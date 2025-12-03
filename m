Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D2ED1CDAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 23:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gEmKkhVK421TyvMrvWJGjeYvv2qNyDYjC6lx7wWY18=; b=OyAIH2qpm96Y/n55b9+ykU4+X6
	0YKHzK1WMgXUwQ2fpqm9GCUacLHmBw4mYvgeeZ8R5D7xfrTxH8WHxVWSZaNA5H5DlWWObUGUmDxLp
	h+vE3RdV1GgpudyLSPtRTy552jQy3MJYgz+pNx2P2LB902iP9Dtca7GCQ7XxIcgXMAvKeON5SA+Kv
	SmL5fVdKh/kiQ6ww4auyBhb34q3ETGHAS1WluNJFuvhm+oWc/t5KOIqkpmWBEH5ZKSPmOTqe2FbCg
	FKalunIix7DNmnlx6c2pLxN3ZROlv5pCEJz4MNxVQXho6MaLHGzOjwjmtaRvF3MAikCq/09T1U77M
	z8Ca9iqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQvxK-00000007EyR-2fVo;
	Wed, 03 Dec 2025 23:08:18 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQvxH-00000007ExM-2uVm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 23:08:17 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dMCwn3nFNz9tnn;
	Thu,  4 Dec 2025 00:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764803289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8gEmKkhVK421TyvMrvWJGjeYvv2qNyDYjC6lx7wWY18=;
	b=VpMFyK5q3opOJnqH7oSxeMkXt6VHMr3WNJ9AOdZ8jrb3iH04MagrYh2cB/UqvCDbnTUClm
	Mu9LWpPidDiVQDa2kubdUAz412xEr90Kr8U6R2FT+ZzYe6hbswGSq/zBSf5JgppyOIA4P4
	SsxF52X4m89bgWJ4FkD7/ui/X5lGUPMvQaFXEYcxIngpn1RDcHhcMGiYAIW7hKx9buHHyX
	bIMfX+JxQxSeEZZeyviJWGj6zROn4SRpCtubiDST1d8otCttpdk3j4StHR6fF5+dUU1MBP
	H77IRiR7G7FlHzT9aecavDkED3bg5EQw8hGZAPoNGGiLzq0fKJyNYwqDAnIkSw==
Message-ID: <4ccbcffd-bcc7-478b-a525-a4a11e3092ee@mailbox.org>
Date: Wed, 3 Dec 2025 23:53:41 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto> <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
 <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org> <aRW7BZimWdpq4TyX@pluto>
 <20251202-evasive-neon-rhino-d2745e@sudeepholla>
 <66257fcf-9024-454f-b776-4ba584963ebe@mailbox.org> <aS82GSN8c2SnRn4S@bogus>
 <8d773671-5e2e-4e21-ade6-2bf9a3b75066@mailbox.org>
 <20251203-thick-didactic-cockatoo-deaa1d@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251203-thick-didactic-cockatoo-deaa1d@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d99e4e4bccb195f124e
X-MBO-RS-META: axhwhoadnqfeqnn1a5gg7nu48548oqju
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_150815_884772_EFB3C0AD 
X-CRM114-Status: GOOD (  36.99  )
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

On 12/3/25 12:41 PM, Sudeep Holla wrote:

Hello Sudeep,

>>> Consider a system where a mailbox controller is present and one channel is
>>> used for SCMI communication, while another channel is used for an unrelated
>>> purpose. If both channels share the same interrupt line, and the other use
>>> case enables interrupt mode on its channel, what would be the impact on the
>>> SCMI-specific channel?
>>
>> None, SCMI kernel driver and SCMI server side would still do polling on
>> their respective SHMEM areas, while whatever kernel driver needs to receive
>> the interrupt notifications would subscribe to them using request_irq(),
>> right ?
>>
> 
> Fair enough. I was thinking if the controller manages to not call
> mbox_chan_received_data() in that case.

Wouldn't such a setup use separate mailbox channels , therefore even if 
mailbox driver calls mbox_chan_received_data(), it would be called for a 
specific mailbox channel , and it won't interfere with the SCMI mailbox 
channel.

