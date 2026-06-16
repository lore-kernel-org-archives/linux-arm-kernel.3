Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA481CD98E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 14:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39k9hJtIngFDc5kAzhTQBAbWUtLN4p1Hj+Wp34GgIk4=; b=az9Nq+ArAbFy4pGXbvuqV87vyW
	ATzfpDyOCvo1wYZNMYW0aZsQah2XdT5aYpj/nnNwmqUIap1BkSaFsSKqIJOXbDpU37dCW7LpoX7+S
	aHuc/HBS44RDTJzkBqR4qPYMPPnvi51YxISP8JCsA1EmmiXkrf1Zjk79iGY8Mi5T7vO/swpzkVWXJ
	i6kdEWx9ZtggAstXM9VQnjtL5V9QjPf2XScL10ZgdNUsxPLdm9FoLQLhmw9LlfPK8Y2FX+/RXYwZV
	sZfSOe53MW0WxPnRVz/hDM1DGpDM/0OmNuR/e9VyOqP5TjKLT3DrxiF+N9A9K2aB2V1Ln8txbsoGB
	881Xj2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUZr-0000000Ftyk-2PVd;
	Tue, 16 Jun 2026 14:15:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUZq-0000000FtxD-120Y;
	Tue, 16 Jun 2026 14:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3462445AC;
	Tue, 16 Jun 2026 14:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C57A8C2BCB7;
	Tue, 16 Jun 2026 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781619341;
	bh=6Uru3oiN+KUnWcz/gv4yCW62HmXWPmwm2tqYSe5EbcY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qubnNbcvKZjEhjV+mJnGorrsB0ORuYDBW+yWOFGPViFLW1gqvWb3QpBPXaJzndvAD
	 n/oGrPHvlpHe8+qlZH0KGUBfzXnqAtIV41gXSRv6kMw5mAjm3ixb1Odz4yONizatMt
	 fav5xVdPKpBdSqoM6uxjfumyDAHqrrLL9r9FzBYiQ42V+E30bEPrYWAr2ernaNnvVf
	 6mikH61I3SgFnvs9nL0PT+ZVqXZkJB9kgv6pkPekb5i8tyeTdh73094x6f7hIpHHZz
	 spuNzBXozQAFExc66irW9DMTfFmJETOOR2tjzEEjT+wj1Lg2/8VtV0ivA7LMcbQgQ6
	 26FMwMazrlA2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE47CD98E4;
	Tue, 16 Jun 2026 14:15:41 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 16 Jun 2026 17:15:42 +0300
Subject: [PATCH v3 4/4] ARM: dts: mediatek: mt6323: add AUXADC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-mt6323-adc-v3-4-1c27c588185d@protonmail.com>
References: <20260616-mt6323-adc-v3-0-1c27c588185d@protonmail.com>
In-Reply-To: <20260616-mt6323-adc-v3-0-1c27c588185d@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781619339; l=814;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=WC9jUSlABoGBdBqPU8PZ4ZIU5LJl1TAO11/EPH3tS8U=;
 b=cx8MHpOPsgD79V+yFNyXEm9LaUrOOAUnb9gXrJA90ceOaAZQ0r+3WMmBIQXs1KOCSBl5ODVrl
 39S5IKQEj72D2dsBdQJqJsDcRFBxyg0gZFfXGYLN5bGpXuOeFBLjUMf
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



