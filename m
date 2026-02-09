Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A150E7E0C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zydFrzJH+96vd0MZWYoBxPrLaZzn7gyZbiDZtRmiFmw=; b=cTpe80WsvYttASE0ZJMnn3kEUD
	iXqm/4RxwDeZ4EdGN+OU8paySEdVU2GUdhiycioi2WA0yLjC5eBGl0MyfXZd2LG9vEzm2ArUq0ns2
	0XfI6ZcbjXuaDqtVZK4t9jXC3lv6yUl6Uffs0sB76/yCTfX4q2LKUpXZTyeZun2PXAGt0satakfaI
	oYep0JoePAF8/Na2LBrD5jw+Y7jISw3uPd5/bV7OmQdnuJo+zTIZS3lNzpy8eGbcF7Pm4vBsaCNJE
	wD7Kvk4qSTyiIMmvU+0dtylIN30QF9Inu6TwBI2xFqdRznXJZyICdW9GvaCEpTLIsi4I1KgLPVwaE
	bNa5Q1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOth-0000000FGG5-0YP6;
	Mon, 09 Feb 2026 10:53:41 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOtd-0000000FGFd-42vz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 10:53:39 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f8hPb5V7kz9thJ;
	Mon,  9 Feb 2026 11:53:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770634403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zydFrzJH+96vd0MZWYoBxPrLaZzn7gyZbiDZtRmiFmw=;
	b=uZQEmMMnqu+KKkZ6j/RoqENlHAYih92qjoTX2RaoOITAcMDFjc6Cln1dOivYcTvBwCo7Bx
	/b2FwwI4Ib4T7smuNHNINr6GWzQXiRHenm3gDr52is6xKWqgnc53uE3ve6WudEEU/mbY7d
	Wl75V0PZ4Mr53AD2oOnPvtMWnzskEdg3cby0JXhUQeZrXKayveXIz38/GYTpkK3rE4aEhs
	NEaUbUZA9WNyf2DYt+1AgsV5FS6lm3Sb5lQuMy38SKERsrDTTUnabxV57I1YS+Tg8JHtlo
	BFjD9OR+i411hQmxi436AgQqspwEZLlfOgLNLjJE+abCbisNU7+UVI9O8nxvVg==
Message-ID: <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
Date: Mon, 9 Feb 2026 11:53:19 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
To: Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
 <aW5ifVcxVf6uux3m@pluto>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aW5ifVcxVf6uux3m@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: cbaba4dbcdf869d6e0d
X-MBO-RS-META: wetqpb4rrqtabw7urz9ywxbqnbzbkuq4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_025338_215822_073CC0EF 
X-CRM114-Status: GOOD (  19.54  )
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

On 1/19/26 5:57 PM, Cristian Marussi wrote:
> On Sat, Jan 17, 2026 at 02:02:29AM +0100, Marek Vasut wrote:
>> Implement new property arm,no-completion-irq, which sets all SCMI
>> operation into poll mode. This is meant to work around uncooperative
>> SCP implementations, which do not generate completion interrupts.
>> This applies to mbox/shmem based implementations.
>>
>> With this property set, such implementations which do not generate
>> interrupts can be interacted with, until they are fixed to generate
>> interrupts properly.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Cristian Marussi <cristian.marussi@arm.com>
>> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>> Cc: arm-scmi@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: Drop no IRQ handling from SMC transport and update commit message
>> V3: Rename property from arm,poll-transport to arm,no-completion-irq
>> V4: No change
>> ---
>>   drivers/firmware/arm_scmi/common.h | 4 ++++
>>   drivers/firmware/arm_scmi/driver.c | 4 ++++
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
>> index 7c35c95fddbaf..7c9617d080a02 100644
>> --- a/drivers/firmware/arm_scmi/common.h
>> +++ b/drivers/firmware/arm_scmi/common.h
>> @@ -235,6 +235,9 @@ struct scmi_transport_ops {
>>    *		      to have an execution latency lesser-equal to the threshold
>>    *		      should be considered for atomic mode operation: such
>>    *		      decision is finally left up to the SCMI drivers.
>> + * @no_completion_irq: Flag to indicate that this transport has no completion
>> + *		       interrupt and has to be polled. This is similar to the
>> + *		       force_polling below, except this is set via DT property.
>>    * @force_polling: Flag to force this whole transport to use SCMI core polling
>>    *		   mechanism instead of completion interrupts even if available.
>>    * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
>> @@ -254,6 +257,7 @@ struct scmi_desc {
>>   	int max_msg;
>>   	int max_msg_size;
>>   	unsigned int atomic_threshold;
>> +	bool no_completion_irq;
>>   	const bool force_polling;
>>   	const bool sync_cmds_completed_on_ret;
>>   	const bool atomic_enabled;
>> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
>> index 3e76a3204ba4f..f167194f7cf67 100644
>> --- a/drivers/firmware/arm_scmi/driver.c
>> +++ b/drivers/firmware/arm_scmi/driver.c
>> @@ -2735,6 +2735,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
>>   	cinfo->is_p2a = !tx;
>>   	cinfo->rx_timeout_ms = info->desc->max_rx_timeout_ms;
>>   	cinfo->max_msg_size = info->desc->max_msg_size;
>> +	cinfo->no_completion_irq = info->desc->no_completion_irq;
>>   
>>   	/* Create a unique name for this transport device */
>>   	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
>> @@ -3150,6 +3151,9 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
>>   	if (ret && ret != -EINVAL)
>>   		dev_err(dev, "Malformed arm,max-msg DT property.\n");
>>   
>> +	trans->desc.no_completion_irq = of_property_read_bool(dev->of_node,
>> +							      "arm,no-completion-irq");
>> +
>>   	dev_info(dev,
>>   		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
>>   		 trans->desc.max_rx_timeout_ms, trans->desc.max_msg_size,
> 
> LGTM.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Is there anything left to do with these patches, or can this now be 
picked up ?

Thank you.

