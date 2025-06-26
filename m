Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4321C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onu2j4FTd/VxB1pXc4Zz9GKWPc2Pzzo0Ifzl3D6XjF8=; b=3FC1sol4lmt3roCgi2sjvYVQ6n
	M2HWOECRyLG56Fp33jIDgU1ZEcRFHLN66HJJ6e3IDLTzhRNyMciceyB+YMD3/cEsp9kPiHzU6uQDe
	zhwne4kxmGc9uLAA/h64tzbk5lA2t/0tOT1O3ookSGDyQx2utn95mphTNtFlGoBTLizYyuIcEWaLj
	qQN5WS1J12tj0eWLwrV3FYptIEC4ZzRjqajqL+WuMbR/1/lgNe8iJAmx9X5kyBv4EQ+0XgkTGRBJU
	eCdJeIiIbFcEC/GVcxD4HCsLGCIEi5P6pi4mEHk7lK7h226/JUI+Blxd/5nWt7tMCkW+cFxFOveBp
	CX7V0URg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUj1T-0000000B9sa-2LZi;
	Thu, 26 Jun 2025 09:35:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiMp-0000000B3A0-0aTZ;
	Thu, 26 Jun 2025 08:54:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56D0849F8F;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36AEDC4CEFB;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928038;
	bh=1uKs+XDDqrpUqn/1Z/qWj+WCvNbk1VITw3tdl0xPaOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=akJGCetTIYGTBrocZjBvs4n2bAkD6nWVsAtQWLv5hevXgB7ol8dBUPKuFzomrXwgT
	 67+4v23hDPGn1VwMKvZXQt4vPhi1DYTZH0ETFGhzh11yfPP/mv2yFrEgnR7sLB3IEh
	 OUyNd66o8VFTeXVvuLrNGt5YkVPNaXt3cTrQOzNLjHer8LSuosbSklUjh1qvSfUPaN
	 kWXboZilVq0loosnwkcKZBfLmCOMCkob+4T4ib0SuloVQFKmpfvuLa9G775qIRLM5V
	 ts8tcRYm563eA2c9jsqQpU6ils2J21ex7n3bCtR3A651kZ7e4BVaE8DnOHokdIx+Fo
	 XD8+vmAfTpk5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F498C77B7F;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Thu, 26 Jun 2025 11:53:59 +0300
Subject: [PATCH v2 06/11] dt-bindings: arm: mediatek: add boards based on
 the MT6572 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-mt6572-v2-6-f7f842196986@proton.me>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
In-Reply-To: <20250626-mt6572-v2-0-f7f842196986@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928035; l=995;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=9aUXHuNvHaXvQkrisfy954nmLPBRtgbu4/kIQzXjqPk=;
 b=zitJojHs4XEqtVPoIFwkaqtXDGM6igKRes//Su7pRROBXjAlIhPy5GXXTGx7+tOTYYBzFat6C
 luBZ8jHjoCfDs3TaOOTppEuSnJswvMrX/cqUN/aUi4MOqZGuy19FEfu
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_015359_232024_DEEE21C4 
X-CRM114-Status: UNSURE (   8.77  )
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

Add entries for the JTY D101 tablet and the Lenovo A369i smartphone.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d93976556a03768595961961bcc33..d5cb133b8a75fb5325f201f10c83bbe434a1da89 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -27,6 +27,11 @@ properties:
           - enum:
               - mediatek,mt2712-evb
           - const: mediatek,mt2712
+      - items:
+          - enum:
+              - jty,d101
+              - lenovo,a369i
+          - const: mediatek,mt6572
       - items:
           - enum:
               - mediatek,mt6580-evbp1

-- 
2.50.0



