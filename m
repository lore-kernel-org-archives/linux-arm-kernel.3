Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A76CF9D0C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zH0R5sbJzEQ7yxwtzIi4pbtWLt6pIkCcNIRfI2l55qc=; b=LHrF6BvP9eIV8uZMV/nQDLoJU4
	4MMlZRkv2AcPvO6/A0u3K435mn7Fk9pWqEJyY3udiuh+TGDvWtma0eBK0HhE8LtgtN7TpBGgQ/BRd
	tgFmisL8TJ6fqPiJfhfyRnF1tzKh3m1F+Di29YY3ZU7K+CIqVHxNKf1MqHoCuEPSzkrZdzNknMORA
	t0netvXWZAhVtOWqQlCe+toc7/9sHuQbgTMOIkhKoMX/BkupCw9/qnAY027FvAtzm0rPXK35k9hjT
	n6jk2FAUfSlsV7EHujtEXYDcPjNE32Gn4fGOBvyLP0cagsMwc+Fxyyp9+ytZ/ITVHQn0dwMiNWJ5n
	dekTIhOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcCw-0000000HFe1-1K6Y;
	Tue, 14 Apr 2026 11:45:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcCt-0000000HFcM-3cRR;
	Tue, 14 Apr 2026 11:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776167125;
	bh=tx6YHplKw2wzbPUqEn6qcYrqTXhPiMFKrMER9Kp00HM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kDS7qidnpnqUHyiIcaFtEfHBBYYSt2EkBlFs2e2od6gdxcvH0cv1u/mxrQ98a/A0E
	 ZjlpQJyJP5+xaLeNMVmB5JtzXbSpfekQ89Q6nKQ6hWS5GrVGfApE/pL3ZiD1n4jONL
	 mewgXuDbcCEv5Ue0VK3E4H0zwf4n1dsUKtbOia+zrY5+Z4DTmY4yWge20f+iSrw89Z
	 2Dz2CPtqZs7opFvUhcw3HGNnxNHF+RQmcNpG03T4wZNKstJwVJrgJ8ZA8mWnJyC3c+
	 0Ja1gp74Axk89kRZMX8x42jSovQwKjkOnZNFbxCrls7YVk4jxdTXfSW8heRnom9fFT
	 kK+sehbySWosg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 406B417E1313;
	Tue, 14 Apr 2026 13:45:24 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 14 Apr 2026 13:44:10 +0200
Subject: [PATCH 1/3] regulator: dt-bindings: mt6360: add buck regulator
 supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-mtk-g1200-pmic-cleanup-v1-1-2a7193ed4e93@collabora.com>
References: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
In-Reply-To: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Gene Chen <gene_chen@richtek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776167122; l=1149;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=tx6YHplKw2wzbPUqEn6qcYrqTXhPiMFKrMER9Kp00HM=;
 b=Bsu7eHJDGAZi8VLbWxRKUzSwo3gi7EeXTNYA7Etr10Z9AyArwuf8c5v4VkQb58/XgP1xMZ2I/
 sJZtLUkIcuUBH5dBMJMYd2WzMsi3tUWoJVnHczk5Ur6h6wsnDEulKrK
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_044528_083679_D5D2BF57 
X-CRM114-Status: UNSURE (   8.83  )
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

MT6360 PMIC provides 2 buck and 6 ldo regulators, that have each one a
separate supply.
Currently, the supplies for the ldo regulators are described in the
dt-bindings but the ones for the buck regulators are not.

Add the descriptions for these missing supplies.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
index 9c879bc3c360..cbb74e8e875d 100644
--- a/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
@@ -17,6 +17,10 @@ properties:
   compatible:
     const: mediatek,mt6360-regulator
 
+  BUCK1_VIN-supply:
+    description: Input supply phandle(s) for BUCK1
+  BUCK2_VIN-supply:
+    description: Input supply phandle(s) for BUCK2
   LDO_VIN1-supply:
     description: Input supply phandle(s) for LDO1/2/3
   LDO_VIN2-supply:

-- 
2.53.0