> Also IIUC, the irq request happens
> as part of channel startup and there are no explicit APIs for the mbox client
> driver to control that. SCMI is mbox client in this case.

Sure, but the mailbox driver has to make sure it is correctly demuxing 
the IRQs it handles and correctly sends received_data notifications to 
the right channel(s) .

>>> I am aware of systems that implement such sharing, which is why I prefer to be
>>> explicit that this type of design is challenging to support within this
>>> binding. The intent is to support only minimal, constrained cases - essentially
>>> systems that are already somewhat broken. I do not see value in broadening the
>>> binding to cover every conceivable scenario.
>>>
>>>>> Clearly defining these constraints would be helpful. It may also be useful to
>>>>> note that this is primarily intended for mailbox transports, if that’s
>>>>> accurate. Alternatively, we could keep the DT binding definition broader but
>>>>> emit warnings when a transport other than mailbox is used. That approach might
>>>>> make it easier to move forward.
>>>>
>>>> DEN0056F refers to this polling mode in Shared memory based transports, that
>>>> can be other than mailbox transports, it includes e.g. SMC or OPTEE
>>>> transports.
>>>>
>>>
>>> However, polling does not make sense in the context of SMC. Once control
>>> returns from an SMC call, the command has completed. What form of polling in
>>> an SMC workflow do you have in mind?
>>
>> I think the polling happens on the SHMEM and the SMC transport is capable of
>> that too, see :
>>
>> drivers/firmware/arm_scmi/transports/smc.c
>>
>> 175         /*
>> 176          * If there is an interrupt named "a2p", then the service and
>> 177          * completion of a message is signaled by an interrupt rather
>> than by
>> 178          * the return of the SMC call.
>> 179          */
>> 180         scmi_info->irq = of_irq_get_byname(cdev->of_node, "a2p");
>>
> 
> Ah this one, is actually implemented to avoid sort of implicit polling
> mode we get with any SMC/HVC. I don't know how the platform deals with it
> but SMC/HVC is synchronous and doesn't need this polling. The irq introduced
> here is again a sort of workaround to get some sort of async/non-polling
> mode with SMC/HVC. So, to repeat polling mode make absolutely no sense
> whatsoever for SMC/OPTEE(based on pure SMC) transports.

I can drop the SMC part from this patch if you think that's helpful ?

>>> I believe the same applies to OP-TEE.
>>> While OP-TEE now provides a notification mechanism that could, in theory,
>>> allow synchronous commands to be treated in a quasi-asynchronous manner, I
>>> strongly doubt that the current SCMI-over-OP-TEE implementation behaves this
>>> way, given that it ultimately reaches the secure side via an SMC call.
>>>
>>>> I don't think a warning is justified, if the behavior follows the
>>>> specification. But I do agree the behavior is ... suboptimal.
>>>>
>>>
>>> The specification does not address SMC or OP-TEE transports, placing them
>>> outside its scope and likewise these DT bindings.
>>
>> I believe the shmem transport includes the SMC and OPTEE ones, right ?
>>
> 
> Yes, but the expectation when the SMC completes is to have the shmem to be
> owned by the OS(except that irq workaround case). Again the OPTEE/SMC is
> completely out of spec, but I agree the SHMEM behaviour must conform to the
> specification.

OK

>>> Consequently, what we
>>> decide here in this discussion effectively defines the expected behavior in
>>> this context, in my view. So I would like to start with minimal possible
>>> coverage, why do you think that is not a good idea here ?
>>
>> I would argue the current implementation covers pretty much every transport
>> which could ever need to do polling on shmem, so the implementation is
>> generic and inline with the specification. Also, the current implementation
>> is some 20 lines, so I think it is minimalistic?
>>
>> What would you propose we do here ?
>>
> 
> Yes it can be minimalistic but not restrictive. As I already clearly mentioned
> I don't see it makes any sense to enable this for SMC/OPTEE. Lets start with
> just mailbox to start with and extend to other transports if and when needed.
> It would be good to impose that restriction in the binding as well but that
> is not a must IMO. I am fine if the bindings for whatever reasons(though I
> don't see the need) to apply for any transport.
So I should simply drop the smc.c changes , keep the rest, and send V2 ?

