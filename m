Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C09D73E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 18:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lRzH7QAiFYOeBmG/MVJQPf/49vFBSG+OS78kbsM7dE=; b=1U73G5msp9tPI7OzY4AWfg+LW1
	MqH9jgoLWCsbhJkO2UPZNa0edt2Yu47BsR6jeLIVBnp7V07LAovQShSJOWJLmZfW09F7DTi0RAqfQ
	HTfm3kcMxCUOQuHskDw8FcyQzFETaahd+mxN0CcgmYNHD18X88D7MuHbWT2gyfiArcndGEBfIpSkO
	vQqbxou3XoDXMeMOTiIu7RRpa93pPCoK1yl1W/PSLUBWNDwYYIZkDziU8Ma4zUojM+f1AoDgUeqWk
	LC0qmfE0TsfPJgeEcxSgvpByUysx67TN5RIjXuoE0fpWpdg46VdOo6IVViRWX56dWwtfB7E+O3kJb
	SvM+YgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWab-00000000V6z-2Qnk;
	Thu, 29 Jan 2026 18:17:57 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWaX-00000000V5O-0gue
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 18:17:56 +0000
Message-ID: <21a738e6-6585-4479-b797-f8b17df91aed@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769710668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lRzH7QAiFYOeBmG/MVJQPf/49vFBSG+OS78kbsM7dE=;
	b=DW04QRdUeCsRRMf8a+UY5VC1vJKvbo+F/VHNsuq41shG6z2AvXaJTO/9kspQEsFWxq0XLK
	JV9irS4h3qUCrOO6ZFAuYdyLq6AVclEput3bglQIayPTVNuKwOeZ5rA9XANw3yU26mdE7H
	EuLcGSEdSml5orP7NjN0WV+shsl/ZeE=
Date: Thu, 29 Jan 2026 13:17:45 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
To: Mark Brown <broonie@kernel.org>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 Takashi Iwai <tiwai@suse.com>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
 <700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
 <a95d7feb-4d94-4b25-be96-c7c367342c19@linux.dev>
 <a17602f1-537e-46e6-a85d-8a005a0443a2@sirena.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <a17602f1-537e-46e6-a85d-8a005a0443a2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_101753_670897_21335C2D 
X-CRM114-Status: GOOD (  22.36  )
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

On 1/29/26 13:09, Mark Brown wrote:
> On Thu, Jan 29, 2026 at 12:46:27PM -0500, Sean Anderson wrote:
>> On 1/29/26 12:27, Mark Brown wrote:
>> > On Thu, Jan 29, 2026 at 12:23:15PM -0500, Sean Anderson wrote:
> 
>> >> -	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
> 
>> >> -	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
> 
>> > Given that the properties already exist it seems wise to continue to
>> > parse them if available and prefer them over what we read from the
>> > hardware, it would not shock me to discover that hardware exists where
>> > the registers are inaccurate or need overriding due to bugs.
> 
>> I would be surprised if such hardware exists. These properties are
>> automatically generated by Xilinx's tools based on the HDL core's
>> properties. This has a few consequences:
> 
>> - They always exactly match the hardware unless someone has gone in and
>>   modified them. I think this is unlikely in this case because they
>>   directly reflect parameters that should not need to be adjusted.
>> - Driver authors tend to use them even when there are hardware registers
>>   available with the same information, as Xilinx has not always been
>>   consistent in adding such registers.
> 
> I'm not sure I follow your second point - driver authors tend to use
> what?  

Authors look at the devicetree node and see something like 

	i2s0_tx: i2s_transmitter@80120000 {
		aud_mclk = <99999001>;
		clock-names = "aud_mclk", "s_axi_ctrl_aclk", "s_axis_aud_aclk";
		clocks = <&zynqmp_clk 74>, <&zynqmp_clk 71>, <&zynqmp_clk 71>;
		compatible = "xlnx,i2s-transmitter-1.0", "xlnx,i2s-transmitter-1.0";
		interrupt-names = "irq";
		interrupt-parent = <&gic>;
		interrupts = <0 105 4>;
		reg = <0x0 0x80120000 0x0 0x10000>;
		xlnx,depth = <0x80>;
		xlnx,dwidth = <0x18>;
		xlnx,num-channels = <0x1>;
		xlnx,snd-pcm = <&i2s0_dma>;
	};

and go "Ah, there are the properties I need." On some Xilinx cores this
is the only way to discover certain properties, so people have gotten into
the habit of using them even when these properties can be read from the
device itself.

>> I am not aware of any errata regarding incorrect generation of
>> properties for this device or cases where the number of channels or bit
>> depth was incorrect.
> 
> I'd still rather see the properties get used if present, worst case
> they're redundant best case we avoid regressing a currently working
> system.  The code is already there, it just needs tweaking to make parse
> failures non-fatal.

I would rather remove it for the code size reduction and simplication.

--Sean

