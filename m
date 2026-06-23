Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF753CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0w2h0/PgYum/lowTycp/ZZLn25ByCiJR7keu7H9SE8=; b=1Ys9djqg7uAWUDjGKPtRBwq4su
	GaRa0bCHYkmBXTzVyx0uf0wvOhCeKV1bVSL8EV2HtrPDAd3rh1HbsCJnwnFL1G9oS8xkziFQ8czKu
	AduYmW+FwmnXh7pqGPUesrfzyC8Jl002TJyplfK3WQsWkry5duiJnIvj+wHLKpTOc8r3qtqcwjL4z
	HTvDklZpe2k9PntiXGqn0fdhX7zWSy1jpRz4KXgJFIdqpyhTbIh3fqq9N4H+cNDcDxJKTfpMkd8LG
	82vgB+KNkl1PdRlxseXxojHAm/m8nuDOcXW1geOP8f+9Sw8mKSJE3ulhhxaYZYJl0wuRLLjS+4sy0
	v8acmKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpQn-00000005VOR-1Lmj;
	Tue, 23 Jun 2026 00:56:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpQm-00000005VN6-18G3;
	Tue, 23 Jun 2026 00:56:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A030044573;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5594CC2BCC6;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782176159;
	bh=tSD4Hs9DYH93R7Jc7jJ+IQP4zIOSPVpLhWi8rQ50D1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HFioLk8D7PA8/Kysn9k22FcaW248vM1xTkLYUCVBCwkTHdrJSvajd4Y7j2y2wKaek
	 yrNYrVYMxLWZNxtsxqaLRCDtSs95ngQg0qFNZt8MGeBBEXSxis1/xwFStyYW2BHtpZ
	 G1NX8YupCGr4lUShzvcYrkAqKMyLpzK6RgnpoZ2kGla7VhYcaGZFpwalqTnznzzfkv
	 il4CofJ/sg93dSqAf8DkCHGLCY/V8ahcx4hajJiZaHjx8x3nDBc0QPg3/hANK2Qtq3
	 yVTUeILOihNUuOflR3QlmpRYvIW6uwgyENKGLp6UVitTEnXYAjwd+j9+mFp1rGMw8/
	 vhpIjt8lFye/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5A0CDB46F;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 22 Jun 2026 20:54:23 -0400
Subject: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
In-Reply-To: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782176157; l=1165;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=dNSyXBWa/SgBuC5DS1nmxn6H5I1XRJm1ND+MaumtrOk=;
 b=avtwaAbKkhC1ZKRPC4unCsIH6vaYQdfvyHdr7AZ1P76eX9EYXvS4vVtnRyygd5YnU/IQK2R6A
 18IC4f1DJpjDjXdv/zjRB0X20ihVKePGF9OoA8C5yFC8rkKs2ZmtGa2
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
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
Reply-To: esteuwu@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Esteban Urrutia <esteuwu@proton.me>

These nodes are not present on downstream device trees and only take
memory away from the AP.
No crashes occur without these nodes, so remove them.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 56cb6e959e4e..e34e3c05bf74 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -752,11 +752,6 @@ oem_vm_mem: memory@bb000000 {
 			no-map;
 		};
 
-		mte_mem: memory@c0000000 {
-			reg = <0x0 0xc0000000 0x0 0x20000000>;
-			no-map;
-		};
-
 		qheebsp_reserved_mem: memory@e0000000 {
 			reg = <0x0 0xe0000000 0x0 0x600000>;
 			no-map;
@@ -806,16 +801,6 @@ qtee_mem: memory@e9b00000 {
 			reg = <0x0 0xe9b00000 0x0 0x500000>;
 			no-map;
 		};
-
-		trusted_apps_mem: memory@ea000000 {
-			reg = <0x0 0xea000000 0x0 0x3900000>;
-			no-map;
-		};
-
-		trusted_apps_ext_mem: memory@ed900000 {
-			reg = <0x0 0xed900000 0x0 0x3b00000>;
-			no-map;
-		};
 	};
 
 	smp2p-adsp {

-- 
2.54.0



