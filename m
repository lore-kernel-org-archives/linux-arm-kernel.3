Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605A6EE6428
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 15:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lM/LDEXQ59nBAxlq+a/Py0Lpzo0PBuXD2pbfBww4E0Y=; b=R/CwO+yO2DC45rerGvqve4nC1F
	/msXJpaBLOyttkrXQ3jPpEf7DerQXZoeUH4pL4htgnGza5fuQJTP7u6Aqv5xFAdVa09ukh35b1Bw1
	E60+IDUsRMlAKremRLPkOXoBT+fFH0Jyl8b8Q/oiGVqHYZsYUzrD6j7fOR4ArglZjTWm+GBtzBu+j
	pVj4IpvL2ruk10D/Pexl4FTmeagheg1b1YlsNQAyyvRik0WOE8x04e7J+t+KGsisPmC9SMx5CvBq6
	O2rZZ3x+fLjrfHCS9LZxozkDnRDIsnvbf8s02KwUljH4LmuFW26aHwC97LNkZCuhikRFfo8C6ZDTt
	UmJLiVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaxmj-0000000640J-1rKQ;
	Wed, 31 Dec 2025 15:06:49 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaxmg-000000063zk-0M53
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 15:06:47 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dhCwG0DDkz9tl6;
	Wed, 31 Dec 2025 16:06:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767193598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lM/LDEXQ59nBAxlq+a/Py0Lpzo0PBuXD2pbfBww4E0Y=;
	b=Asx1XP+iK6i9hd9W7t7F6twLwvZLgknRFiVWAJtmFEKwWhEpg95MI/5bPlJ7BuTiu9g4jZ
	zwLA4V3y5lWOjd1jhSVH+2OE8Z9jy33X2Z/OBimKm9vYIganTuJN+dObTeGLj9fT5yyZRp
	dJcT3/qsedaLjTXA4e1fL/x2pP99YFb350pAtz7Dy7AfiKdOMiIWzHPS0XuJJ7n8tXrW49
	yG5jgR7LNN7ejW2yPmqB+F8vfNG76QzcGpqus0cEMxDE5JZuxSoB1LvYhvyq8JwBpUDmc4
	OG6Y6VoLWEvvETwUSIpt8kiiPGOR4NMBIpHVwmvPzDHMGmiBtd3bbAjVXj7b0A==
Message-ID: <37489cb7-820d-46cd-a7ea-0f9097604895@mailbox.org>
Date: Wed, 31 Dec 2025 15:11:21 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: remove CLK_GPUAPB
To: Rain Yang <jiyu.yang@oss.nxp.com>, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, Frank.Li@nxp.com, liviu.dudau@arm.com,
 Rain Yang <jiyu.yang@nxp.com>
References: <20251231031915.752262-1-jiyu.yang@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251231031915.752262-1-jiyu.yang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: cj1nf6xkoodfn1a4i3danjiknax1xpez
X-MBO-RS-ID: 487dd8ea82aa49fe10d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_070646_275002_A85B6B18 
X-CRM114-Status: GOOD (  14.15  )
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

On 12/31/25 4:19 AM, Rain Yang wrote:
> From: Rain Yang <jiyu.yang@nxp.com>
> 
> Dropping CLK_GPUAPB simplifies OPP handling and avoids unnecessary
> complexity.
> 
> Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
> ---
>   arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 88bde59e61b2..ab446aa6f73c 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -2164,8 +2164,8 @@ netc_emdio: mdio@0,0 {
>   		gpu: gpu@4d900000 {
>   			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>   			reg = <0 0x4d900000 0 0x480000>;
> -			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
> -			clock-names = "core", "coregroup";
> +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>;
> +			clock-names = "core";

I don't think this is correct, SM can disable the GPUAPB clock from the 
SM monitor:

 >$ clock.w gpuapb off

Linux has to make sure the GPUAPB clock are enabled to access the GPU 
register, hence the clock have to be described in DT.

