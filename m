Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC68CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IKVoiH7XLcNaedQxfza9YTAwsoIt9Wu8Ls74q3lR27g=; b=fPa3+mFiIVHz07wgqZnsL/9uFK
	dems4hk4JuiFTMqPAWF6o5VtuvZoqlnV6rK/MGDKpx1ChnB1GTzCiTQf11zcqwZzgvU8YEW0BTi/L
	69Ysl6g/itOksK7RxzpBBDino4hfResrl7Upvz4zjyY3yVI8FiByVJbj50yLDUaDGzA/YlMVv4+/+
	EklruSozL8J25QLXfTriGPZaMou5gP5jwX60zrqOLIYGt1xENylDY5q2Ufohi8k0uqniLIl+kL25p
	22GnBlCfQiofJ5AjtUx6DrjqsXdGouExSgRNZyEk1j4SlGoLr2hG41t2zfeTNionBh/6eARS9RdBv
	g9MW/KpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4kj-00000009tDM-2lz6;
	Fri, 12 Sep 2025 14:27:53 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4kg-00000009tBl-3jMh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:27:52 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5607c2f1598so2236517e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757687268; x=1758292068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IKVoiH7XLcNaedQxfza9YTAwsoIt9Wu8Ls74q3lR27g=;
        b=UIioxereYyX0ANJbagIwv3vRw4zUupa1x9bndHWZHmbb4sbIvspuYAwI4SrQYPgjku
         2y+NmaN5YI18DcMxnMGksD5Wi1QArimq6eBaYqyPuiS1L0OH7yvKdlUSPyIXODCVjMX4
         Dv25csF+Av1upP/89Tn75K+VyExPSYzaiqmY1xIU/AII7v3x3rO37IJUedQN2OtZn56W
         VABpIry/ICl1eVz7yE9kM0aBGz3hCJWCYkdz8g0ssrJ2qcx8zUWqwzEKKDD9HthJtR7q
         A5TkJ9mEdpR/PPnajjflOhSa4zJcZuqMnDmaMGOTmzpCRSYHpFCgbhHu6BoCingxYygr
         Fvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687268; x=1758292068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKVoiH7XLcNaedQxfza9YTAwsoIt9Wu8Ls74q3lR27g=;
        b=bcnKCiwHkSpJIhAuyalyykVetarD5FD0OVQcouHY3lznZwmXfsuJUeDn5bMtkD4XII
         f1KdzKT1XhTx4DwFyRhWmIQtw/5bvcd9y0oGr8KPpfExZQKuL3+NFT9xbyGhl3/XckOU
         4dmT1P4bYMBxo9EtDEyYtvjjZgn8k7vSekaJDbc28vriGIfdLcYWolVil9mF53Sy7Ici
         ZNhTt1Na9fbjvZO4WaZPvSidujH47DYROmRWG4MNydlfoLXwOVdEyQr3VcvtAL5D96i3
         +X1wTdUlfTKckGJ8Tg13BvpjXuGQOUAxgfelKQb4bxhouLvFh/ESKd+zJOgwNUv5kFX+
         Ohug==
X-Forwarded-Encrypted: i=1; AJvYcCUCSVsYEDDvXXKkSNiN8oVJqUD6YfAbEGpmI9Z+zsdBWxckQB7W92/E5NgDYGLI9PST+ItFV0kGjHFX71lhot9I@lists.infradead.org
X-Gm-Message-State: AOJu0YyJqjgo+pPytcjUbsfP3kpNZNqfrWhk8drglEOc6amY+VVyh44L
	DvzQu7x+h/bIDK4cTsXEKp1Y4nmsw8k1X/XK4ZNQlZkk0tWkNAsZvOkZgLvkDmaT1HM=
