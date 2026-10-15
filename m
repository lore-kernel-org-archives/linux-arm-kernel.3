Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B1DCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 02:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHAMUEDGItR7vD8mHcnvtF5InhaMhwN9oMDqx6Yu23Q=; b=K7FKtyNoHDMwKEEzH/tE1ZxM6Q
	vlVdVWE8Wugh1EAzNlBUbzs7zF3cfnpRcLlI3oIHTHEtYwIV5Z2wnYkfr+fzDXQHGJdcETM7KtmQr
	stN2zXzSO563vvxAIrJMD1vYp308JV0FdgbDMpcaSaWuHZWDaOTSSL/zByzYyY3aHJNcfr8XBl0qU
	NXuqOFmSVK4KgSzu+a0m6UZjbKExSJrGHb7AfxSuENl/IM7iYjZ+BCF90Jn9n23G2yVmvknKv0T8W
	l3j1c/0OAyxb0qsAW6UUovf5AmuoDVigHlpMxsqy0BLIJx+bCzyGfTBs5JMr0GvpL0nidd8H6hnCx
	6St/M4dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBHn-0000000Gg3Q-2ab7;
	Thu, 15 Oct 2026 02:33:40 +0000
Received: from mail-m93192.xmail.ntesmail.com ([103.126.93.192])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBHj-0000000Gg2H-15o6;
	Thu, 15 Oct 2026 02:33:36 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 511930650;
	Thu, 15 Oct 2026 10:33:31 +0800 (GMT+08:00)
Message-ID: <b7cf5fc5-e833-4406-a136-21836e79301d@rock-chips.com>
Date: Thu, 15 Oct 2026 10:33:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Diederik de Haas <diederik@cknow-tech.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 8/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2
 power pin
To: joachim.eastwood@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
 <20261014-nanopi-m6-improvements-v1-8-e713f71eb4d3@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-8-e713f71eb4d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13d685b2d03a4kunm431f7c103a2f98
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUxDVh4dTUoaGkNKGEkZQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SaqgKGYDVN50o1hg8KF/ko+9spE20AMp7Rt6WxJh96wvnb1LYTm1SaPdxrvqDrKG4q9OjFQUR1NulSUdv2BOnVI/DMhiY37Df/DKhp8lMCbMn8MVNVw+XcEXAuHnaMeHxDAnIivE7eabEAbf7XNRSf8TG6eobEKSAhHrC0Wrys8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nHAMUEDGItR7vD8mHcnvtF5InhaMhwN9oMDqx6Yu23Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_193335_509263_0DAC91F2 
X-CRM114-Status: GOOD (  11.49  )
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

在 2026/10/15 星期四 0:33, Joachim Eastwood via B4 Relay 写道:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> pcie20x1_2_con_pwren matches the signal name in the schematics, which
> simplifies cross-referencing.
> 

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>

> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
> index 6205a542cd1a..ca115d8e108a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
> @@ -41,7 +41,7 @@ vcc_3v3_pcie: regulator-vcc-3v3-pcie {
>   		enable-active-high;
>   		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
> -		pinctrl-0 = <&pcie2_2_pwren>;
> +		pinctrl-0 = <&pcie20x1_2_con_pwren>;
>   		regulator-name = "vcc_3v3_pcie";
>   		regulator-min-microvolt = <3300000>;
>   		regulator-max-microvolt = <3300000>;
> @@ -116,7 +116,7 @@ hp_det: hp-det {
>   	};
>   
>   	pcie {
> -		pcie2_2_pwren: pcie2-2-pwren {
> +		pcie20x1_2_con_pwren: pcie20x1-2-con-pwren {
>   			rockchip,pins = <3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
>   		};
>   	};
> 


