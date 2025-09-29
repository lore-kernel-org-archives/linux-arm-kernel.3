Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF45CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 17:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0n/n2aPG/kzPYvO+2OVEYL5klvnYOH3rxCzc5hQBZE4=; b=24mYFJWoCullO3RqDweFtv1w9d
	Qknruj2Zl9tnMHv/anbIHe8dOB/cHGCEp/bewY7n5c6yk+PWFa4YQjzfZKJtbCD/u5h9DuyVoMNgv
	ugUyOzaSOOEYkETnjchKdI6MCwnG0Pd2y+V6smk9iEd+lNSqXOwAh0qcOTKaKQWhlG3njpWDjn47J
	0DjeFB5Tr75G+9SOb0B0Lol9dCFmiVl3kxcEB7eaR4GzCNpHWZ27y7imzmXMDTjohZYkgvIjy76rM
	c7MgLuwTptv8z5mDo2DGhyra3S7zNH849srIHzsFJ0pZFVWoyr1a8Ji/eoSnrc4vyAIDZuEGrrX1y
	bYYrbfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HOZ-000000034bY-0hod;
	Mon, 29 Sep 2025 17:10:39 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HOW-000000034Yd-1TZO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 17:10:37 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cb73q0D68z9t2F;
	Mon, 29 Sep 2025 19:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759165815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0n/n2aPG/kzPYvO+2OVEYL5klvnYOH3rxCzc5hQBZE4=;
	b=Ufxi6mHO2aR5i7X58ZBpLwHEL1pIEx9MUkoEvGNpNObkP7xQV8LyFtXd+zAp0BDCtSjssN
	oh3l4R5h3ZSSr8rHmiulD6gD7roOpmZj+8qTTWOdTuHN01EcIqy/F2sT6yNjxRRSL3JJoM
	6hlUATmJVZNi+HeQ7DnGYXjYvKQAvNEKDA7WcmlM4G9TzUvxCHx/gH9cnLziVGmgzs22sN
	NplepLhy45jkBrUeePGTyDTs2RefZgWdrzzhBAwPeATwArcHygRT15vwKggU/gGatN1UzK
	aF4Ls9sMYg2NPD9DakRPnpnPzCiC0KbXcam/xj78mXXAcOj1V1bJBLmlEtXhZg==
Message-ID: <86bc3866-4188-45d2-8046-da82e44333c0@mailbox.org>
Date: Mon, 29 Sep 2025 19:10:00 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Frank.Li@nxp.com, airlied@gmail.com, alexander.stein@ew.tq-group.com,
 boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, simona@ffwll.ch, sre@kernel.org, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <20250926055701.GC8204@nxa18884-linux.ap.freescale.net>
 <8f4ed393-f94a-4abb-9cdd-60dd693f3ec6@mailbox.org>
 <aNpYG5VITPmKkNgl@oss.nxp.com>
 <cc873c8b-435c-467f-b1e9-dc78ddbfb483@mailbox.org>
 <aNqx6XrUGBgUJ-pF@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aNqx6XrUGBgUJ-pF@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 216c242169d189a438d
X-MBO-RS-META: 694cwbhaseu15wsa8xaqtfy7753b3yym
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_101036_570077_34B1D708 
X-CRM114-Status: GOOD (  27.15  )
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

