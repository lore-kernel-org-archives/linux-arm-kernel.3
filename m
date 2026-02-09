Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF227E81BDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 16:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mheOQ3ZsEitKxTfDWvElUu/CWXpGhuWicvtisrl9azA=; b=WRFZi6Nk6axdfRzDxkjYyPKjga
	/eyONPu6GyCo9dGu/ojPD0JDrjko946Ohz63fV5d0yCAlgjvil1RBy9JQgZ5dgiaP9AMN0Zvus9ex
	EY1mzjKJMe/d4kCkFNtS41TLdS8m5y046l2Rizo5ZoNBn4Cr3FwUWvZ9pAZEFDZmzfbgiHdWVajbU
	0M9hCCJ6cbhMBW0NoIx6oW225MDjtZe09xk+8JHSthb14wo9ddUdooQ3S1p7z1d7tgiFUAT4uWYJi
	3v0Bv7kClXjQyNOobztYv9n+i+/6Bu3911W0YmzFqPcc7e7DIYwF52BMQpKZIF8CTlw/1yHRRVQ1z
	SKfkYe8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTzj-0000000Ffyp-2wmV;
	Mon, 09 Feb 2026 16:20:15 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTzh-0000000Ffxu-0bSB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 16:20:14 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f8qfb4c8Zz9vGT;
	Mon,  9 Feb 2026 17:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770654007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mheOQ3ZsEitKxTfDWvElUu/CWXpGhuWicvtisrl9azA=;
	b=ToSjreamnbDhZ+ckfkQfh7To3b50S/SvtMGUmX6pm93aFO5cwtHPAEq7Ts5dgluYhbTY8Y
	2VxCSwxAGp94nVVd6Q+p02EU/8sLw31Ab7k0aqRGo4ggkVrjTloPJ09KSG4aKovphv1EJ8
	GN8KZs0gOGr6PjHPSWBGQRYVPt2aRQdEH+uIRtA0YllZIqxGGHR5agfsl28sxLnnphgDwD
	fYPtmrY/owxlbA0RD+VFvGFC9i/TCJckbK9WFQPAkIHrB2r4CxBbO2trjLpxXXtD+QimS4
	gRDm8THR4YWrIHq50fdTUfChWdPvq9Z7W9te2KaiFVuVtMilnD6z8ZvXiLt8Eg==
Message-ID: <6ba32e90-9db9-49ab-886b-966e0aa171c4@mailbox.org>
Date: Mon, 9 Feb 2026 17:19:59 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
 <aW5ifVcxVf6uux3m@pluto> <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
 <20260209-quixotic-offbeat-stork-f1d310@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260209-quixotic-offbeat-stork-f1d310@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: e1q3d1hmpyss1sw191f8k6td7mfr1fpp
X-MBO-RS-ID: aff92f44e05a52bfbda
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_082013_341981_B359C836 
X-CRM114-Status: GOOD (  19.58  )
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

On 2/9/26 4:44 PM, Sudeep Holla wrote:
> On Mon, Feb 09, 2026 at 11:53:19AM +0100, Marek Vasut wrote:
>> On 1/19/26 5:57 PM, Cristian Marussi wrote:
>>> On Sat, Jan 17, 2026 at 02:02:29AM +0100, Marek Vasut wrote:
>>>> Implement new property arm,no-completion-irq, which sets all SCMI
>>>> operation into poll mode. This is meant to work around uncooperative
>>>> SCP implementations, which do not generate completion interrupts.
>>>> This applies to mbox/shmem based implementations.
>>>>
>>>> With this property set, such implementations which do not generate
>>>> interrupts can be interacted with, until they are fixed to generate
>>>> interrupts properly.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> ---
>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>> Cc: Cristian Marussi <cristian.marussi@arm.com>
>>>> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>>>> Cc: arm-scmi@vger.kernel.org
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>> V2: Drop no IRQ handling from SMC transport and update commit message
>>>> V3: Rename property from arm,poll-transport to arm,no-completion-irq
>>>> V4: No change
>>>> ---
>>>>    drivers/firmware/arm_scmi/common.h | 4 ++++
>>>>    drivers/firmware/arm_scmi/driver.c | 4 ++++
>>>>    2 files changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
>>>> index 7c35c95fddbaf..7c9617d080a02 100644
>>>> --- a/drivers/firmware/arm_scmi/common.h
>>>> +++ b/drivers/firmware/arm_scmi/common.h
>>>> @@ -235,6 +235,9 @@ struct scmi_transport_ops {
>>>>     *		      to have an execution latency lesser-equal to the threshold
>>>>     *		      should be considered for atomic mode operation: such
>>>>     *		      decision is finally left up to the SCMI drivers.
>>>> + * @no_completion_irq: Flag to indicate that this transport has no completion
>>>> + *		       interrupt and has to be polled. This is similar to the
>>>> + *		       force_polling below, except this is set via DT property.
>>>>     * @force_polling: Flag to force this whole transport to use SCMI core polling
>>>>     *		   mechanism instead of completion interrupts even if available.
>>>>     * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
>>>> @@ -254,6 +257,7 @@ struct scmi_desc {
>>>>    	int max_msg;
>>>>    	int max_msg_size;
>>>>    	unsigned int atomic_threshold;
>>>> +	bool no_completion_irq;
>>>>    	const bool force_polling;
>>>>    	const bool sync_cmds_completed_on_ret;
>>>>    	const bool atomic_enabled;
>>>> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
>>>> index 3e76a3204ba4f..f167194f7cf67 100644
>>>> --- a/drivers/firmware/arm_scmi/driver.c
>>>> +++ b/drivers/firmware/arm_scmi/driver.c
>>>> @@ -2735,6 +2735,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
>>>>    	cinfo->is_p2a = !tx;
>>>>    	cinfo->rx_timeout_ms = info->desc->max_rx_timeout_ms;
>>>>    	cinfo->max_msg_size = info->desc->max_msg_size;
>>>> +	cinfo->no_completion_irq = info->desc->no_completion_irq;
>>>>    	/* Create a unique name for this transport device */
>>>>    	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
>>>> @@ -3150,6 +3151,9 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
>>>>    	if (ret && ret != -EINVAL)
>>>>    		dev_err(dev, "Malformed arm,max-msg DT property.\n");
>>>> +	trans->desc.no_completion_irq = of_property_read_bool(dev->of_node,
>>>> +							      "arm,no-completion-irq");
>>>> +
>>>>    	dev_info(dev,
>>>>    		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
>>>>    		 trans->desc.max_rx_timeout_ms, trans->desc.max_msg_size,
>>>
>>> LGTM.
>>>
>>> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
>>
>> Is there anything left to do with these patches, or can this now be picked
>> up ?
>>
> 
> As I had mentioned here[1], I am happy with it and I will pick it up for
> v7.1 once I start collecting the patches after v7.0-rc1. It just came in after
> I had sent my PR to SoC team for v7.0
OK, thank you

