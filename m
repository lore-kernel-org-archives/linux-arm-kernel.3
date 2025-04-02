Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A310C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 20:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AmK0Ra5TtcArDaUJ5j2HthYPux7vb8lZx0CQMomz70U=; b=sEtUdfZ+aSfRNlSjAFeOZngfdc
	MFQ+8lMqd1K2pPUcIh732CpX9SSaqqf6YKNvHkPNRFlUlVxGhZeA/RXXD6b3W140TwFaZ6LddqQTv
	7kD3tv3QplzNSNgNDSC+khSwzwukQdAN4EQpRhkif9zAP70VptfdvQzoRIOaYCWbRBtdw10/zVbyX
	LyYChJI1J38oCWcz3nOZDs9fsuHCEPOuF3x9FaCIVrOvTQiMkK46bVOEleqNP867taW/YpjvOzTj3
	ytTd2aCbZULJk2xO/VUN4k10Lcs9L4NsKykPrh/31KGIrIhkiclA7mkgGpa1IMpU20DOi7TSnNKqC
	57fRXcTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u054m-00000007BDL-2acO;
	Wed, 02 Apr 2025 20:52:44 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u051H-00000007AqC-2KuO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 20:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=AmK0Ra5TtcArDa
	UJ5j2HthYPux7vb8lZx0CQMomz70U=; b=g3QXX7sGr1UFWA9SFcTc+t3BbnssU1
	HasTLnO16m46SagZYhurhFerLE3kmEd/WIKsr4UeuUJJQJV5LLOzBW3KEYjafF5b
	ti4L17qY4H0oMSzkOLFEUTnaRIc2NiysypsHub1v+sycPF/g/v+M1+rJPtoWBDwL
	BKrBLlceFUgqK8pgOZ42VHd/HELjc1JA1B/agM0YzEhEq6ziW7JKSGQXfWN/5zJP
	CfxIeYGhVcmkjPV/qrPREH7N6Q8dUFF50kN87n6ybOpBWuGBaLNLJf8xkRoXB1as
	C5ZhZRjdR6eUfmxwgRHTzEUIBERC4jk75GxnfWuhK6Yq/0p0C6hJwdCg==
Received: (qmail 2132784 invoked from network); 2 Apr 2025 22:48:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2025 22:48:59 +0200
X-UD-Smtp-Session: l3s3148p1@YjRUyNExGoYujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/4] ARM: dts: at91: calao_usb: clean up and remove usb_a9g20_common.dtsi
Date: Wed,  2 Apr 2025 22:48:50 +0200
Message-ID: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_134908_411536_2808023F 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

My USB-A9G20 definitely has no external RTC, unlike the LPW version.
While fixing that, I noticed that this renders the whole a9g20 include
obsolete. Here is a complete series doing that.


Wolfram Sang (4):
  ARM: dts: at91: calao_usb: simplify memory node
  ARM: dts: at91: usb_a9260: use 'stdout-path'
  ARM: dts: at91: calao_usb: simplify chosen node
  ARM: dts: at91: usb_a9g20: move wrong RTC node

 arch/arm/boot/dts/microchip/usb_a9260.dts     |  8 ------
 .../boot/dts/microchip/usb_a9260_common.dtsi  |  9 +++++++
 arch/arm/boot/dts/microchip/usb_a9g20.dts     |  3 ++-
 .../boot/dts/microchip/usb_a9g20_common.dtsi  | 27 -------------------
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts | 10 ++++++-
 5 files changed, 20 insertions(+), 37 deletions(-)
 delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi

-- 
2.47.2


