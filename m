Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303E5D767FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bisvSGdJmTNxEy+BCeYD0G5k5UhzuOxMkuiAbXDRHLI=; b=YetrEqSI3sK+kxcu+A7SO9/jme
	0rHTRdzW+Q0ZKYSPrf98HN+xnD4eEFXgWx0kWmgt76XRvrlrSQvVuX94IK2oVdPu6QKRu6jollBm5
	aYXVdvQqWpGoAWnGspxwAdoa2udbPweX/J4gXB3ZrSz332YV3EHWo+Wfkkbt5OBXjyVgQege7SLts
	JdWmzO6LwfVmQkIDFpoJpaQzHfVnEBZ253sm2Z+3rMt57GTENLAVrWEe+zNpwz5du0xkspkoh5Dte
	g0cV4ez6aC24Cixj8vORZM34WSsmGR4+Jr5j+kGpPx+VyHxvPUuWxpjvJgmSnUo5wnHEAujvqE56U
	O1tF0ShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaBo-0000000AKnV-41YP;
	Fri, 19 Dec 2025 13:06:37 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaBh-0000000AKk5-39nw;
	Fri, 19 Dec 2025 13:06:31 +0000
X-QQ-mid: zesmtpip2t1766149539t952d8a5d
X-QQ-Originating-IP: jY9hh+hZRftMelyYq4qMI68uWxnYw+8R5DaNR3RP260=
Received: from [IPV6:240f:10b:7440:1:13e:d253: ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 Dec 2025 21:05:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9508836906846272605
Message-ID: <0758EFC1271A57A7+ededcd65-5064-479b-b4c0-1a2765d05a37@radxa.com>
Date: Fri, 19 Dec 2025 22:05:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: enable both 2.5GbE ports on Rock
 5T
To: =?UTF-8?Q?Martin_Holovsk=C3=BD_=28Probably_Nothing_s=2Er=2Eo=2E=29?=
 <mh@probably.group>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <96516D1F-9787-47FE-A67E-4745D11D9207@probably.group>
 <034BDB37-34FB-441F-B79E-1631CA501576@probably.group>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <034BDB37-34FB-441F-B79E-1631CA501576@probably.group>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NrJHW3hvBPkCeDB2sAP+7WW8XTBwRLnQuq2YtY5vgOoHuLwAr7x10aNL
	IFmRtakVQS6K8ZGKmJS+P3s370PjegiAMctkboy5uAxJR5HlQu2fKDIWBT2uIZQrh2BMUKD
	StF+2IWNISuYqWAZHANrW6esBKXcpPjH8vEhel8uriXOgt1bJB0kY8xBIHWNXgS2p5dPoYc
	IYyByqETQh5xbYPsqbDOkGnPhrqDP+bF+Hz8iAUREyFGsL7m3ORwVyUIbGcZuY+JormO9iC
	Ndmtu6uOqGidca6WNegVurExUmR7qHj+oy+Jf/a6apOyiVLo3IFi5WXbBjfrQLTgbIDofgS
	P2rcue1XNsybYFvlIChqd3vlW5o2DQrK4SvQzBtPJVFe3QzJYQA5nzAf2hqFZ3RlZQsnDa6
	XQ7dVbjlqNmEN4FmHkyfO2ru1sE/O959fxOkFOYgfYBKTLreXXgcMm3Sz+qTXDEJiCcDX+s
	PASlhVztfD3v/aQ+G4uQkwxF7pCDg3LpivoX31lC5QQGri2PbcV/czeFORvJwyuzByp9L/Z
	Nrj2P8kz6NFZNkM5VRugD2Dmm+ECFqRzckWQVTVW0Dp2da+1fqtvPit/zb63hGJJc7bAchX
	xJ3UPOpLtiQA6sNLsWLkNj751UNtMQP7uCDVJzlz5cy3/qbWEFjcTlTDqDIzzB/7Lve3GcG
	wcwQ/aDUMxdapX1AF6hEhkgAKNPx01BktvN2iqJDVhsu7S5L98OjN4jKmUKY437fWXrA7iy
	qy96Co/QywX4mRAWn5Ee0ETZIfc+ul+xb7vlxjRvChxhQGOxbFNqGc0wGeQbZ/MT6fSi8RD
	7+M11pNWu2+NyM+cMKIW0zGwJLjBTlgUK9if7lDXvL0uW3+XCnSc7tWKZ3yr0nbrWe52CKi
	CAhRZ/E9DL5glXKHfAYg82yffSO75z11fb3Umsx06yoH4FBOp+rBqI2WfBxTXbdOBBdjSvp
	9sOsu765+gU30RKUtJl/jz2nhakCc0u5gnH5CKd/5ROtX2g==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_050630_677941_845B4626 
X-CRM114-Status: GOOD (  16.84  )
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

Hi Martin,

Please check
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi?h=v6.18#n469

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

On 12/18/25 15:27, "Martin Holovský (Probably Nothing s.r.o.)" wrote:
> The Radxa Rock 5T board features two RTL8125B 2.5GbE Ethernet controllers
> connected via PCIe lanes pcie2x1l0 (fe170000) and pcie2x1l2 (fe190000).
> Currently only one interface is functional because the PCIe controller
> nodes lack the necessary reset GPIO configuration.
> 
> Without the reset-gpios property, the RTL8125B PHYs remain in reset state
> and are not enumerated by the PCIe bus. This results in only one Ethernet
> interface being detected, or none at all depending on U-Boot initialization.
> 
> This patch adds the missing configuration for both PCIe controllers:
> - Enables both pcie2x1l0 and pcie2x1l2 nodes (status = "okay")
> - Configures reset GPIOs (GPIO4_PA5 and GPIO3_PB0 respectively)
> - Adds corresponding pinctrl definitions
> 
> With this change, both 2.5GbE interfaces are properly detected and
> functional on the Rock 5T.
> 
> Tested on Radxa Rock 5T v1.2 running Linux 6.12.
> 
> Signed-off-by: Martin Holovsky <mh@probably.group>
> ---
> Changes in v2:
> - Sorted pcie nodes alphanumerically
> - Sorted pinctrl nodes alphanumerically
> - Added Signed-off-by line
> 
>   .../boot/dts/rockchip/rk3588-rock-5t.dts      | 28 +++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
>   		};
> +
> +		pcie2_2_rst: pcie2-2-rst {
> +			rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
>   		pcie2_0_vcc3v3_en: pcie2-0-vcc-en {
>   			rockchip,pins = <2 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
>   		};
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
> index 0dd90c744380..aeb8e0d42f09 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
> @@ -68,10 +68,24 @@ &pcie2x1l1 {
>   	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
>   	status = "okay";
>   };
>   
> +&pcie2x1l0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie2_0_rst>;
> +	reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +};
> +
> +&pcie2x1l2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie2_2_rst>;
> +	reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +};
> +
>   &pcie30phy {
>   	data-lanes = <1 1 2 2>;
>   };
> @@ -101,6 +115,14 @@ pcie2 {
> +		pcie2_0_rst: pcie2-0-rst {
> +			rockchip,pins = <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
>   		pcie2_1_rst: pcie2-1-rst {
>   			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;



