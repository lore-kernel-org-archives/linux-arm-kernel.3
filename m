Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60B3C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtwTjTpw0Vr5sz6bdwu5/AqqBhdI7OSOUmgECWI+xPM=; b=hlM+AcJX8sNMxE89rENOiK0dKk
	dkbnWzmqEuUKCu/JLyLFTKniV0dYRUoSniDalmcF/df5OdFJ6VSBpwGfHtr+LWK0ws3KqMlvJyqq9
	dhOwLoHlqAIscQft4RvTY2c0ZlQBZ623r96ryCdk+VyfVaeYOoveurvK9bn6vGWSNCrbaUwCJ+2Ld
	TqJGWoi2Anpgy/Sno2vEvm1amZeQla2zAcI9Ii0O2+rHPjT/0nJrv0P3hEF040Gl8ABIc5f+bpuxI
	7cmZse2jiocGinh9Qe93i2Nqf0mK31x25HPds9+IDd14VaezuQsoxmJ1sU+zy9pnB2ZLYVN9DNaKU
	fq2aNBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Pv-0000000CEMS-3wKz;
	Fri, 28 Feb 2025 18:48:59 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to559-0000000C8O5-3yYz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:27:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED201102901CC;
	Fri, 28 Feb 2025 19:27:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UtwTjTpw0Vr5sz6bdwu5/AqqBhdI7OSOUmgECWI+xPM=;
	b=FwveDW+W0Zn4acPWayV/4P1UVN2P1khcGzVmkJVhGS101XEfdWPoOyh8+AG7WIaKam633t
	uDzHhOiDp0imrWhBZMmUREAaLwQdPgPKem8CyvX2T1ZrRDRe1Mh6UsbhOpxE7oH0udlcGc
	IIVEaPn8mfY+5hQHRP7W0n+D3mOSzEocFwefXjspugKDwozTtccc8HXC+FfAY5lxhPEmEw
	MTz7HZz5M7QuqPn20F3ZKC60ni935e0zwSsB3X1fyqFQFFaZUsTJAElVz15dHQATRW/48P
	IIyfxRvvG/LYHhzcD3AEZDxSs/4Onu5JlLRMjcv1dU5uTYt6gWvzKDdvxgC7dA==
Message-ID: <4a27b6bf-aca8-4f29-9561-609a42eb81a0@denx.de>
Date: Fri, 28 Feb 2025 18:43:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
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
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de> <2153305.bB369e8A3T@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2153305.bB369e8A3T@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_102732_140926_978D1F57 
X-CRM114-Status: GOOD (  13.48  )
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

On 2/28/25 11:36 AM, Alexander Stein wrote:
> Hi Marek,

Hi,

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
>> +	};
> 
> Is this an internal voltage?

I think so.

>> +
>> +	gpu_opp_table: opp_table {
> 
> Node-Names use dash instead of underscore.

Fixed, thanks.

[...]

>> @@ -1846,6 +1877,37 @@ netc_emdio: mdio@0,0 {
>>   			};
>>   		};
>>   
>> +		gpu_blk_ctrl: reset-controller@4d810000 {
>> +			compatible = "fsl,imx95-gpu-blk-ctrl";
>> +			reg = <0x0 0x4d810000 0x0 0xc>;
> 
> Mh, GPU_BLK_CTRL is /just a bit) more than the GPU reset. Does it make sense
> to make this an gpu-reset-only node, located at 0x4d810008?

The block controller itself is larger, it spans 3 or 4 registers, so 
this should describe the entire block controller here.

>> +			#reset-cells = <1>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
>> +			assigned-clock-rates = <133333333>;
>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>> +			status = "disabled";
>> +		};
>> +
>> +		gpu: gpu@4d900000 {
>> +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
>> +			reg = <0 0x4d900000 0 0x480000>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPU>;
> 
> There is also IMX95_CLK_GPUAPB. Is this only required for the rese control above?

I think I have to describe those clock here too, possibly as 'coregroup' 
clock ?

>> +			clock-names = "core";
>> +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "gpu", "job", "mmu";
> 
> DT bindings say this order: job, mmu, gpu
Yes, currently it is sorted by IRQ number, fixed.

