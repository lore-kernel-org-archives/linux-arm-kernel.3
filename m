Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB80C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFXE0ow+NHAbVFHf1JYlkpT5w06lX7CE26ijM1Wtcd4=; b=0CEre3QhkD8A7+4ncLJCiZPq6a
	7QnKjPyRR1wNcRtTh3uESVePpMQV8Z3VTWVDNS65gdX58Ht7hwPnI/l/OssX/UjhrX19K14TB71bt
	AZ8jfynWKhJoEgw+xs/yTkiUvqck/u0XYzztrcb443BUCGcBah9Qzy+uO72n28aZQwydLhLLFpKEn
	ZPlVfMBqPPLprNQqYcoMfM5AujHF92PvGOqMQpewFS6zZMI5CfMw7vLxPtw8KQ4mTirlgtgb9Ucp4
	85cfAeQ38JrFI+xvi//tFe2cFYH9/0UorCoSQak7MDYHdpUEcjgpgeFW5cyAcAMnkl1h5r3/PSvG5
	9BVcnUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iHU-0000000EMRc-1Fwd;
	Wed, 02 Sep 2026 10:33:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iHR-0000000EMQP-2lyT;
	Wed, 02 Sep 2026 10:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788345197;
	bh=u5hHq0Z8k4K50Ohjh9lwnjaZVf04Xn7H8lsSwUTpb60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AtQMhqVaX4vBafLgjq38dnQi+xH3JfKJm7L/JJkdyo9laW+iJbMja+VHNaaLIpkAZ
	 E1Zko15QCw3xKw4hWCtdn343tZrZfR4lsUnMxO2690e8QPvlTv+cg0eQ+SZQVT5hQ+
	 bZHZrDUWqNQ/EYmDznXLbNKlcE9bOSlc/UD4Z7xukiHAnXbOPyz063C4h7tev4Ts3X
	 tg5eN9UCwXKTHG3dig7A8HR+BE/vyyKdDOtI0m0beGdMTAev53/g77MBhh4ytBZia4
	 0ABT+p/o6mp0hZwNIGNc7bQfMAS8Pt6sKMn2/s98DUsY1BCkWvp436ju+uH6hLgxqt
	 Zwg1IcsgDuqCA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9323517E11E0;
	Wed, 02 Sep 2026 12:33:16 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 02 Sep 2026 12:32:45 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8395-genio-1200-evk-ufs:
 Complete UFS power supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mediatek-ufs-cleanup-dts-v1-2-7876e7a27a9d@collabora.com>
References: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
In-Reply-To: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788345194; l=1127;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=u5hHq0Z8k4K50Ohjh9lwnjaZVf04Xn7H8lsSwUTpb60=;
 b=lFpdvPJzBvklTLiXP2jD/pez1CnBtvueQBfvZSzK6nMVsCJPvYjgbiURCaaBLffnYNr4mr4Ph
 V0XqDbVqq+ZDv3zkmjuw3fwOtRGJhmRwxbXy2kWMZuAmAyD+8/LqPzz
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_033321_865726_89067D9D 
X-CRM114-Status: GOOD (  11.55  )
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

The MT8195 UFS host controller dt binding now describes the power supplies
feeding the host controller, that were previously missing from supply
description.

So, add in the Mediatek Genio 1200-EVK board devicetree the regulators
used to power MT8395 UFS controller when the board is configured to use
its UFS storage as primary.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts
index e09a3ecd8773..f3d839f31918 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts
@@ -16,6 +16,9 @@ / {
 
 &ufshci {
 	status = "okay";
+	avdd12-supply = <&mt6359_vrf12_ldo_reg>;
+	avdd12-ckbuf-supply = <&mt6359_vbbck_ldo_reg>;
+	avdd18-supply = <&mt6359_vio18_ldo_reg>;
 	vcc-supply = <&mt6359_vemc_1_ldo_reg>;
 	vccq2-supply = <&mt6359_vufs_ldo_reg>;
 };

-- 
2.55.0


