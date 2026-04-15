Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8133FA0C38
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34e8JFUv4ZKhgYCB5RRCzKxh8Gp/hrO09zwSk+uxlwM=; b=Kr5RzQW4NbvJrVC7N6aJJc7vv5
	v9APqJyHOy9ZQjCC074Q/DKI3gD51+INqzH3w4eiEl3G1o1ZWT8L3wn8U2wjaMbja9ZtpJJyXxabK
	EX9qRWSGV1lJ3MpHOAem4mFr1njGx6lqXWCTLEMGAOWK3sUGd7fIl5AVWxgMOPMDOBcbtbGfvJ1TH
	mZuhLHuuipcvZ/tt/txaNsCg8wylZZrLHy0OiBOxrcFLVMRR9qlmH9jtqYOdjOWGsm/thym2zOAjv
	+pJuus4tSrKE/lg/o51gEl0phBWIJhlQ+aWzcq55zHikf5cN2ZUrm5Vgi0Fc2cfCkVV41DmYEJQM/
	S4R8poWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvhS-00000000p6S-3eYu;
	Wed, 15 Apr 2026 08:34:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvhN-00000000p2q-2cGV;
	Wed, 15 Apr 2026 08:34:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17F19444A7;
	Wed, 15 Apr 2026 08:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9D6DC2BCB7;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776242052;
	bh=FfXjRFmg7qIWDzIcMzkkgcBil928LcG9XVE51++/LHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TqqobZoQWkl5dARinKIGTjyWtV9xL9giB7g8TENIQvAJ6UH/4yj0HGvQ5hPnEIEZc
	 3JaGasO2EFf2ag9UlV9TI3w0FaRTfjIG5DPuZb6Wv2UGdoSng3xFS6RD2oWRc7+iqy
	 Oid+M4E/5iVijnXFZbkTsO3yhbJzYM31b4aSlJbqoD7X90EuxpodnoynpH7oBnb9lN
	 e6bPTR6alrRZkn7N1huiHWpLNWO4Cum+Uf5U9LRLC1bxYD/niDMqh22NP99x89oaox
	 aV9BazmTV0wzXsihbcWIDCdxcYEani3yg2oK/5mRk4cWaarWyzpHqBJn8xGeUIMgSq
	 tjCGKpvnH5kHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE290FA0C4B;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Wed, 15 Apr 2026 16:33:43 +0800
Subject: [PATCH v2 3/4] arm64: dts: meson: a1: Add clk measure support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-clkmsr_a1_t7-v2-3-02b6314427e6@amlogic.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
In-Reply-To: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776242050; l=739;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=dY5flplQX4DkVTZxyXyrnyiX8aeclNtTfDgXIhbj2+E=;
 b=kZKAk3CaLVxGsvBI6801SS/Zq8bVLAttiPeNXu9Dp0er+VPBcZ6OoefdFluiAN81gL5xM3ydS
 YIdNIdZMhRiBSh4ytmBC17LHkGoqg2iNjMV47w9JAlTor7dgh7MN29j
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_013413_700247_44460906 
X-CRM114-Status: UNSURE (   8.60  )
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jian Hu <jian.hu@amlogic.com>

Add the clock measure device to the A1 SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 348411411f3d..6f6a6145cba1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -576,6 +576,11 @@ saradc: adc@2c00 {
 				status = "disabled";
 			};
 
+			clock-measurer@3400 {
+				compatible = "amlogic,a1-clk-measure";
+				reg = <0x0 0x3400 0x0 0x1c>;
+			};
+
 			i2c1: i2c@5c00 {
 				compatible = "amlogic,meson-axg-i2c";
 				status = "disabled";

-- 
2.47.1



