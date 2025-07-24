Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4154C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeKVcuQnhXsh+G4bmWTicbNkRPGFIlq15x1crTq7V+0=; b=28tlmV4WpfSCX/ASwW5sqZRaYp
	UfPh9yiAoFS9jDUKkqNFCyDinLr35sfaXvFvyFq8Pmd2hMbqHNVE9TI38KE7WMpKhSNe+t4l42vIR
	szjtU2Mw/6HE0d6jOKSOGSJyiw7QFvlNyFjDvo4Io5y09kzrrwKB2S3rva89iWMHlGB217sRYnpuV
	WJy1OTBunfEjHZRmgLl8/sGEGdqFVpm+T2Lfzio8OAbw4Sex1L7rEXM1D8FCwaMFLHN0MzlEao+D6
	6Z7I1yJTK3NcZwGbilFuu9IAXkKMCy1Rk9w5pDOd+fgtltmkhp8Hdsu7u1TFAIUA7giUDDdGNtU3B
	yA4pxTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesYd-000000076Cb-2qm6;
	Thu, 24 Jul 2025 09:48:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerTt-00000006t7B-30ED;
	Thu, 24 Jul 2025 08:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346352;
	bh=k3CxvdIFne4d7WnWUFyHn9jMo/aAR5LTnqhS5VtHfmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pxusdln65wCWqLYwZuVfsCEnelwtqT+Nd6iQJaDo7Xk+5M/1q9kvkZgm9n38IjIml
	 VS714qsiF9Q8EGHmCPh7tQ9oDi98BdkCKhKPPkzI1m9bxiZPO/fw8cVdNBBKUQ2L70
	 kpuYBOr9GXvSrYV5Fe1RtxE/AoWD/Ij+uVu/C/V++qo2KjnlKUUPHPSFPCPPNHCiRB
	 LGdCSwGQdENJCuJC3H28I1whEb+ju+k+IT48KlU/SMkCiNWoxyXNQ+YkLaM5Wdu1GI
	 4PcGGLunD3YBILPKjhJp8xgp2jLIruxu3kU/WJbfU62vZlaYUmDgDafKuGLuxyOkl3
	 K2qokTPUlYQgA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89DBD17E11EE;
	Thu, 24 Jul 2025 10:39:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	u.kleine-koenig@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 3/3] arm64: dts: mediatek: mt7622: Add missing audio_mrgif_pd clock
Date: Thu, 24 Jul 2025 10:39:07 +0200
Message-ID: <20250724083907.61313-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083907.61313-1-angelogioacchino.delregno@collabora.com>
References: <20250724083907.61313-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_013913_895637_82535475 
X-CRM114-Status: UNSURE (   8.54  )
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

Add the missing audio merge interface clock to the audio-controller
node to enable the ability to merge AFE connections.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 917fa39a74f8..308c23b9de28 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -650,7 +650,8 @@ afe: audio-controller {
 				 <&audsys CLK_AUDIO_AFE>,
 				 <&audsys CLK_AUDIO_AFE_CONN>,
 				 <&audsys CLK_AUDIO_A1SYS>,
-				 <&audsys CLK_AUDIO_A2SYS>;
+				 <&audsys CLK_AUDIO_A2SYS>,
+				 <&audsys CLK_AUDIO_AFE_MRGIF>;
 
 			clock-names = "infra_sys_audio_clk",
 				      "top_audio_mux1_sel",
@@ -684,7 +685,8 @@ afe: audio-controller {
 				      "audio_afe_pd",
 				      "audio_afe_conn_pd",
 				      "audio_a1sys_pd",
-				      "audio_a2sys_pd";
+				      "audio_a2sys_pd",
+				      "audio_mrgif_pd";
 
 			assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP_SEL>,
 					  <&topckgen CLK_TOP_A2SYS_HP_SEL>,
-- 
2.50.1


