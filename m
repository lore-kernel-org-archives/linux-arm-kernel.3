Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7E0C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyAg+oao2hLSO5MFtf+OUxfyez7940gq4vcJ71Nff6U=; b=4oJniHaTTilbrdk0rSZg+XlTwd
	ZPFmsr5pnZQfbCwwXM4rs8r2TK6e1qzgNhjLJfGbM/TNNgKDuY+nUsR+6qA2aGQaUtvmstez5Y5HL
	KFi6QrLo3o5SabMIam8OEAHW316zV3jfHxAi25QlJlOXcoC3/7ZrB2gkpP7CMFyxZu+/yZwr8ATr9
	NSwxTnYhPtYhlTc9pXKZx0mCFmQYktvhXp7ruu64VjBtdOOP1iOXg3OfZx0Ex6SyE00A1oDgQCooT
	tUXnsNQSeHB467DWnU/+05lQOGm7XW96z9DUn2DTubneW08MOYPSqg/yZ6yoMJJ965fJzGz3g8B/Z
	dT4GYsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iHY-0000000EMVd-0rzg;
	Wed, 02 Sep 2026 10:33:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iHV-0000000EMRT-1c5K;
	Wed, 02 Sep 2026 10:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788345198;
	bh=Iy+VUNXDXW8cWtqhoAcajkOwEmooMeEJCbxXu8rQQOs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=POWuk7sdMsPIg1zcWIim2kuet5JxYBmhJG6SFrb9VcEt2CfsK1hM8cI5oK3fJQIvF
	 5XcgkAR+aYJTiNYVtTHmFcAZtkPj9E4aHvkvs2heFQaBlssCUbTQzIKVIN+J3CUPqg
	 rlYQqPMqssgCrFzk/kchPsPUGT7lPmqppZ/fd7OOEZg5Lh4KTdxgv6mO74T/DrKdar
	 yFPEg38BsCY6jhenufqkDlpj0XQx6/S7MMNKaftFCyozJxQGPDXfPraSXaGPeMVBhm
	 1o2ZWRMsr3y8qEMX4YMFHiz08rs3xNGGq0gloYYZJJZNC3ef86a5SbfQia7ImQqxZz
	 dPEZDpE3ES/Qw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 76D0217E11F5;
	Wed, 02 Sep 2026 12:33:17 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 02 Sep 2026 12:32:46 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8395-radxa-nio-12l: Complete
 UFS power supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mediatek-ufs-cleanup-dts-v1-3-7876e7a27a9d@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788345194; l=1050;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Iy+VUNXDXW8cWtqhoAcajkOwEmooMeEJCbxXu8rQQOs=;
 b=c940H5zXtUUgCV2sxRtdhKxlcCdgXiSInmQ1m1p15P0fCc6REDVxahRltrLYYFGv6Z/dWMvKJ
 r3EureIi3lSDVQbsIYWdtnhDJS+zxKJXTxYtS3WtfSyJykNR8tRgN3r
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_033325_776784_4DAB8548 
X-CRM114-Status: GOOD (  10.46  )
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

So, add in the Radxa NIO-12L board devicetree the regulators used to
power MT8395 UFS controller on the board.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 9cf0315da035..7e9cabdd2825 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -1184,6 +1184,9 @@ &uart1 {
 };
 
 &ufshci {
+	avdd12-supply = <&mt6359_vrf12_ldo_reg>;
+	avdd12-ckbuf-supply = <&mt6359_vbbck_ldo_reg>;
+	avdd18-supply = <&mt6359_vio18_ldo_reg>;
 	vcc-supply = <&mt6359_vemc_1_ldo_reg>;
 	vccq2-supply = <&mt6359_vufs_ldo_reg>;
 	status = "okay";

-- 
2.55.0


