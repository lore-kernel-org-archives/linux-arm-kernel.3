Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30DDF4198C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 10:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U/iizR17Gf6o+UY0a60C+rF+10q08/vEGmsLhnspuew=; b=22Wke0ICYP/WIQHHAHhErDPorr
	vvrNcwIDITbBCEKx/ve9v4TX1RVjvNegv9pDAtLb9LzFBagEUQtZSUHxV3gK45/5cqUbZspk9gZ0p
	cvWPjGaa0CusrtkdgbufRDYFYxZEI/d/NDlgDB05gX/C0DB6OwlN65dDw6K8V6ME9fNiHuD6aeMYf
	ZF2o7caSMacSaSZJeJMSNcziyQeYo7lBr2448DYXvkbrBaJG7EIlA5o6x+UQrQYT/7ETmkBiOUNBo
	2vqPHe7Mg36EdGaCUqg/0jLvbCr5oZIaepnyupz4+oWcfET3n0PzXOA0ITMRI9aKQ3LfB0ZcvoKio
	ayx3y/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxXU-00000000y9d-1upd;
	Wed, 15 Apr 2026 10:32:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxXS-00000000y90-0CA7;
	Wed, 15 Apr 2026 10:32:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31FC3439A0;
	Wed, 15 Apr 2026 10:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C12C2BCB6;
	Wed, 15 Apr 2026 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776249125;
	bh=HIKPLEyWCCsA3zb5wxtyTAgfOX1+xiCwivVroOYHU3I=;
	h=From:Date:Subject:To:Cc:From;
	b=IsWcfKmGsYtWiRh/FZMbE4wbuP6wYxpAnlj2rdBMw9jy0FIshvnLhRncIFBGx55DU
	 yWEDTdxCQmP+AmN2EykEHsTXI9y9W2IILpWODjg9oKPSy8qeZUAUIvQTvYrQHlNG4k
	 Vl8esEtpWkq/n7NX1kLIVB71KEFYhSPp3uUHCeTWfx7UcmpIboef/Yh4gDB1fA/uKP
	 IArjFXNgkgQp621EAHevpxOUICTzfsFCt0XsmgbHf+KfhyfSOnwjzvuR6+6ZN4chNd
	 2i4k0TM8+7Obc9EMJgzVudsLnapoQdfbeCPwj9RO6QTPn/JCMARqhdDQ1xKh0Svqud
	 7Ht4qE9fBE31A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Apr 2026 12:31:49 +0200
Subject: [PATCH v3] arm64: dts: airoha: en7581: Enable spi nand controller
 for EN7581 EVB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-airoha-7581-spi-enable-v3-1-07e0f27cce13@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBswzYquEi1MpxoIFYUIorsnL
 d/i/wcKZaYCk3gg08WFY6jQjQB32LATsq8GJVUvu9ag5RwPi4MZWyyJkYJdT0KpOydp08qvPdQ
 4Zdr4/sfz8r4fC51muWgAAAA=
X-Change-ID: 20260415-airoha-7581-spi-enable-034c0ef32db6
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_033206_118367_F82A579C 
X-CRM114-Status: GOOD (  10.77  )
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

Enable spi controller used for snand memory device for EN7581 evaluation
board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v3:
- Rebase and resend
- Link to v2: https://lore.kernel.org/linux-mediatek/20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org/

Changes in v2:
- Clarify the commit title
- Link to v1: https://lore.kernel.org/r/20250225-en7581-snfi-probe-fix-v1-1-77e4769574e4@kernel.org
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index 886e2e4b5f64..3dc68dbf1be7 100644
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
index ff6908a76e8e..0964cd783013 100644
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
base-commit: e6490a169f6d5f5bdea7a2e8a673890d43afadc0
change-id: 20260415-airoha-7581-spi-enable-034c0ef32db6

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


