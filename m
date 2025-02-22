Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD50C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 19:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pd43a9MHVoICh4a3HzPPv+MCm5aOiuEViUTV2lQ3hCA=; b=IJXhW0lYyV4stcLA5v5Xy/1DMC
	f2BSxSH9Tim306504XCi1HpzEQ/uA2rx2a49dObWt4PxtAmKy/RLt6ubwVBN8CI6GdyzfhBj60sjR
	2EtGSMlN7MUHRf3nxb80aqAh+7nBZVJD/Y6tPtT7Y1/+RGAyBgFyh5QQ21lXMVQkRF9fS/f3PDOrs
	cBhB7UNMdBSDYwJUD10DQx2iFG9bOj2bHAu2mj4yZfRNTGrOvqX1jkbPVe0obAEDeiPXAcQLHC3Bt
	nakiqh/ZkzT1LEeiPP2rO9Kc65pWLKHva2B2iIAfYMkAN5swdDVvcW5mxzHx/GUgwBMTxKvjwcJ4H
	R0dwvzqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvHq-00000008ccs-2t29;
	Sat, 22 Feb 2025 19:35:42 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvGM-00000008cUa-3soX;
	Sat, 22 Feb 2025 19:34:12 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5fcd686fe0fso1860204eaf.3;
        Sat, 22 Feb 2025 11:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740252849; x=1740857649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd43a9MHVoICh4a3HzPPv+MCm5aOiuEViUTV2lQ3hCA=;
        b=eoI/8E9Ps1S2A5sbl2Y0v9+bub38i1CUrWsrJRsdz93oOBM6CW2XhRJOqRjTKWKBE0
         XHDXxb4pjJZPHyArkQ9WDrzmUaiH0Y4Iz5lgbjxIkI27G/pb7oZ6Ntvj3f2dEpWPJQPc
         NlhRxP66cb+WDjYwtonr3r0m23bWf3LL3epR4pvRm0YegZUfP1BHPqxJbXr67iCoMDom
         eJsXYjisLvc+yGuDc00TdzTQyaSY8VZGm1onwmPGawIx8ElqhJSt0e9U1qOdTTYfSZtG
         Braz+2F3kTa4U7S5u/q+jqSfMP+KNiZUuYpSau6PbfmotR64JCougePGygUe/fKsz1yO
         IahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740252849; x=1740857649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pd43a9MHVoICh4a3HzPPv+MCm5aOiuEViUTV2lQ3hCA=;
        b=F3Op9O6xHD/gmWHkNbHRNI0kGzaHkFYvPZsWX2ytWqAni/ovK6aAalc2QVWeR+Mtc8
         GZJH8zHJBq+3VHlXq/s72v3JCcxqixUaCXRd8x5E9wWtpoEUohV3EZMuW/0k69ksGYx7
         UjTHCRz5Oi3GA1K0Z8hwsFkrHP2KUzIdcPeS2vSkG173L4Co5wByG552i7lnia8pIUX6
         5upI0M6Midxns1qvs6ncfWCJEyw7odkr5+Qdt7eL/f/E/fuzd2zghtA1RIH9otpvNFFS
         hid0DrKhsgekremV1BsgMrBBajU4vI4F9ukhDOIczBq7zM0ChNjdJ0YoZ1/uMXjyrKnh
         9s1g==
X-Forwarded-Encrypted: i=1; AJvYcCUUChKXOPjT5uy3VRmoVZR19+0q/OgUAiJWFNKxyGNQREEI02pdaSjwDdiHQ5KWbuHYyrN1W3fnqNbPl3xGTLZ3@lists.infradead.org, AJvYcCVtBtUj0ubTdv/fV+NSBsjlSVyNFfri7p772C5KonP32Zd0OWiuQcbN50ZEzxrS3AnsM+JKDjjqVvnWapUtYeU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7pWvEYuS2gLYzFItjwQq805pOBtZUCTjmcuY684YRE8qNqpqg
	tJswqJJxHKm4xWEZ23rboMLoEgBMFDtJKW7cuypw/KNb0nvf+XDn
