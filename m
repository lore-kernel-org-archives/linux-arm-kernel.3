Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8A8EFB810
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xMQ+DHjakSDtXac64/7KfFCwZ1L4pq/RTh2zM7Fd/uA=; b=PrI05XNILh+KkX5unvKW7LpzAO
	wk/IwSbb7Uh0Q0wkCAHz7bhEb1L0b7Vad89K9I1e5V2iK4UZ99DRqGZu0GK6qxIMMvS7/hflR1F/Q
	8D0iaxLT2tGA5Jrwd1V7q/wylMey2Ry1iYzFJkQwCjXdKaJVto5nO1j+UYL8tscBPOmgnQwSzR7kI
	fQYATmN6s/DJjK0wUuL+lNjy4uLBBcl5PmU/W28VSWyLD1DgDc/pjfu1/gg+oSwwa4QC6H+dqny05
	lcTqFwXnol7Eqens/ptFfGpowDY4eaKtJV79z9fYStBgJPwtjI5FVvcRoj7oq1rcIAD05u5H/Taa4
	v0Vt9UqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunxZ-00000001epF-2DvE;
	Tue, 24 Feb 2026 08:40:01 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunxW-00000001ens-4Bhq;
	Tue, 24 Feb 2026 08:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1771922326;
	bh=xMQ+DHjakSDtXac64/7KfFCwZ1L4pq/RTh2zM7Fd/uA=;
	h=From:To:Subject:Date:Message-Id;
	b=MYZfTPRGkProJpwObrXrpdzS7Hz30VbQ/M5wB+ja5Rp54Wp9IBSw65A/oEWfBMB0j
	 WFfCiRBkPhxTCKDReHyaPMEFrsdrTXglTkBs1ZaCEitSdaglucYAi0gRxLiD73WkAo
	 8YQysRVJX5vR8mwPZOjznNrP7Ci3DMfMpPbYHU90=
X-QQ-mid: zesmtpsz3t1771922318t09647f08
X-QQ-Originating-IP: nD0/7aqmIlm4w8EtxVu9RwDBosldNey/sa8Ya3axcG0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Feb 2026 16:38:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12253562334839428720
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Enable displayport for rk3576 evb2
Date: Tue, 24 Feb 2026 16:38:18 +0800
Message-Id: <20260224083818.109-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N+/GyfuFbcLiejvXDXiYPk2bixzvWO3kJCN+CvQLNaNY4v3FxRPPKbYE
	MxGCX91TVSMBRwNAhz28ekTtYVWXXY6B7a3j+N9zGnBAym8RDhB3A+b8+2IDgrOOS3SZeMX
	x8Ak8jn2PIIWVysK4dbdl8PDG313lUQc/llzPmgEVlb5lyA5t+pKxpj5aq2rud7eob8+JqN
	asjzb+hf2hBKyVgOkvuoKTiYgxLFKUdT6xzOD4alTszJxP9jBpWki3uV7vi2cj2PYgwAGwa
	PK21mOKEJ5fVG5zP68KUINw3hB1Gb5Rxo/8VsuLoB4dnT4sLWcHNRBx3lmyXHwFtVG/mGzy
	d/tcAJvzsjbpgqVh9q/ODK1Z4BQx/B3LiNKWbVjITCohLG9JZHSsd/PUBZsELBoHcOMpLYB
	wbnfYOATexe+abpNUa37786n0+B+MuOuDYhzgaj7d05PmCQu1KvgbqQB/o/rrNlQfgxbBr5
	YTwKmtN+OrOxjZS/gn7TmahBX+cbqlVwfe1TJo/ryukqUf+WGyeBamOL7JsxO4fG3eC0/FX
	sMPa/h3iWtALBKEsyTfvjG0kabh3NROyqVPaQJXfJlPoUqlRFSw3Wh4qcjW0Y4yd7fyltHn
	xZmHjt1Gl3FtKIBTWjU0E6hJLu4nEu/QPGjsRRUPQapG6wHkzZY3fG1nHndXuxvJKvRlZ4Q
	Dr1zRloGtPg0wsZT4lm8Gk36LuVB/gMY6jT99iVNZGHPqN2gHQmKzZ8JU/UzIH/5o5fzsTg
	zdM/f6RID0I+vH/KXnG5mUiXAlWsj038riEdRh+6AZ7P4vB7Xkvy9uFNY98/6Lj1towSudK
	9M+9TOlDemHQFmI0+ht0leY7WPYMzfhI0nF7YWb6uNjfzPrST7SCo4rY8X+1ZiCmrduaYhw
	GUhRY+HUy+LwlxTLcLwgibHkl+lNEVYMfTdEMo61x6PL0VRDe83OUXMuOVuT3hEICG9LXdF
	OAohq0PNBt9UtnNjXvVWxMh7OAtOaywsuiUnqn5jeqrjxke7fDHFHns/f2n9G3wIzyQ0=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_003959_445947_75692166 
X-CRM114-Status: GOOD (  10.82  )
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

The rk3576 evb2 has a full size displayport connector. Enable it.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../boot/dts/rockchip/rk3576-evb2-v10.dts     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
index 028fb0a830b2..6bdc232ab267 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
@@ -27,6 +27,19 @@ chosen {
 		stdout-path = "serial0:1500000n8";
 	};
 
+	dp-con {
+		compatible = "dp-connector";
+		dp-pwr-supply = <&vcc3v3_dp_port>;
+		label = "DP OUT";
+		type = "full-size";
+
+		port {
+			dp0_con_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+	};
+
 	hdmi-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -312,6 +325,24 @@ &combphy1_psu {
 	status = "okay";
 };
 
+&dp {
+	pinctrl-0 = <&dpm0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&dp0_con_in>;
+	};
+};
+
 &gmac0 {
 	clock_in_out = "output";
 	phy-mode = "rgmii-id";
@@ -1005,6 +1036,17 @@ hub_2_0: hub@1 {
 };
 
 &vop {
+	/*
+	 * If no dedicated PLL was specified, the GPLL would be automatically
+	 * assigned as the PLL source for dclk_vp1_src. As the frequency of GPLL
+	 * is 1188 MHz, we can only get typical clock frequencies such as
+	 * 74.25MHz, 148.5MHz, 297MHz, 594MHz.
+	 *
+	 * So here we set the parent clock of VP1 to VPLL so that we can get
+	 * any frequency.
+	 */
+	assigned-clocks = <&cru DCLK_VP1_SRC>;
+	assigned-clock-parents = <&cru PLL_VPLL>;
 	status = "okay";
 };
 
@@ -1018,3 +1060,10 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};
-- 
2.51.1


