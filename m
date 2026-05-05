Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C9BFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iK2OTeqhoBSCveaCZexOJs9PVb4BkPBHaXlxF/rh3GY=; b=PwJhiljShr6uPW+pmrH65WEt4Y
	AHZo6o3IozyQuuN092clAkn/D9uz3UU1AXH5tKzUJfGacRAcY6gptrujFBKs/qqd6oZCfJGPhYsta
	T8zo3DvUQQnZan22WQ5Cpnq0igyDW4GKYIZ0NIXAQFH9aeF7qy883h0jCsStrXcnBjCV/3mRkYKa8
	1EO5ZIHN1NObcmmdnshFFuKdMx1xYUUMoruianYlkphn4mcGiHR/3Asi20af4QO4/Xa6Q5LzrxHtw
	QTfMdxJ+qEqY2+KXv5qEsAOCUyUPnB4+2iIvwAy1m7qlKodVMPCMZKtK6p7NrRpu9fSBvjR5DGGFn
	zqPhxlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBDA-0000000FXUk-38Ym;
	Tue, 05 May 2026 08:33:00 +0000
Received: from 1.mo575.mail-out.ovh.net ([46.105.41.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBD6-0000000FXSP-3B8Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 08:32:59 +0000
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.58.189])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4g8sGB74TKz5ycJ
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 08:32:50 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-92v2f (unknown [10.110.118.108])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 74512C31BF;
	Tue,  5 May 2026 08:32:49 +0000 (UTC)
Received: from armadeus.com ([37.59.142.106])
	by ghost-submission-7d8d68f679-92v2f with ESMTPSA
	id muovFjGr+Wkn/wgAJ55Jkg
	(envelope-from <sebastien.szymanski@armadeus.com>); Tue, 05 May 2026 08:32:49 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-106R006582a2f30-e56d-4c4f-8000-ab83c7f616fe,
                    EF376445141242EFB525A4BC622796E311A81957) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 90.126.104.208
Message-ID: <b5f75901-29c0-4153-ad1f-543dcf7476e4@armadeus.com>
Date: Tue, 5 May 2026 10:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] pinctrl: imx1: Allow parsing DT without function
 nodes
To: Frank Li <Frank.Li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260504170836.1794372-1-Frank.Li@nxp.com>
Content-Language: en-US
From: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Autocrypt: addr=sebastien.szymanski@armadeus.com; keydata=
 xsBNBFNfZLEBCACv1lqSePHJNpRgcnER+3emy+Arjz84zFax3XkogjY/e3ZneihIgWrVKe5M
 ql16pX4KTkzNgMUKz4bG/XwT3kjcrXshxFLlg7KrHMl287C+W+QOUjnjVeRi/su+SPmjz8VD
 yr11h+ZkVLAWhS+uQJ93jy1NwG8M4t1kBLAVHHD5Vw4FJ+3ouaVYIp1X1Cr8bVKQw33Q1aTd
 ro0kMBb96B9vNu7ciJZ3gvlaBzUEKOgNnq9KaywuLnqrqr4HUIn5JuxZjCjJzt9kTAKcTfp2
 cJM8qpp+2FF5qtbkse9fZ6M64qozgOPr9Tk4Amf9fZEUQ6UNw14mmBZuXSzoHe75gI7TABEB
 AAHNN1PDqWJhc3RpZW4gU1pZTUFOU0tJIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
 LmNvbT7CwJAEEwEIADoCGyMHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgBYhBJwGygpYm/1C
 /GCmwbCaKeiBMmTiBQJdhIHLAAoJELCaKeiBMmTixXIH/2W3kbzRG0UF81jtRRnp0H83rjDT
 v0H+8fgFMRL/7HCJ1QPArkfRJlM2wlJkN+ChP09CCarYfUEHfRCHlTb7At6Yyrz1jziD7ZwX
 8IWHYRXnZkY5eZc5DsiUgq6JH49kt+GPzK8UVP9MTa6zkBpPCUf7LzZ4pD3FihdkT52BU3gI
 d9P49fSI0TYySlb/VKn815aOhvwEr7+Dh3mZUjSh7saofbRmVUOr7p+R3MvvGI19/IJZjeOE
 ZWliODDOt6HnBOtoGSXMcNIFF6snH52D5N5gY88njZjTwhgGGUBix1bsgf/EY0v4R5itZBXB
 B/Ze4Tm++YHaB75hZK6PQu/YRv7OwE0EU19ksQEIALo7jhXddrXBTRu5SAjelV53jyHBJTX/
 vN4nL/VbbW/saca+NJjDSxx5DBmotZbQdWIyZiSIjU/xnTREvtDrl6ZeSsKWd7ZqiuiY4fSR
 zwuQp9rd0yqRuxesrWeyJB1zCSdEvLyKASERt+nxkOA+IzJ4y1qLtvnWr+SL1AXgTMw+Tkyw
 KIDCRWHTIYas11ldGj82gOIpYeXnapeNLHfT4EQwg0NeWYHynJxAQWiX5aPlw0uSpAQSsBXQ
 FIe3fpoveMSnXK+PG2BBOzexYv7r4S70a6sF9sgTTPpfKqUaqqC+u1+bUX6alTAKhGKJywaF
 6ViqLlgY8PfwohSyAlqlTRMAEQEAAcLAdgQYAQgAIAIbDBYhBJwGygpYm/1C/GCmwbCaKeiB
 MmTiBQJdhIHSAAoJELCaKeiBMmTitU8IAK7NQM3fEwaF5XaKtepYWsVka44CD8A9e4r7NVK9
 ugirKvXirIxBSDmN/Db862NmVpITsZ6ERNSNZLm/7k55N+TexKYiFZeU7G92TEfAM6qPElvx
 DLEcrkNMq9r08YZeUloacsq31AL5fK4LW+xdvXudkdiKRMJsdTpmff3x5kIziGOHjwFP9wve
 ZgEH52gpbRsP8Whx/Z2lNX/BBRmFM8OnEXFsjjqDzYThdxTq85wGPpkgvvUGyPNRD7TpbB1C
 pajOUUkPxgj5LKt77HD1afeZNudWhgcdkbtT5PMQTT0WY6wvMEj9S1+bGPeXRGWLYB7gHQ+L
 JNoSD7Kz6Y9qnKo=
