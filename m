Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059B8C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZO05xNK1Hbq+tmP+bxjD79MnCLqnvQlOFToHRwo4P0Q=; b=yzfC1vs5apkcZInLV5UydxS/4C
	6pKAfFFP9lQRVNvJmQhKPpRkYBi7S74U+G010PDTK1e+AVvZeiR4xNnX6J93WbJUvRreu+7dH+s2J
	zvkemFvXqWpLdhQjXUmffLoKyYTka8VF/f5p4XIwmh+GjzGs7ROGTd0whmYgKduBk4MH7SGpYClz2
	KA4R/b+/AmEmdjogDVdB9ecHOoTJNCB+OWBPAdohKJ/A4Awt3FgxQ5dKHT7oo+u1KcLXZvD8HnKZr
	nvzqg6uUmJFlyP7alqr8QvM4ITIrQlB281KNBigfqzIKhNbalL72mdJT4Tmb+Y4BPYn1vZ7AvJ9u3
	y/U40cyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlW5-00000001p2e-0A6O;
	Thu, 09 Jul 2026 09:58:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlW2-00000001oz3-2GZp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:57:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c7c61b5292so31228835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591078; x=1784195878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZO05xNK1Hbq+tmP+bxjD79MnCLqnvQlOFToHRwo4P0Q=;
        b=JbEJVf6OLQXW6UlPfgtbTKUDSOgWFtzN//NG409OSkqxbKMICsCsy6zsM5gOW45vbw
         q60Z6qUvFsprHDck8rv3xhLPnn9tbZiIM2GLaOfbUo9ix22QE2SV4LM72r55mEmsKeBX
         abPvBiDqjCeEsP56ZFM0brX8n/38k7tPAAnOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591078; x=1784195878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZO05xNK1Hbq+tmP+bxjD79MnCLqnvQlOFToHRwo4P0Q=;
        b=ECR6B8La/C1tD8232IkQVBL7+/xD7eD53exZJgqKMO75rHWpkHfcjxpnj2o58Dv6jW
         uf1+peVGKWEJdDelNacIRN9sHxdtQGAJDjfNcm0WpEl2bR3r05Vp3HL8ATvZLsG8Yjj3
         tT14X50xZl0zOJj9I2NLEfX46m22u4mljXafr+1XVOqfTISsfEQdFAv4kTRX7aacaOJr
         lwFdxvpWvHqr4+taW+lLkiBTHYaH6PwtZ3X+1F5/0WAc36rOqtmU8rx8nOUJNPoSF9wd
         Fk0hbyDPb5xEwMTqPpAxRpRUbmGTVekEsKk7TUmWGg2xamCPxmPDhaMJtwHRGFyhAL9h
         Kqlg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8QvYoKZw3uO9RaILiyZnYlUkZ3k6cPz+yT8v/FGCaRFAegah8+1yEVdOUDltO4+T66E6SjXRloqMoo7T+v+Fn@lists.infradead.org
X-Gm-Message-State: AOJu0YxiolGytHC5nmQyWdikNTbHLRjit8F2zXBDFvtGirQlFuy1ldOb
	hYt9WC/YifGBidttlaxFjZSQ39WLTihnageM7h8jWmJU+f1onYfaTYqy3wBkbdECsQ==
X-Gm-Gg: AfdE7cku8xtfo8Sz0ZVLqy1qhs7dc1vbitTLrPC60cfavuhqppdemIdGytulkjrxwla
	BvQotFFaciRYT4rgeNz2/6mKB8PNCkmMSQPXYdvKhI9BY0yQorl5dlcIXCbWHmmk1wy2L2rVkhL
	B5McneqrN2tHRHcuBn9KtuIPlOHThATcttEz9By79XFtvCEe3NCZJP17UOO+7t+kW2b3Kjt0Luu
	GqR3rvzfGMWhvIYXRXrbPzHEpw0Jx93/mozJW+9cp6xW3pyRrRV6IhDL3ebRZAs10uwQjAlZ2kf
	pbtfdjyZB+UWuAGBrXnZrK8yqcaf+vj3ni12TeMjXKQQvvTPsym1nYYsldJiPKGubhUhi4Qq7rO
	oUwhBDT8X1pq3iMkatUiRi3Ex+Feuo2dQEgewt42zODDqdqu/sk5I5n+J/W19siZJPih4END9Cl
	fzIAWu06Qjwb6hkc6MXexKxw64LiTPEOiCigVbIjUehFFwcNhgdZfJmkh0Aq+KoNpmlvZd4A==
X-Received: by 2002:a17:902:e78e:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2ccea1a4d4cmr66175845ad.0.1783591077993;
        Thu, 09 Jul 2026 02:57:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:57:57 -0700 (PDT)
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
Subject: [PATCH v4 04/14] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Thu,  9 Jul 2026 17:57:09 +0800
Message-ID: <20260709095726.704448-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025758_613716_2B8ABC02 
X-CRM114-Status: GOOD (  16.60  )
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
index 13264e86bc6d..fe10d72ef39d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1874,6 +1874,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2005,14 +2006,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
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
2.55.0.795.g602f6c329a-goog


