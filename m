Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE86E77198
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 22:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yVwTqtMBmufKy+4+Qd4AnDnVsi8YGYtimBuBuOfsG0Q=; b=l2wekGuDcbEp48HJ5CLR0NtRiS
	AVENgIBcFTL+f77ce68bPEAWr+zATc+z07ZJpA6aGtn74rPy8eCnSCdbMon/1tyesqFA78BgD1Ao/
	9JcP4oF8MlODR9UZ4UiJVJ5AIeMEK19uTmujQ/85/XILqpw6O3V5yLG3yQMGxUqEWNMxg0gaMdE9G
	RGuQc18XRtHVBtUc41yspkAGuEoOKlwhlaVxH2xKgefCS5Obp2WdrfYb061TUwqN8fKulrgx/x3qb
	YmbPocpg58ZjPHlSJcJhY1sGYfZDtp5vlIcjVzshTWPbLlnZ4RKlAMOe1t03lU3EeVKuFhtPtbzAW
	OJUKSeow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZ6K-0000000HT1N-1TK1;
	Sun, 05 Jan 2025 22:28:04 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZ58-0000000HSwk-0ktl;
	Sun, 05 Jan 2025 22:26:51 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3eba0f09c3aso4655709b6e.1;
        Sun, 05 Jan 2025 14:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736116008; x=1736720808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVwTqtMBmufKy+4+Qd4AnDnVsi8YGYtimBuBuOfsG0Q=;
        b=ehfaAMTQQeluiCvB5F80qhQg+eqMzIpqMz5Hc2BDDdba90m3TpXNFPDmXCTTapVWWh
         Mle4MorjlbUhX1OfWDdLOQDPmucmHC4okpkmTJkcoVLG90huF/t2Hdj6m2T5ldyGnYo1
         GqNDsAONhqh5AgXNOn2t+OsmbRQ8/adpHTIVUxI87t5aVgaemWb+7xCuI7RGnRtcD4Oc
         TniwUJt+SPcMyI8Ci5AhvZfpqCnZ0ktM9IenAuKuzxrOfb2SvuOmVwChKUEhtGFLO5Vf
         ZHDNDjTNbaQguxgtaLrnmuafhiDIO1btoDGFpv+rlbmedaUE4kyYxz/BShEmXGKfwJKh
         BOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736116008; x=1736720808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVwTqtMBmufKy+4+Qd4AnDnVsi8YGYtimBuBuOfsG0Q=;
        b=imER7pYS7DXE8CNSLJchLCaRwKUOJyHJ3/vqF4Z+YRflaxCJ1y+4s0+u2rDgZCqym/
         ugj5oqhS4hA650YGCsD1uZyuOuMOfaT48TzItXANj3/tJo6dhdXrz4LAa2sys+MJzuCc
         N3f9SV7kgfuqmCgHZr/wABm2mO0+OY6IEylcaxfRwUwbGmQUnSm6Dko590Kuqt40KDaa
         U8qIpCVIJW8kxEGYmiJ32lfRxknijdFnlgSFSZQH0APcrrwNoWaGJ6gH1V3hDIyPoaSz
         NMUODeEuhOoAAbgdbN8CMvxFHipyh9kqSsHWymSFxpXsqKetihPlzQAz9I+anmxDSttF
         Og7g==
X-Forwarded-Encrypted: i=1; AJvYcCV/fvDm8hoH6+hHRhAOMx4H/23dGF8DawD7ayECuWqfl4qdEArvoFUg6RwFbdxyVEvnhsOnDEWfvOmEhxWCMbMu@lists.infradead.org, AJvYcCWqtW3qID1GiflcGcqnh4A5YPvEtYdUnl9GLPxIYEmYIuxVlFE0NLwL3CgMBjCI27mo9SZNtY724cCWvfUuJrE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMVzcop40dZAuz7iL15gQcceK8AuOF5MlW5ACS12UHCYnbeAFt
	8txJP0OT+n8sV2xH58lY09UbUlrXQybVyDGefLgLZeYS0L3bzUL8
