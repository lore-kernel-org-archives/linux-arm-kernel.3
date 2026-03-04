Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241F7EB7EB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvuY6tCoONAs/t9LL/PNu3yXMbVho+VdPaNM8mraxH8=; b=ZzIdpdFpNurFW4NoYG+m+Pt8cb
	npNbc9TPp64E3HhN6bdyr/zrgQaHRhhzPWSdkfktUmkeF6CE9Z0HPVPrv3SRZbt71VezFzUKHqST1
	9M0YaduazgjIDsqJFDoWw82U84sZCT0Ln6QSJDqzUL19iUwM5+dyHGrAIJa/njLGiTzu0fUv4dBeK
	HOXqZ1vbr1uHF2eboqKczDGqHTOjwZO5dhNcPNwWbzADw+nA0CJWaU7A68VZYsinZa4oRxssYWqLK
	EN5N+4HydEt5nS1CDYxSZMW6TnW1ycgxkfz+dBDhhH27DLYpusclno4DosgkjNK5EmyXKoQoGmDZJ
	DVsPb44w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxk2p-0000000H2ff-0FDL;
	Wed, 04 Mar 2026 11:05:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxk2n-0000000H2eD-0MLv;
	Wed, 04 Mar 2026 11:05:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 890D44420C;
	Wed,  4 Mar 2026 11:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 659F1C2BCB0;
	Wed,  4 Mar 2026 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772622332;
	bh=9J9gL7YouFeYvBXgJJkDaXgAt8k2hc/h0yRIxOleEKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j+QeheTMgLHN+XpG4hkIJ8TpnjnKk9mM3CqtuHJOizSAHae5ol5Se4uz2t0EsPeKH
	 rKSTQkDOEaLMVxLFybj8BArm4bKdoyYYre/Bkta8DyqfDiW9MRHOZZBO/rHSEJE97K
	 zGJJIBIz82boYmKQnRVefAWx4Ejdh9UiyyCGdZBH0SUniq3RsnonyoyXJI72CSZObH
	 XIJxJ27LxnVPh65jkYuRO2gcjiE2oaGWkEjzl9sHGBHFQo1kvr9OFjJFkxcbDmERvQ
	 l/Z16IKZhZWWj1y2KTjMNM2ZCxS/waFsPlNmv+uW2VElfGcMxfnfDJ2H0x4s+Irze5
	 saX+2/3z5J2Uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5A7EB7ED0;
	Wed,  4 Mar 2026 11:05:32 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 04 Mar 2026 12:05:28 +0100
Subject: [PATCH v4 2/4] arm64: dts: rockchip: Introduce the reference PCIe
 clk generator for BPI-R2-Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-2-37abd7ba29d0@ixit.cz>
References: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-0-37abd7ba29d0@ixit.cz>
In-Reply-To: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-0-37abd7ba29d0@ixit.cz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Frank Wunderlich <frank-w@public-files.de>
Cc: Martin Filla <freebsd@sysctl.cz>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DLgTWxKRH1XYO2l0p6yOj+4it8sVM+ozZghYVlPNXHU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpqBH5gdm8kJ6PRji07y1AoVW4weyCqyiqcXhyz
 CrdW/QqddWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaagR+QAKCRBgAj/E00kg
 cnTIEACNOBUR/FhB3Qhvx1ArPFV1jEbJ5Mkhq+52FBSzE/5xAhZolPSB4qwnxofKAUBCiqTAcCO
 RwL4DZJkDuo24vdIRvou7pIS0+tdAJwEcUUg+sK6TZV6if26D3nrG/b++oPQ2TkYFFcSfXlerXd
 MvBPs2QnBe9vZRrOIS+VkXyz3Dca1G0UY3KingyIp0ZSaIO224a6gKXtNxfC1VbD6Th1k6LKgK+
 qEk757LAspf1PJpLpfnesR1/mZ0yiZt8LU593uPEHDv1YuKW64Imnm+OIDjBoPzFqd/8c16o7I1
 fpQFy/cUT3rO8LP0YVlgnRNQKqJDpbJLOD7jwVHS0iMptNgvddV1/xYmEUAIFnCITA5Ao1vM/bL
 F5Q0epZXr7bWvvTwWF9EYad1eaVtgRRU411xkjYgO965wIS62cM9rOdTEn5+FcI3mNHW3IwYmTs
 2TeoaIu9VNpBR04FlwrhR36AkGkaRnSRjkokJDFbASTKyatIKjnhdnINdzMIVpq7NN59d1JPxQy
 i5YHy+rM8M++0tsz/cqnSMm+o6ZcfHvCtjSo+8CzmBwyl4I9QukITdnBs6JCLiwc+LUd0dT+FN3
 8qSPGhpchHPRI2WThVWQzLDVE2wxD9bDMK2ClB3lO/8g4d818CorlmbgzWxNaw1STgNCnhsjIRW
 VLphnSOIxGjgO0w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_030533_173440_24359866 
X-CRM114-Status: UNSURE (   9.51  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

This clocks provides for both PCIe lanes. In following commit will be
utilized by PCIe clock.

Most likely PI6CG33602C or some variant of it.

Suggested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Martin Filla <freebsd@sysctl.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index 4d3ebe50b90ba..d02b82c5f979a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -114,6 +114,12 @@ pcie30_avdd1v8: regulator-pcie30-avdd1v8 {
 	};
 
 	/* pi6c pcie clock generator feeds both ports */
+	pcie_refclk_gen: pcie-refclk-gen-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	vcc3v3_pi6c_05: regulator-vcc3v3-pi6c-05 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3_pcie";

-- 
2.53.0



