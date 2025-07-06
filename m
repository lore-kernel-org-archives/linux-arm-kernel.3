Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551ABC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 21:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIiqXz9LsgS5XmKPI7jHGuK8VIEq2ClzFVk908OgH1k=; b=Zpv43isKd+kxw+lV2/p2u4oXfs
	ESu4Qy2Ovk7WJWLnn2JBHYx4zsraBLDkCTTgWpvvBvaNa8PH6tq/h2NUIp6njbG9bs74CZS8lidcz
	KcW6dgU1Q7/dydDANGPJdcqdTdbzcNT776AnGI+oLv4sNO9MNqGHVPygrq8dphn38DFKMUklcoRWB
	Z30GY4V5E0HB2cbSEeFsPs6iwFiSaIpxOO0zmoLM4LcB7/IDyuIUaxvbjnToiyf7+CQnrX7goTjMB
	kgSXyug/KsMi/IXLipZXOA/7V5SvLdrj51HwRE3IUlMDMi2FTg1oHm+kPFU8fidj68J4fBuN+gNJy
	68QU6LGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYXBS-00000000rIA-1Ncd;
	Sun, 06 Jul 2025 21:46:02 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYX6p-00000000qll-23wt;
	Sun, 06 Jul 2025 21:41:17 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-74264d1832eso3084838b3a.0;
        Sun, 06 Jul 2025 14:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751838075; x=1752442875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIiqXz9LsgS5XmKPI7jHGuK8VIEq2ClzFVk908OgH1k=;
        b=M6ea+z7aeuFSHiiS12A3P3awacXBZs+SfJXvcLac+8mJuB/EXS3vlY3d8Yw8xFbLH+
         JujRoxfCjSn/41goSXA6IvYJmtcYaZXxj6yiZLSJgVahk1U7xF35qtUQygINn3UX2QH1
         bWX8RJqohRVdi+1wLk1gD5c4Vkob06cuKImPI6fnXO58JLPOTE/Gaf3kx1yiTI/9GVRX
         9djGyfYeBLqXQmP2dnmwRyHqiaOhlQ4w8IhcYkJc6CvTLERLx5H6hzA/kTX2RU8695Me
         7HNOseoTVbG7TEqCo4yA0U9w+IM5aHKRBdsdRoYgMWXSefNXw2m3VgK/wwggaK6Uju/a
         0zBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751838075; x=1752442875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIiqXz9LsgS5XmKPI7jHGuK8VIEq2ClzFVk908OgH1k=;
        b=DnEU4LqJ3kHR3/qBWgteiQkLhZV/heegvL6OYxcs2JChFCoUIMo+rZUzgac42ByHXh
         /6zkV3DiFiZLusJgdsJb/R1diKiOYVuJMXnC9XPVJlXoSnXkGnvqaJVOCptTSiO8/Sl8
         HrDiHzzJZk82Rkm6rxtkQHDZ7F3Y8wpPIb+bmkjJBpPomtRuTcPWFX4TMLnJAapgNH7J
         wlennDeP1afAggpfkuTmT9UVILo7iPlDXrsxCj9BEgkLG23LqYRMGQxALMfDYn1Z1/9J
         x2ZrJ6vIpRErUhGaMBNvnCwsFbbEq8Et/dKnb8aVjlBOqr9J4B9GsPH1iqkUj11GpOT3
         ZvhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9gBgTTNRQnt7LT60FHi6Y5AhTvhi7gisCL2wuOLVeZ+biAyHcZvzr67JPQ7j9ObTCUd80nDJ+MvUIuZRJP1M=@lists.infradead.org, AJvYcCXrCVICVvB3JXihD7EjSkLCuWDofChAp6YsBL6a317eJUhYn62dKx4TM7Ze3MVAgLiT6ZGgLiNcgXPUP9nIlKWr@lists.infradead.org
X-Gm-Message-State: AOJu0YwTX3m5t/MPQNi4zn3OSYTVwPgbw85I5krPLg7SgMsNziIquP/N
	Y5cPDcDyuJMmGddVeUzjyPGzUhxW65dnYMrxqL6nrFibBYdO6EAADTBr
