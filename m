Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183D7C36008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 20:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a14P7c9Bp63M0MikNJ0Fvj67ia2oHwxPak9QEd1B7t4=; b=WsxpxrcNGuQDBQn0FZwo2roGcC
	9yOXFv+JJk0CK6Yu/bZAhufRYtAXpyR+Y0fMw0bLaqbbbAGNYad8xUQYwG2/2KJiIJbLc1TqA1sLn
	euXVj2yh7KeqXQ01cb4k3k1QORzXwjQpR/+sR4ma+fJIneaQYtXdLK2zRb3fAlZmGW/yqSq5/G2uP
	3LdCLoi43gO7lCZqkF1mjU8BQYyT14trDFPlDVSgfEg/5HXtvpMp3Iiwem4oPmLC1k27zj5nPORQC
	S1YyHAiDqlwrTdPgfkqJ1MeHsxhs0ej3aEduKF+kr5MtO29lr5L3lCVIeExk+Dok75RbBA4HOvM8Y
	BLDIh+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tviyw-0000000GAI8-1kKx;
	Fri, 21 Mar 2025 20:28:42 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tviZP-0000000G6pp-1DAH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 20:02:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AFC510206773;
	Fri, 21 Mar 2025 21:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587333; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=a14P7c9Bp63M0MikNJ0Fvj67ia2oHwxPak9QEd1B7t4=;
	b=VMotOcUjpl1dTWWEKwIByS8XW1DZznwH/22i39U16DkYz+o0LxVp22AjGOgnvAJdMC4zAi
	84RK7OrxFPOWowuQ9XaihDLTGw6uIWaxi5E/SRZSo2gVkblvdPtMBNQuf7rciyG00O9iTL
	/Nzd/6AT+a0w9H4xiyeh8cc1Un12OGqFeSDfKS5YMh/vcq57IYeiCESxTGKa9zPRaX1M6X
	MCd++V8xRc3pCSogyVZbD+k9i4NJJLhS55AxDnXL6LtVLdQ2WahxppQORHOra1Z7yDjiAE
	eX/XV5KSQIh/bxBnkezBsFXhq1EaJQMIczhpqN2bZKwh6DF/VZWALBTfeKWFng==
Message-ID: <6034b024-381c-4fed-9d97-ad7d5d293112@denx.de>
Date: Fri, 21 Mar 2025 20:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de> <2153305.bB369e8A3T@steina-w>
 <4a27b6bf-aca8-4f29-9561-609a42eb81a0@denx.de>
 <Z8XFCv6ku6mG1_x5@e110455-lin.cambridge.arm.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z8XFCv6ku6mG1_x5@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_130219_489029_AEBE9C2E 
X-CRM114-Status: GOOD (  10.68  )
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

On 3/3/25 4:04 PM, Liviu Dudau wrote:

[...]

>>>> +			#reset-cells = <1>;
>>>> +			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>>>> +			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>>>> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
>>>> +			assigned-clock-rates = <133333333>;
>>>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>>>> +			status = "disabled";
>>>> +		};
>>>> +
>>>> +		gpu: gpu@4d900000 {
>>>> +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
>>>> +			reg = <0 0x4d900000 0 0x480000>;
>>>> +			clocks = <&scmi_clk IMX95_CLK_GPU>;
>>>
>>> There is also IMX95_CLK_GPUAPB. Is this only required for the rese control above?
>>
>> I think I have to describe those clock here too, possibly as 'coregroup'
>> clock ?
> 
> The 'coregroup' clock does indeed control the MMU and L2$ blocks as well as the AXI interface,
> so if that is indeed a separate external clock source it should be defined. Could it be why
> you're seeing issues with L2$ resume on the fast reset path?
Sorry for the delayed reply.

I did define these clock, they are enabled, but the L2 reset problem is 
still present .

