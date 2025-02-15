Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6296BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AOPD4qymf/IqNbBDolDLOPpuGGy9P3JOLEcWb703OHE=; b=bHNzHTSC0/emaqrVx9h53QajlF
	wobSb96r1IvVysoXo6JHOPyZguo8A/xUbvgSbP+EwQkpSKhgPHRzM8zqxE1g74oMkF8JyhcRMx5gs
	wRbCYIuNzRjj8+Wd+aL+zgAmUNHLICg79ANuHY2skjDbjcOKf9BY7k7w6My3okpKCH5nP/mTo8t0U
	pwuaonv6rYYmeCITFFtIODIng3JzXpihf7kfUaQyrd6I4XGwTU3ea6H04aak+ZMsQYJhDstgnEbT/
	cqIQablOrcVgbEPa550aghUo0CQULuSI8sV0vq7PLM1EVvRJE7cOl4TGIjpkMb7YBPbGCajwbrO4d
	4dDZPJMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHEv-000000002W2-1d6Z;
	Sat, 15 Feb 2025 12:25:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHDT-000000002GX-09Ly;
	Sat, 15 Feb 2025 12:24:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4396a4d5e3bso13340565e9.3;
        Sat, 15 Feb 2025 04:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622253; x=1740227053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AOPD4qymf/IqNbBDolDLOPpuGGy9P3JOLEcWb703OHE=;
        b=UZIpupg7Pusz5KT4lO+3dzB+qpv6VHdyaOSIf1OMT+E4TLm88CYcHrnTzjn5GhFEeE
         xIBMXWs7J4igLUUhxdDaWPQ3A54ROwwESNZu0tI7BgeBJFA715bpUQJGlM9OrjNgxexJ
         mPSIair/zI2Ry+GNDPYtoGFNLYlx0pe7KPpbAcDJ3KuqAx4miwIWUc2ZogszTYCtodm7
         QMbmpgbqbxEPJ2WVlDf8OEwczQTRLoJvEez+Ys7FNPTadJJV64pwyMV+mQYJTWYoHoUm
         vPn24uYxvhTUOSkX99imxcZsKsJvlMcu8uzztjOh4Y6RiezeQb2zyWMjriDnU2KD2yLn
         YuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622253; x=1740227053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOPD4qymf/IqNbBDolDLOPpuGGy9P3JOLEcWb703OHE=;
        b=XjEkrdLolN9i1NX14phbxodleOtOIouAVRO66b9iDR/zD7kdSkq3rP5r2RcDF7QyMJ
         aANJY2LOOp4qiYmE/v0IAHiTj6yrcsi/v9M5FZf/ALAnUEy7/THZjrjY3gdkP2WBYmaJ
         +IKv9NM+jAOOnvvR4dAaxdsg2yFg0jAaqS0FfTEx+vdoAkVLi/yWZVzyNCnxLmM9Yo3C
         CXpfV3Srj4LqeQ1avr1LYtVg9ffTg/OvI3F9bCbrr5DUuiti7ewb3j5qxJCM+S9xK/sL
         cCETCMvteB+5xdRj2NdMUsQ7tGXKo+HYcHZitKJx4WOoJ3DFvzb9iFoRDu2MK4aTl+iY
         iRyw==
X-Forwarded-Encrypted: i=1; AJvYcCV8UmKCpWR14jEecIu8uo4mXBpCBQaT2wucHUGn/aQ8mQffocUjAujwCPnPPRU0ZqCzPOqdi4OA+6k=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrQOQEW6aK7wikjAocM4z4lGN8Lu0KJk4IjMuBAAmYxVWgJ5ku
	oZ3ua6iElvQJrwZSBDKoC64X6koE6xseR6t16eqk0VUKKjoZJl/p6MCE8Q==
