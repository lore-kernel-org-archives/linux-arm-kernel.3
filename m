Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA35EEED618
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 16:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwhbiH2i/ANAo8+Wch6/HUZJO5n6DwRlRD01nwzx8Ks=; b=inMzmFmaKuxUzNXtEDn/aqr5SX
	vt3KcDGHzxPVmaLeca/5j8vnZFJZHgDnRHWMwU4NIKIaKsh7f8tN9WLsv/tR/XJuI+pzekBB4LHAP
	4bUxjFTmrDV0pv8TbXSvrvxJsWwfszDuBysxFMn4F3QBTyg7LsebunItcpGol696YD28jmEgjxfPQ
	o/b9dnJY2dpZ5FJG4UBRvoXOjUwyFIwuIprAwbXqmmVan3pzJfZoiTPacSS8PBLUKLb9oYRn33TKt
	FdcuoynLPYWES8s3bm1Yr3EiGqCuuyfaB+/3B04Yp5NGgYYU+frXGLjfIZLD0kic+P9lM6M00MB3x
	qFSpz4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbLzl-00000007MXd-1uSG;
	Thu, 01 Jan 2026 16:57:53 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbLzi-00000007MWb-2pxO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 16:57:51 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dhtKy5gdlz9sJG;
	Thu,  1 Jan 2026 17:57:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767286662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UwhbiH2i/ANAo8+Wch6/HUZJO5n6DwRlRD01nwzx8Ks=;
	b=rXGQB1LYkbEvVkSNsX47TyNne9IPu2vluqViPLO0Fty919Nx3pbgT/jEtVHbbYdNhWDQ6x
	I2bZulzHV3RA1ofyCei2a2VwEDM1cyFyWKp4yY6baAbSWd6cjbG21PxYtTW5ONie3c91Ar
	Q3x0Am/w+eU6tPlCjGaHGc6xO1enuwvMiJ1IEJVkA3E0OOG2dxdT+gB5e7f5/7+pHO0kkW
	JOW9Tha6mjXB9HE7DC6gL4uCJTVLmrrb+jr0+A77VgS5B/VdcSOIJ6g+fQsb19Zhw87T60
	FDi/EDk+eX8NGx31EVhi4be97Zl7uBToY7PRC4/5ppcCuUTiRijCMr3l5JrVZg==
Message-ID: <b2dd2109-c2d9-412e-9b11-5851485acf04@mailbox.org>
Date: Thu, 1 Jan 2026 17:51:12 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: remove CLK_GPUAPB
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Frank.Li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@nxp.com,
 kernel@pengutronix.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 liviu.dudau@arm.com, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org
References: <20251231031915.752262-1-jiyu.yang@oss.nxp.com>
 <37489cb7-820d-46cd-a7ea-0f9097604895@mailbox.org>
 <aVXByNiEfC66RDG0@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aVXByNiEfC66RDG0@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 8f8f6702e7912ba6456
X-MBO-RS-META: ustjw9ys9hf7hrrizs4wzjh54u9p1ppq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_085750_888716_1E52E836 
X-CRM114-Status: GOOD (  16.59  )
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

On 1/1/26 1:37 AM, Rain Yang wrote:
> On Wed, Dec 31, 2025 at 03:11:21PM +0100, Marek Vasut wrote:
>> On 12/31/25 4:19 AM, Rain Yang wrote:
>>> From: Rain Yang <jiyu.yang@nxp.com>
>>>
>>> Dropping CLK_GPUAPB simplifies OPP handling and avoids unnecessary
>>> complexity.
>>>
>>> Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
>>> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
>>> ---
>>>    arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>>> index 88bde59e61b2..ab446aa6f73c 100644
>>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>>> @@ -2164,8 +2164,8 @@ netc_emdio: mdio@0,0 {
>>>    		gpu: gpu@4d900000 {
>>>    			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>>>    			reg = <0 0x4d900000 0 0x480000>;
>>> -			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
>>> -			clock-names = "core", "coregroup";
>>> +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>;
>>> +			clock-names = "core";
>>
>> I don't think this is correct, SM can disable the GPUAPB clock from the SM
>> monitor:
>>
>>> $ clock.w gpuapb off
>>
>> Linux has to make sure the GPUAPB clock are enabled to access the GPU
>> register, hence the clock have to be described in DT.
> Hi Marek,

Hello Jiyu,

> CLK_GPU and CLK_GPUAPB can only be controlled internally by the SM, not by Linux.
> CLK_GPUAPB always runs at a fixed frequency, does not require dynamic adjustment,
> and is practically always on.
> Additionally, CLK_GPUAPB's frequency is absent from all OPP entries. Removing it
> could simplify OPP handling logic and reduce unnecessary complexity.

But the SM can turn the GPUAPB clock off, correct ?

Linux has to be able to turn GPUAPB clock on, therefore the GPUAPB clock 
have to be described in DT, correct ?

