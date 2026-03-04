Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B07EF8FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 16:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fIqCE6mIY0/CBMbtErt3OlL2eYJgNS5KhY7QzO9qeg8=; b=Zy0HF8UqyvX0Tsyaizpsxg0vFc
	V+UWrLX3aTNFaC3VcfQ1CeEk7CKOo71L7VU1KAESpok3FGGvNybWbt7VqePqb7EQkXLbjuxGqkOwa
	Qu6dyvT2wnRYZ+iQSNJs0PN2jpFZAYlIVjJsleBsGz0HwIH6BkZZG3QeRW2ZgTcUAmf2HVm87eGFf
	q6cnSijxnYav6gcgKzlbjetHHu096AQtsqUHlcyQslS5r2gicNvVKgcDxPlgRVnDoh9PZfQQDuHu0
	x6A1/J96jNxj5k5bAnrRvjPlrXy7Q78m0dI3oeGGau0NeTm7ftqqXXBmAJu3dCHpAJguUq080NUCg
	JGiGF3Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpCI-000000005Xa-09y6;
	Wed, 04 Mar 2026 16:35:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpCG-000000005XU-2yPG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 16:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4EF260018;
	Wed,  4 Mar 2026 16:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1BCC4CEF7;
	Wed,  4 Mar 2026 16:35:37 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: "Paul J . Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: intel: keembay: Always use decimal interrupts
Date: Wed,  4 Mar 2026 17:35:35 +0100
Message-ID: <c6fe682d69c85a0d4cefb02868e1583261529192.1772642043.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

Replace the sole hexadecimal interrupt number by a decimal number, for
consistency with all other interrupt numbers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/intel/keembay-soc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/intel/keembay-soc.dtsi b/arch/arm64/boot/dts/intel/keembay-soc.dtsi
index ae00e9e54e82cbb9..b6323ebe7a5f46bd 100644
--- a/arch/arm64/boot/dts/intel/keembay-soc.dtsi
+++ b/arch/arm64/boot/dts/intel/keembay-soc.dtsi
@@ -71,7 +71,7 @@ timer {
 
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
-		interrupts = <GIC_PPI 0x7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	soc {
-- 
2.43.0


