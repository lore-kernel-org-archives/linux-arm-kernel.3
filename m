Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB051C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NooB89X5tJa0ZLP+MCPoYyJOUPrf8RrZ885TqBy0BAk=; b=rahJLc0Np9/BqHBQK8T03DgZQd
	UM7IaDBjr1+EE4yLGU+nV/byreFlHlEZoULJO8mHl+vjPYCqBj0fcOfnjeEXm1I87buVUzpdb+nIX
	Mqf2nLbNfwquI0g5kmcgPs+Zc40MX1P47VB+sczyD5quDB9bkApLChj+5Y5IUNGXy8Mc0osoCoBD2
	z/TRX7q8Zt+yI5x7kMq48UCVPcXc8N0qW94HNi46BXOOwnchbm1O7Y+SNEtOzH7/S6RvNbi+wniEz
	KEimbm8a4ZbIEGcGcjh86JNxH921G3c4Ja8QHbTa42IEOz0X5vvA7RykfB33nR47FtlVzu8pjMFrM
	hGw+lnYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmNC-000000021Ka-2Wpy;
	Thu, 09 Jul 2026 10:52:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmNB-000000021JY-1Ch7;
	Thu, 09 Jul 2026 10:52:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B33443EF7;
	Thu,  9 Jul 2026 10:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38C15C2BCFC;
	Thu,  9 Jul 2026 10:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783594372;
	bh=AL+6cjS+Aq23xV5C0GZ6jVglJtlvdb3jharPXO6eVtU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gRwE7eBu11JWC35IbYbkGu2puijlISPepAScWBPDPHrPAKnweJ3kP1ILYgJlL5hMe
	 M0lqFUaB3JiYDX3DZJ2+o6Jo+eDlHt4mk8J778GzUIbcSxV3deW6blo0qAls4FgCok
	 69UslMX3GTGnx2c2ENfprjA7ySPUFl208n98vmNg/x+s65rAPYyYJOws0zMlQ2ayzg
	 r4/4k27OOK/PJlnmFf1MN9TucmKF0iwtHVQ/565At9cO3FqQ1BGOvsl947w3UpJyNS
	 MjGYTfmHgSjUY+jDmWXrs/cUDqIycE3CmkZT/jEOTUtcdQNaxzQU1bawEbKO8oHONE
	 T/+05oC7JDt9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282E1C43458;
	Thu,  9 Jul 2026 10:52:52 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 09 Jul 2026 13:52:50 +0300
Subject: [PATCH v5 4/4] ARM: dts: mediatek: mt6323: add AUXADC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-mt6323-adc-v5-4-d11b8332a735@protonmail.com>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
In-Reply-To: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783594368; l=866;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=Gm5yHjWd+okdy+GbK+XrT9mjlxYBCgUC9x8KovsgFk0=;
 b=/csjgwGmhCRCc7gN/lLpul7ac274/mSOrm/l/CZz82mruZpXO0y2ZKDJb684iwDJNKk1nOgwC
 RNTmO/XkKV5Bw5PngIKKXPvRC+zUHJYKWEboC3cBo3z8A9EPW1YO6p4
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add the devicetree node for the mt6323 AUXADC.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6323.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/mediatek/mt6323.dtsi
index c230c865116d..c070f4b0936c 100644
--- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
@@ -14,6 +14,11 @@ pmic: mt6323 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		mt6323_adc: adc {
+			compatible = "mediatek,mt6323-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		mt6323_leds: leds {
 			compatible = "mediatek,mt6323-led";
 			#address-cells = <1>;

-- 
2.54.0



