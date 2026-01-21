Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504D3D262BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 03:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vF9xBEexMFrVhcYjmid4zoQnxl0AqiI6XxlKJK5Uvco=; b=CZqZxnCfrouz0at/pHWVQoc5OJ
	e6+sJmWLsKhkt7JLabncdthcN4ATaMqYM9uO9b+x2uRGRNueYsbe3tvLNlIbsfVIKZjnbFtm3DaFW
	9I8oaYqTU3OM/VF+F/tl0xdEBW5LI4EkeCZ24cnBC2ydn1A3k8yE2B+RGGLb4LQagMFY9x0aojugO
	8y3VmIl1a85te3ZYQg7NzmaNZJqF4eEjst4hEyRQzSMpE9K9Ckji0uzgqVeEb73GQXWfLNsQbxAry
	hSLAy0gdjrc6OT1Sd57NazKCN6LN5sae7sVibJvcbqZrog9qm1NhjY7cxVx/6mAoJymr100jIwlDE
	uuQAnJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viOia-00000004p38-3Pbf;
	Wed, 21 Jan 2026 03:17:16 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viOiX-00000004p05-3xeL;
	Wed, 21 Jan 2026 03:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768965370;
	bh=vF9xBEexMFrVhcYjmid4zoQnxl0AqiI6XxlKJK5Uvco=;
	h=From:To:Subject:Date:Message-Id;
	b=JVZH5szwiK0hINuTWpZn6L+lYgCXG/R5gzoguy1Vam8Il6nNhDnXJTE4WxyGKP+IX
	 mfqXLV8/AmlnKFyzjKsyihMGppH0Gjj/B86eHjeErROXKK9o4WjRXHgTLDkSfu1BGL
	 viOC2LR7cQ2LZR1CSsjbz3gLiB1V305LEq0leWVw=
X-QQ-mid: esmtpgz12t1768965368t8de48cbe
X-QQ-Originating-IP: 9ln4DdrihkMVwVkbbbpi6NuAAqxwyC1I6z53O7jLqt0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 Jan 2026 11:16:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6010837920077048805
EX-QQ-RecipientCnt: 17
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Stephen Chen <stephen@radxa.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: rockchip: Change gmac phy-mode to rgmii-id for rk3576 evb1
Date: Wed, 21 Jan 2026 11:15:46 +0800
Message-Id: <20260121031548.402-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260121031548.402-1-kernel@airkyi.com>
References: <20260121031548.402-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NjuDfT6zrIZcVGIJ41oghtR0sscROnA8nqM5dSFjo565oO6U5LshTOgN
	/98Qdy7b+PnI3xCjT6YbV/B/CaLiDFhY0UInuSmzUohEQd2B4jBbMOtJEA5TCPp+nYF2yyW
	bZ1YQ3EoEJzQ/nVIgd8IodJAKWry3V1WI/ckNzxAmXqxONcVOCrjxKyLYFj3bSm0ztR7bwF
	kGpW3Fyc1LrFVROH0oMPGWjtZMONEX6FXGuzWUQhS8c0kfpIaLY/Bcj7sZkVH3HvxSCTcN7
	xZueCBfsCy/BZndF1YAjNCkgA4TWjMbB9IWV/blwoNagNt10HwP33XvbhNI5dWTsMvEETza
	WF4t1Un4SsQ1PohhSI8Roa3YXt7zmO3TbJgmhDUAjABk9ErziIjCkPk2pLRaLBFYtljsUHL
	FIBYKY6KvSZuoMZCrvaT3f6IPXRKnZcbC6DzECtOnWUVflNw29G+n8U8n/E0DRK3af0EZHn
	QnfaOrcIaQlHtRacUt7PAknH2Ep+157c0l9MAPXSpuEOODiauxR+R2hjmZPLtDJ7zNYEQwF
	48xvqOwtTSDS+iK7QY/pVuw2O2i4Rv9tHEnQgjTT8fnMSWqgYlYpLwsuAjWLRVLBXI/r08X
	8YmRCLVWHgi1l6kmYbiTqlbQ8LAEhpAiVYO5u5SUMPF0Zsw9iuxYlkZf3Tfn0D2dq59bmNf
	i6Lm0u3r+NpXY50fkD1aWlmvHtvVpp076tkwEpFFbmEEuZLGMaTcxCdmOyMwdiBVL3/SM9n
	Y+nrI3/EuDlna3YlqIICcgXhcT/KHm098e9fqbGsSK0WlnUz/lBfYH5ugA9jukMZXi4qS5O
	CdtfXekXZMIzNSaF1ytGU5iYdPcj6czM+hP4G7amYkwoESlJ/mjv/CPMBPUof/BXLSmuH0Y
	eCldkKmuXRCzWwOdyPxtg80/6F18yv8YQ5iW9VPk8+p7IYiscqSIx45T79wB85ghq0LbA8h
	T+3Q/GiZoOtTi3yEXz5rB2LR5cnshmo09kIzTwSbIzzeMShirfZwLciZVN2OJnJR1+orvZG
	hJCXKUoD739E/GgUTDxm6G8mUU9DI=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_191715_054921_A020252F 
X-CRM114-Status: GOOD (  13.30  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

According to the description in the net documentation, PHY modes
"rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock signal
to be delayed on the PCB.

The Rockchip platform has long used the above mentioned PHY modes and
private delay prop to describe the internal IO delay settings of the
chip, which is inconsistent with what is described in the documentation.

Let's describe this part of the delay in the PHY and use the more
reasonable "rgmii-id" mode.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index c5584c26db52..3ee76bafafb5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -266,7 +266,7 @@ &combphy1_psu {
 
 &gmac0 {
 	clock_in_out = "output";
-	phy-mode = "rgmii-rxid";
+	phy-mode = "rgmii-id";
 	phy-handle = <&rgmii_phy0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&eth0m0_miim
@@ -275,14 +275,13 @@ &eth0m0_rx_bus2
 		     &eth0m0_rgmii_clk
 		     &eth0m0_rgmii_bus
 		     &ethm0_clk0_25m_out>;
-	tx_delay = <0x21>;
 	status = "okay";
 };
 
 &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
-	phy-mode = "rgmii-rxid";
+	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
 	pinctrl-0 = <&eth1m0_miim
 		     &eth1m0_tx_bus2
@@ -290,7 +289,6 @@ &eth1m0_rx_bus2
 		     &eth1m0_rgmii_clk
 		     &eth1m0_rgmii_bus
 		     &ethm0_clk1_25m_out>;
-	tx_delay = <0x20>;
 	status = "okay";
 };
 
@@ -721,6 +719,7 @@ rgmii_phy0: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
 		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
+		tx-internal-delay-ps = <1950>;
 	};
 };
 
@@ -737,6 +736,7 @@ rgmii_phy1: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
 		reset-gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
+		tx-internal-delay-ps = <1950>;
 	};
 };
 
-- 
2.51.1


