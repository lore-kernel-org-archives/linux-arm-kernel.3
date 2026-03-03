Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163CDEDEBEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 19:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AE8RG/FIdiaYMWWTcs1iYRcEAnWUFJxCWdneSa1fF9A=; b=vwBt7sDGfeVGyGc0RBsHpwfjLr
	5UNXfDh436sX+H6IdHN3Uxi5oeCk6Uz/PIIbkNV7fJ4ZTlvSuJf85MbGuP0SP5HLUry31s1roF5uC
	YrRRYNVihuVFt+m+mHFfMEauZE59TE+O5J9Fh8RzCTdweh5/MVW+9H/VF5BpQmgpYWRFM0jud9Hlx
	AG+sv52VVFHtJ0Dp4sBDmFVgBLBzTFVipcn/JuJMYBtFwLk94CCsU6gJKwT3GADnQa3KeMkBFfe0o
	TdSChoOh1+N5F8JOQuH0p+XHxAgUPOtUXyab8rfMknKmjUSRmsYUoHgYE2iijPG/zwhT3bH9ExYWH
	s4u11ILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVnF-0000000FqcO-1eHO;
	Tue, 03 Mar 2026 19:52:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVnD-0000000Fqao-16V7;
	Tue, 03 Mar 2026 19:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE668444EB;
	Tue,  3 Mar 2026 19:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1A5FC2BCAF;
	Tue,  3 Mar 2026 19:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772567550;
	bh=NuR9llP7GHy9Y9058elFyhLur654m0mtWCISGmMQp1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vp9MUiddG4WBWMVkJ7hX9X1IFx9xj7Se/BABMjnnad1MZoeGZH2SxD2/uZiUtZ4V7
	 aNs1O41EdxE4dMbn1UWavUqfkkvUv0ZEZU3Hiobz+9/k+E4l5QZzoKuU99H7gwWd/T
	 4Wf6LXv7RiZQojDeWMDChFtEb9twSnFuL6UV1Nl0l2hmlTdlloMzll7fLdEnjg0DNg
	 SWn8RYh+WGV17ZPcQjGZuLO+6GEqvhmIhhwYtygtSqcwiTxNBvBq32qADZX0hNKksz
	 HJl80AH150Aj7fsQb1y6qADN4cu4BrMq/eYO8IBqLBT5r5C1kE9wJjpShLA2Oa/u/j
	 /n44Uim7sescA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6782EDEBE5;
	Tue,  3 Mar 2026 19:52:30 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 03 Mar 2026 20:52:30 +0100
Subject: [PATCH v3 4/4] arm64: dts: rockchip: Define PCIe clock pinctrl for
 BPI-R2-Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-rk3568-bri-r2-pro-fix-pcie-v3-4-af5a5207b0a1@ixit.cz>
References: <20260303-rk3568-bri-r2-pro-fix-pcie-v3-0-af5a5207b0a1@ixit.cz>
In-Reply-To: <20260303-rk3568-bri-r2-pro-fix-pcie-v3-0-af5a5207b0a1@ixit.cz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Frank Wunderlich <frank-w@public-files.de>
Cc: Martin Filla <freebsd@sysctl.cz>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=phK8+ZRwh/J/YxkbsoLpGT+s0IxKqlf1J/b5vaUdLh0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppzv89u4mY2XaGjePhEcixdqoOdxzszV8SB3R0
 FfjESfkvsKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaac7/AAKCRBgAj/E00kg
 coMXEACr5SqodWnv0uSX0UNjzeDCfbfs618RVV3qPpmjTPFdWVY04Hf7dpBI8Ppe5G+OBshoplz
 lkG9U96qRUaz+oBdp3K6fD6+qIXteppjcOriPweKextma05UdkQt0HDLrQ2xgStuAXrpAh03Akf
 C1ATF6a9StzQU9WvoDnypBPnRD1Vziv17ZbEasNMzld4n7Sn5WDmcgTYtvSEJK3GKdO2uXdkbnG
 mqeVfhP9g36uJu//KJUWvBo1VhKiB7T69pV/2m9/lfpEfpSp6iPfmHU8gAcMRoIZOMryNKwZII3
 Lag4iSA0TFe5yNIIOU3bCMppDGSwTYSpmYrSVZVsh+XIw/E8o6R/KvTlq0xbC/ujNotYdpWmslM
 0oXxDOkkbJcw6NbyANWpJ+Rj76QnpXhVTYDrLdKg1CXh4x/Zx+bQKw7u4hw6OfoLAHWgayY1AN4
 Bw1Ef3LrdKwSziAr1rNfgJcLIg8TcMcqOaCHyn8/9Omhk1yu3WuCCgbw8HT7UrrP2LNvhq7H2OW
 K1vDpVO7Tm54yNXpB0kN8Jfb500Bv3pyixxK4r6cBKTgiR2x1CRYrP1g1RjJDyVu4nVpMPhkaP6
 1Fd1AAqpyusWuhbrCrsbtxYQn3jyQ5cB7nX9uiP1v4tHwKUYOxOV4+q0+ux1HRsWqHn3TIxXpAl
 iTMqCSASa/ixdYw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_115231_353260_9670A3CF 
X-CRM114-Status: UNSURE (   9.47  )
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
index 3cdea9456a28c..95cf4a6236048 100644
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
@@ -652,6 +654,10 @@ ir_receiver_pin: ir-receiver-pin {
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



