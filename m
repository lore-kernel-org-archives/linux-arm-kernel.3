Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE1FD232C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 22:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rUdIRkC+zEuxcNbd63t9e9cSpfOXEkXRYqPsvyET8Us=; b=SIe3TBYqRLWEZM81y4BM1qH2pp
	xLBbAXha+e/dh6ER/nyBF4k3mSs18MObwr4JEa88P5Xr3DXifDHFO2/v20+z5nRCRhORBOBkLF0EV
	QnuIL6DnO3KHzg5zdIWYBISaJtFDIrSdNTCYm9RpCj3fhxakAjlljKbdXmbxoM0BrH0bTESUf6AKu
	HjjaS5KJ6Ca0KVHfxnF9shzwV/0dcz4SVKB5JyvBkWv6gn7kpDAb5EdMIR6PLLo3aijS8ITdLe3qm
	x2EIRc1M31oqe1hbSe+i/i2W/KD0N9TqySsLij5epS+rQCTAIAjC/YMTmQj9ITojB3p9G4rE5W9oH
	L16nwwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdypC-00000000xdQ-3HYR;
	Thu, 08 Jan 2026 22:49:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdypC-00000000xdF-1Nq4;
	Thu, 08 Jan 2026 22:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7984560130;
	Thu,  8 Jan 2026 22:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A897C116C6;
	Thu,  8 Jan 2026 22:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767912589;
	bh=gLUTVZsyrlzlQM2BPw05odFnPxR0Wfu002nPLnUp7tE=;
	h=From:To:Cc:Subject:Date:From;
	b=drfh8mEtaNQj/vzo0dlnRwPecAdGf2qS/KT7xk+Z3GxYlTj5rhR6Fe4X89SGDUYGx
	 9hnar2lvOxLLhRQCDf+PNxyQDqQjpH9Zwvsd/7KoEkNFn+yLyTI1Fr+4+JK9oWGQEk
	 L8xT8kUdH1tVIelIQ4nicr0S3yUAgZvtVVkjisl4vqfg6bSnm0tHAZZM7aeumcWoVW
	 8BSB0yGoknwKIyWBMuRfdDBjegOV0099zUctPq8247OuFaRQ2/JzzDpNS8DZijk/Ec
	 GH/0dCTaV90Wae+gcDlmL2k2nXoK5VRIaaFYV5TuOGBiZU9UaWfNzIpxXJrjM08j3d
	 Om9S15AUKxTkA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: rockchip-spdif: Allow "port" node
Date: Thu,  8 Jan 2026 16:49:36 -0600
Message-ID: <20260108224938.1320809-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a "port" node entry for Rockchip S/PDIF binding. It's already in use
and a common property for DAIs.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index 32dea7392e8d..56c755c22945 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -70,6 +70,9 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
 required:
   - compatible
   - reg
-- 
2.51.0


