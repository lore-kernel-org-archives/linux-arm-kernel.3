Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162AAC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FR+qGUdvWVOKl5Lsw4ScgczUCqfv231LVCou7CB4FXU=; b=VKHTvk5bcqZUQ97iTq4rqIOOoA
	OuzVXvg8Sru7nH3pzaXxJvaJPLHNQIUcYrJXfIe6TglqngK2ggC2+G2JGepBKQi3ymlqVQqAXuBXM
	baxiXX6HENaRg63kFYgqRRO8L+qBoZ9AghQAng/3AqVCsji+sMmUs4FIu2X/Zg+cRVOMb9C7oi43k
	DMl8bRzIMU1JCzbCtx0c9Y4wFkkScnJ0aV3xFlCwWxvQQIAHESkeLRNoAKZtIZhR5B+Tew5L8Nyjl
	T6Jr7CufUWXnGhJAzIUMs152PDnfDiT+i9oWHvcYXqyCCS5kL3AfJVJvO6UC/K1XVjAOGWD+daFa2
	vbsdXd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHL1o-0000000Cc0N-0hni;
	Tue, 20 May 2025 11:21:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKrF-0000000CXue-2uWE;
	Tue, 20 May 2025 11:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747739404;
	bh=Xj2HD2MawbrtSBmFoR2etpcm9AJMpw2lNkY9iw6DYso=;
	h=From:To:Cc:Subject:Date:From;
	b=iTReMvdVCpaCDVMuwX3W1czc++LprkMXOfYNLuwlLmxVk6948s9N/63vebV2laGb6
	 iIc6fDwRS+Jl0AqaAssQTditjtaCyj7TsQsNtU+E0ytyh0EEb3BH3tvNoWTq/RSH16
	 pWOwS+f42f2Xbef1NehzBQkih4pVNEepvmINY9sIpUpJchz8vqYWmyDglQLh7eOY29
	 2gv9dpirPGSIzem8EtxOWIRFTMv9/QdcgeQWD6317wf+yS6ZVJSDA4+pHcad3Yfz3P
	 XWx1w009+HKJX41OotXwUK7fVl1xLjZ4xhZQYm1Auozo2MFG3EVXs3F8C+B06TY78L
	 0fhkmqzptb78Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9313B17E0FD3;
	Tue, 20 May 2025 13:10:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] Revert "arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0"
Date: Tue, 20 May 2025 13:10:02 +0200
Message-ID: <20250520111002.282841-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_041005_901241_61D64A69 
X-CRM114-Status: GOOD (  11.84  )
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

As clearly seen on other non-MediaTek platforms, this is known to
eventually produce regressions in the future, as drivers may break
ABI and stop working with older firmware versions.

Although the firmware-name property was used in multiple MediaTek
devicetrees for the System Companion Processor (SCP) node, avoid
doing the same on MT8390 to lessen eventual ABI breakages that may
happen with a driver update to change the firmware retrieval logic
for the SCP.

This reverts commit 2f0066dae66f30386ecd6408410e27a4d6818c15.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

As strongly suggested by Arnd, I'm sending this revert. Driver changes
will follow as soon as possible, and most probably not in this cycle as
those should - at this point - be carefully engineered.

 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index aa8dd12a84ea..eaf45d42cd34 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1177,7 +1177,6 @@ &scp_cluster {
 };
 
 &scp_c0 {
-	firmware-name = "mediatek/mt8188/scp.img";
 	memory-region = <&scp_mem>;
 	status = "okay";
 };
-- 
2.49.0