In-Reply-To: <20260504170836.1794372-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 12335922329985537596
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEWs1CvnSF4v633awRkMH0ahEGn5C0+c++fw9VBsFYXztTgV9ZJ2F8N+ZSAbMbv/HYhmLuUAjRyFjbUiQ5R0aS6fBaDZIMPo4xCDlUU1gWChYuIMplqn6iFKdU3T+9B2w51tZ6LXDDPwU0h8KqLQRr40NsBvJkTdIPfb0iedBFu74++SYkQ8YJrOVN4BoqgyiAMYjXDpmLVUYN9eXNCtxYxuVjYQrQb+BV/anL5lvvxNSICFcXSE+l8L/6/684fHghG554MIvCR8mPnvjaK6erHzJpHyweaDfJsL7zFrMZ44PpTC83kJ0u7TdBJCjxlvglpr4/7KUKiA/ufxhodj/OLj5gwlA9p0Qdabh8VKzzKJVf6Zl0GIXoKj2dB5dM/q5HlOvLbbQ6DJDluyhVoULt05tm75n2i0E6f/5X7/RAYL2CHFrTxc16bp+e8jY864wrBvW6vEUQ/PLLONS29YPZcoP8Oj1kwcRUGjiD6y+xVQUP8dZ7CNz16hpOMgtvaMEjP1/D0i6OnD4gnxaOikzy4DUD/+F/IFrquDGzVrSlIlTwPpvmpAC3cXdnQXPut8uTpjzS7tSAWg0FV3OC3mxm7o9+Wiu7Re+Ml5YCKkh9xVXuJblccRACiBV/aoi8+XNsykk9wm8MuaC0F4cJrk7wc9/bfl7zZ/vvh2yLeg3Pz6Q
DKIM-Signature: a=rsa-sha256; bh=iK2OTeqhoBSCveaCZexOJs9PVb4BkPBHaXlxF/rh3GY=;
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1777969971; v=1;
 b=Do6u5Ku7eX6UIF3R96zMpCeUIo7GLJTLcUIMaDSuj8NcjGQZMI/tQAA+A0YJ+NRuaFvcfFDV
 CXbFObklQuf4vnOOwLupte9otDmWc4h2nrBgM1N/6MLn6Z1EB2Qw6BOUxKE1hRq0dinoDnxDNJ0
 EO97leMDcdFlDAaLYNI5n2q71LkjfowgDzVC/b8geyIOc1nJsLyKOUAcYKmXrtQMeMX6/I0Li+4
 QHRirIyIrY/wDbtm9wsojJwDchDBqNcCj2Hm0Ua7wXAkJymFnyDRhF39tcqoCy1CrGu9MKSdp7J
 n6ssmgchukE2veiUL3dAOcTM68HGTGSlsj5Jylt2e05UA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_013257_964310_8C7073B3 
