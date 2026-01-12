Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA34C9EC99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87O3JqIkZHp6I/ueZ3YnKx42k5g2M8EmXTH6VBq5jz0=; b=BDqnsnQ1WXQCsbPFVjwYb8W+yG
	LQaLs/fES3Xm4OSfmrKzr97XLJDTiUlYa0bvYf96d8XGIxP2ZL67VgSv3vLuxaDqyOmy4Rf2LHB0n
	bONMdW+1MTbqFKJtMm9yvComTUsXPlMRJxAJ/gCCohYiocpd8RM8xfCS0pGnispJLoQJ7qdX1X2I4
	1tOfZGaNLjjDG5ero0ZGA+XzNWQyXf+8Ts3llsvtvYbaf/JrqMdCJ/k3ktZBSjiwrqk2Yi31wMtbi
	BkYIOR4swIhMIvSkuvDlqFqIvSDVG18ofYr4WIFA6jh7hHQWcmYikTuVclrVsaCmTZEdG1vT/O6Ow
	f9KTwKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJL3-00000005aJ3-3lSI;
	Mon, 12 Jan 2026 14:56:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJL3-00000005aHB-0OwE;
	Mon, 12 Jan 2026 14:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=87O3JqIkZHp6I/ueZ3YnKx42k5g2M8EmXTH6VBq5jz0=; b=HWvjY/eKNbJrplAX77uHuw0CRv
	NmPzwqhi7sZyeg2iXK7nzI+hpQh1gqjmFxtI7ZBVYzTmPJ5GzCsbQhtIWBui2EMgDAV29Ry9M8zUo
	v5qjuRsJYzVNPgImyXLCffYx2SwSF0JDBXcL2XmCkyPPYPpssbga3WQBnV0kGxP/JVqArJmuk9DBw
	gLdgL2cVe5IrK/FFukwVqaaKkV/9O2Tcdt+PAPKnaRiBEYVHXBl6SE95fwbBf6k5k6yETS3y1gp3t
	aLsZ6uuHZDVJLGtf0s7hpsvsJUbjFzrcglpATx2fgd4iJpkey1oBxip5S6fBgI+St6nYnHgbIKAH2
	8SN6dzzQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJKz-00000000xSQ-1GoH;
	Mon, 12 Jan 2026 14:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768229763;
	bh=gw1VaxWzqkyKrA2KxIUxIvewB29jkb6zfBD6Cnr2AVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jvvp8D/P+mDkgw+JICaE/Z1AYqoyAAOjofI/lF7k9/a/WA8mOhDNBsq1MO7wgAJmS
	 1Rf4Bk0oNTk7nETQ4hAp+kCViyilQBVWXqk7w7tJPkCf7ZvJ6XeJvwPi4xFIqVNPhy
	 sbFPD4ZDI7eflyQoGZI4Yb6eqR1gYSST5MDyVvweUDu3DnUyRnLSVzZGP/nK1ksFkk
	 i9DsC8gOM/4QYoK83hg5Cd4sSuv3cNF3pMk43nBelWHHtQwb/9yz74N+iz4dH80i1c
	 y1o3sQLkzoR06eGbAyseWGzWgKSlnWIov5VIjXPLC/saPgE/YwcpSuqCiBImcnRHLD
	 2mWzb5by9/JPA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D527117E11FF;
	Mon, 12 Jan 2026 15:56:02 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 3/4] arm64: dts: marvell: Add SoC specific compatibles to SafeXcel crypto
Date: Mon, 12 Jan 2026 15:55:57 +0100
Message-ID: <20260112145558.54644-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
References: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_145609_513747_B804F770 
X-CRM114-Status: GOOD (  10.11  )
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

Following the changes in the binding for the SafeXcel crypto
engine, add SoC specific compatibles to the existing nodes in
Armada 37xx and CP11x.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi  | 3 ++-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index c612317043ea..87f9367aec12 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -427,7 +427,8 @@ xor11 {
 			};
 
 			crypto: crypto@90000 {
-				compatible = "inside-secure,safexcel-eip97ies";
+				compatible = "marvell,armada-3700-crypto",
+					     "inside-secure,safexcel-eip97ies";
 				reg = <0x90000 0x20000>;
 				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index d9d409eac259..39599171d51b 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -512,7 +512,8 @@ CP11X_LABEL(sdhci0): mmc@780000 {
 		};
 
 		CP11X_LABEL(crypto): crypto@800000 {
-			compatible = "inside-secure,safexcel-eip197b";
+			compatible = "marvell,armada-cp110-crypto",
+				     "inside-secure,safexcel-eip197b";
 			reg = <0x800000 0x200000>;
 			interrupts = <88 IRQ_TYPE_LEVEL_HIGH>,
 				<89 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.0


