Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7E3CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 02:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivmrdh2dht+zG6rGwy8YMuShCGc+/A1lo8JzbUoMYlI=; b=2hp4Y48kQlx+Vgn5c/eNfEWs1M
	cWVPMY/975O7pQSq46+1qAVLn+KmN63QeT2xGZMjQ4WuscuVAP7gZSbDKJUgjfvxNbuaEII7rQPNm
	J9dbxT4+ZOYQHk7tQl9XYPseLT+0rW1lN/PnIqCZsj+hDdwCoydPKQ9e+Iq4few6aunewxo5hqu1s
	pNq73E3lzbbmQBdoHE10jaa4OwMD9o/+cmQJAT9EdrIVYiuSXuWY6pzgzMXZBzOyMPSJPj/iXVMC3
	0nc50IRpiHMscnWm6SSgegkBf7y4rD0GEP+SCryFapKdFOx/V62Uh7L3M+BnfUi+ATvPyCY9CpHj0
	31dxg1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZftz-0000000GUrz-1fhR;
	Wed, 17 Jun 2026 02:21:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZftx-0000000GUq4-1CmT;
	Wed, 17 Jun 2026 02:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D2B8444B1;
	Wed, 17 Jun 2026 02:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CA84C4AF13;
	Wed, 17 Jun 2026 02:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781662872;
	bh=O8e39Y8zZ8di3UFxOjhE2ft5kuA5vKiMtzFy1esWqMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g/Ny7Wij0FghiETR6iRHsZtl8WvGjGYL2yQIxJgyBaXCvix6EuEigEsB40N4gHU7K
	 om/8KVTiZ9ACKeU1pRxo249Y4UtiI/4N+RVO2+VEtpsMYF6Or0Z9jBrVigDR8rrL07
	 oam6uOuqFhXH+Jqe05DKBkgK+X56hyR7oNaee8FEeJow5IegXLKrswFzJiEtrLUL24
	 O9/TeAfbsxMLkT4rQuhtHguQnI7AQAbfJ5kzCpvyRib8+qCQeHAjsjfXOsUFYzRv1j
	 6G/703QifGB5NnbUdvIFJoTcRd8Ju5MFKF2HAOQrX+uEtzn9v+dXwDmzcz85HnoZLD
	 5Jf+EJ6+lwC/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2720ECD98F1;
	Wed, 17 Jun 2026 02:21:12 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh1.proton.me@kernel.org>
Date: Wed, 17 Jun 2026 11:20:13 +0900
Subject: [PATCH 4/5] dt-bindings: arm: mediatek: Add MT8127 Amazon ford
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-mt8127-amazon-ford-basic-v1-4-d02ad15ac359@proton.me>
References: <20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me>
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, Zakariya Hadrami <zkh1@proton.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781662870; l=814;
 i=zkh1@proton.me; s=20260616; h=from:subject:message-id;
 bh=CteuquPMK3ekAPrSrikG9MTiPrJ2S6hY2cdfoA37n5Y=;
 b=QvALVdl1TyvRHk4IbG6e8/iH3V6MqHh3AVd8EW+tQXxk/ZkC7U92/MSbTx1juqnWNb4PxHErv
 mxOxymgs/kyDPvoRRdhunQYznwxiVCPOYX2uHPy6LmUWEZoNykVaRJ6
X-Developer-Key: i=zkh1@proton.me; a=ed25519;
 pk=9DiJwhINAERP95fbFofXSP77GEnvfO/rMIRRRFDhaoc=
X-Endpoint-Received: by B4 Relay for zkh1@proton.me/20260616 with
 auth_id=824
X-Original-From: Zakariya Hadrami <zkh1@proton.me>
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
Reply-To: zkh1@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zakariya Hadrami <zkh1@proton.me>

Add entry for the MT8127 based Amazon ford tablet.

Signed-off-by: Zakariya Hadrami <zkh1@proton.me>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af..5ddc79689df9 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -124,6 +124,10 @@ properties:
           - enum:
               - mediatek,mt8127-moose
           - const: mediatek,mt8127
+      - items:
+          - enum:
+              - amazon,ford
+          - const: mediatek,mt8127
       - items:
           - enum:
               - mediatek,mt8135-evbp1

-- 
2.54.0



