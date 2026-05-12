Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6D8CD4F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2RdbNlluX6qT4qOoxomxX5POO3onXcdGyFjZAaOinw=; b=u4o7lBtS/rI6Vz7vfHWLNKGG8w
	woJ75wq9b5fznRSAH+LM1diPvoQqH2ArWu1R2v3pEdIqCg8MECTWy6SpMyNzQW9SoMWvksWqo3o9N
	Yi40axr8h+2p31G1IpOW8+PtrNAksUOGt+f8jKRs8Jivu0K/w7Cyo3pdFRUrX8ftSgTTnZn5rs2th
	T4wmWDrtHCBHzTZjjhtFArn9S1Vr1iwJLKr/+4i+bmtuIe+Im8Naf9lpBbiH30lUDxCHKMgRZYaRC
	s7QtaTNLH67GZDwvu4pDPX2NAdiGqhHkTPrG0i/5Q/TZfM75VZj33dX0i8lFjB0kq9YX4nQzanmtV
	U3LPLGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfZ3-0000000FZ6R-2E04;
	Tue, 12 May 2026 05:21:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYr-0000000FYmE-1VZq;
	Tue, 12 May 2026 05:21:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4CC2443B4;
	Tue, 12 May 2026 05:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABA67C2BCC7;
	Tue, 12 May 2026 05:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563299;
	bh=8rD3NqMbvfYvXT1U3COEaIqJZUm6U2f/YI8JsziTLi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mEDzgb47pH0Xm+QRZMUBy6VibEvTQOvbQ7VnJODdkwVS0RFi3IV97KSX1Sb4kIPY5
	 SQa4/weqW05P+9L0F1qrcfZj7ABqovNB1065PqMtKF9E/nUY9dmjrkZAN+ZI59p4s2
	 22daHJGbpf9ajy3JNNnRzLOQzWRrYW1JZcJ1sL3ENHpI7vgeomzmdVzBSX/wtY+RZr
	 79E3ezw7IWFjPsHgKrl+6oZtF3AM3vbOz7r6ejAhcOQ6J9pAggzi1kVh2muDFZjkI+
	 99kaD4xi+V7mZzGAWp+TGg9ED2sv/aSoib9SThraDe3LLWC+DwhtXF9CKc8oA4E7Fy
	 XifHwYRGA3GTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A66CD37BE;
	Tue, 12 May 2026 05:21:39 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 12 May 2026 08:18:15 +0300
Subject: [PATCH v2 01/16] dt-bindings: iio: adc: mt6359: generalize
 description for mt63xx series
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-mt6323-v2-1-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778563297; l=1032;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=AYn0XjU2ae/zdyiw0ViO8BkZaJAkv3YZ+5qK7y/nM24=;
 b=cI500HfBOYi++fLA+j7kNShbO0dyyIKQxeQSrjaUgFR9GTRMwmDJB7zwlbjlnlYUZoyOvdEa6
 AVYu5CxEPWeAaImMRcxt2YYlc0zSb+PzjPNQpDJ65J7x39j+q8wrbHw
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_222141_461214_637E96A5 
X-CRM114-Status: GOOD (  10.73  )
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

Update binding title to the MT63xx, since the list of compatibles already
includes mt6363 and mt6373 which don't belong to the mt6350 family.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index 5d4ab701f51a..2e8857e104f5 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: MediaTek MT6350 series PMIC AUXADC
+title: MediaTek MT63xx series PMIC AUXADC
 
 maintainers:
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

-- 
2.54.0



