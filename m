Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B21DC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=; b=4r3sk6zmc/XG9XEgdE5EKgl2KS
	MOEjVaLT5dLMBffrBv5pdTPR5jdE1h9Lazime6ijbgG1WI/5oYPu8NpxFsmee6IIZNmABRiD9nwF9
	ZQiRVhlbhf/3B5gVN/wQq4Xlf+PbFxOJX6PvTCq4sEKV1ipZJxMk1FXn8DbMgcD2jjrjG2DrK4c37
	3w55xoj54vUqO5arPRHdwRiXjy5fDOLIR+TAeWhWhiiuf8dTBgLtgbDAE6gEWfsehg3L6ad7YAW95
	CpMkHNSWjIOjRoX7VT1yQaYgNN+O/MxqzjzwyOQXYMW2QCoSgWLLaYuQgtIu/HU7qZwcOD24OE+Bk
	Uuemg4Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWU-0000000Fqvd-264J;
	Fri, 24 Jul 2026 08:44:50 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWP-0000000FqrW-31Fd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:44:47 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so132269a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882685; x=1785487485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=;
        b=EljaJyFp1e1RM68T8qpu2aUZCva2g/42q/1uElChM6nQoTqyW7DoP/YgUmDo5AKTxJ
         QywHInZX3B4Ky1EJJy6QUmMuYhV7VwUUjPfEKWp8HToJkSETdqvtpWwDAgXakQbcdpNG
         hdS8um167yVkZdZXYTtyQwPCFJImvQm/OR5Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882685; x=1785487485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=;
        b=b8oXf8NeXqcRc014P5GauKi5EP5T10LcTNQAUgYx99MIX4NYNqBpDrFCdFc+xHB/GQ
         J7Tx48Yn9dfBL5+JrMdQJYAVR+or2oweH3ghOxhlvZhMibka+vo5K18eNf7/wJfIwLzI
         AeChBf0bYOTdXCA8bEVOBrJcHCFWEAiNV/IN7UkKQLlsO3GI6WhDDS9CKyr8CBZ2kaJ6
         7qixIRiEsbj0sjCZnSC2zmeMOq9Ax0W6oh6PJu2bcE8gfk+aD47/vJmvBLLEGRXby4wA
         6FRpOxxh0sozJEFVNo73Qp5Z+sbUwC7SojmCHbPObjCWKBKzV5QQTkEALYMBiAIfDUdJ
         quGA==
X-Forwarded-Encrypted: i=1; AHgh+RqLXKIb4hlBAt1Sgfe7+h1JL95fPWj35xkrGtfsNJKM62TDkyIfq4nlGgBRvc9xW9oDxA1IgWtNEvPbwaPmg/vc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz53JZ8QoQjzWlKJGpSWvOgasetjHJM2aBL9HB8IA8VE4OT6pLo
	vguQHqp34R4Y6ZqCGadVyp9Im08L9Ed87VVuugGUSkJqj7MfpULh5wvrTHu70/Dj0g==
X-Gm-Gg: AR+sD10Dq7BrIKH5GDB7H3kZDNpLrPF2zx0q6zap2s5SBG1kBW0g+5Uk7chk8VU0Q25
	dcrSESQ8ezF6Q0nQmOFNF49YCNm9fpiI1fESSfSiSejlPqOKXzJjYzJgvzTtD4En+FX4y3yFNTX
	WOKMQmn3o96Pm4+Tbb105pW82arJxelefJe14rEKOeRhkFeTenYl4fKK0gRd89BOUOlSmoUMbcj
	os0KU9ZQHRlU/67801s+ZTbhYKr0eRLV2ZBxGF/woo5j1rXFya6/sPEH+pIfVZTwtsWnFZoQYu0
	qqC6Z69L1zpu5ypeOjIMBLJpIpCCvapkDPZh/G6/oTKVOZhRzqA10Az0T6w89ZV3g6Dwb817lAQ
	yFs0ZKEqh5MQaffzLB1F7EOd294+oskz7Q+9ByF4xmaHlUk1oAx8LMZN2pkw+i98AK4HEm/seuy
	sXkl+IE+/x5TGPJTtJVlbFHD2ybd4QS847QybBsLcJC2NdSo/KbCn26f53UBM=
X-Received: by 2002:a17:90b:1c01:b0:38e:6ba9:5203 with SMTP id 98e67ed59e1d1-38ec658e6bcmr6608480a91.22.1784882685067;
        Fri, 24 Jul 2026 01:44:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:44 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 08/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Fri, 24 Jul 2026 16:43:17 +0800
Message-ID: <20260724084328.3943997-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014445_784308_4B201C8A 
X-CRM114-Status: GOOD (  19.13  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
it to tell if the hub/port is SuperSpeed or not.

In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
state tracking field in |struct usb_port|. Either structure can be used
to identify whether a port/hub is SuperSpeed or not, as the field in
|struct usb_port| is inherited from the hub:

    port->is_superspeed = hub_is_superspeed(hub)

Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
|struct usb_port*| so a subsequent change can use it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Adapted to move of usb_port_is_power_on() to port.c and port.h
---
 drivers/usb/core/hub.c  | 7 ++++---
 drivers/usb/core/port.c | 6 +++---
 drivers/usb/core/port.h | 4 +---
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a6c4e4c0368a..6671b5e45191 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3291,7 +3291,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3733,12 +3733,13 @@ static int wait_for_connected(struct usb_device *udev,
 		struct usb_hub *hub, int port1,
 		u16 *portchange, u16 *portstatus)
 {
+	struct usb_port *port_dev = hub->ports[port1 - 1];
 	int status = 0, delay_ms = 0;
 
 	while (delay_ms < 2000) {
 		if (status || *portstatus & USB_PORT_STAT_CONNECTION)
 			break;
-		if (!usb_port_is_power_on(hub, *portstatus)) {
+		if (!usb_port_is_power_on(port_dev, *portstatus)) {
 			status = -ENODEV;
 			break;
 		}
@@ -5434,7 +5435,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !usb_port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b2e953f137f8..8d686d43e996 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -23,11 +23,11 @@ static int usb_port_block_power_off;
 static const struct attribute_group *port_dev_group[];
 
 /* Check if a port is power on */
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
+int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus)
 {
 	int ret = 0;
 
-	if (hub_is_superspeed(hub->hdev)) {
+	if (port->is_superspeed) {
 		if (portstatus & USB_SS_PORT_STAT_POWER)
 			ret = 1;
 	} else {
@@ -114,7 +114,7 @@ static ssize_t disable_show(struct device *dev,
 	}
 
 	usb_hub_port_status(hub, port1, &portstatus, &unused);
-	disabled = !usb_port_is_power_on(hub, portstatus);
+	disabled = !usb_port_is_power_on(port_dev, portstatus);
 
  out_hdev_lock:
 	usb_unlock_device(hdev);
diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
index 00f7500af336..2f4349b3ce6b 100644
--- a/drivers/usb/core/port.h
+++ b/drivers/usb/core/port.h
@@ -63,6 +63,4 @@ struct usb_port {
 #define to_usb_port(_dev) \
 	container_of(_dev, struct usb_port, dev)
 
-struct usb_hub;
-
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
+int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus);
-- 
2.55.0.229.g6434b31f56-goog


