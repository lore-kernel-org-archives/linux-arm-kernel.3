Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A0ECCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuJP5uvYjaOsI3s6JnmyPIK3HRGUO35U3kgpSzlcU5g=; b=Aggfcohld/oIzaPKqA1JIydII1
	pOufDZST6RvM3m4XUCt/K9Sbz1M+IzQitSTidp1pFsCF/NOLyBsyW3SoL0Fdf2KSgqvXb9kMqD54I
	2otHy3jROG1pzcGAw5IVJB/eL37a3uq49QsU+NHDomsR/fvTDq2Sz7HfcPt8pOk6xMg3HCEAcQhkd
	ynzM9X8Ten0mxiGWZ0yOyLNeT3x2uFPqq1amBJZYrGPz3c4/JJUwVCOoL+6igGgmOfW2wlntwxRXI
	sLLhpOiv5aeS2Z2tGV4j1jWG63oAXF8imQcaF/bOngEw9UqjxA1kLEl+od7iyodZuq4GFDh4eE0TM
	YwfKz3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6qW-0000000G4qG-3Zt0;
	Tue, 21 Oct 2025 07:31:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6qU-0000000G4oN-1Fh9;
	Tue, 21 Oct 2025 07:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761031906;
	bh=bjLpM2W3sTbWopeGWLyYiV//AjiRsTV/ewj7yfjNBrM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RwX6o/WWdSdPSpu2/HisgEyMoJji5k3aDmofw9ZGxGk96NsPmibSMruKhynlrD8GF
	 AWjsghxqNSysqj5MTV07u/F8VHmapT0zU4hVo8Bua2vodIPpTt3PWuysDz5QTg+CM+
	 TIDZnxajRnKpDDoLGZVjf+K7+GPVEOD5VU1JFc/aDY2JLxm9p5hdUnkxCJfnwvCbxY
	 AhNwlbxMLLi5wOIwKnVJv1nFXaNrXL8CjVsM3JQApDDq4koqu1NhDBXzpvXPNR8pFE
	 E+9syuCWr5PJ1SEjxitkdgJbqqzHCjYQX6DR1AxiTcjPbtmucOoqsr6guubGrc5X/2
	 R5BH+fsFgiWiQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 12F3217E02B0;
	Tue, 21 Oct 2025 09:31:46 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 21 Oct 2025 09:30:51 +0200
Subject: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-mt8365-enable-gpu-v2-1-17e05cff2c86@collabora.com>
References: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
In-Reply-To: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761031905; l=1138;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=bjLpM2W3sTbWopeGWLyYiV//AjiRsTV/ewj7yfjNBrM=;
 b=qh7dnF8RA3htMtb2+A8RKYeQOThCkDf1QWvsJ06DDoW/sFl/x83o6uGfQLpoTzN5imoU+xGdq
 XF0ULFINFWlCVD2vo6U/beUlt89s5VcHZyxaeTJbTv+r6UlC2nVBQk5
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_003150_503998_4E57968C 
X-CRM114-Status: UNSURE (   8.98  )
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

Add a compatible for the MediaTek MT8365 SoC, that has an integrated
ARM Mali G52 MC1 GPU and compatible with arm,mali-bifrost.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index be198182dbfe0dba61176f7205b08be131f4845c..db49b8ff8c74864afb25fdde40174d521c72c6e7 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -22,6 +22,7 @@ properties:
               - mediatek,mt8183-mali
               - mediatek,mt8183b-mali
               - mediatek,mt8186-mali
+              - mediatek,mt8365-mali
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali

-- 
2.51.0


