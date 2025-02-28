Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A8DC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZS4nj+6CXdvnwv7q5KXp5Uz0YuvWKS25Z4+jZ2AtgM=; b=pw4z4/zkraS2fFBAcEDNllhsS+
	GM+FGqOEKsX4TuFr62G+l/1G9qHo40JzxXGhcbH/i1pYtaj8agnv/Q3h765+V5/c1g7/2/zAgoSru
	/DwJyy2z0orvd7XHhdsvuPIhf/vrOfcKIARneYNNZPsYjhIQDWZ5847+/0f9145glmJHyCSKrRVb4
	ukovEkNF9TuMARP/HymbAqtAatKYxri5dLtFoPh/dV0aSgmjbJ+GtE4HAppBCRM07I0Y97yINIAXz
	xzZccXpV2f5e1V4gYub7CNGR9aQQiCFUJsqsELc7SyxcI+In+H7jVpOdMNk1uEEKTXb17lVFqbNoZ
	SuVe9WTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5OQ-0000000CDwU-1BlF;
	Fri, 28 Feb 2025 18:47:26 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to557-0000000C8Mt-0xJw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:27:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC5A8102901CB;
	Fri, 28 Feb 2025 19:27:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZS4nj+6CXdvnwv7q5KXp5Uz0YuvWKS25Z4+jZ2AtgM=;
	b=MMAOQyq8fDfYlgTpZqC/M+BGzgpy9ow1BJurDp10ybzZ0pWTxNGhGN3rhcaGG0+P7rjhit
	mDM7zuoPQRTg0KVG0DhAmQp7kRrYuhbq+XMiu/iJ2VYPyRysu/zG21jO/2q1URP/DayWDr
	TJrERFxmPTvwFlEM5fHjwvd+nZfq7j7BRbBSFEH3CkUu3oMopCHWUTVJhM/gGo33C+jlBs
	QIvO0o1lQRG5q1f5Gx0R9jbHy+Xpsm6ZPIOcTYY+mSjcCWphqBUnAb7D6L4HalOXZLTY7t
	elNTV2H+836UoG1zNCm6E1IMRT4k/FzSGlcRKKHtAifZja6oqOUsuTAjtiWOiA==
Message-ID: <52f42263-d40e-449a-80f5-145a87fdfdd1@denx.de>
Date: Fri, 28 Feb 2025 18:33:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <db903f36-e897-42ed-be46-f0b035303233@denx.de>
 <Z8DlYjq+87sjS9cU@lizhi-Precision-Tower-5810> <3332618.oiGErgHkdL@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3332618.oiGErgHkdL@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_102729_412729_473089F7 
X-CRM114-Status: GOOD (  15.12  )
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

On 2/28/25 11:39 AM, Alexander Stein wrote:
> Am Donnerstag, 27. Februar 2025, 23:21:22 CET schrieb Frank Li:
>> On Thu, Feb 27, 2025 at 10:34:20PM +0100, Marek Vasut wrote:
>>> On 2/27/25 10:27 PM, Frank Li wrote:
>>>
>>> [...]
>>>
>>>>>>> +		gpu: gpu@4d900000 {
>>>>>>> +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
>>>>>>> +			reg = <0 0x4d900000 0 0x480000>;
>>>>>>> +			clocks = <&scmi_clk IMX95_CLK_GPU>;
>>>>>>> +			clock-names = "core";
>>>>>>> +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
>>>>>>> +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>>>>>>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>> +			interrupt-names = "gpu", "job", "mmu";
>>>>>>> +			mali-supply = <&gpu_fixed_reg>;
>>>>>>> +			operating-points-v2 = <&gpu_opp_table>;
>>>>>>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_GPU>;
>>>>>>> +			power-domain-names = "mix", "perf";
>>>>>>> +			resets = <&gpu_blk_ctrl 0>;
>>>>>>> +			#cooling-cells = <2>;
>>>>>>> +			dynamic-power-coefficient = <1013>;
>>>>>>> +			status = "disabled";
>>>>>>
>>>>>> GPU is internal module, which have not much dependence with other module
>>>>>> such as pinmux. why not default status is "disabled". Supposed gpu driver
>>>>>> will turn off clock and power if not used.
>>>>> My thinking was that there are MX95 SoC with GPU fused off, hence it is
>>>>> better to keep the GPU disabled in DT by default. But I can also keep it
>>>>> enabled and the few boards which do not have MX95 SoC with GPU can
>>>>> explicitly disable it in board DT.
>>>>>
>>>>> What do you think ?
>>>>
>>>> GPU Fuse off should use access-control, see thread
>>>> https://lore.kernel.org/imx/20250207120213.GD14860@localhost.localdomain/
>>> Did that thread ever go anywhere ? It seems there is no real conclusion, is
>>> there ? +Cc Alex .
>>
>> The direction is use access-control to indicate fuse disable. Only
>> implement detail is under discussion.
> 
> Well, the discussion ended up to be more complicated for i.MX8M.

Aren't we missing the access controller in MX95 DT so far ?
And maybe some driver to match ?

> For i.MX95
> things are a bit easier, as fuses and clocks are controlled by System
> Manager (SM), accessed using SCMI. [1] is more important for imx95.
I think SCMI is replacing GPL code in kernel with stubs that call 
non-free firmware, which removes flexibility and makes long term (or 
any) maintenance much more complicated.

