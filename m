Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B06AE83824
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 19:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NJl/yKqTclNT9kEkBmAeTF7lEJo3F6xT2CC7EiH5zHk=; b=RdaUXu6x+YMqOu6Wy+FnqEfNYK
	GbMsY9HwYk52Lqn3HZ8CoyOMqDPfJxbJ1PXgt5YWsKCw0eoVtyg7RXWUMzNnSnY1uy1bnFDZT58ds
	MjHiBAjxsmy4iPw2+o/S1ujJ3+GbZf4aQH1Ik9cVLTV/Dj6ppnHAi6bq0dTbV6n+pSCuu8FZLDWR3
	TGzByGE6V95irJDP0o6bxR6UkMb/1mA0emenPie60D2QUZf8zXMN0dai+cPO1acs4J04h5q1eauiW
	SG6KOEPi4X50hNEqzSSkrK11H6p7C+Kkh6ApkWk9p0XtiEkKMm89NQj78SRm6djQ3MtNHkwpNK1dH
	H5Fhp69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs44Z-00000007BPo-3gGL;
	Mon, 16 Feb 2026 19:15:55 +0000
Received: from mail-qt1-x863.google.com ([2607:f8b0:4864:20::863])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs44W-00000007BPN-2h9P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 19:15:53 +0000
Received: by mail-qt1-x863.google.com with SMTP id d75a77b69052e-506aa685d62so18042871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771269351; x=1771874151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJl/yKqTclNT9kEkBmAeTF7lEJo3F6xT2CC7EiH5zHk=;
        b=CgR7O046XZMOhG8kqlLh9unEhOTVX5HBSDAE2mSgYfbHqxATQYrjnRjpwXjSrYPaoR
         9+/d+LQcEAUyI30/IcZIllybL3pDW9E2obp5YAy7KetzeWQfBqhJMvYIPY6FWsET0Srp
         K5U4P8uF8L1Pagn196nmJiDAkM3oJS5H+/kHi93VUJYQOZrhT69TzpzerNu6xXLyKP0c
         GY6HQlNzP4LOQovlY3xWBCN2YeIP6VJSOVrZNxJXHw8bdWBgTIB8gv+IPsqrQH2+V1qJ
         gd2UPj2GYAbFTSdRW8odYJ3UsyvzWe7WdZvkbPtJ3c8pWczHOQn5H0ajlFgVcL1uPTui
         9zPg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ1Nu6w9YPBOLvP8QrxFW5clzPmp8dJ2Taey0Y9LTrF4KadSLO6VKcdw2hrd6DIVFV5A2iriUrGAks5TJpj92e@lists.infradead.org
X-Gm-Message-State: AOJu0YycGLKpIxzrktkXiUKdBQrUZG/9nCbrjGRTMFxquR7mIBCsz94x
	ZxpqgibGCTck60FljjUShPiSxfx+3X8KveGYoPM9DwmYXhcb5ooTuuPTjPEC86hkFQrHUh8xBjh
	F/9UW/cpdrLz3p7jxkY6b4VIOUQC1o/AyK0RNJqi1Bvm4PpZOxrws1oCVTLW0LODwB1LoDgg2wU
	PLSpjcigY22S9JGLDQTsZWxjYErTE0TU/385zVrJwgVvUo25varjC8/oFbDx3mMxWdYlVhSlHhN
	wqNlt4kl2RgOG8UYLpUTpXodYU=