X-Gm-Gg: ASbGncu1V2kWEb3/SRDSlezNQQzMyqVE+n74Q9620PkLW0TgYRI5q6r8+5fNcQTKXm+
	q/cw/3u+RDaLlozu7cVFGEENMWlJJ2M5AnV1j/3nc7GhJAqi8cuGsjDgdLJjH+HhhfkKy5BMyZj
	PTulWztPryFD+EpCNCUPPGuxLL5X1WhIE+csufe9Ar1RFydpANuaw1OI87C+K5j6pGYMyzHfBAs
	GG7t8Ru2YwJIwUgKcMJAAUo/5wlVEAitj84RAc+AMPPsqoHiwg6dlwRpkGoxt5Gb6JbbEVjGJzV
	/cUDjty22MixInSkdhPf3MZas2qBclRmKBAxx718BvtE4D3hYARuthGRf3CMcnxc1h8=
X-Google-Smtp-Source: AGHT+IF2EDbcWuGuPwaVqGyExCl4jmeDNEBMWClpEDv9+wDSPNJiMarBLIkfU3eg/COziRDF/asPfg==
X-Received: by 2002:adf:e750:0:b0:38d:ba09:86b5 with SMTP id ffacd0b85a97d-38f33f56af3mr2707537f8f.52.1739622253043;
        Sat, 15 Feb 2025 04:24:13 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5b40sm7188175f8f.68.2025.02.15.04.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:24:12 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Date: Sat, 15 Feb 2025 14:24:05 +0200
Message-ID: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_042415_076397_87228654 
X-CRM114-Status: GOOD (  11.73  )
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

Hey folks,

In the vendor kernel, everything is handled in a single phy driver,
with helpers for functions outside it. Clocks and regulators are
specified and enabled in one node, which makes it difficult to
separate what clocks and regulators go where without access to
schematics or TRMs. The following gates are defined for USB:

CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBSUBCTL_APB_PCLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBDPPHY_CTRL_PCLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBDPPHY_TCA_APB_CLK

CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBLINK_ACLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USB32DRD_REF_CLK_40

CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_EUSB_CTRL_PCLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_EUSB_APB_CLK
CLK_BLK_HSI0_UID_AS_APB_EUSBPHY_HSI0_IPCLKPORT_PCLKM
CLK_BLK_HSI0_UID_RSTNSYNC_CLK_HSI0_EUSB_IPCLKPORT_CLK

From what I've managed to understand, this SoC has 3 PHYs for USB:
 - a synopsys eusb2 phy
 - a synposys combophy for usbdp and superspeed
 - a usbcon phy, which can detach/attach pipe3 and has registers for
   linkctrl

The approach taken here is to introduce 2 new separate drivers: one for
the eusb2 and one for the usbcon. The eusb2 driver is modelled to take
a phandle to the usbcon and configure/unconfigure it for the eUSB2
to become accessible and not cause a hang whenever its registers are
touched.

A new USBDP driver will be added later on, so that pipe3 and super-speed
can be configured.

Best regards,
Ivaylo

Ivaylo Ivanov (4):
  dt-bindings: phy: add samsung,exynos2200-snps-eusb2-phy schema file
  dt-bindings: phy: add samsung,exynos2200-usbcon-phy schema file
  phy: samsung: add Exynos2200 SNPS eUSB2 driver
  phy: samsung: add Exynos2200 usb phy controller

 .../samsung,exynos2200-snps-eusb2-phy.yaml    |  75 ++++
 .../phy/samsung,exynos2200-usbcon-phy.yaml    |  70 ++++
 drivers/phy/samsung/Kconfig                   |  26 ++
 drivers/phy/samsung/Makefile                  |   2 +
 .../phy/samsung/phy-exynos2200-snps-eusb2.c   | 351 ++++++++++++++++++
 drivers/phy/samsung/phy-exynos2200-usbcon.c   | 241 ++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |   3 +
 7 files changed, 768 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
 create mode 100644 drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
 create mode 100644 drivers/phy/samsung/phy-exynos2200-usbcon.c

-- 
2.43.0