X-Gm-Gg: ASbGncvLkCV2w0xHIZE8/xPMaztUpMlOUuii3IfZxdSTc+GS8nY9we5GNILscmHFlWh
	0GtLQuo1pSMSaU0rnVG1gBAvcB6tKC6OaIJMB9Cu5qV2AFTt5qAapm1bqOeyaZXaYM9rw1Y8Jfc
	RkCCsH4kcujMp294d4yB47kS2p8PNfc+DqXBag6x/cCVVEmAbSGmabMEJT/QsLPGGcPY8QE7GLV
	wqsNLKHZMrypNnIM5R1L2jhMLs2Q7SjK2M14nsKV7+G9s+yDpwKMUt3shhu0MK9Fw==
X-Google-Smtp-Source: AGHT+IHbBRJ9nMbE34acFF8TAd1PhbaT6XoSzAtuwlbwM0Aqvg9qf+IuJ+CehsLkJusQr87XsmRxqA==
X-Received: by 2002:a05:6830:6d8d:b0:71d:5117:c07f with SMTP id 46e09a7af769-720ff4a6899mr40495188a34.0.1736116008135;
        Sun, 05 Jan 2025 14:26:48 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:b377:72ce:54b5:bddf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc980a9e8sm9555227a34.43.2025.01.05.14.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 14:26:46 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v7 0/4] Orange Pi 5 Max
Date: Sun,  5 Jan 2025 16:26:09 -0600
Message-ID: <20250105222614.2359-1-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_142650_218752_F6D97BEE 
X-CRM114-Status: GOOD (  12.81  )
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

Add device-tree for Orange Pi 5 Max

Orange Pi now has 3 SBCs using the RK3588 SOC. Refactor the common parts
of the 5 Plus DTS so it can be shared with the 5 Max and the 5 Ultra.
The 5 Max and 5 Ultra have a similar credit-card sized board layout and
will also share a DTSI between them.

5 Plus: HDMI0, HDMI1, HDMI RX, M.2 E-key, USB-C
5 Max: HDMI0, HDMI1, WiFi/BT using SDIO/UART
5 Ultra: HDMI1, HDMI RX, WiFi/BT using SDIO/UART

Changes in v7:
- Add signed-off to first patch
- Expand first patch description 

Changes in v6:
- Remove clock-names from incorrect merge conflict

Changes in v5:
- Include Orange Pi 5 Plus USB 3.0 change in baseline before refactor
- Defer Orange Pi 5 Ultra to a later series
- Defer Orange Pi 5 Plus HDMI1 to a later series

Changes in v4:
- Orange Pi 5 Ultra was released and does not use VP0 to HDMI0
- Move HDMI0 from common to the board level
- Make DTSI to be shared by the credit card sized 5 Max and 5 Ultra
- Updates for the newly submitted HDMI1 support
- Add Ack for dt-binding

Changes in v3:
- Refactor to share common include with Orange Pi 5 Plus

Changes in v2:
- squashed commits together for initial board file

Link to v1: https://lore.kernel.org/linux-rockchip/20241026100310.52679-1-honyuenkwun@gmail.com/

Jimmy Hon (4):
  arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi
  dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
  arm64: dts: rockchip: Add Orange Pi 5 Max board
  arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3588-orangepi-5-compact.dtsi   | 151 ++++
 .../dts/rockchip/rk3588-orangepi-5-max.dts    | 101 +++
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 855 ++----------------
 .../boot/dts/rockchip/rk3588-orangepi-5.dtsi  | 805 +++++++++++++++++
 6 files changed, 1127 insertions(+), 792 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
prerequisite-patch-id: 6346d482f91509dec24bfe5d4f0ca0d345b90deb
prerequisite-patch-id: 4672b745f4308a7be527749279edb71625d120e6
prerequisite-patch-id: 2743fb64eba2a29eaf993ebc8a5d6ee445b69dfa
-- 
2.47.1


