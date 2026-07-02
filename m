Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F588C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 23:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpuKVe+lRKqwz8I4sCCCvGl1yuQhnT9Cj45Lwwhxfj8=; b=AwZeg/xjQ0lQltjh+oK8ZTN1Pt
	5khlLZcOaFDoI3D57SrxR7KbOwa5HnkWflzFJJlzI+jSqKqJMrxhIB2F/aTVQMMSAIVj07YbnOqyV
	FVmOrFhjma7SB9J4xnM6K/w7yYymmbrb1zIMjJy1cM0vESWwRnyN/McfHVNQ4PB02b3iar+ms6Iul
	AuCH//HK+3BZjdi/ED3TApivMsgFb0UikbNmFNdfiQ8l5/RdBxnJNOPqpJTrIDGsWy6Sfd1xYAUhS
	aMkvX5qSYjg+dUXrpli5VAWa+x/jrxmSz528cIJUMgYqq8LWr/mAWf+DxQSOhwDqu6OhY3IVyHAPB
	8lO+clBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPaD-00000005cUE-28Bv;
	Thu, 02 Jul 2026 22:08:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPa4-00000005cHq-3wO6;
	Thu, 02 Jul 2026 22:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C70543F3B;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F4ECC2BD04;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030104;
	bh=TKxN6qyOBwLKlwESXEsYSM7OBYEKgIX1X5/4DfGa//0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EqH3YksV7+TgS8d34n2LpYkEqt5Nu59qJO+FRfJo/LashQW0XALw+ZaLFUy1Baaon
	 qZ+GNT079JRuyLWv8SyexvG/CWcOwI3RRVOUPJ2k+IbFnWdLDzXrWdklVDwa5hwWyQ
	 m7gY5cT47cbuPb32CL90+ZU3icBBn9JmaooR0z+WCM4M+NKlraR9kq0BgGhEsBeHLG
	 cdDYcwi3CU9ZSynBgfQxH/23THPQtMITVJL0CEpKzlNRCESI/XQcv07AxnG3IEJqcy
	 Ohbqcw5eIvEx0sWm4RJu2RakMhHEcp3sNfdxs8M/jUhpSs/yesO0ucX/U2BlDMB0ik
	 BsP4dUyzlvTGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA2BC44501;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:21 +0200
Subject: [PATCH 06/12] arm64: dts: rockchip: rk3588s-nanopi: add missing
 pcie rst pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-6-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=1356;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=Qf2hXVsAwP7OhpMLxy0ZtYTeVQxe69crFritq8w97Ws=;
 b=ai/uqBJV0PYPqDHQ1Kv82hk1ayEHURj9pEPXB5kV8X6jVRRvVkrhRD2MmxpA1sSC7F8ufC325
 898POi1Vy+oDK2MowvPW/47s6QP4POLtyNYIi1gU9s8Mb5D766sYhFW
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The pins are used as reset-gpios but not reserved through pinctrl.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index f3a240b48a2a..361682c18e69 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -303,12 +303,16 @@ rgmii_phy1: ethernet-phy@1 {
 };
 
 &pcie2x1l1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_1_rst>;
 	reset-gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";
 };
 
 &pcie2x1l2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_2_rst>;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";
@@ -335,6 +339,16 @@ rtc_int: rtc-int {
 		};
 	};
 
+	pcie {
+		pcie2_1_rst: pcie2-1-rst {
+			rockchip,pins = <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie2_2_rst: pcie2-2-rst {
+			rockchip,pins = <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sdmmc {
 		sdmmc_det_pin: sdmmc-det-pin {
 			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.55.0



