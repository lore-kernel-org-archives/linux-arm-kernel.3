Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BED9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8uHDg/x40TevlTefyWB2n9w7vCjeuz91hItU9OU7bQ=; b=qjJFEnSmKkzDWjt7npwrrT0V2J
	Cb2K6Sk5OWbJYoLKCprmXxuTdIP73KzhODHfEWtl3d+nPp2YRMJ5+KI8cG9396htfn3ijL52Ubkoi
	E/A6dJhGE2afMFXGjWC781BuyMjvRjFKaTdhdOEu4WPbzO48aPXMyS5dQHr3UzI6XwlsXJ2MtyLV/
	KZc54BD3BkPx+tqPJj+HQvXS9IiSVpVaW6cM90dEtb7g6KjghAhDfORAldP8W928r9V/GXkDBa0wG
	LkUIyaABhZU1Lm/ri2+WooP3Td5t2ypoDAkC3BNggDxDg+rupcA0GgUP6meM5zkKQ0zYtBkyxIjrv
	XxYCohrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqx4-000000028cz-2Wd9;
	Mon, 06 Jan 2025 17:31:42 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqtv-000000027dD-03vq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:28:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=r8uHDg/x40TevlTefyWB2n9w7vCjeuz91hItU9OU7bQ=;
	b=qhMUtIBCQX8lvB/wpH7xorcKmbswvEt8exnaViGZBEd0/y5tGO8mejay3FWta16lcImIYenzkzeVRwTyIrd9l2hHiklaIm59leHd0okefayUdswhxBh9KWyEBsCyORfqdZC+5rnBFt42bjtjJidzPQvNqVVTI0kINtgmFp2ArNE=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Mon, 6 Jan 2025 18:28:13 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] ARM: dts: sunxi: add uart1_pe pinctrl for sun8i-v3s
Date: Mon,  6 Jan 2025 17:24:02 +0000
Message-Id: <20250106172405.3897-4-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250106172405.3897-1-lukas.schmid@netcube.li>
References: <20250106172405.3897-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_092827_350789_CEA5C68A 
X-CRM114-Status: UNSURE (   9.80  )
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

Added the uart1_pe_pins pinctrl for use by the NetCube
Systems Kumquat board

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index 9e13c2aa8911..f909b1d4dbca 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -416,6 +416,12 @@ uart0_pb_pins: uart0-pb-pins {
 				function = "uart0";
 			};
 
+			/omit-if-no-ref/
+			uart1_pe_pins: uart1-pe-pins {
+				pins = "PE21", "PE22";
+				function = "uart1";
+			};
+
 			uart2_pins: uart2-pins {
 				pins = "PB0", "PB1";
 				function = "uart2";
-- 
2.47.1



