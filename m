Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B776CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8vU4fraYJY2dKV6dsvqKiUd/8XZienPc6/6TZlCtSI=; b=V8v9pYuP8/7SzwSATFxpiH+3jU
	FUG5oXqBdpU8iDu8kuJNvoTLQnRFIh/PcZfwHnacMduNlyZK1TVDMu884rIf2HTUMFLYAxppoyoWd
	VqTYRp3J+ZblNXTLOhgDos94iRevgzHglw9c6p6OJFBbJEcRzR1IHHgBbDF0U1Lq4TNd1amVmCivJ
	8QB6Cgd14k2eJMTcKgalVZegDto3oyHFvBzqLVTwf4UFt1HRDTuFdLHMTSOjnHDPSvZG7XSzoEPsA
	+2xv9WVFLDnmZvWc92mLspC5hTbKIB3Tz7Is6wJzq2s6NPFSjBJRo3rD1eJ+1jndorioxjzZaZrmj
	DWbdbE1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3Q-0000000877j-2T3s;
	Thu, 01 Oct 2026 08:22:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3O-0000000875Q-3xKM;
	Thu, 01 Oct 2026 08:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=G8vU4fraYJY2dKV6dsvqKiUd/8XZienPc6/6TZlCtSI=; b=cfcAphEISHmuqvv3TgY0Bt9rsR
	Zi7Nmta8RO+J8UysZowNX+zPO5ZahJe++jTz10bsn+JrN/RKiVzS7OTzM0Rno5micqj+JMMnzYWSI
	VFsS28OLhaHd0fg1xuWDO99cb0ltHT5vgyvJXYYQ3RvV5UEIhdkjgI6f+k9YYTEcpZT7tAme0wsIs
	+ihpjLH7FERDomSrnLadu4t91bDjX+f7HLNeFK6BLv58kKCBLWCZcN/U2p2i0vLNCQjxYBztjgkq4
	PeE07ZkOL2FC7cuZhQu7bNe1vy5N22AXHrGRi+beVnIikErf+SxjgsXd9+NZdQm37ItHIA6shmRJw
	2uOaOCXA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCC3K-00000004ioZ-3tY5;
	Thu, 01 Oct 2026 08:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790842922;
	bh=64rsImq8u3QqJm7zF2WoizydBGZG/XiWxYKOWCXRpQ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UrNARKVDpLdz7v2hzVJmzkiq4JT3mwX1e6D47KKHlOuyvk+DP5M9sCYvpaFwrz+b5
	 Y9D0Wg8cbXICZsIZFS4QZddJVNcKg4MLkzQDZaQ6k+JyjM7THtb7BJ9VXX17RBCY1a
	 Lsrp3kbxMc/gR12y3tGjptOeZu9JMp35Y6DPU0Z6KxzK1e4fLL8zFicZsMZGRLKfXK
	 g3fScAwhKMXKcnr2bBpnuejB9y2TSTRw2LycSCK18ksGIWF8fN7l6x04Zsc7yY72iw
	 rXNZkk/zmz8xTQgdCc6nA7smyCvwGu8Ykspu/qRItAh/9Bd5nJTbYunoA/uNqHId2c
	 Xo0QXoe4pPX5A==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B0CF617E0667;
	Thu, 01 Oct 2026 10:22:01 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 01 Oct 2026 10:21:35 +0200
Subject: [PATCH v13 03/24] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-mt8196-ufs-v13-3-60854adab6d9@collabora.com>
References: <20261001-mt8196-ufs-v13-0-60854adab6d9@collabora.com>
In-Reply-To: <20261001-mt8196-ufs-v13-0-60854adab6d9@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 "Martin K. Petersen" <mkp@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790842918; l=2540;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=AipbRJl+DnZaj2oACO08sgptMG0954obXAyLR09vgH8=;
 b=ycTp4X0c5pSF8va92oSGXSqUVN8dzWl1DwLvBfGtt7bjzPUek0dK+mDr7qiBwt9sbYMdTdA82
 FAiK47q9x6rAAiMeSzdGTvDis7il+AifypF16pX8h9QnwyyReCEPjHk
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_092207_656561_7CDF5E82 
X-CRM114-Status: GOOD (  12.64  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The MediaTek MT8196 SoC's UFS controller uses a different set of supplies.
It is therefore not compatible with the MT8195. It also have an additional
0.9V supply pin (AVDD09_UFS_1), that is specific to this SoC, thus not
currently described in the binding.

Add a compatible for this SoC and new property for the additional supply,
and modify the binding correspondingly.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 945cb986b06b..99181ec9dda0 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -16,6 +16,7 @@ properties:
       - mediatek,mt8183-ufshci
       - mediatek,mt8192-ufshci
       - mediatek,mt8195-ufshci
+      - mediatek,mt8196-ufshci
 
   clocks:
     minItems: 1
@@ -60,6 +61,9 @@ properties:
   avdd09-supply:
     description: Phandle to the 0.9V supply powering the AVDD09_UFS pin
 
+  avdd09-1-supply:
+    description: Phandle to the 0.9V supply powering the AVDD09_UFS_1 pin
+
   avdd12-supply:
     description: Phandle to the 1.2V supply powering the AVDD12_UFS pin
 
@@ -104,6 +108,7 @@ allOf:
         clock-names:
           items:
             - const: main
+        avdd09-1-supply: false
         avdd12-ckbuf-supply: false
   - if:
       properties:
@@ -119,6 +124,7 @@ allOf:
           minItems: 3
           maxItems: 3
         avdd09-supply: false
+        avdd09-1-supply: false
   - if:
       properties:
         compatible:
@@ -131,6 +137,21 @@ allOf:
         clock-names:
           minItems: 10
         avdd09-supply: false
+        avdd09-1-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8196-ufshci
+    then:
+      properties:
+        clocks:
+          minItems: 10
+        clock-names:
+          minItems: 10
+        avdd18-supply: false
+      required:
+        - operating-points-v2
 
 examples:
   - |

-- 
2.55.0


