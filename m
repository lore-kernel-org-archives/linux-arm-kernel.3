Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1CFD0C851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCgzEWnwvyy33EIR1672xNm2180ZO6kr+dCmMTMlWOM=; b=yLdlGefyC6KWSGeysAzD4W8xjf
	Kb1TKXJyb7dM/ItBVsgujuxom3hNaj7+7tP8vNcMiNMGKWwJVnpIDbCpxoUmEBj8ocknqWXngKefr
	q4oZDW1SVp1y/ZplMOzcTqVSNSwodmSPOa1+IkEwMqsauidTGqN7DQT5B5CJ89HH2ynFI+B2AhBVT
	Nvfj47qlbGarFdxL3TkP+qgGGxDgb+dea4zuZ/y05MJYLVqkxlSGBNtxo8sUU0W26Ytjb2mEs0Cmt
	u6C/WljYJvFhdtMMMuky4JvdlE/rBWuxeGCb3QwYys23S4p/KxeREIb6fWQ/tUwr/GBlYihhFX37a
	Lu6rlkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8u-00000006xgj-0KTj;
	Tue, 13 Jan 2026 11:00:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8K-00000006x5Q-0Q21;
	Tue, 13 Jan 2026 11:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302017;
	bh=Qtzz12boIO/VIHRD3C752NQeLrf04iw9L8Q1Ovq/IUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kfynO2Fw+GmTUUJqbGGo7tn19FvNwLBWV3hhk8lcL6XU3zlCKt/ZexsO3EVcMl8Ru
	 b/G7wP2iQLL0Mn2/24j3bpuwI0EbVDStOa5UlZD/Bgm2qrJTPciB8w5huhrfXFONbN
	 ulrMeSadQKUM0g5UQkV5TvDKUWDd4yg3n6xFG31tc+JcRvH0UGOdE/tEXTphxQGZta
	 lAyCAnUU12GuXKEXrvI/dOR1qe7S/tMHZC1p699GDrkcCqDzFe2aX+gsJhpThU+rTC
	 SZk+3iQKYmteH8ClyWE+GUpfICjZaMh9vCDD6Uv1D4IE6yYGG+PH/ot8f732mPTlT8
	 /D+Sxp1qdSMqQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C57C17E1406;
	Tue, 13 Jan 2026 12:00:17 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 4/5] arm64: dts: mediatek: mt7622: Add missing clock to audio-controller
Date: Tue, 13 Jan 2026 12:00:11 +0100
Message-ID: <20260113110012.36984-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030025_639473_9A14DD77 
X-CRM114-Status: UNSURE (   9.35  )
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

Add the missing audio_mrgif_pd clock to the audio-controller node
to both resolve a dtbs_check warning and ensure that the AFE merge
interface is clocked while using audio.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 158bd9a305d7..133a6dcc8ef7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -654,7 +654,8 @@ afe: audio-controller {
 				 <&audsys CLK_AUDIO_AFE>,
 				 <&audsys CLK_AUDIO_AFE_CONN>,
 				 <&audsys CLK_AUDIO_A1SYS>,
-				 <&audsys CLK_AUDIO_A2SYS>;
+				 <&audsys CLK_AUDIO_A2SYS>,
+				 <&audsys CLK_AUDIO_AFE_MRGIF>;
 
 			clock-names = "infra_sys_audio_clk",
 				      "top_audio_mux1_sel",
@@ -688,7 +689,8 @@ afe: audio-controller {
 				      "audio_afe_pd",
 				      "audio_afe_conn_pd",
 				      "audio_a1sys_pd",
-				      "audio_a2sys_pd";
+				      "audio_a2sys_pd",
+				      "audio_mrgif_pd";
 
 			assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP_SEL>,
 					  <&topckgen CLK_TOP_A2SYS_HP_SEL>,
-- 
2.52.0


