Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670A4C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=; b=b29VNJugMUXTSY3arAVsmXw6qm
	fxoPAcnI1DngT2WqY1dg3D+EcyZSJg4eSW4kxvUr6+Q0Wc7uOuiFgD/7afTXAeE1X/ouGRWVyt3v0
	gxHLnOXRL/Ku2zahTWjkdFMPlbqJsBQE23slmOdTggP9YPj75bASq8O+DtOOnloQWrKAa1DgSSmcf
	Oy+soXt386me525s5TyZPXk84ChGxDjIBwL1IA8wI3IodrjSQWAExh9aUEfCQKmRY71ALG8Itez0G
	a6T/hsI6Q6HWu7f/R+jsm/Xjb5tQ+YUniO5jyPa0a2y/dH/SNtm7asMZ7ee5XUIpIMVxrRndKr4Q8
	kKT3fuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PVL-00000001Pf4-1pBu;
	Fri, 04 Sep 2026 08:42:35 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PVI-00000001PcK-2ply
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:42:33 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3964e480f76so935088a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511352; x=1789116152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=;
        b=MtmsNAesD1/5zGGxGW+DJW60QwikMGkAVJkaFzWLsnEqczKgQuhc35e26dV6d+9lrT
         8twlzlnJJv/P7r/pwqNhiM3dlDd9Jpoa6j6JOoyeGJKQ5qVX2Ie5maeN8jdo3nUupSjY
         m5yUA8Qp08kG1wAAJuupwN/f+G9j43I1UiDlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511352; x=1789116152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=;
        b=iXpeEuAOvGywsVV8+01Y8LkCknKkROEtlkooYbInzYYx9S6OFurpiF/luWA8GNbL3J
         SB3QlrfmF4TGyW/SeFPrMK4TIT+AXqo2nvTQXX1MmdgUJ52pVWoSA2d+Sxeq1K4Hfb+o
         Bi+IljeKMyb1ThPImMGAFKOwhc4tw4BORYDlg34THVv4HKpBxNOGsBNxAjFhslQpL8h0
         7lANYsY1fRQglsCl7k3bvfpZCQEvEmo/4aPIVLAecmWzRo8qmCJ1Hvw0pmNbd8+zWOdZ
         Hqk9pI2m8MhSrUO6oP5uOA9mnqyuzsoWCvYU/56ldM2OXujhoFJ0MOB62vknA5jyxSix
         OZOA==
X-Forwarded-Encrypted: i=1; AKwUvByM2kAWQAJ740Gamg/qIN0CEB/KOnF584pYL1SekGx3usd/Rdso2Vx0FdWc5NuAOJzvEYrMi9lzCY5tiyHybg5/@lists.infradead.org
X-Gm-Message-State: AFuF++nccigrnDU4TPJ2Bva8pp5Lwd+BXW8J/fEqjg7hysNqdukE04Zj
	hVbQ4xbncs+pm87LUwqXMZ4gSwQAYaNW7+JoYVAQ8GSI/8I3BKiybH8IDnlVoKOQ3g==
X-Gm-Gg: AYBFou1SpuUT+SoO+RbKl8aWqNUASlF/jonwoFw35zH5ISOUerN+iUlJSh09x3t+icc
	VNM16lJJ3qjsPy/l/accH9r4+ceXSIWpa7NCRovNINjukS2QgHdnUeDHNK2fhPwTVOZu1ekDxbs
	1G9izFSwosTBu/ubseooogHwh7KxaVeUMaoaaZVUwY+iM8kbi33w7XNAQLmoy3LZiSbpkFze0GZ
	uVXQt4Aqoh1j/oLoTAzjf2517ievPDTwxsL0SDaHQyCpB7F0bdagI2q6sjlDXx1NpxLptKoZLd/
	/hfIz18VylnEA7jgKh54I75S2CXKvAtDD6IlSGuEHVC+d6aDhuSqerp+5sKW5LdjSTbbaDcqtBH
	7rkG0l9wN0ewMXEKN2TmDExChAbr2N0z3/x5vffelYNCZGwAJZjEV4Nbz2agkQGrKb10FqlJEou
	GGebIpuPd4UvGKtYd+Mo9MNBxW7R1OBduQOYFO5ly1NJf9rTHl6nhSMgo1fan9OEOhaWackQ0E/
	ooCagcHGunLW60xUZBF5t/Mp9jDDw/9ofYLgZJ2i1yp
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr7387796a91.18.1788511351714;
        Fri, 04 Sep 2026 01:42:31 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:31 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v8 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Fri,  4 Sep 2026 16:41:43 +0800
Message-ID: <20260904084158.1341550-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014232_715152_6D2EC0B0 
X-CRM114-Status: GOOD (  13.60  )
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

usb_hub_set_port_power() open-codes assign_bit(). Just use the
assign_bit() macro instead. This makes subsequent additions to
usb_hub_set_port_power() easier to read.

This change does not introduce any functional changes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Attributing suggestion to Andy, since the change was originally
requested as part of a review.

Changes since v4:
- New patch (split out from "usb: hub: Power on connected M.2 E-key
  connectors with power sequencing API") (Andy)
---
 drivers/usb/core/hub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..16e03ec8d1ab 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -899,10 +900,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 	if (ret)
 		return ret;
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
-- 
2.55.0.979.g7e5102b832-goog


