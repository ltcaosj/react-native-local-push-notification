package lightkits.localpushnotification;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;

import android.app.NotificationManager;

import androidx.core.app.NotificationCompat;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class LKLocalPushNotificationModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    private int notificationId = 1;

    private NotificationManager notificationManager;
    
    public LKLocalPushNotificationModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;

    }

    private Notification buildNotification(String title, String text) {
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            NotificationChannel contentChannel = new NotificationChannel(
                    "content_channel", "Things near you", NotificationManager.IMPORTANCE_HIGH);
            notificationManager.createNotificationChannel(contentChannel);
        }

        return new NotificationCompat.Builder(this.reactContext, "content_channel")
                .setSmallIcon(android.R.drawable.ic_dialog_info)
                .setContentTitle(title)
                .setContentText(text)
                .setContentIntent(PendingIntent.getActivity(this.reactContext, 0,
                        new Intent(this.reactContext, this.reactContext.getCurrentActivity().getClass()), PendingIntent.FLAG_UPDATE_CURRENT))
                .setPriority(NotificationCompat.PRIORITY_HIGH)
                .build();
    }

    @Override
    public String getName() {
        return "LKLocalPushNotification";
    }


    @ReactMethod
    public void initialize() {
        this.notificationManager = (NotificationManager) reactContext.getSystemService(Context.NOTIFICATION_SERVICE);
    }

    @ReactMethod
    public void notify(String title, String body) {
        Notification notification = buildNotification(title, body);
        this.notificationManager.notify(this.notificationId, notification);
    }
}