X-Gm-Gg: ASbGncvWkLTP0pLGUnMuu4lRi8rLzSuhDrwuDoAfO+XUvsNjdYwoWNvu+GxiMH8y/Xd
	S6JGdEwkgse+MKOIu9LBRAbyMeD+Y/OuX2xIH43yCOuRnEq8z4LMvHRLUPnTv5zqdif0tKwJWid
	mIVU1vu6xHK81D/hc978QfYvVpb2GjPjeEp2gDBjXFho5ilzoUAH6aoBqgmnn8yvXvwKbdZstn/
	Cb/nSGwbQDUQSte3+yZoNdEvh+Wfux8dBjIETfxoqt/FU78yzmkYBdhyB//ZCKiRQbJ67Y7c/V3
	KtuS1OxNH4z1FgxLRAqXtTbnsjHO/JgzGjkmSAni0DcyTQtULw3O3BaWfn+roQTs0pHiOw9MIFZ
	8c3NrCtnn+neBmkuK4ddUW/3LetGAChpz2DYFBeR+0mwtrk4/Q8/8VFE=
X-Google-Smtp-Source: AGHT+IEElym8VeagaBl+nzdswFEmu7VAD/4OSv6vmc7bSL5e4EMGTxBVOdIqLiD6z+3vnjFAisOdJQ==
X-Received: by 2002:a19:6a13:0:b0:55f:6a68:c44a with SMTP id 2adb3069b0e04-5704a105f44mr667707e87.2.1757687268467;
        Fri, 12 Sep 2025 07:27:48 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63daesm1171816e87.77.2025.09.12.07.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:27:48 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ulf.hansson@linaro.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 1/4] pmdomain: rockchip: enable ROCKCHIP_PM_DOMAINS with ARCH_ROCKCHIP
Date: Fri, 12 Sep 2025 17:27:35 +0300
Message-ID: <20250912142735.2843958-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072750_951891_5CCF7F2C 
X-CRM114-Status: GOOD (  12.71  )
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

On rk3399 based rockpi4b, mounting rootfs from mmc fails unless
ROCKCHIP_PM_DOMAINS is enabled. Accoriding to
Heiko Stübner <heiko@sntech.de> all SoCs since 2012 have power
domains so the support should be enabled by default
on both arm and arm64.

Failing boot without CONFIG_ROCKCHIP_PM_DOMAINS=y:

https://ledge.validation.linaro.org/scheduler/job/119268

/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e: Can't lookup blockdev
dw-apb-uart ff1a0000.serial: forbid DMA for kernel console
root '/dev/disk/by-partuuid/1d48ffd8-f2a7-4a33-b52f-186089b3c85e' doesn't exist or does not contain a /dev.
rk_gmac-dwmac fe300000.ethernet: deferred probe timeout, ignoring dependency
rk_gmac-dwmac fe300000.ethernet: probe with driver rk_gmac-dwmac failed with error -110
rk_iommu ff650800.iommu: deferred probe timeout, ignoring dependency
rk_iommu ff650800.iommu: probe with driver rk_iommu failed with error -110
dwmmc_rockchip fe320000.mmc: deferred probe timeout, ignoring dependency
rockchip-typec-phy ff7c0000.phy: deferred probe timeout, ignoring dependency
dwmmc_rockchip fe320000.mmc: probe with driver dwmmc_rockchip failed with error -110
rockchip-typec-phy ff7c0000.phy: probe with driver rockchip-typec-phy failed with error -110
rockchip-typec-phy ff800000.phy: deferred probe timeout, ignoring dependency
rockchip-typec-phy ff800000.phy: probe with driver rockchip-typec-phy failed with error -110
rk_iommu ff660480.iommu: deferred probe timeout, ignoring dependency
rk_iommu ff660480.iommu: probe with driver rk_iommu failed with error -110
rk_iommu ff8f3f00.iommu: deferred probe timeout, ignoring dependency
rk_iommu ff8f3f00.iommu: probe with driver rk_iommu failed with error -110
rk_iommu ff903f00.iommu: deferred probe timeout, ignoring dependency
rk_iommu ff903f00.iommu: probe with driver rk_iommu failed with error -110
rk_iommu ff914000.iommu: deferred probe timeout, ignoring dependency
rk_iommu ff914000.iommu: probe with driver rk_iommu failed with error -110
rk_iommu ff924000.iommu: deferred probe timeout, ignoring dependency
rk_iommu ff924000.iommu: probe with driver rk_iommu failed with error -110
platform fe800000.usb: deferred probe pending: platform: wait for supplier /phy@ff7c0000/usb3-port
sdhci-arasan fe330000.mmc: deferred probe timeout, ignoring dependency
platform fe900000.usb: deferred probe pending: platform: wait for supplier /phy@ff800000/usb3-port
sdhci-arasan fe330000.mmc: probe with driver sdhci-arasan failed with error -110
platform ff1d0000.spi: deferred probe pending: (reason unknown)
platform hdmi-sound: deferred probe pending: asoc-simple-card: parse error

