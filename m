Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80E6C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=; b=r1xGkIrsmT0yl/rT0mQOKrWUBH
	CskPp2WovCRIYMhNLwVBgyp2l+cXxsu8X+zNIr23VONisXFVTNY2zbgzeHKBC3OUhVrrWQgxRKCty
	JFlVCVMNT8qD8Yv4/UXa1IoTDvfcxl7cYBYmws1yB2PxfEAqZo42l00eQp8CL5jbau8VbWe/UkZb4
	gjN6awxcWJkBq+iOACG52W/JMksC68hegyq5uw1q6TjPaN3z9gwWzDaZMHmtFhrmMI+2R7Ri5wrtS
	vWk8OU/inVzCFgd26kNLulrslRWlsG+BE+QZi1/m1XrgLe5RQKMLO/exG1v8IEM1ybNTlCE+d6NP5
	bUP5Jzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWi-0000000Fr8J-0Xdb;
	Fri, 24 Jul 2026 08:45:04 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWV-0000000FqwR-0u11
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:44:52 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so151767a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882690; x=1785487490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=;
        b=XAYNGjVCbMe2jRP6DCStPhh3BrJ4CP8BU07pqRUN5cJpYOz2xxfpCUYG15Y956QzOI
         Mr0RCTR8Zzl/48Pl/zQrDybB4VPWnCbgcOFp5e90SsjK8VL3hLNuVhgVwX3Bl3IFzQxG
         UeNrLULJ03iVJibaD0KYBUYxZ2VEnb481GU2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882690; x=1785487490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=;
        b=GHJve/T9Z/R9n67CPL5ZRdNGMMc09CeBCl+/7U4oEgYNfDq1Xv4MCkuI0o25qBqGDZ
         KBFGejIzBjciO+tH0rAkb7XmLnqhSuc2w7PmtocEk+WM/b457Jf1WL/aPTQ5ySM+35St
         VjqYJrRQt7UD8TwpM72d3CtuZll+IWM3TPN1SXEivlSvD9eREL7P8+ffQC0o+HGZek68
         leEIB1yOQ/VLRaVIqRu6T/XuTVFEB5WvtT1gBL09ysON49QORhLEqduWavjd4k8b2W/T
         moBS4wLq6s+1GlTyveH6te2lwIxKJX7tB6JueaaIAZIV0fHmWDWq2jASUymbMciC+63m
         7K0w==
X-Forwarded-Encrypted: i=1; AHgh+RosTJGMjRWcUVRaDImeK53DOVWBEAu//tD627RSeBDQJv3bebJupMLHhbWU2L1tDP7OPtirAXb8HG+RgjTyguef@lists.infradead.org
X-Gm-Message-State: AOJu0Yy88LIQ4QqzDgL2DtZwyMJohBjJHKlpovZbOav6IfT+A4B8OdOv
	zW0yYPLE1mcNyRXZbJ+buGY5xM+hqzT+iEHi/CEqXSdnPx0lxUN9lqg7DcR7GiyE6A==
X-Gm-Gg: AR+sD10sR7Nn7Z/h27cYLa2OGCiewsFvoCxU+wKYvaOETYAp+FOp4u2VaBFQyX8WOQN
	xV1PHbAsXzSXjdR+DaJNJmGkBIv6gXReZYk8298T7wgRJznqG0D1baCrsPUsHSUGCp3ud6AQcEK
	ncCIh3dyOubf2cuqrvX2RZnFX5po651JT4UbrNxApUE4ICFEBhL4yE/C1KTREueIHs6DPuzg0qE
	PLXlqil9W9Qi1lJUgW06dV4XdMiiXIuZmNIdTHMMmCDVoyy/43lNTeji5uKtsxYoNlt5DzrThO1
	5yN/+FCnXpA4F/jYguwH4WpT0hLnRxQtqoAL4guwEeIHKqtOegDE5f3fgUjb/bna2HeY/R3vi+s
	+I9jSvyAL404QOe5sSXQj8Suj2yAkDu6qbAzlO8k+L85iu0XqIrNYizP+bi2sX6UC4Yftn1xH9c
	Cy3Ncc54SJnuCMT5KnYeBiQT+Sy99OysULp2u3/AsXZTO1cvofgQYqDSEZH+o=
X-Received: by 2002:a17:90b:2750:b0:381:5ab5:b667 with SMTP id 98e67ed59e1d1-38ec6637d1amr6239942a91.31.1784882690591;
        Fri, 24 Jul 2026 01:44:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:49 -0700 (PDT)
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
Subject: [PATCH v7 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Fri, 24 Jul 2026 16:43:18 +0800
Message-ID: <20260724084328.3943997-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014451_264700_C7F92B11 
X-CRM114-Status: GOOD (  12.85  )
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

There are still some instances in the USB hub driver where port power is
directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.

Switch these instances over to usb_hub_set_port_power() so that only one
unified function to do this exists. This makes adding external power
control with the power sequencing API easier and consistently applied.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 6671b5e45191..a5c5038e1604 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -976,11 +976,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
 		dev_dbg(hub->intfdev, "trying to enable port power on "
 				"non-switchable hub\n");
 	for (port1 = 1; port1 <= hub->hdev->maxchild; port1++)
-		if (test_bit(port1, hub->power_bits))
-			set_port_feature(hub->hdev, port1, USB_PORT_FEAT_POWER);
-		else
-			usb_clear_port_feature(hub->hdev, port1,
-						USB_PORT_FEAT_POWER);
+		usb_hub_set_port_power(hub->hdev, hub, port1,
+				       test_bit(port1, hub->power_bits));
 	if (do_delay)
 		msleep(hub_power_on_good_delay(hub));
 }
@@ -5437,7 +5434,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.229.g6434b31f56-goog


