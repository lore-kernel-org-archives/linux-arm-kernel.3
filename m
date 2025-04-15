Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581D1C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 02:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfX42KND3wfiGI3s2GAcV+EA16mjxq8jQcoFzN87uls=; b=dsTx+3jbfiPe4eKEspBP2yvxqM
	0/EfAUjd2snCvQ3ryJaVMPHE0eUHiVlvdm6F8kObYqPqV1/NpYs8X6It54C7T2DUFG8HaDhmDbIIZ
	+YEZP9r5J1O/E4Sd6V95KnCfOHlUufcj26W3gVodWLJMoZQqMAu4NFqMzv6yqAio/3nbw71kQgipj
	9N5aq/settU1cRt/4TXjw6e5BrGHgnQ926CULa2TqEdcKCY0ylQJ624hbkHbI2bmrMEvhT7N7o6KE
	zkPtUXdroUhWeefkhy/Gf9dw+zwsggRjH1E7R1qVIueube3YQ8t2SmvgRisDujf9k215zu+bkRpl9
	oEokAaaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WQQ-00000004FRc-3jV0;
	Tue, 15 Apr 2025 02:53:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WJD-00000004DRb-1mA8;
	Tue, 15 Apr 2025 02:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 759214A5C8;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3364BC4CEFD;
	Tue, 15 Apr 2025 02:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685158;
	bh=eNT2DnaFtau75otXvoSolGN5m1XSsI2mM3CYJJA0yaE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=caNP6SHesjBv9W8pk7XtNpw0ohOioGZ+mdNkqa4qtGPF9db3jjJKrm49BQU7qjqDS
	 cvkBrQS9NcBf45axdnFHKcLBL83dx8qJuG+3NzLsWbB5aSym7JsCyOfnDv7voSNbP3
	 YU6eZiqkJpwk11T3yfK+JpdI7T25GTWrwOWYWpMJiwQrMwCwDYimjyP1KQFbTtLlli
	 G/Dio0DVgBi4NREH6fwHR55G750UpRW6JWI4U/t7QhQ54KCY9E32BADfwQ3er3sMk2
	 ZPQbiwD+22rv/jjb3R2yrCM4PisAE57F3pGFq2VF3KK5oNdSfF5UEJ4gu8RtD7tDYo
	 syuxRO6PsFdCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25514C369BC;
	Tue, 15 Apr 2025 02:45:58 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 15 Apr 2025 10:45:30 +0800
Subject: [PATCH v3 7/7] arm64: dts: amlogic: S4: Add clk-measure controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-clk-measure-v3-7-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
In-Reply-To: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744685155; l=824;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=A6JIk28+NZPU2Eh+mMPRGxQPj1l3aQ0UYp+1TpAudD4=;
 b=X1Y5uuDxGW5jE7qTJI6N3V35nAflYKrcp+V2LQetx3I7xN7FJz/iQVMpKRESAiGNPuMPSeQhJ
 YEBjd2Ixq4YCik4Xi8I0Xk8zBt94QEqzZ7a6GdEQDu993zCLwiOYDS5
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_194559_503109_CA50305D 
X-CRM114-Status: UNSURE (   7.68  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for S4 SoC family.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 957577d986c0..9d99ed2994df 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -629,6 +629,11 @@ internal_ephy: ethernet-phy@8 {
 				};
 			};
 
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s4-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			spicc0: spi@50000 {
 				compatible = "amlogic,meson-g12a-spicc";
 				reg = <0x0 0x50000 0x0 0x44>;

-- 
2.42.0



