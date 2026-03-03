Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59931EDA690
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9t+zIGrL1VCsRIMGwv2ZF1ipDttpPQVQDGgXphB//ek=; b=lip5rej2EMh/d50UaBr6qS84IB
	7EJTXUldx+4VDqqLuAcfwPKV9NV3IZhOq1wA4zabPcC6S9QtnAI+Nj3qWDFiasl4UBvP+nCyLjDDK
	bYXdwDnnh5YSHXRgz75PEPpzfEM7kGdU76cPPIfC6og3bLvpjNqj6XGp4WvAvtBZ+eE1Kem6bruGY
	DdSTekfMsReM0noqHEF3AiD0/oEmvdMdMNFvxv8a96y6oQ7cLWd7icURw3R7gQGYeZ3gsZ9xpwmQU
	KwYQ5gsTpxX0xkhXsLwGrC4E6qCYm6m09kDH2iL5TNcRkADeHyIHDvMtpbMGJ5Vu484jzN8PYVfvr
	CCKsExwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRxw-0000000FSMX-0UB5;
	Tue, 03 Mar 2026 15:47:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRxs-0000000FSJU-41fJ;
	Tue, 03 Mar 2026 15:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C9174452B;
	Tue,  3 Mar 2026 15:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3B9CC2BCAF;
	Tue,  3 Mar 2026 15:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772552835;
	bh=LLKQElExZghMy4kQ8esawKMBzcTfhLrpiQB2Ve3kd+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rQSQVj7HT/6abpwLlcS7u+hzgwwsKQQ3Oa56ei58g2IC8MPXpcDeSssGkIIufUJ/H
	 7vYOA3/AoqIm200UR++fkWRuutBjqYfTiJsETnQsYXUSn7sC16omKbZ6ws4OhnT3D8
	 kPgLFWUmOCh249MNvBkO78Q92Xehb6EFU0b4O07BggEKTANbh7tfau9kncoTiWTkdu
	 EeSjRitClF83K6Mj1sCMrYdVphljt/GzKNIuo1R16x5KbhTaxJW4n6PK/XlR2bHigo
	 IeXsgS6U1VQNVWRXDilA4sjPKU0pJWjUjNK/r63xUB+QjzRFZao/ODi8FRKRX5rriI
	 n4JUpAQLhrpww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8646EDA690;
	Tue,  3 Mar 2026 15:47:15 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 03 Mar 2026 16:47:16 +0100
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Define PCIe clock pinctrl for
 BPI-R2-Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-rk3568-bri-r2-pro-fix-pcie-v2-3-04665e55d5a8@ixit.cz>
References: <20260303-rk3568-bri-r2-pro-fix-pcie-v2-0-04665e55d5a8@ixit.cz>
In-Reply-To: <20260303-rk3568-bri-r2-pro-fix-pcie-v2-0-04665e55d5a8@ixit.cz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Martin Filla <freebsd@sysctl.cz>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YlHCb0F1jScc81vTO0QX1ebEtLSzHBVXADDaJRK3w/o=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppwKCO+kcSHyvVYUFDqdVlS/FKdg2A2uzn7r7i
 14m2Hb9WmOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaacCggAKCRBgAj/E00kg
 chSTD/0aqo0VrgY7y3pu2xg/5Hs9RLsyUQ9RMPw9nhqZxI+GaxgPgHw4Q4qmQCCxDun/wkv2zj9
 t6lZor6QRNaLMQ5UHuajfEsz1MH1Jg0wV1jXWdKuYn8KCd0542qPxl0cDDf9AzfafT9FsfafkCn
 VkL8Oz61MvzWpTbGcOLOJzFmEB3aCdxesPiKCMhAV0ueuckNtqWn/nA7rKnLPrqMpBpYspqbjSJ
 YeG5QIIj19+KIaOzhOjGgTh+tTXVpSesYCshI+c2ZaC8BRTmCQXwiZUodXIkd5dApKHPMeRLyIo
 fDTr+E7EUkXyMURwc+QaxIQYHJBhwATi3wRB58uok4wdnn77e+ZGfN63yv7BkSiQqdqnxcr8k/b
 Op1+1evuQWP+HK5AXtiAx98FQOp9OAeepOhHqS5u3g9UuT/gzuNmEzBCobDxybJMq/pOpj0DpzF
 errUiIHL8zg4bS+BEfkZvVMcjkYFZgmsNZl/y9646A1CjQ75sr4um8tSdWSaPHkkbq1Jao4JE2q
 Asi0jh/mJYzPaU2F77cy5Ahy1bWkuHKQVSMQu4O3ol5oCuy6H4KQ62OwKFDE+kCbnVWHxTuroEX
 fxwFpjhJ6YCDV1GF7wc72VBToyedtEFBweezk2XZ+RG88BUGJOQ60aEpWMdyO3q8MzXIzcdeOp5
 SjoHILyGCxzcoTw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_074717_054393_6A3D9983 
X-CRM114-Status: UNSURE (   9.57  )
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

Without configuring the PCIe clock enable pin as an output, it
remains floating in input state. Some operating systems that rely
on correct pin settings may fail to boot as a result.

Fixes: 86973ae0355b ("arm64: dts: rockchip: Add PCIe v3 nodes to BPI-R2-Pro")
Reported-by: Martin Filla <freebsd@sysctl.cz> # reported by private message
Tested-by: Martin Filla <freebsd@sysctl.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index a071cb67579c4..0616d9a065605 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -125,6 +125,8 @@ pcie_refclk: pcie-refclk-clock {
 		clocks = <&pcie_refclk_gen>;
 		#clock-cells = <0>;
 		enable-gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pcie_clkreq_h>;
+		pinctrl-names = "default";
 	};
 
 	vcc3v3_minipcie: regulator-vcc3v3-minipcie {
@@ -650,6 +652,10 @@ ir_receiver_pin: ir-receiver-pin {
 	};
 
 	pcie {
+		pcie_clkreq_h: pcie-clkreq-h {
+			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_output_high>;
+		};
+
 		minipcie_enable_h: minipcie-enable-h {
 			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none_drv_level_5>;
 		};

-- 
2.53.0



