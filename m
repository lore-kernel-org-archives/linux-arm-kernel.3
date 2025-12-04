Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD5ED29FBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 19:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIJNFBhdSnffADZEOe9nQ4d4H4pvGzKjj8eclPnTyLE=; b=MTiTumVp3m4tH5hTEq3XL0FnPJ
	9ny9KOGxCFXeP9HRiC5go29EDcgQRJUNIdVaoeWDUH2mC+VhBobEKtbfVZCm2/ty1goekAG4+OvWt
	Tui0Gw9bNFHJTdaRBjBj8DWEJEcGXfeeV2nhu0aJ1456hSgh3LHFhJ9nY8ordpHFLrCkeEu4LjShl
	JHpFykD4vMyGJPay6oog+IQ+1t0M69pgqk3/X2HAN1GH4xXZP0/iJLm56XYg90ms3w1m0P1LLv2qk
	z6RUe4UiE319QDU8MVQUbUCHQSoB8dYAaWLb+0Yeka1SRpVo23YxDvGvpQ9AGJjxC0ZvwmKa5wLkg
	mS0n3xUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFMd-00000008Wpl-3ast;
	Thu, 04 Dec 2025 19:51:43 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFMb-00000008WpI-1hCm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 19:51:42 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dMlWX1Mw1z9tk3;
	Thu,  4 Dec 2025 20:51:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764877896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qIJNFBhdSnffADZEOe9nQ4d4H4pvGzKjj8eclPnTyLE=;
	b=xa5OYDPWg7TSWslcUL5t9YEKI6y1CzJ7cOiAAJLoJsnJlfPc9bVVNP+boKZzzKZSsgyzoT
	20+jI4OIcatib0EBjKzSYGmYk52wYDVd/SA/hLbY6Z3zXWLLto/fbyZaTROmCOheV/yVGg
	B5aXRF4JFTCKFeM0jGkoIVo2cupQ1YOaWPn8g7xC0SCLw19XedXx++xeIXIxPR/KjKjBsh
	/TdUN/CNXsQ6Ow2CAKfzgI8vPUprDERO3ltztQQy7ezrhULGwJFjcnqVhJ+JuE3W3xbXm5
	eM7lFkMZG1u1PHd5bCl6RE01PTstOI7CEDnTCFRxLSri7ckaNNiNCeKtf9CKSw==
Message-ID: <e25c690c-e74d-4641-a97e-8eae81a59168@mailbox.org>
Date: Thu, 4 Dec 2025 19:59:20 +0100
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
References: <aPoxfH_TLrsMxMVQ@pluto>
 <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
 <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org> <aRW7BZimWdpq4TyX@pluto>
 <20251202-evasive-neon-rhino-d2745e@sudeepholla>
 <66257fcf-9024-454f-b776-4ba584963ebe@mailbox.org> <aS82GSN8c2SnRn4S@bogus>
 <8d773671-5e2e-4e21-ade6-2bf9a3b75066@mailbox.org>
 <20251203-thick-didactic-cockatoo-deaa1d@sudeepholla>
 <4ccbcffd-bcc7-478b-a525-a4a11e3092ee@mailbox.org>
 <20251204-calm-peacock-of-fantasy-6b8cbe@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251204-calm-peacock-of-fantasy-6b8cbe@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4j81ge399yohgdmjy4u4eeezey8sorws
X-MBO-RS-ID: c95005d4a3fbe1596a5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_115141_617871_9B19916B 
X-CRM114-Status: GOOD (  34.52  )
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

On 12/4/25 1:33 PM, Sudeep Holla wrote:

Hello Sudeep,

>> Wouldn't such a setup use separate mailbox channels, therefore even if
>> mailbox driver calls mbox_chan_received_data(), it would be called for a
>> specific mailbox channel , and it won't interfere with the SCMI mailbox
>> channel.
>>
> 
> Ideally yes. Because PCC uses shared interrupts and provides no mechanism to
> identify the channel that raised the interrupt, we must run the handler for
> every registered channel. This behaviour is specific to PCC; other controllers
> that support interrupt source detection may not need to do this. But SCMI
> must work with any mailbox or other transports.

It seems the pcc_mbox_irq() operates per-channel, so it seems even the 
PCC can demux channels for each IRQ and does trigger 
mbox_chan_received_data() for correct channel ?

What exactly happens on the PCC mailbox driver with this polling mode 
enabled ?