X-Gm-Gg: ASbGncvOuTSGBROAFMbPqD3eTpVvu4uXBw97HdTohU1Zx7geFHT8g3iHSAQJDW+NRfE
	JJj7GxxH9TmaVvo4X0N5w9Ko3awGAprWd2gkv2gPhgDhRqDZxPF2nB+y2T6I+WSgo0wvml80YLy
	r91AJfNPjoJTz4r4w+V1kfwyGtPmYXdg1m4pXmbPc8oq+oseEMOycuauA8JqTlt6rEuaRaTZoic
	GIBhWNieshyQx9BRGMwapOZpK3hpZtv0g+1i4WO9I50qIb/lDp02+8BuVFtuaDXyLFQ3RC6uu3W
	2MslZvkBU3YU9GuUI695+Rf9VZONtS7+pA==
X-Google-Smtp-Source: AGHT+IECzTbYt3NmTrSq+8RDe0MmHfmCsANljrYV/iu6RSScvtdnp87PSX3HecDEFNEkc/hybrkhtw==
X-Received: by 2002:a05:6820:999:b0:5fc:b418:8cd3 with SMTP id 006d021491bc7-5fd1963475emr5853290eaf.6.1740252849525;
        Sat, 22 Feb 2025 11:34:09 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:b69:ffa3:9d4e:2cd7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fce7afabd8sm2724012eaf.34.2025.02.22.11.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 11:34:08 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Johannes Erdfelt <johannes@erdfelt.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v7 0/5] Orange Pi 5 Ultra
Date: Sat, 22 Feb 2025 13:33:27 -0600
Message-ID: <20250222193332.1761-1-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_113410_969570_42EC3B7A 
X-CRM114-Status: GOOD (  13.39  )
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

Add device-tree for Orange Pi 5 Ultra

Thanks to Johannes for testing

The schematic has been published for the Orange 5 Ultra. [1]

It's a sibling of the Orange Pi 5 Max [2] with the HDMI0 switched out 
for the HDMI RX. As a side affect the pin for USB_OTG_PWREN [3][4] has 
changed.

Also, the Ultra's PWM_LEDs have the polarity inverted

Patch 1 can be included in 6.14-fixes
Patch 2 and 3 can be used on 6.14-rc1
Patch 4 can be used with 6.15-rc1
Patch 5 is waiting for HDMI audio patchset [5]

My testing branch with dependent patchsets is on github [6]. This now 
includes extra patch in clk to throw NOENT [7]

[1] http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-5-Ultra.html
[2] http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-5-Max.html
[3] https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-rk35xx/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts#L306
[4] https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-rk35xx/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts#L321
[5] https://lore.kernel.org/linux-rockchip/20250217215641.372723-1-detlev.casanova@collabora.com/
[6] https://github.com/jimmyhon/linux/tree/integrate-6.15
[7] https://lore.kernel.org/linux-rockchip/2425191.NG923GbCHz@diego/

Changes in v7:
- Forgot to commit additional include in Ultra dts

Changes in v6:
- Add R-b from Rob
- More differences between Max and Ultra
- Ultra PWM_LEDs have different polarity than Max
Link to v5: https://lore.kernel.org/linux-rockchip/20250220041010.3801-1-honyuenkwun@gmail.com/

Changes in v5:
- add USB 3.0
- add HDMI1
- add HDMI audio
Link to v4: https://lore.kernel.org/linux-rockchip/20241229184256.1870-10-honyuenkwun@gmail.com/

Jimmy Hon (5):
  arm64: dts: rockchip: Differences in Orange Pi 5 Max
  dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Ultra
  arm64: dts: rockchip: Add Orange Pi 5 Ultra board
  arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Ultra
  arm64: dts: rockchip: Enable HDMI1 audio output for Orange Pi 5 Ultra

 .../devicetree/bindings/arm/rockchip.yaml     |  3 +-
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../rockchip/rk3588-orangepi-5-compact.dtsi   |  9 --
 .../dts/rockchip/rk3588-orangepi-5-max.dts    |  8 ++
 .../dts/rockchip/rk3588-orangepi-5-ultra.dts  | 84 +++++++++++++++++++
 5 files changed, 95 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts

base-commit: fa15cc73121279f93757ec76312b0d0b73f7462a
prerequisite-patch-id: e7cb3b62d173506d38a10a8e71eedd62ba6a1bc0
-- 
2.48.1


