Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D399C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWzYe+a7WOMxrt3xeOI5Fe3eq+MqX2idDVrzjgtINMI=; b=MHb58TTLC/arQuoOSMdwCLABdG
	sWJndjpyUpY+Hf2/s/UVqSVtb85OU+rzXekDU6irxVD7cHLiQ9IIqcM5MXVeL06T3G+qJuljuIUxz
	sEUXltZ0yOAHm7nSuW5Kx2Ytr5kBPAcXffjiVhw2RPRSeK31ZjHO9v9c0l/MXu4DySeKvcBjo/a3y
	zqqxVXnv6uW9jPNIf1SsKeXMEFx8pD0Qd33YSN9mm62eiETlQiBmAb2TXzws+TA0yzhtQGx/skFgl
	8tL2FlzYrR8ESewWT9lyo5ZBj1VxgKkGhfd7egA83Ys/Qtq0zzIhSJAlcI//w0LosPurmyfM9KNHN
	5xBGjbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetw8-00000001tSW-0ijA;
	Wed, 01 Jul 2026 12:21:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvu-00000001scn-2H9U;
	Wed, 01 Jul 2026 12:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908448;
	bh=10CwvtT4kY3WD8DU6fNrUFwHds9K/lWQ7/9XIIUig4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uu9+yMvRjGLMKFl9yW+/o2Vic+6LDilccI6IflxLeP2DCne9qMZqxR0PSBjnRW51d
	 vv2L5JmyVP7yDZUqFi1E2Ltg20qiPBYVzY/5SVcsCN1f+/xz6F+SdCEPEO1oepjrJ9
	 6AMVIVO25Ntbrp4NUK/dnOemc17i0YE7fhnbLnRkCCEqYTfdGFW5MAISY4pKL3NYvV
	 Lk5LqfKjYJawd1dRKqfZvdFjbsSMoON4+HLUpNIUywTUv5ZKTqejaY4YnHDDIzqvyU
	 vl9EkdBex3Czq9sFxiVVeYUXhWLPjPklNlOsN4zxaM0jIjLv6+xtCrNU1dNCbw9fR2
	 fzRKWxUbdJNaQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC2C217E0F44;
	Wed,  1 Jul 2026 14:20:46 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andi.shyti@kernel.org,
	djakov@kernel.org,
	broonie@kernel.org,
	jitao.shi@mediatek.com,
	ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 1/6] dt-bindings: soc: mediatek: mutex: Improve title and description
Date: Wed,  1 Jul 2026 14:20:38 +0200
Message-ID: <20260701122043.19612-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_052050_846022_6E205D88 
X-CRM114-Status: GOOD (  12.85  )
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

Improve both the title and the description of this hardware to
disambiguate its functionality from a hardware mutex and/or from
a hwspinlock.

Though in datasheets this is called "DISP_MUTEX", the meaning is
is "Mute-X" (where "X" means "any hardware trigger signal") really
as this is what this piece of hardware does: muting or unmuting of
signals in each sub-IP of the display or other multimedia related
controllers.

Based on that, also clarify the description text, as to make sure
that the information is actually accurate.

While at it, also avoid forcing literal blocks in the description
as there is nothing in there needing that (no ascii graph or other
stuff that needs a literal block anyway), and add myself in the
list of maintainers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/soc/mediatek/mediatek,mutex.yaml   | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index 5267cfe92572..1ba086ad749d 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -4,18 +4,21 @@
 $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek mutex
+title: MediaTek Mute-X
 
 maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
   - Chun-Kuang Hu <chunkuang.hu@kernel.org>
   - Philipp Zabel <p.zabel@pengutronix.de>
 
-description: |
-  Mediatek mutex, namely MUTEX, is used to send the triggers signals called
-  Start Of Frame (SOF) / End Of Frame (EOF) to each sub-modules on the display
-  data path or MDP data path.
-  In some SoC, such as mt2701, MUTEX could be a hardware mutex which protects
-  the shadow register.
+description:
+  MediaTek Mute-X, namely MUTEX, is used to "mute" or "unmute" trigger signals
+  like Start Of Frame (SOF), End Of Frame (EOF), Tearing Effect (TE / VSYNC)
+  and others to each hardware sub-modules in the Display Controller IP or in
+  the Media Data Path (MDP) IP.
+  In some SoCs like MT2701, this hardware module may feature functionality
+  to, for example, protect shadow registers by blocking auto write triggers
+  upon operation (usually frame push) completion.
   MUTEX device node must be siblings to the central MMSYS_CONFIG node.
   For a description of the MMSYS_CONFIG binding, see
   Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-- 
2.54.0


