Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389ABC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=; b=amQe4X67HLBJVwbKbbqPv90J0J
	m+H+kMf2XFE1kz0Ml5OZiN08j3ScvA8iPTqlyuzAJ1dvfaD9z87GT1/w+Gje5DAQC/HIHSVljdSmt
	zTZRSIzbROc3UC02B2RnM7zy9OaLcRgd6iHnq3KN9BTFOay90piSGAsJZz4zCuWaVp/stxx+gfm5x
	kQTK1RtsnhSGkWfXWzbNNJEt9/23mKHnKlM/j+oJQbGCc4mMubzQhNrp9Vm6mN6tk+hG4RTLGpBX2
	SjW9WSYEkudMpyCLlFvlJqJPnCdYmtIXOYEC3TLzxjnE9+NWPTYhM3wpPpudULhhBZpgupQXmeV1y
	YD6P4Cbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4O8-00000008arH-225F;
	Tue, 21 Jul 2026 06:55:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Nr-00000008aWX-1ZYz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:20 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso123657275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616918; x=1785221718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=;
        b=C6q8vt57mFAlh6C1ObtWGzsOhpZ/u7CEPGGDioTuYG6vKEUEMJ/odXqlOqsoptqEU5
         W2a76urNdzUK9yIj5rCHgpPe4Su5oRc9nzSnSwvR+MXPxxGolbJdfaQ7UCxqVMzxD4Cp
         7yhbIA2Joj4sxMNlwycI6xC/ol4WHsKf6l5JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616918; x=1785221718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=;
        b=TeORRC1LC67Vr+afWCsjZxWuDpEA02YYZIZgLbWGJ6shFem0ybzuqSC0NEa2YZh46B
         k2f0TjC4GcXeW+ppQ6inie+u0GYMWhuGVa/KBcJJbUNEuYld0W8/bj0Upx52Ozsyg6g2
         QrUYY+9RW4YYaKy/3RFVq21l7PgoyYcR9VsGlJOHsH4tCKUCfQSVwY/jy3v7cddUszrV
         +t2RziL3Gn9OqT5QgzpBNgw0NOexaE1IIqETdSchRi35W574/k2lW1iPb1K588qO0map
         kOC15/+uTOIg9g08kqifgHg/ND9B+fB+UpECcm8jPkCORaZiIfwBzb1LkvCKoLnLL6Ue
         Dsbw==
X-Forwarded-Encrypted: i=1; AHgh+RrJXmuPZze05xFDKRtM3VagqHizSoPBLXNkmoymoy+rPNqdOk3wpDKyz+y/t/c6zplu50x7VKQLeVm7UP9m/IZy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4NSGsU3F0mx81f6EaXsElaYnRsQYhyqyFfDXDfEtSSzHQ3Lp8
	VzAYmmhHO3lY4G6DnrLGenP0tdWS6sGjfg8yRAY9dJa7R+UHBnMx5eLv76yawoqugw==
X-Gm-Gg: AR+sD10SntN6LNo96fu++TRVX8a3rD+jKJIXE4OGAjXtXs+WsuZHbn6hBCzEYKpRmmr
	3dI/v959PmZ7FMdX2wg/NWk34kxYT8a3ULlWi9+Oho8iF9eXq9ZhgfPgf4F23J8+GB/V9sfVFVh
	eHZkGXSJAvepUAawb0H9CAGOOkGGPQH2OvDMURo/4jjJnN7jOCL5tQcYzDTguyag6QsdcoxQqST
	xgwDlCLvLWTSZJymrNj7NumFfYF9NTqqsG4Ofdeyd124asW32PlCjVHSw1NlI9K+PgZJ3Y8a49c
	2cklhBqwYng7QHMiL46kAcndcWHTeKyISyUmVqWAH7mcPFSx/lCl77NLkEojhGjGiAl8nacc9kU
	dUXfTI8dNxxU4RkYAYZYAWDWpdmOF0iOEYM9BiuS1cSqtl2yYkM0EXWXnegtx67nxLwFl+1Cglv
	hm3pMPjQsu6DxHPQ/vqT5bnZ1UPEMe6ePswiU2BjEntbpBn42lAxG+ZplYElKiR/9CT1JgXw==
X-Received: by 2002:a17:902:f64d:b0:2cc:df15:91de with SMTP id d9443c01a7336-2cf349d30b8mr204344825ad.42.1784616918417;
        Mon, 20 Jul 2026 23:55:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:18 -0700 (PDT)
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
Subject: [PATCH v6 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Tue, 21 Jul 2026 14:54:04 +0800
Message-ID: <20260721065413.2306137-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235519_410961_476B06B6 
X-CRM114-Status: GOOD (  13.69  )
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