On 9/29/25 6:20 PM, Rain Yang wrote:
> On Mon, Sep 29, 2025 at 03:09:01PM +0200, Marek Vasut wrote:
>> On 9/29/25 11:57 AM, Rain Yang wrote:
>>> On Mon, Sep 29, 2025 at 02:23:01AM +0200, Marek Vasut wrote:
>>>> On 9/26/25 7:57 AM, Peng Fan wrote:
>>>>
>>>> Hello Peng,
>>>>
>>>>> On Thu, Sep 25, 2025 at 10:38:31PM +0200, Marek Vasut wrote:
>>>>>> The instance of the GPU populated in i.MX95 is the G310, describe this
>>>>>> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>>>>>>
>>>>>>
>>>>>> +		gpu: gpu@4d900000 {
>>>>>> +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>>>>>> +			reg = <0 0x4d900000 0 0x480000>;
>>>>>> +			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>>>>>> +			clock-names = "core", "coregroup";
>>>>>> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>>>>>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>>>>>> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
>>>>>> +			interrupt-names = "job", "mmu", "gpu";
>>>>>> +			mali-supply = <&gpu_fixed_reg>;
>>>>>> +			operating-points-v2 = <&gpu_opp_table>;
>>>>>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>>>>>> +			#cooling-cells = <2>;
>>>>>> +			dynamic-power-coefficient = <1013>;
>>>>>
>>>>> Sorry for my ignorance, would you please share how to get the value?
>>>> Copy-pasted from NXP downstream kernel fork DT bindings, see:
>>>>
>>>> https://github.com/nxp-imx/linux-imx.git
>>>>
>>>> 11495de7c24a ("MGS-7621-4 dts: gpu: update devfreq para")
>>> Hi Marek,
>>>
>>> 1. this "mali: gpu@4d900000" label can be found in this commit you showed.
>>> please correct this to be compatible with the downstream
>>
>> No, sorry, that's not how it works. Upstream is not being adjusted to match
>> decisions made by downstream kernel forks unless there is a good rationale
>> for such a change. "Downstream does this" is not a good one. (*)
>>
>>> and upstream kernel
>>
>> All of imx*.dts* use gpu: or gpu2d:/gpu3d:/vpuvg: for the GPU label.
>> Also, variants of gpu: label seems more popular:
>>
>> linux$ grep -hro '[a-z0-9_]\+: gpu@' arch/ | sort | uniq -c
>>       3 adreno_gpu: gpu@
>>       1 bb2d: gpu@
>>       1 gpu2d: gpu@
>>       1 gpu3d: gpu@
>>      80 gpu: gpu@
>>       4 gpu_2d: gpu@
>>       1 gpu_3d0: gpu@
>>       4 gpu_3d: gpu@
>>       6 gpu_mem: gpu@
>>       1 gpu_reserved: gpu@
>>       2 gpu_vg: gpu@
>>      17 mali: gpu@
>>       1 v3d: gpu@
>>       2 zap_shader_region: gpu@
>>
> 
> Existence does not necessarily imply validity. Since a single SoC may contain
> multiple GPUs, it's generally better to use the specific GPU name as a label
> rather than simply using 'gpu', to avoid potential conflicts.

Does the MX95 contain multiple GPUs ?

If no, then the statement above does not apply.

If yes, then there is the gpu/gpu2d/gpu3d option.

>>> 2. the compatible string is different from our downstream kernel,
>>
>> See above (*)
> Additionally, there are still some performance differences between the upstream
> driver and the Mali property driver. If compatibility with both can be achieved,
> it would allow users to choose the driver that best suits their needs.
> Personally, I find it convenient to switch between the two drivers using insmod
> and rmmod, which allows for quick testing and comparison.

Update the downstream fork to match upstream bindings, not the other way 
around.

>>> also you dropped the "nxp,imx95-mali" compatible patch in the panthor
>>> driver, why?
>>
>> Because it is unnecessary, the generic compatible string is sufficient for
>> the in-tree kernel driver.
>>
>>> this will impact the mali property driver too, which
>>> has already been used in many customer project.
>>
>> See above (*)
>>
>> All the more reason to focus on upstream and avoid deployment of various
>> downstream components, blobs and so on. They cannot be maintained in the long
>> run, they break, and cause all kinds of maintenance problems.
>>
>> Upstream cannot be hindered by downstream blobs and their issues, sorry.
>>
>>> 3. the number of frequency in opp-table is only one, but there are two clocks
>>> in clocks property, this really make people confused.
>>> CLK/CLK_COREGROUP/CLK_STACK in i.MX95 are from the same source
>>> <&scmi_clk IMX95_CLK_GPU>, the other clock <&scmi_clk IMX95_CLK_GPUAPB>
>>> is always-on APB clock, which can't be changed by A-cores, and has been removed
>>> from clocks property in the latest release.
>>
>> Can the APB clock be enabled/disabled from Linux, e.g. to save power ?
> 
> please note that the APB clock can't be turned off on the A-core.

I think if the clock are connected to the GPU, then they should be 
described in the DT.

