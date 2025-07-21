Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE09BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 20:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Y6+2cPDfgn+t73s7GBJRmbBaE1GUVE/hJf3lJMCRxM=; b=0xPdDbr5SKJfe2vvEGtHeVT5Rs
	IXTsadocV/6CRFV98fu5wIUgo3H+hmUCDO0Z6nkzWYZOTgq8qCHW/Wc6oCcXYl2Dh2WwlmjhGrrwe
	tSELH9DQSiWpqjPaZy8zu3s2fNARXpoEZQzwBR45pzNH/YPgf+9TUcNTj5ju1GMISP9YeBDXe/QuG
	zw576pxFuB7pjsq6sp5+Dfj3yamVTmmuQphu4ohqK3ziSmpY5G2pZQOpziNvrnYlyIXiqHwSzXOio
	QcIOc2GEVWyxReQFzpUJy/Xn5NwD36aFRNd6JZ2mFfo8jLbioIkC8fjaAFHeOgNqru7If4rERp6rQ
	LD46EPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udx9i-00000000dEL-2C51;
	Mon, 21 Jul 2025 20:30:38 +0000
Received: from chumsalmon.baetis.net ([209.222.21.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udww3-00000000bBn-0Z3I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 20:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753128990;
	bh=igbX+jfJh90M1KH040iOHlCfFeYBaYR0WrJ2E+mayYE=;
	h=From:To:Cc:Subject:Date:From;
	b=Gty0/gO0efdIOfplME1yfrZW31GrUlB5KZSoZISKdNQ2M/50JhCoM9gYNSMXFvIVy
	 /TZyxvlRcYA7mgyPvRBK8iXsJVg5/55PkDMBaVJ55KqXfKmDocIwZNcJ1zEohAaRXO
	 9oDi1OucqjOqgK0S2H1stzeTWny5jofy7jp7GQ9CZSLLhadSWWVfEvn4VNvT9oeoRa
	 mC3IK/PdDVPfVovc9k1xL/A2j8j+e6OkIttqh0N8DE73e/DIT4wOYIss4e5C4kGJU0
	 EHlSFHoJXyoCl2gLHjIbUIJcrcYr1/OTVf1La2wl5E1Ef2B3H9WhEGhYLQFDb7XKrW
	 zjNDwYa+oEO+Q==
Received: from localhost (unknown [IPv6:2600:4040:50b7:b604:da10:58b0:4f02:7df4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 2FC7827E472;
	Mon, 21 Jul 2025 20:16:30 +0000 (UTC)
From: Erik Beck <xunil@tahomasoft.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Erik Beck <xunil@tahomasoft.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2 v2a]: New board support,LinkStar-H68k-1432v1 (RK3568)
Date: Mon, 21 Jul 2025 16:16:21 -0400
Message-ID: <20250721201625.233750-1-xunil@tahomasoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_131631_232991_8C8D4A4E 
X-CRM114-Status: UNSURE (   8.91  )
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

** Resending with proper patch sequence numbers **
-- version 2a
-- Apologies 

Signed-off-by: Erik Beck <xunil@tahomasoft.com>

This patch series, revision two, provides initial support for the
Seeed LinkStar H68K 1432v1 board, featuring a Rockchip rk3568 SoC.

Changes were made relative to patch set version one to address
comments provided by Heiko Stuebner <heiko@sntech.de> (Fri, 18 Jul
2025 15:13:22 +0200).

Those changes are:

* Splits the single commit into two, one for the yaml binding, and the
  other for the board devicetree plus Makefile addition;

* Adds other recipients needed from get_maintainer.pl --nol and --nom;
* Uses git send-email to send the patches, to avoid adding line breaks
  from the MUA;

* Changes comment style to conform with style guide;
* Removes several unneeded comments from the devicetree;
* Changes LED naming scheme with more standard nomenclature;
* Changes naming of regulators, prepending 'regulator', such as:
    - from: vcc12v_dcin: vcc12v-dcin {}
    - to:   vcc12v_dcin: regulator-vcc12v-dcin {}

* Removes unneeded tx_delay/rx_delay from rgmii-id


Thank you for your time and effort reviewing these proposed patches.

Regards,

Erik

Patch File Summary:

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../dts/rockchip/rk3568-linkstar-h68k-1432v1.dts   | 740 +++++++++++++++++++++
 3 files changed, 746 insertions(+)



