Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282ACC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 07:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjdu0bh3sHSMsCVVWKg2rIqiffBppsu+UcHUmDVc0PA=; b=doZzp35L1KyvPKwpanLR3Ct2FP
	Leu8BeXpzakaor1QX6WDtFMrzmmlN6M9SnIuItA/+9OnuApU4M3G0MOUp/IBJJV3JFQvNwcqX1DFQ
	54OTfmlxllDzrJF1gVTdSjuoR78+NgpcBxLX9zaeTLHsgpfgetxkgY1AVKt1uf4YAjJL+D5DwfLL8
	gcLU22ngg33Q29blGcxAReM3EUKtH5T2Rmq4exPh7fe5P5yTHUwIyHbzZEUF/uYWjHTlHRDsRijSb
	G0CoAsxKMYOV3TlGtrGxnJ71/pCY8dCEX7JhzohMcp8NVVq4INRnGNnQlWX57AT09HPM1Jb4cfiKT
	nfS6Kqdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76cM-0000000Am3G-3rsS;
	Thu, 17 Sep 2026 07:33:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76cF-0000000Am1f-3Ea3;
	Thu, 17 Sep 2026 07:33:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C630B43CA8;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BB7AC2BCB9;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789630386;
	bh=gxiqBAElq9Xre5OAg7uTOQmxUlQteJwsBnd3ZBdbFzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Hze9NxO6AqLpkNqahw3TdRpM+U4u9HEqCSCboe/Fwlc6aiq2TPj7YIIETtJCL2VmP
	 uKfK2Na8oD3CC2nvdcm+iJqkQ8lTpE+2bklBdKxvO2ZSgeXLkmOxmP5VdZqT/PgVWb
	 Toi+xmDzzfP70xiLkI6PJGOxQ7Vs0KiXQ8Mdn01cDc4gja8+JbNagFy3/3qIxHi32l
	 uojBm9rNiHlByjvFM9QBmORRh0pTHDyWOboby3gPnOWiqdLMFRcQjDfW6sSC3WMQpq
	 DHROUZ/lGcw7eEMBLwv0rGDDQl8tS4rBPK4RXy7BeClndb3WNdv3m8OQMv8tgIqRkh
	 5Ki1qQS6Cuczw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7749BC982C1;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 17 Sep 2026 10:32:06 +0300
Subject: [PATCH 1/3] dt-bindings: usb: mtu3: add mt6595
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-6595-mtu3-v1-1-a2ba7c230d68@protonmail.com>
References: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
In-Reply-To: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789630384; l=785;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=obVpW7WHQG6DMltdTdYTZQf36G3lb4xafRlhZgLa8RM=;
 b=eUwn67bk9XeiQJFx/p1Vss7TE4r0pmPT7jJNEVOa8SoYeZa6vqsStS/7HnYK9QY6+mcEIMjP4
 BRQeAGy4QZ7DZdhzXBUjV2CSoZ6XS0rrU+rbC9QfMTGyE51AfUZ0Xqq
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

Add a compatible string for the MTU3 IP found on the MediaTek mt6595 SoC.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 21fc6bbe954f..4538df164a16 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - mediatek,mt2712-mtu3
+          - mediatek,mt6595-mtu3
           - mediatek,mt8173-mtu3
           - mediatek,mt8183-mtu3
           - mediatek,mt8186-mtu3

-- 
2.55.0



