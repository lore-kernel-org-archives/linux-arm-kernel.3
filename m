Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F47C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 20:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U90M64wanQBRNx694B4RGMPnnsdcEJHHduiDNodL1WM=; b=OPhB+1lYwFE9xnVKaflBuQM5iS
	DpwdMoHoEX7VFbbYz/9M0sj/q0M2CEQvwFCyMJZ9YFbrvFHd1N9qa0FhFUf+om3sJ5Du0XjzVqzBk
	GDClhZ2k1i21xYd+ESBE65MAfhGt3PDf1yoXL47ib+pUksVc76P/r1DOWhfv/vZFTx241Wagzjeqc
	jrpoGoywCdywAA6ZDQhaaFgvW3YlbRXJgR7aoWlh1Sx6tDbiLDaDvAYNRNPfwbXOF+HUQ/wdGbRAP
	3aIgtDLhz441w59DHZu3PeIH7n4zkr3fPVJHihz9fuxcO3E6cckcQBdEPWX/cOak5o9dyO2bb+cND
	/UVo95tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkkk-00000008oSo-2qlG;
	Thu, 27 Feb 2025 20:45:06 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkgE-00000008njj-13tD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 20:40:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C72FD10382F1E;
	Thu, 27 Feb 2025 21:40:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740688824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U90M64wanQBRNx694B4RGMPnnsdcEJHHduiDNodL1WM=;
	b=ODfjWdrg/29QzHE2GphsPmlrRX9T153PAfrgZEC0s4SW0vaze/i4riJufy0qeFsizqr7gB
	A1irk/W+dypV3LCKQRbarT1b7qFr8mkZYkAJ3p0COwJurysVAH9XA56HLsUDYYL3262K+R
	LdtF+h/r6TqytM8Flz9iaB/4N9LLKWCxZBZG90OaHXCp7UMZPnG+j4Oq02iTf+hoOH7Hhg
	IdoPkSVFa4OUQJ9YKcBBP/mDR7NLVcti/DBAYKi/6u8YRpdvn6FnQRdNJ9Cs8vjkUVy9i0
	pKi/FL4yxqLP5LJTxYcx+oMuk92ZZ+dZLyIZGXaOSdnMOdeP990ydQ8KnAmapg==
Message-ID: <d41c9cf5-9ec4-4b9a-b281-653873fb8df0@denx.de>
Date: Thu, 27 Feb 2025 21:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Frank Li <Frank.li@nxp.com>
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
 <20250227170012.124768-10-marex@denx.de>
 <Z8CkSUry5puMu6Mx@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z8CkSUry5puMu6Mx@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_124026_438032_DD6FF492 
X-CRM114-Status: GOOD (  12.75  )
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

On 2/27/25 6:43 PM, Frank Li wrote:
[...]

>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 3af13173de4bd..36bad211e5558 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -249,6 +249,37 @@ dummy: clock-dummy {
>>   		clock-output-names = "dummy";
>>   	};
>>
>> +	gpu_fixed_reg: fixed-gpu-reg {
>> +		compatible = "regulator-fixed";
>> +		regulator-min-microvolt = <920000>;
>> +		regulator-max-microvolt = <920000>;
>> +		regulator-name = "vdd_gpu";
>> +		regulator-always-on;
>> +		regulator-boot-on;
> 
> Does really need regulator-boot-on and regulator-always-on ?

I don't think so, this is a development remnant, fixed, thanks.

[...]

>> +		gpu: gpu@4d900000 {
>> +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
>> +			reg = <0 0x4d900000 0 0x480000>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPU>;
>> +			clock-names = "core";
>> +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "gpu", "job", "mmu";
>> +			mali-supply = <&gpu_fixed_reg>;
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_GPU>;
>> +			power-domain-names = "mix", "perf";
>> +			resets = <&gpu_blk_ctrl 0>;
>> +			#cooling-cells = <2>;
>> +			dynamic-power-coefficient = <1013>;
>> +			status = "disabled";
> 
> GPU is internal module, which have not much dependence with other module
> such as pinmux. why not default status is "disabled". Supposed gpu driver
> will turn off clock and power if not used.
My thinking was that there are MX95 SoC with GPU fused off, hence it is 
better to keep the GPU disabled in DT by default. But I can also keep it 
enabled and the few boards which do not have MX95 SoC with GPU can 
explicitly disable it in board DT.

What do you think ?