>>> Also IIUC, the irq request happens
>>> as part of channel startup and there are no explicit APIs for the mbox client
>>> driver to control that. SCMI is mbox client in this case.
>>
>> Sure, but the mailbox driver has to make sure it is correctly demuxing the
>> IRQs it handles and correctly sends received_data notifications to the right
>> channel(s) .
>>
> 
> Agreed, but the concern is that if SCMI is forced to use polling when the
> channel is opened, and IRQs are enabled by default with no way for SCMI to
> disable them in polling mode, we could run into issues.

This constellation seems odd -- if the channel can do IRQs, then this 
property should not be present in DT.

> I realise it’s a very
> specific corner case, but every time I’ve assumed such scenarios wouldn’t
> occur, we eventually ended up encountering them. So sorry if I am very
> pedantic, but I prefer to start smaller and restrictive and expand if and
> when necessary or required only.

I don't think this case, where mailbox channel does IRQs and polling is 
enabled, can/should even be considered valid. Either the channel does 
not do IRQs and then it should do polling, or it does IRQs and then it 
should use IRQs, but not both.

>>>>> I am aware of systems that implement such sharing, which is why I prefer to be
>>>>> explicit that this type of design is challenging to support within this
>>>>> binding. The intent is to support only minimal, constrained cases - essentially
>>>>> systems that are already somewhat broken. I do not see value in broadening the
>>>>> binding to cover every conceivable scenario.
>>>>>
>>>>>>> Clearly defining these constraints would be helpful. It may also be useful to
>>>>>>> note that this is primarily intended for mailbox transports, if that’s
>>>>>>> accurate. Alternatively, we could keep the DT binding definition broader but
>>>>>>> emit warnings when a transport other than mailbox is used. That approach might
>>>>>>> make it easier to move forward.
>>>>>>
>>>>>> DEN0056F refers to this polling mode in Shared memory based transports, that
>>>>>> can be other than mailbox transports, it includes e.g. SMC or OPTEE
>>>>>> transports.
>>>>>>
>>>>>
>>>>> However, polling does not make sense in the context of SMC. Once control
>>>>> returns from an SMC call, the command has completed. What form of polling in
>>>>> an SMC workflow do you have in mind?
>>>>
>>>> I think the polling happens on the SHMEM and the SMC transport is capable of
>>>> that too, see :
>>>>
>>>> drivers/firmware/arm_scmi/transports/smc.c
>>>>
>>>> 175         /*
>>>> 176          * If there is an interrupt named "a2p", then the service and
>>>> 177          * completion of a message is signaled by an interrupt rather
>>>> than by
>>>> 178          * the return of the SMC call.
>>>> 179          */
>>>> 180         scmi_info->irq = of_irq_get_byname(cdev->of_node, "a2p");
>>>>
>>>
>>> Ah this one, is actually implemented to avoid sort of implicit polling
>>> mode we get with any SMC/HVC. I don't know how the platform deals with it
>>> but SMC/HVC is synchronous and doesn't need this polling. The irq introduced
>>> here is again a sort of workaround to get some sort of async/non-polling
>>> mode with SMC/HVC. So, to repeat polling mode make absolutely no sense
>>> whatsoever for SMC/OPTEE(based on pure SMC) transports.
>>
>> I can drop the SMC part from this patch if you think that's helpful ?
>>
> 
> Yes, that’s essential, because polling in an SMC context is meaningless in my
> opinion.

Maybe the "a2p" IRQ is also used for notifications from longer running 
operations ?

[...]

>>> Yes it can be minimalistic but not restrictive. As I already clearly mentioned
>>> I don't see it makes any sense to enable this for SMC/OPTEE. Lets start with
>>> just mailbox to start with and extend to other transports if and when needed.
>>> It would be good to impose that restriction in the binding as well but that
>>> is not a must IMO. I am fine if the bindings for whatever reasons(though I
>>> don't see the need) to apply for any transport.
>> So I should simply drop the smc.c changes , keep the rest, and send V2 ?
> 
> Not just that. Unless DT maintainers oppose, I just want to keep this
> new property valid only for mailbox transport(i.e. "arm,scmi" compatible
> not otherwise) so that we can catch any other use in binding checks and
> interested parties must discuss on the list and expand that if they require.
> 
> Also we can explore if we can parse and scan this in mailbox transport for
> now.
I feel that this only adds more implementation complexity and makes the 
solution less generic, while it does win us very little in the end ? The 
generic solution implementation is actually easier to implement.

