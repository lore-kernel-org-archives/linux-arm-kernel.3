Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20970C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lx+lxbptc3ElInI5zGm1mKbu0LmgncMfZ9ZTzHnQz60=; b=ME2KdDAdCh0Xe3
	OoChya33Qk94rD0EvLRM9yL1xb6P8nFYsjH8QmSsEMn7eBZ6vrhZ/acOeGDdBC/ZMwAzgK7aMGCK+
	6FGBAxktCUhjncRzipJWPOYDwDzYxg+eCo2+aO9AMbcrjriRITWb24jpr/d24tqmT3W3zjioHC7jn
	U85hXzHjZVILCjNnfDMWFFK/NfebMSqz2dKnAhOi/stGePnUK/W9ILI33EX4Lo0q7i/C5VPhNBTiZ
	qIAMfxE9Hc02PNU/kK85RF+6UUAqEvcozRcoZx4MXK2WFspFCZIcp5EY9vkmErofuHFUAPJsgCBPJ
	HzazJ1oryR5xRaLl4UIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyCk-0000000BPpF-3FAY;
	Fri, 31 Jan 2025 21:05:34 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyA8-0000000BPeU-2K5K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=lx+lxbptc3ElIn
	I5zGm1mKbu0LmgncMfZ9ZTzHnQz60=; b=iEFH02mBNfZHfCagQfCkrwGh7oo3w0
	9i5oqK3FhPmAr8IgE4wiCIZ9xM+LgWIKUHp9DfdeqDDTJ51+5JKWSlkGnIRtMG5I
	6ce9zTpB6QG4E8xK9TG53QAnT2hE8H30zcvj3IV51ZKKc+H2OIFAVMg6nnUrZfow
	RF/MxRIFkk6L4IYWszMo1iWUl6Y32zfS0/0u2kkpL4FhFnEv2nLgVCe59tN/fZZA
	WvH4grwSFgbsjS7NF+SutlS8G1wXbLGBXblicXHjTq1hnVugutMg26oLOUonJ7yz
	lxvlKpcO2AFuZH084WyJ02DS+YVT/zg15uDnCvXtKz7avy5FnmQSzKGw==
Received: (qmail 1801959 invoked from network); 31 Jan 2025 22:02:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 22:02:48 +0100
X-UD-Smtp-Session: l3s3148p1@7Zxs3QYtrH3Uph5e
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] ARM: dts: at91: calao_usb: fix various naming problems
Date: Fri, 31 Jan 2025 22:02:35 +0100
Message-ID: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_130253_456459_76350798 
X-CRM114-Status: UNSURE (   7.70  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Two patches deal with the either missed or mistyped vendor 'Calao'. The
other two patches deal with improper node names as reported by
dtbs_check.

Wolfram Sang (4):
  ARM: dts: at91: usb_a9263: fix wrong vendor
  ARM: dts: at91: use correct vendor name for Calao boards
  ARM: dts: at91: calao_usb: fix button nodes
  ARM: dts: at91: usb_a9g20_lpw: use proper mmc node name

 arch/arm/boot/dts/microchip/tny_a9260.dts          |  2 +-
 arch/arm/boot/dts/microchip/tny_a9260_common.dtsi  |  2 +-
 arch/arm/boot/dts/microchip/tny_a9263.dts          |  2 +-
 arch/arm/boot/dts/microchip/tny_a9g20.dts          |  2 +-
 arch/arm/boot/dts/microchip/usb_a9260.dts          |  2 +-
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi  |  6 ++----
 arch/arm/boot/dts/microchip/usb_a9263.dts          |  8 +++-----
 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi | 10 ++++------
 arch/arm/boot/dts/microchip/usb_a9g20.dts          |  2 +-
 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi  |  2 +-
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts      |  4 ++--
 11 files changed, 18 insertions(+), 24 deletions(-)

-- 
2.45.2