X-Gm-Gg: AZuq6aI//oHFQMFXYHFgPf6MWuZGbUFA5dJwCtVW5ck48ZgxKJgosWCgtRYg9Bhf/bl
	uacNOcOl0RSilUX6m/aGA1A8BCf64BHZTQq1rYlP5EhCfkckmN0Ki2P0n4AG5lJ4wxq3rgm7zvw
	eyVl/qcKajNL7YL3riDuF70Eanx4QC/bP9yYRi+lr/sapKCeYp6ZNtPys8uFTkJJxjXd3q4NNKX
	17VOsfDaIGiRqV/7Z1VAzkpnv6uZYjbAoXW3TezjZQCMTwqCel2YNUpxRFaZajcFynCbpEYxXkO
	duNSv/k0EV9481FH0KsUqNN/043a7UCN/W9gVID97o/gIuA9SdXAlcsae2JmtZ0qk5T8gNaPfnr
	YOYnupfYj1HzcBUGZqQzcXjgACcXgQVYFVp45gPvpuxoDlDImpw5dFjwc8t20nQV+FfE7bNQuG8
	8cUpZ10au32cvoB2K8M+ONxre8rsIS9fxh5fUwnERdF6rqnTjYPJ6vt8Dj
X-Received: by 2002:a05:622a:1ba9:b0:4ee:4512:4a24 with SMTP id d75a77b69052e-506a835cb44mr150661021cf.72.1771269350725;
        Mon, 16 Feb 2026 11:15:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8971cd75df8sm21192736d6.30.2026.02.16.11.15.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Feb 2026 11:15:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124a95b6f61so61568767c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771269349; x=1771874149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NJl/yKqTclNT9kEkBmAeTF7lEJo3F6xT2CC7EiH5zHk=;
        b=Klv8WItwrYkUpGqPRNLDoLtR9KSzpR+MoGdlig5Huk8RwSZhfCDCjZDNsVRchXPr1M
         puz9JnU9+CAXVMqilbIDg5c1QBnpRyYrMaNshlv1KF7b+kI9FXXF7MxxC1wYRJHNjJto
         aAFEl0Bw3/h/FdIJ9bacRp0liIdFeKAW7SyBs=
X-Forwarded-Encrypted: i=1; AJvYcCV7GoBjSzbyXIPFmmo4w+piav8ntVY7a1ccomiRktL1YvHgSZiDZMscoXbvKkQsOCp4uZqD1eavjPbCXhVRRqoa@lists.infradead.org
X-Received: by 2002:a05:7022:439e:b0:122:153:d161 with SMTP id a92af1059eb24-1273ae1655dmr5050537c88.17.1771269349579;
        Mon, 16 Feb 2026 11:15:49 -0800 (PST)
X-Received: by 2002:a05:7022:439e:b0:122:153:d161 with SMTP id a92af1059eb24-1273ae1655dmr5050523c88.17.1771269348982;
        Mon, 16 Feb 2026 11:15:48 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cada1csm11067327c88.9.2026.02.16.11.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 11:15:48 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: adrian.hunter@intel.com,
	ulf.hansson@linaro.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH] mmc: sdhci-brcmstb: use correct register offset for V1 pin_sel restore
Date: Mon, 16 Feb 2026 14:15:43 -0500
Message-Id: <20260216191543.2514647-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_111552_744342_DCFA2392 
X-CRM114-Status: GOOD (  12.68  )
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

The restore path for SDIO_CFG_CORE_V1 was incorrectly using
SDIO_CFG_SD_PIN_SEL (offset 0x44) instead of SDIO_CFG_V1_SD_PIN_SEL
(offset 0x54), causing the wrong register to be written on resume.
The save path already uses the correct V1-specific offset. This
affects BCM7445 and BCM72116 platforms which use the V1 config core.

Fixes: b7e614802e3f ("mmc: sdhci-brcmstb: save and restore registers during PM")
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/host/sdhci-brcmstb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index c9442499876c..57e45951644e 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -116,7 +116,7 @@ static void sdhci_brcmstb_restore_regs(struct mmc_host *mmc, enum cfg_core_ver v
 		writel(sr->boot_main_ctl, priv->boot_regs + SDIO_BOOT_MAIN_CTL);
 
 	if (ver == SDIO_CFG_CORE_V1) {
-		writel(sr->sd_pin_sel, cr + SDIO_CFG_SD_PIN_SEL);
+		writel(sr->sd_pin_sel, cr + SDIO_CFG_V1_SD_PIN_SEL);
 		return;
 	}
 
-- 
2.34.1


