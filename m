Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23D9C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6LALh33H60DfQTGEPsCcojG8hxhs271R8nFenuDi8Y=; b=4Hlhb7C4zWf3g9FpwWxQUqXIh1
	RJn0ZDQVqFAztlak/8DKM8zzauaZI0UmDxceeM5IhqehG1spkp5hnnFi970I5IHU9kjeRJXyioJ9r
	dcmF3hLTVgc+SyOhXHH27qK0mDbITMCNdkADCDIJJjzzWr4MVP2NesCHdtJDa5fQ4hgTnoXNpp5pV
	wm+M10iU6VACjcNHLF57hwXOMWele+xdlegt0LuEjEP+dqg+mZisy3fzramt5p5Iqi+iaRZ8Ij2eR
	5Cm1YugezFC4+aa8TYU3mXuEXnqILF3Gmjso7iyq2ssvFvtJEjZwgp2pNMMlN8xYZIHLHDF0L9jI0
	mFfeK1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4erC-0000000ET0X-2Z7v;
	Thu, 10 Sep 2026 13:30:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4erC-0000000ET03-0Uw0;
	Thu, 10 Sep 2026 13:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9896E447AF;
	Thu, 10 Sep 2026 13:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 763A8C2BCF5;
	Thu, 10 Sep 2026 13:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789047025;
	bh=VWlC7n5SUM9DtFOBPFoA8GByTAAgalb/ZLqc2nBu+mg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=niv1dyqyLuz6blBL6bh6N6ldSuwNFZfqM2YhnECq9Mx5DQA9H0LATKZXS+5ighZs3
	 yGucoAyqk6sAbDERaqKn7BO9cKR0ztn5TvWCGdTAy6HnCwXXlT82jWqoy1wB8dBZ0i
	 QDEBYdXPBQEi/G3UceW90H+NBIng0z7mvl5kOT5ik11ZJLzXJLmz5paOKk/TnNYjw5
	 PLPoOIqgOs6VdAa/nztbrlS5Q200iK3LwWNF1qlNN6rJC5Urfv0qHBa+iGknmAJSiS
	 I9rZ3Td5lV2xE8jb3tHuBzPXvL4ocpzcyytieZ2s7uHOWFIRRMMai+/CdqUYv9NN81
	 6gOTHhnPDsLyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564A7C88E40;
	Thu, 10 Sep 2026 13:30:25 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh.mailbox.org@kernel.org>
Date: Thu, 10 Sep 2026 15:29:13 +0200
Subject: [PATCH v5 2/4] dt-bindings: arm: mediatek: Add MT8127 Amazon ford
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-mt8127-amazon-ford-basic-v5-2-3cb9eeaffd5c@mailbox.org>
References: <20260910-mt8127-amazon-ford-basic-v5-0-3cb9eeaffd5c@mailbox.org>
In-Reply-To: <20260910-mt8127-amazon-ford-basic-v5-0-3cb9eeaffd5c@mailbox.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, zkh1@proton.me, 
 Zakariya Hadrami <zkh@mailbox.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789047024; l=940;
 i=zkh@mailbox.org; s=20260908; h=from:subject:message-id;
 bh=6nQiaYGOKfITeaTuR+B1GCX01jYN4Tqbt4wScWriW9U=;
 b=Sj28nnhxHpArEkTLyWakRCNV540MPZXTEhT//VpZVifjCRiFq3DGcO4Uca9lpsqkhTxMmmCO4
 JL4fipZHsZDDNwStnX5k2DKqSjJYsJWoU935VC089jxS1Kmun9xhSqC
X-Developer-Key: i=zkh@mailbox.org; a=ed25519;
 pk=up24Xn4ScFKugfT4EJru/UQAS7JOIN+DSQqro+a05T4=
X-Endpoint-Received: by B4 Relay for zkh@mailbox.org/20260908 with
 auth_id=1015
X-Original-From: Zakariya Hadrami <zkh@mailbox.org>
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
Reply-To: zkh@mailbox.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zakariya Hadrami <zkh@mailbox.org>

Add entry for the MT8127 based Amazon ford tablet.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index cd4040ad3437..180e6e4948e7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -122,6 +122,7 @@ properties:
           - const: mediatek,mt7988a
       - items:
           - enum:
+              - amazon,ford
               - mediatek,mt8127-moose
           - const: mediatek,mt8127
       - items:

-- 
2.54.0