X-Gm-Gg: ASbGncv3ggOdWUx8I5mh+mwlXMu1eCHTgQVwH3i4CkosE/1+GIGVwJqedwg/tH8rzH0
	DNmK2Jt6GbmEn54qnrUZIiluL1AFBzSVXAGZ0hH3Gfuq62itaa7Wu5nf6fBTlwBXMaO+9yWibM+
	I0jAUDwLOK12svHIcWztCvA7k0OOYjh1VepXxjjkEo03apxO9D2lFbkLySJVxJgCHY0BuNwJI3A
	oKW7F8HyM1WXspDUEjYXJYp9IOVA++7fZoFd6dkxLye/f8tHKfwHKudNscgBaDwXFgUr4Teb52E
	XCFLWXpAc9mNICAam7WHp7hViMzSDifn1P8BISAb+6g=
X-Google-Smtp-Source: AGHT+IEwlHfBS1DHzBD9Lj+YLxDEJbYcNB+0NkMuq5is6NeWi5/aui1kdvGuU4/F3aaylahetEIVfg==
X-Received: by 2002:a05:6a21:6497:b0:215:d565:3026 with SMTP id adf61e73a8af0-2260c33514bmr14391573637.20.1751838074724;
        Sun, 06 Jul 2025 14:41:14 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74cfad75020sm4126416b3a.109.2025.07.06.14.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 14:41:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	yangshiji66@qq.com,
	ansuelsmth@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 1/6] wifi: rt2x00: fix compilation
Date: Sun,  6 Jul 2025 14:41:06 -0700
Message-ID: <20250706214111.45687-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706214111.45687-1-rosenp@gmail.com>
References: <20250706214111.45687-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_144115_531270_8552AD1D 
X-CRM114-Status: GOOD (  11.85  )
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

The .remove prototype commits seem to have missed this driver. Probably
because COMPILE_TEST is missing.

This is a mess anyway. These non static functions will be moved to their
proper place.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/Kconfig     | 2 +-
 drivers/net/wireless/ralink/rt2x00/rt2x00soc.c | 4 +---
 drivers/net/wireless/ralink/rt2x00/rt2x00soc.h | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
index d1fd66d44a7e..3a32ceead54f 100644
--- a/drivers/net/wireless/ralink/rt2x00/Kconfig
+++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
@@ -202,7 +202,7 @@ endif
 
 config RT2800SOC
 	tristate "Ralink WiSoC support"
-	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620
+	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
 	select RT2X00_LIB_SOC
 	select RT2X00_LIB_MMIO
 	select RT2X00_LIB_CRYPTO
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00soc.c b/drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
index eface610178d..f7f3a2340c39 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
@@ -108,7 +108,7 @@ int rt2x00soc_probe(struct platform_device *pdev, const struct rt2x00_ops *ops)
 }
 EXPORT_SYMBOL_GPL(rt2x00soc_probe);
 
-int rt2x00soc_remove(struct platform_device *pdev)
+void rt2x00soc_remove(struct platform_device *pdev)
 {
 	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
 	struct rt2x00_dev *rt2x00dev = hw->priv;
@@ -119,8 +119,6 @@ int rt2x00soc_remove(struct platform_device *pdev)
 	rt2x00lib_remove_dev(rt2x00dev);
 	rt2x00soc_free_reg(rt2x00dev);
 	ieee80211_free_hw(hw);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(rt2x00soc_remove);
 
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00soc.h b/drivers/net/wireless/ralink/rt2x00/rt2x00soc.h
index 021fd06b3627..d6226b8a10e0 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00soc.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00soc.h
@@ -17,7 +17,7 @@
  * SoC driver handlers.
  */
 int rt2x00soc_probe(struct platform_device *pdev, const struct rt2x00_ops *ops);
-int rt2x00soc_remove(struct platform_device *pdev);
+void rt2x00soc_remove(struct platform_device *pdev);
 #ifdef CONFIG_PM
 int rt2x00soc_suspend(struct platform_device *pdev, pm_message_t state);
 int rt2x00soc_resume(struct platform_device *pdev);
-- 
2.50.0