X-CRM114-Status: GOOD (  28.05  )
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

Hello,

On 5/4/26 7:08 PM, Frank Li wrote:
> The old format to define pinctrl settings for imx in DT has two hierarchy
> levels. The first level are function device nodes. The second level are
> pingroups which contain a property fsl,pins. The original ntention was to
> define all pin functions in a single dtsi file and just reference the
> correct ones in the board files.
> 
> The commit ("5fcdf6a7ed95e pinctrl: imx: Allow parsing DT without function
> nodes") already make moden i.MX chip support flatten layout.
> 
> Make legacy chipes (more than 15 years) support this flatten layout also.
> 
> Fixes: e948cbdc41d6f ("ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> build test only
> 
> Sébastien Szymanski:
> 	Can you help test it? I am happy i.MX27 still alive.

Sure! Thanks for the patch! With this patch applied on Linux 7.1-rc2 the 
board boots again. I see the following messages, though:

[    0.085139] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins 
property (gpio)
[    0.085226] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins 
property (gpio)
[    0.085281] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins 
property (gpio)
[    0.085327] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins 
property (gpio)
[    0.085372] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins 
property (gpio)
[    0.085416] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins 
property (gpio)
[    0.092693] imx27-pinctrl 10015000.pinmux: initialized IMX pinctrl driver

That's because there is no fsl,pins property in the 6 gpio subnodes.

Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

I one have comment bellow.

> 
> Frank
> ---
>   drivers/pinctrl/freescale/pinctrl-imx1-core.c | 48 ++++++++++++++++---
>   1 file changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> index b36c8a1461b7c..bf07e0c64a098 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> @@ -540,10 +540,34 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
>   	return 0;
>   }
>   
> +/*
> + * Check if the DT contains pins in the direct child nodes. This indicates the
> + * newer DT format to store pins. This function returns true if the first found
> + * fsl,pins property is in a child of np. Otherwise false is returned.
> + */
> +static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
> +{
> +	struct device_node *function_np;
> +	struct device_node *pinctrl_np;
> +
> +	for_each_child_of_node(np, function_np) {
> +		if (of_property_read_bool(function_np, "fsl,pins"))

Isn't of_property_present better here...

> +			return true;
> +
> +		for_each_child_of_node(function_np, pinctrl_np) {
> +			if (of_property_read_bool(pinctrl_np, "fsl,pins"))

...and here ?

Regards,

> +				return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>   static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
>   		struct imx1_pinctrl *pctl, struct imx1_pinctrl_soc_info *info)
>   {
>   	struct device_node *np = pdev->dev.of_node;
> +	bool flat_funcs;
>   	int ret;
>   	u32 nfuncs = 0;
>   	u32 ngroups = 0;
> @@ -552,9 +576,15 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
>   	if (!np)
>   		return -ENODEV;
>   
> -	for_each_child_of_node_scoped(np, child) {
> -		++nfuncs;
> -		ngroups += of_get_child_count(child);
> +	flat_funcs = imx1_pinctrl_dt_is_flat_functions(np);
> +	if (flat_funcs) {
> +		nfuncs = 1;
> +		ngroups = of_get_child_count(np);
> +	} else {
> +		for_each_child_of_node_scoped(np, child) {
> +			++nfuncs;
> +			ngroups += of_get_child_count(child);
> +		}
>   	}
>   
>   	if (!nfuncs) {
> @@ -574,10 +604,14 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
>   	if (!info->functions || !info->groups)
>   		return -ENOMEM;
>   
> -	for_each_child_of_node_scoped(np, child) {
> -		ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
> -		if (ret == -ENOMEM)
> -			return -ENOMEM;
> +	if (flat_funcs) {
> +		imx1_pinctrl_parse_functions(np, info, 0);
> +	} else {
> +		for_each_child_of_node_scoped(np, child) {
> +			ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
> +			if (ret == -ENOMEM)
> +				return -ENOMEM;
> +		}
>   	}
>   
>   	return 0;


-- 
Sébastien Szymanski, Armadeus Systems
Software engineer

