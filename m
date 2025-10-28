Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66195CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 11:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2mscf8leSzJwhOu2M/nnAE9gaYBbj3LyHdaS1gioCE=; b=OvwDlXoPtPctQzaEfCFbIh+bt1
	y2U/blY9xCjlbhAhXJTIkwMalZhbeKmmGJw03p9hA5alLZZ7wFs5lGC696iLdla2Hys5V22WQZXED
	owteuvFs3qrMDV84uTHvuvM1No+5rlEgIvnvWFtrdH/sGJWFIN5w4lRE3WxKX2Cqkop3yj4mqqVVy
	TrB1uKe1xCO5x9ujVulJhX8gml90mm5OKIofRJoK1VYJj+1wA7Fgv3A9lExddQ6R5k1jGNwGB8ovq
	9oocKLBUEmIe0kSwbsvxZXBYFzZtP24phGMqTWcB1GEFU6Tb3LNAR2f+RMvCbhCBPg+Dg2mGBiZuN
	BxWDtmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhWY-0000000Fodn-3XB2;
	Tue, 28 Oct 2025 11:06:00 +0000
Received: from mail-m32122.qiye.163.com ([220.197.32.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhWV-0000000Fod6-2tmh;
	Tue, 28 Oct 2025 11:05:57 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 277c22857;
	Tue, 28 Oct 2025 19:05:48 +0800 (GMT+08:00)
Message-ID: <2822bc51-2c3c-423c-8777-af52c5f0da95@rock-chips.com>
Date: Tue, 28 Oct 2025 19:05:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] counter: Add rockchip-pwm-capture driver
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>
Cc: kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20251027-rk3576-pwm-v3-0-654a5cb1e3f8@collabora.com>
 <20251027-rk3576-pwm-v3-4-654a5cb1e3f8@collabora.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20251027-rk3576-pwm-v3-4-654a5cb1e3f8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a2a7edc5f03a3kunmddd3695f160f5d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx5MSFZLSxhPSUoeTEtCSR9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bEruiZnB71xueUYJgaoCvzPxOfhsvA5KMVFq3QVee2vR0a5M2oLjHIWURnA/KnjEX9jELibw9sz3H5zs3QUAKS3dU3FwLNfzzqsk82FV+DOfPAz3rdWepdDZtXXg60FUw2P43lkXid+u9eveq7Kj7mQl/CrSQs3xG3yIg/CtrBw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=K2mscf8leSzJwhOu2M/nnAE9gaYBbj3LyHdaS1gioCE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_040556_210736_5EC535D2 
X-CRM114-Status: GOOD (  15.69  )
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

Hi Nicolas,

On 10/28/2025 1:11 AM, Nicolas Frattaroli wrote:
> Among many other things, Rockchip's new PWMv4 IP in the RK3576 supports
> PWM capture functionality.
> 
> Add a basic driver for this that works to expose HPC/LPC counts and
> state change events to userspace through the counter framework. It's
> quite basic, but works well enough to demonstrate the device function
> exclusion stuff that mfpwm does, in order to eventually support all the
> functions of this device in drivers within their appropriate subsystems,
> without them interfering with each other.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

......

> +
> +/*
> + * Channel 0 receives a state changed notification whenever the LPC interrupt
> + * fires.
> + *
> + * Channel 1 receives a state changed notification whenever the HPC interrupt
> + * fires.
> + */
> +static struct counter_signal rkpwmc_signals[] = {
> +	{
> +		.id = 0,
> +		.name = "Channel 0"
> +	},
> +	{
> +		.id = 1,
> +		.name = "Channel 1"
> +	},
> +};
> +
> +static const enum counter_synapse_action rkpwmc_hpc_lpc_actions[] = {
> +	COUNTER_SYNAPSE_ACTION_BOTH_EDGES,
> +

Redundant blank line. ;-)

If the dclk cycle is regarded as the 'input signal', then the HPC/LPC 
counters should be COUNTER_SYNAPSE_ACTION_BOTH_EDGES.

If to deal with the interrupt for HPC or LPC, the LPC interrupt occurs 
in several pclk cycles after the rising edge while the HPC interrupt is 
generated similarly after the falling edge. Shall we distinguish the 
synapses between LPC and HPC? LPC is COUNTER_SYNAPSE_ACTION_RISING_EDGE 
and HPC is COUNTER_SYNAPSE_ACTION_FALLING_EDGE.

> +};
> +
> +static struct counter_synapse rkpwmc_pwm_synapses[] = {
> +	{
> +		.actions_list = rkpwmc_hpc_lpc_actions,
> +		.num_actions = ARRAY_SIZE(rkpwmc_hpc_lpc_actions),
> +		.signal = &rkpwmc_signals[0]
> +	},
> +	{
> +		.actions_list = rkpwmc_hpc_lpc_actions,
> +		.num_actions = ARRAY_SIZE(rkpwmc_hpc_lpc_actions),
> +		.signal = &rkpwmc_signals[1]
> +	},
> +};
> +
> +static const enum counter_function rkpwmc_functions[] = {
> +	COUNTER_FUNCTION_INCREASE,
> +};
> +

......

> +
> +static struct counter_comp rkpwmc_ext[] = {
> +	COUNTER_COMP_ENABLE(rkpwmc_enable_read, rkpwmc_enable_write),
> +};
> +
> +enum rkpwmc_count_id {
> +	COUNT_LPC = 0,
> +	COUNT_HPC = 1,
> +};
> +
> +static struct counter_count rkpwmc_counts[] = {
> +	{
> +		.id = COUNT_LPC,
> +		.name = "PWM core clock cycles during which the signal was low",
> +		.functions_list = rkpwmc_functions,
> +		.num_functions = ARRAY_SIZE(rkpwmc_functions),
> +		.synapses = rkpwmc_pwm_synapses,
> +		.num_synapses = ARRAY_SIZE(rkpwmc_pwm_synapses),
> +		.ext = rkpwmc_ext,
> +		.num_ext = ARRAY_SIZE(rkpwmc_ext),
> +	},
> +	{
> +		.id = COUNT_HPC,
> +		.name = "PWM core clock cycles during which the signal was high",
> +		.functions_list = rkpwmc_functions,
> +		.num_functions = ARRAY_SIZE(rkpwmc_functions),
> +		.synapses = rkpwmc_pwm_synapses,
> +		.num_synapses = ARRAY_SIZE(rkpwmc_pwm_synapses),
> +		.ext = rkpwmc_ext,
> +		.num_ext = ARRAY_SIZE(rkpwmc_ext),
> +	},
> +};
> +
> 

Additionally, I test the capture by connecting pwm0_ch0 and pwm2_ch0, 
and the capture results are correct.

I think the counter/frequency meter/biphasic counter functions can also 
be adapted to the counter framework. And they will be available soon in 
the future. :-)

Best regards,
Damon


