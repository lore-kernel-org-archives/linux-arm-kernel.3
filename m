Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB286FA3741
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujVKOuzo5WqYG+lz+h/KUlxw8OmDWuGVBGYVvXW42P0=; b=Jam3XrO1Jtr7e0gQ3jMJAMTHHe
	uEBXoprql9N0JvfJdZO3zpd5DNIYiF2Spw34x61rjiTON7+KOh4KiyAQi1blDqbQOTMUdZp2Jqzg8
	+pmDe43k7BkaX12S7a3WT8Srb+ud1p87alnfj3GzqU6C/g9lJwc2JLqk2FUPFX3u9EtQ1+XnvB6nW
	Tp2VwbyXP8jRfPKEzwKLYCHmC3IKpaYYxtClEm2EBueS/4wxlOvsSgH4NHsfajNP3IiosiPTTO29t
	KhHjLK3WA8Kth8W9P43q9O08b9ZqMeA/DxWVoV/WtLsEXK4k5jdzGvJtuLkd5zLSK3C4y5Cb28FRf
	0TbTtp8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfb4-00000008Ju3-00Mu;
	Fri, 02 Jan 2026 13:53:42 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfb1-00000008JtZ-2Tbz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 13:53:40 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4djQC270Gsz9stX;
	Fri,  2 Jan 2026 14:53:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767362015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ujVKOuzo5WqYG+lz+h/KUlxw8OmDWuGVBGYVvXW42P0=;
	b=mihNgPx/gLD9uHoofpTBP+ijkKRfW9R0iSjTMv2iJ87GXsbO6ZXnbANN4HYn+OeuE3Iz4x
	YmmXoeJdARn7pITD1kHG6QtBjvD3u0l5juuQUKJxnUjaW4F1sHdDClXfk19gpbdNaqilpD
	re9v7+ZgkVY8RK2JMHogg1PECqRzA6lp/kCPId/C0tR/RoVnEmPL5niryFmko5oJKb4mUn
	gufNrKNpSICS1BMKOzTfC/ZiDp8ScZRrQ8W03McScz4NQiUOzd34SG+wLp4bfO5w8eOfzY
	obyRXY2ol/5SefQn98MgCRDHKpzlSwVhukROUYHoE0sbGrM9SQGv+IsBLgc2mw==
Message-ID: <0de33175-1dc3-417b-8dab-9b57940f0789@mailbox.org>
Date: Fri, 2 Jan 2026 14:53:31 +0100
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
 <b2dd2109-c2d9-412e-9b11-5851485acf04@mailbox.org>
 <aVegAt002L20oBGf@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aVegAt002L20oBGf@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e019832cff23643e43e
X-MBO-RS-META: y1eoui7nrfmfe6kre5jnazb59cqu4f7q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_055339_788557_C7311A7C 
X-CRM114-Status: GOOD (  23.28  )
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

On 1/2/26 11:37 AM, Rain Yang wrote:
> On Thu, Jan 01, 2026 at 05:51:12PM +0100, Marek Vasut wrote:
>> On 1/1/26 1:37 AM, Rain Yang wrote:
>>> On Wed, Dec 31, 2025 at 03:11:21PM +0100, Marek Vasut wrote:
>>>> On 12/31/25 4:19 AM, Rain Yang wrote:
>>>>> From: Rain Yang <jiyu.yang@nxp.com>
>>>>>
>>>>> Dropping CLK_GPUAPB simplifies OPP handling and avoids unnecessary
>>>>> complexity.
>>>>>
>>>>> Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
>>>>> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
>>>>> ---
>>>>>     arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>>>>> index 88bde59e61b2..ab446aa6f73c 100644
>>>>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>>>>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>>>>> @@ -2164,8 +2164,8 @@ netc_emdio: mdio@0,0 {
>>>>>     		gpu: gpu@4d900000 {
>>>>>     			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>>>>>     			reg = <0 0x4d900000 0 0x480000>;
>>>>> -			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
>>>>> -			clock-names = "core", "coregroup";
>>>>> +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>;
>>>>> +			clock-names = "core";
>>>>
>>>> I don't think this is correct, SM can disable the GPUAPB clock from the SM
>>>> monitor:
>>>>
>>>>> $ clock.w gpuapb off
>>>>
>>>> Linux has to make sure the GPUAPB clock are enabled to access the GPU
>>>> register, hence the clock have to be described in DT.
>>> Hi Marek,
>>
>> Hello Jiyu,
>>
>>> CLK_GPU and CLK_GPUAPB can only be controlled internally by the SM, not by Linux.
>>> CLK_GPUAPB always runs at a fixed frequency, does not require dynamic adjustment,
>>> and is practically always on.
>>> Additionally, CLK_GPUAPB's frequency is absent from all OPP entries. Removing it
>>> could simplify OPP handling logic and reduce unnecessary complexity.
>>
>> But the SM can turn the GPUAPB clock off, correct ?
>>
>> Linux has to be able to turn GPUAPB clock on, therefore the GPUAPB clock have
>> to be described in DT, correct ?
> 
> Yes, CLK_GPUAPB can be turned off by the SM, but by default it remains on, just like
> CLK_GPU. AFAIK, there is no scenario where either of these clocks could or would be
> disabled in both SM and Linux.
> 
> If enabling or disabling CLK_GPUAPB in Linux was wanted, the same shall apply to CLK_GPU
> to make this approach reasonable.
> Also, OPP framework shall be adjusted to meet these changes too.

You can not depend on the state in which bootloader or any other prior 
stage left the platform. If the clock can be turned off, you must make 
sure they are turned on for correct hardware operation.

CLK_GPU is enabled as parent clock of CLK_GPUCGC already.

I don't understand your concerns about the OPP framework, this keeps 
coming up in the discussion one way or the other, but it is not clear to 
me what this is about. Can you elaborate on the OPP framework concern ?

