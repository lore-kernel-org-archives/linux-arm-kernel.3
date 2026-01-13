Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706F5D0C851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIYw3Ie1wE4K5m5v+lXWFYYkD7qMZdsNjjuztbIofvQ=; b=hmbhjabIR1ojxv/dYftYcItU0n
	P1nuh0e3ef7VdaxF96j4bqHCT9RTBn+iJegbt6/etigq6wD+Eidfa9nKzvEb/dPT0JiMY/Lc3ucEB
	l9AU+J5IB0T45SnUwGZCVXr6gZxQycdqQm63OT15MNwAQhsGRQLOgAjJpuUZLE+V45e+KtVcZgvp3
	h2EK06lWxyq1cnduo/HitzGbM680ffMy7Nprq95OTPSbL2hDVPdD5vE8KpT+5J2+w+ZSt68wTxR09
	iyFZ6G84Zdpa1ULQVoUdtKPNacaTY5WQfi9PGcEiTo5HqiE1GqINkSrGrLFbKpnFRX3/K2MuPz8E9
	DCVSXKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8W-00000006xEu-1KCA;
	Tue, 13 Jan 2026 11:00:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8B-00000006wwe-3Wkf;
	Tue, 13 Jan 2026 11:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302008;
	bh=Axhq3LGTNbxz4u+KRkYjN6yjn7G1wJmLGxtKUA3MjMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kXBcjMT+Qy+GOdNm65k2fMfkmAy7vsKYxmzjLYrfYwHurGZdIXaOWk9y4G31lNXiD
	 OgrPiaJ60CaNmJDXvJd29vxcnihWw/cTH/Re0zTGwnXW4f41d5pSAno5rtXO+OI1jm
	 iwQEQ0HiBjyNhMIT56q1WC0igCkR0aDWkxRLJsByTzgiqDt/VicjK6bviHQsEHtXlP
	 obOgbaBIuZRr1ESlNPaojyT/xa1mjBAO/X40zNLQTGLPYDEVgN++XPpFwuq3emP7f+
	 qWgu88O3ZS3bA37/pQCXOnUpEh79K+TIjacQ3MkPPl3daUvOxd4TabLqsENFFXgC0u
	 kpvj28Zwpmp8Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC5F917E150E;
	Tue, 13 Jan 2026 12:00:07 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sen.chu@mediatek.com,
	sean.wang@mediatek.com,
	macpaul.lin@mediatek.com,
	lee@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 4/6] arm64: dts: mediatek: mt6331: Fix VCAM IO regulator name
Date: Tue, 13 Jan 2026 11:59:58 +0100
Message-ID: <20260113110000.36953-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
References: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030012_034865_1E636698 
X-CRM114-Status: GOOD (  10.42  )
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

The ldo-vcamio regulator is named "vcam_io", however, the binding
only allows "vcamio" as name: change it to the latter to resolve
a dtbs_check warning.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6331.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6331.dtsi b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
index 243afbffa21f..7e7b96e8ca6f 100644
--- a/arch/arm64/boot/dts/mediatek/mt6331.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
@@ -217,7 +217,7 @@ mt6331_vusb10_reg: ldo-vusb10 {
 			};
 
 			mt6331_vcamio_reg: ldo-vcamio {
-				regulator-name = "vcam_io";
+				regulator-name = "vcamio";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <0>;
-- 
2.52.0


