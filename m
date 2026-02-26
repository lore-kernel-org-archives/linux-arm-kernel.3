Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E67FC592C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DgV+mvUm8IpJAe3V6psRYsqd1U0j6hMyB1pSTvra9qo=; b=gF3Qff65aeD+HD65ga5hY0ugZr
	V9Rh8e4x7ZcMdDiRR2jVrrKc1qlRQKQtM3Bn4mCFiyiosIuf6gci3vpglwgmb+ZlvVPEWajJ8zHMa
	574LPnmOmY3u2QW2vrsvCSRg5tyf/+SY1EjIItqm7zBGJTVkvoRIYDYLCgmp6uIUKolmxuy+io+M6
	ixCoaOPIzcIJ5ym3z6pnXw/u7G1THi4pbrXpLn13mSSxFbRmRLZF3zTkieiwflhkJAoNtYdM2f0DE
	GVuvfeGF7+BbYLbNBZaOjCj5dWEZTXXiJG2+Hok+PIZoeh+XzdLeTPoFbw2mRC7BouOtDtfl5bTZO
	vKphXdcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYVf-00000005tcb-0U2Y;
	Thu, 26 Feb 2026 10:22:19 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYVc-00000005tMJ-2Qxh;
	Thu, 26 Feb 2026 10:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1772101267;
	bh=DgV+mvUm8IpJAe3V6psRYsqd1U0j6hMyB1pSTvra9qo=;
	h=From:To:Subject:Date:Message-Id;
	b=p2qigWXHVToOrq5yAWU+jXL34ZD65EnL2BCJW/55cIqspm8WvKStsWBIODNBnPZ68
	 NGQTbgxTysX0VW3bvGNBN86OWpVku9QMaCi5jUqt8V2ci3MmRGmPqRfuVqNGXNfygG
	 ub+ftJOlve56kJdQPPBeOHVaqWHPX0jvCduBYvWY=
X-QQ-mid: zesmtpsz3t1772101259tc37fa72a
X-QQ-Originating-IP: XUt32+iXhT/CTaIUR8BrzXoFV26VlyMPKSo76kiWS8o=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Feb 2026 18:20:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16148220032706749095
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
Subject: [PATCH] arm64: dts: rockchip: Fix sdmmc pwren pinctrl for rk3576-evb2
Date: Thu, 26 Feb 2026 18:20:52 +0800
Message-Id: <20260226102052.63-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MxdW4jxL6NvXtbscdy2cNxr11uxIvhz3KVTIttkwLxU6wTFpLvIv6Xyj
	W6wBSW5kwjjJ01piLqQ9N0MMVyKo3PN+Rz+jwjFfDCyjNg+EABTLRE3AnKLguCeFkwTVtWO
	O8yxKE5Uu3nEoMdJSPgX5+7X0iy8ZlpKdyA6W8fNb26lLHEtR4NvqZfBqPzeEquRCRjtW6X
	ga7QjruX1S7/60jTVf4ruJxAtA+v4WSERt79tW11rB54+qji2Q3GpL/oukJt79Rq6CEZL3m
	UiipNEY87ejrGpnmVyO3qTZRp8r+4RxCHMFs6Q7FmCksmowgZch3pGc4c6XBeKNUZirk6RP
	h2xqcdlSQjhxxQ4RtrHaCG1Wj+cPeMjtPqyDmgX4HhCGG+Cuja77wrd6RkRuEiRDogX6lpb
	62YP41CU4QQAR87knathLMnbR1v9SS15RfIZnfSXHSSPyq+vWs0YPhU9u3JcVQLRsPUn76Q
	siaF8pk89flJoIuZFDURLSHalHt+wC7QMpbDp54USPbR9ZhPtA+8jSAxQHmFVC09K3M0pYQ
	a4lMoBWdd+zPu082NglpM3HpU5+B2vqeTDSZp7eZGNNyTZQo3T9CEWkzqrx6A7FGs9JoRTe
	Ynn+zGA9v1HTHkn1mgOIEYTE9WiLNJy8JWsvJEZWMYKvI6b6mozeNO5IpDfy2/Mcag6rYiv
	ziSxq07WDSfNz0Xaxk3piGBCb/CqKyI8E/tKWlkFOboGf3TCUJrVvIOlW46Ew7QnZLQYJp9
	BcdJjkPvrnimfwu5v/wgVoT6wPdPUaFUpw6+7lJly7BRj6y8FPDVhnDkxR7HB8px0ackaxO
	K6qZNa6tVqd0vbACYZOIxxMqzt1O7yZEmSfzRB1LloUKFAjFdualZxsX/uh1zsMROaherTH
	7AOsDfgnqCjmG7ZvvQiu2hD4Z/rN4bax9SCgUdVxD2TH15cIaCQJ985rRymMwxwQFPLWBGs
	zguzUujTdVIjxwOwsrlvd6ipnIiGkiy8it8delPd9lwOoZUaDPH2QaEW4xy8v+Lvro4+VGV
	VyL8H8QQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_022217_025455_79FD82DC 
X-CRM114-Status: UNSURE (   9.72  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

In rk3576.dtsi, sdmmc0_pwren is configured as part of the sdmmc pinctrl.
However, on the rk3576 evb2 board, sdmmc0_pwren is used as the regulator
for vmmc-supply. Therefore, we need to reassign the sdmmc pinctrl and
remove sdmmc0_pwren to avoid conflicts.

Cc: Shawn Lin <shawn.lin@rock-chips.com>
Fixes: 86a82f7a7eed ("arm64: dts: rockchip: Add rk3576 evb2 board")
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
index 6bdc232ab267..98d5d00d63b5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
@@ -951,6 +951,8 @@ &sdmmc {
 	disable-wp;
 	no-sdio;
 	no-mmc;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_det &sdmmc0_bus4>;
 	sd-uhs-sdr104;
 	vmmc-supply = <&vcc3v3_sd>;
 	vqmmc-supply = <&vccio_sd_s0>;
-- 
2.51.1


