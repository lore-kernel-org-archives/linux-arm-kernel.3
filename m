Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D90C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=; b=fK65tRg9turS6sgS+RNbX/IETF
	ie3pEsQL5/9gVn9+m0OsERp9hzZwSHyx/yTnKYmPwTqZTe5g8h1pJMQI82y1SF88IvKNFjEjAcv6x
	vqNGtHZpsrUr+nTorLJLRJG6vLBrMYiTY8KgT+VwPy9QyL5Z7jiGcYDlSWwZ4Is0do0uiL6wqoT9l
	mSObWJRFrrX8bRtRbUBL+Oh5b5J+p9Fr6lZjAv3AVs6zDJzh6m6Y+Pn7ixW/PH0JsTTi5pBrFgduF
	6AhMiHt4QxVrA2J0YRlXtdlnpE0F14FV0OKM48WR8AC7zQ3ua8iMK6bUxq9ypuMA3vz6iK/h74mhg
	b60soOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Ne-00000008aI0-0z0L;
	Tue, 21 Jul 2026 06:55:06 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NY-00000008aAO-2esJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:02 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso81982005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616900; x=1785221700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=CPSlwAHEnwCH2TZmzjvDm/D+iSPSxHarSeWlPl74XPxk66Z6SW/NwxXQeWItbpW3iH
         NhmcS3JfZRXWO6IzfZiEQVwhBz/YwDC4m/gFiAhGWL2oYlhsSc4ywgfQz0V1r/V6EZ/7
         8iLJGcIdRSXuzgMOQ7Fkt7sx1DoI9mtalBbDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616900; x=1785221700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=XtPaYLf2q6FYALJRbdtS4m2PgxpffFtTkNCWiK9xi17jVaJALSBXuYwPAK5fmGLVpQ
         hnoqVhDop1/LD3JK0id+ypeFPeRc5ZQSckuqDeSBbz1tfaVBEHA5Y0lspB/nkq4oyVeo
         Ee0lZCd3epKGIHqAjAIJ28Mg1auOEUFtVFWo8kh3vUFUGIj+P0x5WVMTuMOVxGYiClJX
         L0K23v0Pk1U5I6xUhX6/V+QFvjKdhztE08rHyoqannOryWgWpJ6S3rtbzrmxfCffGBZh
         Xn3pY37Iokd7pJVe8oQBqYcwmPMpgACzPKjvuzWpQnKbFSAZe8jV4HPg5QLRXZ8Pn0PC
         3vxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqx5Cg5+6H3tVpyU8xPEmtHhbXPlD5Cvn/+zZTQ67p+H686A6wuekEDFOLbE+P0DvieYrcMu1Nz5axx5rhlkJZG@lists.infradead.org
X-Gm-Message-State: AOJu0YxT+Pz0XOH7jThPmcf3BoByjXO5f+gI/XR6HZrO4xOJw/TA5RzH
	HNU6gWwNVLh9M8I4NuiFkyo1sYFKtBQeVNDj/JeG6PREmG1IcSRJ2bdanPiZ08j5aQ==
X-Gm-Gg: AfdE7cmN7J57yX6fMZTC5iRZkCF9hSUFrKYcE0rVfr4XbTmaI8loTR7AG4BwJYtEblm
	Ek6kdypQ2LiVOkc6v+U0LP+rmjBkMFKJEJrdWniHNDWcoHseBupQ4Z4fWgAZh+vpvkiinxbWDkJ
	GfVfssLKYOXzuttKnLtoalkpd/RCBGuspElLS28UVE1fMf6IUaYuoj0jVWtkZtfLI+qSX89t7Jt
	L6U/44+3OAVTrKtayqp7/wren6/bk7k+lQ8CKEUh+neqY62auuf7NF72GSCSbA68UKIAI2C+xSG
	kOD2OTQYmofoH3rz3Ko4PDGyGXnMVhkdtQRE6gZDsTl6QIXf5nlObDxfNqXVNyLB5mZuhYTFnFF
	ll0lAO/nbugokydjcflT29dBQslR9RgMECajk3VEBYnO7EIR0q7N/kfA+oNx3otJhBO2gsRNZSI
	OU7pwXuyaFSQZsCF1hSincWf5V0vv9RCeDv0t/rEbO69oZlne3AwfDnvexluQ=
X-Received: by 2002:a17:903:1a90:b0:2cc:6b7a:dfcb with SMTP id d9443c01a7336-2cf349cc789mr186191295ad.33.1784616899938;
        Mon, 20 Jul 2026 23:54:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:59 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v6 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Tue, 21 Jul 2026 14:54:00 +0800
Message-ID: <20260721065413.2306137-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235500_702139_51BB9481 
X-CRM114-Status: GOOD (  17.14  )
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

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Also rewrite this section into the standard error handling pattern:

    if (error) {
        # handle error
        return error;
    }

    # do more work
    return 0;

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Rewrite into standard error handling pattern

Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 715f26f05a31..8f8624a0d36a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1875,6 +1875,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2006,14 +2007,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
-		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
-
-		return 0;
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret < 0) {
+		hub_disconnect(intf);
+		return ret;
 	}
 
-	hub_disconnect(intf);
-	return -ENODEV;
+	onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
+
+	return 0;
 }
 
 static int
-- 
2.55.0.229.g6434b31f56-goog