Working boot with CONFIG_ROCKCHIP_PM_DOMAINS=y:

https://ledge.validation.linaro.org/scheduler/job/119272

dwmmc_rockchip fe320000.mmc: IDMAC supports 32-bit address mode.
dwmmc_rockchip fe320000.mmc: Using internal DMA controller.
dwmmc_rockchip fe320000.mmc: Version ID is 270a
dwmmc_rockchip fe320000.mmc: DW MMC controller at irq 45,32 bit host data width,256 deep fifo
dwmmc_rockchip fe320000.mmc: Got CD GPIO
ff1a0000.serial: ttyS2 at MMIO 0xff1a0000 (irq = 44, base_baud = 1500000) is a 16550A
printk: legacy console [ttyS2] enabled
mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
dw_wdt ff848000.watchdog: No valid TOPs array specified
mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 50000000Hz, actual 50000000HZ div = 0)
mmc0: CQHCI version 5.10
rk_gmac-dwmac fe300000.ethernet: IRQ eth_wake_irq not found
mmc1: new high speed SDHC card at address aaaa
fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1] Detected!
fan53555-regulator 0-0041: FAN53555 Option[8] Rev[1] Detected!
rk_gmac-dwmac fe300000.ethernet: IRQ eth_lpi not found
mmcblk1: mmc1:aaaa SC16G 14.8 GiB
rk_gmac-dwmac fe300000.ethernet: IRQ sfty not found
GPT:Primary header thinks Alt. header is not at the end of the disk.
rk_gmac-dwmac fe300000.ethernet: Deprecated MDIO bus assumption used
GPT:1978417 != 31116287
rk_gmac-dwmac fe300000.ethernet: PTP uses main clock
GPT:Alternate GPT header not at the end of the disk.
rk_gmac-dwmac fe300000.ethernet: clock input or output? (input).
GPT:1978417 != 31116287
rk_gmac-dwmac fe300000.ethernet: TX delay(0x28).
GPT: Use GNU Parted to correct GPT errors.
rk_gmac-dwmac fe300000.ethernet: RX delay(0x11).
 mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Suggested-by: Heiko Stübner <heiko@sntech.de>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 drivers/pmdomain/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/rockchip/Kconfig b/drivers/pmdomain/rockchip/Kconfig
index 218d43186e5b9..17f2e6fe86b6f 100644
--- a/drivers/pmdomain/rockchip/Kconfig
+++ b/drivers/pmdomain/rockchip/Kconfig
@@ -3,6 +3,7 @@ if ARCH_ROCKCHIP || COMPILE_TEST
 
 config ROCKCHIP_PM_DOMAINS
 	bool "Rockchip generic power domain"
+	default ARCH_ROCKCHIP
 	depends on PM
 	depends on HAVE_ARM_SMCCC_DISCOVERY
 	depends on REGULATOR
-- 
2.34.1


