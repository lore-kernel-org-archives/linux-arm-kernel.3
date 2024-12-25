Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B8BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 19:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ds5dLdL6zKxcI6j+lsReTASICW2fhJUbhIDr3cLRVJ8=; b=Twz0ObE5lu/vW7x72ZmSVW8H3W
	jrXTWtnp4dV/C5k2Xng+x6zsxosKzGGv5HbvFe3Okj5DFeJIj3B0zwBf4kc5Gic7TE6+Lof/1BGm4
	BkocHNkoHBNtDHGgnsbUdQ1GNjcYXk1GkUlyXAIXdAhwZ29NAu6gqlaCPJQWyzPk/YY1dt0xN/d8c
	DK7uvEh7nSPe+01zgyiHqbA4BKwm5SuhF8lOqt1HZcudnpBEr7G2jodl+PCfRRL2VToORTZYWmdaf
	9jRXokpd/wQ1u6Ynjw6B+nco03DEG0IUP9hnhoOrtGFAUP3rbRieNx18pmD9CQyUiqEFvzy1s6hnY
	0kU/Sysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQX4x-0000000EEof-0gop;
	Wed, 25 Dec 2024 19:29:59 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQX2Z-0000000EETr-0mdo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 19:27:32 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1735154848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ds5dLdL6zKxcI6j+lsReTASICW2fhJUbhIDr3cLRVJ8=;
	b=MLdre/57xuTdMWVy3aWKChcNpz3ID3PJ4QRhDwzwgVD7oFLGl6DQrKJXbrGxmXcM2EMu4M
	Nn0u1e0mB15fudBJt2Qvwy06jRYqcyiPE0MMO7bGRTqnE+31LuHN0BX0DKf3athmugHf8j
	aiml2rDj2TaZq4l73NmJL1akOMJBLEBPg8XVtOcqbYk97x3SFoSJBinUtXw8INQbBtCvoS
	VW1iN/3ZxfR4n037ehn/+FqCfnRo+i5r2uB5cdEijY326ZXIVysChtPMB/YiE3k9f9E6E0
	EQkXjHtk4bWen1MfvcgeuBGR3Akg7VMrdrItv715jaJ+E4A1IieUW8wJwQpbBw==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: mediatek,mt6779-keypad: add more compatibles
Date: Wed, 25 Dec 2024 16:26:19 -0300
Message-ID: <20241225192631.25017-2-val@packett.cool>
In-Reply-To: <20241225192631.25017-1-val@packett.cool>
References: <20241225192631.25017-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_112731_381144_271648FC 
X-CRM114-Status: UNSURE (   7.91  )
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

Add compatibles for SoCs using this device (mt8183, mt8365, mt8516).

Signed-off-by: Val Packett <val@packett.cool>
---
 .../devicetree/bindings/input/mediatek,mt6779-keypad.yaml      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 47aac8794b689..517a4ac1bea3d 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -26,6 +26,9 @@ properties:
       - items:
           - enum:
               - mediatek,mt6873-keypad
+              - mediatek,mt8183-keypad
+              - mediatek,mt8365-keypad
+              - mediatek,mt8516-keypad
           - const: mediatek,mt6779-keypad
 
   reg:
-- 
2.47.1


