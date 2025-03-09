Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0620C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 06:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTBN1gdSIrMQtIsM3UQLZJiPjr+T8c48XAisTd7XDR4=; b=xsDYWi/IwEwak/2YORDoI6aNyl
	fDumCtsW/KY1ADE+HtIeLLpHhWeY4RKbLA6XHBmnRBqTRj/VTyZ5oWh46Fzvz8J+ZbDS1072Sjecu
	4hLAHZ4r9GyNIhnaNY9rbesAXiiq+6fa+qH3KdyjPWw3sjTxb6P6lwAAC4O765EGPaCxS98HvLC2k
	a4VIEog/d9GUqMN9WsFREp1j30u3Tp39DafEF4aWSUEa0/nnXn3h6IruNC8t67Tb+Asss/DDvz3pk
	Qgo2Y4P8NaXSJDgWw88yjW+2Y53K+pBkxiQpNb4Rg2bOQZVie/qB91vWL8pj7OoEkIiFnb/2tUJeC
	Uhngznqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAJX-000000003Yb-0iuh;
	Sun, 09 Mar 2025 06:39:07 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAHp-000000003Rv-0x8v;
	Sun, 09 Mar 2025 06:37:27 +0000
X-QQ-mid: bizesmtpip4t1741502154t5gjj86
X-QQ-Originating-IP: PIiBMmc3En4vJW7/I3LQGRV2j1PvNOrAV1RB8S3SouM=
Received: from [IPV6:240f:10b:7440:1:893e:bed3 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 09 Mar 2025 14:35:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2792177622462223588
Message-ID: <3605ABCB7EF60115+2de06a28-1b3d-4a0e-b960-9e0a74c6e19d@radxa.com>
Date: Sun, 9 Mar 2025 15:35:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: rockchip: Enable DisplayPort for rk3588s
 Cool Pi 4B
To: Andy Yan <andyshrk@163.com>, heiko@sntech.de
Cc: neil.armstrong@linaro.org, sebastian.reichel@collabora.com,
 devicetree@vger.kernel.org, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 yubing.zhang@rock-chips.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org, robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250223113036.74252-1-andyshrk@163.com>
 <20250223113036.74252-7-andyshrk@163.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20250223113036.74252-7-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MZChPk4K8ikNtuyS7LmElWHQBKIqfKMszzDt39qR9elumF/p30V6QFbJ
	g+bDMddl4L2ApOzqZsf6BbZqpxBhQ8FxlQ8Zf+QdPmMV+fFKC1g0OGLvHKC4B11VRqLmUJd
	xiJvrpfa5nXJrykU6ICAAYD4loiCATrc9CqFfOjsShImDiiwyk1r1yjkwrhcmqmGkR2cjgC
	goMlrGbz1T27s0luW/t6sHOhgbzTNMaHoiqeYcBNTU78fIrsJKXGCaV5wZ9fpKob/vS7IlO
	259OA+3xlSlakEOJno/qIxnfzWa0gWvdQchNhkytETnW4tfOjJvne91omeqp19Wmxwl6/kw
	lue5yo3oV7uP6utcktSeuot/tjA8lJi3xY3CIiWW7TPI04mn7+27Hlkj2Fc/4q+WTkpCKwO
	1g0uiwPHAOcaQQT1XyKGgzeNdkkKLajaSq2dxTpVMCsh27QeC4XGEVvHSoW9wJO2lN/bu1n
	Xj0jgd+UNV4+U6prlBRe+wa8DosFlbEWJ7zaLIguRHnI9+SpDSBOSErYd3JG5GuJAhbvFsX
	fod++gkfC/Cds41922fNBjUSYxrw/VUxYqHooPfvqgqG7VXcYpno40I9rmfWKNq56S83+I0
	8ZXosFu+XW8ps4DDD/9ay4Wb2f7/ubYCkJ+sCo5UtTegm4TjSlQzsxqgvcsouuLQYZXggXp
	YZSVRDzL1MfQg+ltqk5MhKEFl9d4E9yCtkGVE1yfd7Ec2mO4TnuYxjFtbmkA2Y06CJPZor0
	lGequf4me6fo4y+ZQAWTyG5aGXOK1SK5EuUekyM4j1z91kqezczR4FUKIUu0WXliPLRpwqZ
	dDMd00y+16hTjAYKXqUhUHRLZEpY+fqPNTaYz0AZd82wVG6n94riOOVn/z64x2Y5D+IBo6r
	Rw/LghJEQj8ssX89MtUYd6y+FKqMVJxJlwEY/kUV8LOwluUMHEMK+omZ+NaS551jzPEjbkk
	Zvk0SFrhguJxxzRAxuP/QQaLv
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_223721_727644_7C3A5125 
X-CRM114-Status: GOOD (  13.86  )
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

Hi Andy,

On 2/23/25 20:30, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Enable the Mini DisplayPort on this board.
> Note that ROCKCHIP_VOP2_EP_DP0 is defined as 10 in dt-binding header,
> but it will trigger a dtc warning like "graph node unit address error,
> expected "a"" if we use it directly after endpoint, so we use "a"
> instead here.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>   .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
> index e892dd7c91aa..0f58eb56557f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
> @@ -39,6 +39,18 @@ chosen {
>   		stdout-path = "serial2:1500000n8";
>   	};
>   
> +	dp-con {
> +		compatible = "dp-connector";
> +		label = "DP OUT";
> +		type = "mini";
> +
> +		port {
> +			dp_con_in: endpoint {
> +				remote-endpoint = <&dp0_out_con>;
> +			};
> +		};
> +	};
> +
>   	hdmi-con {
>   		compatible = "hdmi-connector";
>   		type = "d";
> @@ -220,6 +232,24 @@ &gpu {
>   	status = "okay";
>   };
>   
> +&dp0 {
> +	status = "okay";
> +	pinctrl-0 = <&dp0m0_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&dp0_in {
> +	dp0_in_vp2: endpoint {
> +		remote-endpoint = <&vp2_out_dp0>;
> +	};
> +};
> +
> +&dp0_out {
> +	dp0_out_con: endpoint {
> +		remote-endpoint = <&dp_con_in>;
> +	};
> +};
> +

These three nodes should be placed above the &gpu node.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

>   &hdmi0 {
>   	status = "okay";
>   };
> @@ -889,3 +919,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>   		remote-endpoint = <&hdmi0_in_vp0>;
>   	};
>   };
> +
> +&vp2 {
> +	vp2_out_dp0: endpoint@a {
> +		reg = <ROCKCHIP_VOP2_EP_DP0>;
> +		remote-endpoint = <&dp0_in_vp2>;
> +	};
> +};


