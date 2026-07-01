Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8925EC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 15:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/88Vrn8Y7h20GH2cr/4O5dp/5mPIhOGlUDOqjsLUyUE=; b=yu2IhAy999l+qHwXpyzrTvozZw
	v2c1eQOAF9UPAZ0IbcstPN6olIDqBz3isn39uvapbDps2cAQZC1ML7EdLN/6yQOZnCPswmJLrW6rL
	fRJFTkPc083nwXV54/n+Grbm1GGkV/UAkPrCbL3GRm1beLTnP9W4wZEk7IS6XfPvDvaT1dytbi7dj
	ls3q4QEwuEibkPUgn8YC9kHUjEEFyb6yFw9g490C01Sy1U2mGsikRxyiMSiDBDZ3warII0Im5t19z
	wmf485eM73K0+InuNZW59UoIUoIlBe/DOJxrK8NAst9WARe4I2E1H3CsBilZiGvO3ZzrRUjLWC9DV
	l4KPx3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewqz-00000002OYM-1S1p;
	Wed, 01 Jul 2026 15:27:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewqw-00000002OY1-11kW;
	Wed, 01 Jul 2026 15:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782919671;
	bh=URXsJVFgIXD2Z23IoOR4jzvVp//h7YdO2XrHcOWjOAc=;
	h=From:Date:Subject:To:Cc:From;
	b=KmTT0uJDYKlACON/Ui3/4K0cgzzzfdJEnOqHRqHbnTkHUlQoNYPoZsUpLu94DBeUD
	 IXbmeEQOGcyxcoJd867hJv3mXZdTByXRWa1o/1fK2RvOKoW0IjGyH8hgQ0t22cxjFd
	 8aPsnQWwMKtV71Nxz7koAn4U+TkugsW//UvefiNrqfahVq9UTNqbXRN1BYdrncpnfq
	 4TVJidvKvLBJq6yUZjjfpIG7fEQ83ZocirZUEC8WYeV6lFRFyOxJs9iC0IBYsXHMy5
	 OEMgjFfBrhvagWzLZkl5PjrMeIXHgyEY8zBz6nrjdMH8AOXUI8ewOiV7mXPGHhI4Jx
	 fEQZuVIoKhRCA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A593517E010F;
	Wed,  1 Jul 2026 17:27:50 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Jul 2026 17:27:36 +0200
Subject: [PATCH] dt-bindings: PCI: mediatek-gen3: Add support for MT8189
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-mt8189-dt-bindings-pcie-v1-1-7c7a65087654@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6DIBBFr2Jm3UkAjQWv0rgQmNpZgBawMTHev
 USX7yf/vQMyJaYMQ3NAoh9nXmIF+WjAfaY4E7KvDEqoXjyFxFC01AZ9QcvRc5wzro4JlW6tlcZ
 0nXVQ32uiN++X+TXenOi71UC5R7BTJnRLCFyGJtJe8Ir0rYDxPP+iBWvGmgAAAA==
X-Change-ID: 20260701-mt8189-dt-bindings-pcie-283bb19944bc
To: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>
Cc: kernel@collabora.com, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782919670; l=1302;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=URXsJVFgIXD2Z23IoOR4jzvVp//h7YdO2XrHcOWjOAc=;
 b=iF4XbkJ8/pfOJLhmuUVbJrDhfjhcrnWXcdvstnVxVsFSpKJpvFlr5KXpIoUyz9wZEUbXqQhjg
 4XE2KXBZ5cjBxc3M+jniSD6jhHDfFVNE/YYCDABEL0NrB+5TFvOGuxM
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_082754_451046_1F90A1D5 
X-CRM114-Status: UNSURE (   8.51  )
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

Add compatible for MT8189 PCIe Gen3 controller, that is compatible with
the one found MT8192.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 4db700fc36ba..fbc0378392d4 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -51,6 +51,7 @@ properties:
               - mediatek,mt7981-pcie
               - mediatek,mt7986-pcie
               - mediatek,mt8188-pcie
+              - mediatek,mt8189-pcie
               - mediatek,mt8195-pcie
           - const: mediatek,mt8192-pcie
       - items:
@@ -193,6 +194,7 @@ allOf:
           contains:
             enum:
               - mediatek,mt8188-pcie
+              - mediatek,mt8189-pcie
               - mediatek,mt8195-pcie
     then:
       properties:

---
base-commit: ba7c57499e5999aeae8dd4f954eb2600589d80aa
change-id: 20260701-mt8189-dt-bindings-pcie-283bb19944bc

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


