Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D8C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NgIFyD7BBdxExUJwAlUnupBEZ91on8PnKok7i7wsxkQ=; b=zz+rbWfNxmJdrHhZ8sOrSqumEg
	rYIfS8xiz3+zeNh/0EoSR5JTe2j+acyDnXtHCLJ7SM0qFMxcqCIuyk7xCA0uDVjeBUfOmCfraHoCN
	3+fWoJEuJpKMyrj20m7bGRPZ/bTWrprgKISNmfZR6ABecZzJaLgvTc58CW5CbvOspsK8Au8VaO485
	rms4lVV5S0f7870icQYyyi5hpO54xnlykrytinIvffYKSNA9vEbfj0PK+yXxUOkMbpxJjPxpA11+V
	/GJGMnkemOTHSXkh5CnaH9ExXeq6RuBj3tnjEDIItT/mMSjMC/yLK4DGjFOrOBNf+zQ+t3GdA5c9K
	VfiTPW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmufp-0000000HJFU-1VWc;
	Tue, 25 Feb 2025 13:08:33 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuLb-0000000HFmV-0ibV;
	Tue, 25 Feb 2025 12:47:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD99961253;
	Tue, 25 Feb 2025 12:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D040BC4CEDD;
	Tue, 25 Feb 2025 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740487658;
	bh=hnEGBgMiJircNCvnzwAqAxPPcC0ueWOeICOFe+xro64=;
	h=From:Date:Subject:To:Cc:From;
	b=Mv07zunhJd2gjkpAIVUYhM6hGGtxyxFwa73+hcl//2z8K+56pwMAx8GTMEMX3iNUK
	 +0DxuvL0kTSIFOQqIwsNYE6mXteYAtA6M9uYwGJ2q7RkuH8AQEDIlYj8BWU0ftGiYK
	 3I4s52E1a6/lz6ZYTDC8F8/1PIAUbXtBTAYE0ZGk4Z8/FSPJv9E42esmSfFkW+aQeH
	 uvdDMUX79M1hjjl24qZ8Y4ngtn8khXTE+Z/vcyfkjx7QAIGf/gKiKmjBPFmvpcFViQ
	 matqmhQ+7sKl+EPhbcNABxpewkSu3efY/vMGKjGW3k8jGL0lkoVvD8DIw9t8xHjawJ
	 KjsB9cdTkdbdQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 25 Feb 2025 13:47:26 +0100
Subject: [PATCH] arm64: dts: airoha: en7581: Enable spi controller for
 EN7581 evaluation board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-en7581-snfi-probe-fix-v1-1-77e4769574e4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAN27vWcC/x2MSwqAMBDFriKzdsCOFD9XERe2fepsqrQggnh3i
 8sEkocykiLTWD2UcGnWIxYwdUV+X+IG1lCYpBHbiFhG7GxvOMdV+UyHA696s2/FOoSAMIBKeyY
 U/X+n+X0/G6bfrmcAAAA=
X-Change-ID: 20250225-en7581-snfi-probe-fix-c325bedded9e
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Enable spi controller used for snand memory device for EN7581 SoC
evaluation board.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index d53b72d18242e3cee8b37c7b1b719d662fd6db8d..cc69f698c27b804953b1bb671e128d4401744bf5 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -25,6 +25,10 @@ memory@80000000 {
 	};
 };
 
+&snfi {
+	status = "okay";
+};
+
 &spi_nand {
 	partitions {
 		compatible = "fixed-partitions";
diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 26b13694091735da7af977e42f8f546d7d5cb078..49c061d38d7860b3b416610723791a7a91edcb69 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -150,7 +150,7 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
-		spi@1fa10000 {
+		snfi: spi@1fa10000 {
 			compatible = "airoha,en7581-snand";
 			reg = <0x0 0x1fa10000 0x0 0x140>,
 			      <0x0 0x1fa11000 0x0 0x160>;

---
base-commit: 0092294492fafe79a537915e486576a3d69c9a7c
change-id: 20250225-en7581-snfi-probe-fix-c325bedded9e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


