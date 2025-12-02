Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17A5D1266A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 19:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+v+NoBdQKXYODNyo2s+p3Dbb4dLwzSalSja8oLP3Dg=; b=d4qFBI+01IxV1xCJeqfo06kAMT
	WoAHcP7lo461Afkf+6XxOKAvnGehledo6fZv+obP6zATysmPGL1rgy4imn5RsFqRUVmmAk9bgCyek
	Rd6QwyJSyqmUcevDwepMpZrXxmj/WnHFCJgZNVMdXIGcXe3eB/yrJRjkqPVMNUQAgzjdRNb+4ABDP
	PcX/nf89Y/UDfa23zYxWU590mqTe85eem8DmbIgmA6DJ0r8LrSyFL3UqAULtEsHIa6LgSwGD452Jb
	5H6RRJaCscO5izM+5fFBNe/lbRYkUa9T+ClsWBSdjLJzZyNpke0QVuAasI+UWpRyECDm9cc2BaFUC
	cdqtaCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQW03-00000005l3X-0h4b;
	Tue, 02 Dec 2025 19:25:23 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQW00-00000005l3C-3CF5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 19:25:21 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dLW224Vyhz9tVB;
	Tue,  2 Dec 2025 20:25:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764703514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+v+NoBdQKXYODNyo2s+p3Dbb4dLwzSalSja8oLP3Dg=;
	b=EOOVEqYb4DScC9KLHj93ejLx3OUiwQ3FdMXR2CGv89JY4Zs47DdIRZX6+cSa552ue0j2vx
	D75O9xeFjb0agxB56J+a6E7pDej9z8U4YE7PzZUNfMljYZppDzJ6vBi6clR7U7dkfBk8in
	FgsgSI7iuayxgT0nX7zUOSif8mcjZ92lw+izfnPKrgcy/KccoO41KHFs7EvEinf1WJbdVQ
	uI3ZCxz+RfCStYBYYabCPVXOloN6X4M3UxjAre/7fC6mbGM461klGOl2UMvFvo0lxI/o/P
	3vdRtKwkTXB2535BAkJji3pV4xtuMtiTTf+wRUO08roxyuttrHTUZZ2UM31aqQ==
Message-ID: <8d773671-5e2e-4e21-ade6-2bf9a3b75066@mailbox.org>
Date: Tue, 2 Dec 2025 20:25:11 +0100
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aS82GSN8c2SnRn4S@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 912c2fbf440a4c58f35
X-MBO-RS-META: z88q61w1wnsrud6grsj4f69uyywqdr6y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_112520_951012_49259B6F 
X-CRM114-Status: GOOD (  29.16  )
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

On 12/2/25 7:55 PM, Sudeep Holla wrote:

Hello Sudeep,

>> How do you imagine this -- a transport shared with other components, one
>> which does generate IRQs and one which does not -- would look like ? Can you
>> think of an example ?
>>
> 
> Consider a system where a mailbox controller is present and one channel is
> used for SCMI communication, while another channel is used for an unrelated
> purpose. If both channels share the same interrupt line, and the other use
> case enables interrupt mode on its channel, what would be the impact on the
> SCMI-specific channel?

None, SCMI kernel driver and SCMI server side would still do polling on 
their respective SHMEM areas, while whatever kernel driver needs to 
receive the interrupt notifications would subscribe to them using 
request_irq(), right ?

> I am aware of systems that implement such sharing, which is why I prefer to be
> explicit that this type of design is challenging to support within this
> binding. The intent is to support only minimal, constrained cases - essentially
> systems that are already somewhat broken. I do not see value in broadening the
> binding to cover every conceivable scenario.
> 
>>> Clearly defining these constraints would be helpful. It may also be useful to
>>> note that this is primarily intended for mailbox transports, if that’s
>>> accurate. Alternatively, we could keep the DT binding definition broader but
>>> emit warnings when a transport other than mailbox is used. That approach might
>>> make it easier to move forward.
>>
>> DEN0056F refers to this polling mode in Shared memory based transports, that
>> can be other than mailbox transports, it includes e.g. SMC or OPTEE
>> transports.
>>
> 
> However, polling does not make sense in the context of SMC. Once control
> returns from an SMC call, the command has completed. What form of polling in
> an SMC workflow do you have in mind?

I think the polling happens on the SHMEM and the SMC transport is 
capable of that too, see :

drivers/firmware/arm_scmi/transports/smc.c

175         /*
176          * If there is an interrupt named "a2p", then the service and
177          * completion of a message is signaled by an interrupt 
rather than by
178          * the return of the SMC call.
179          */
180         scmi_info->irq = of_irq_get_byname(cdev->of_node, "a2p");

> I believe the same applies to OP-TEE.
> While OP-TEE now provides a notification mechanism that could, in theory,
> allow synchronous commands to be treated in a quasi-asynchronous manner, I
> strongly doubt that the current SCMI-over-OP-TEE implementation behaves this
> way, given that it ultimately reaches the secure side via an SMC call.
> 
>> I don't think a warning is justified, if the behavior follows the
>> specification. But I do agree the behavior is ... suboptimal.
>>
> 
> The specification does not address SMC or OP-TEE transports, placing them
> outside its scope and likewise these DT bindings.

I believe the shmem transport includes the SMC and OPTEE ones, right ?

> Consequently, what we
> decide here in this discussion effectively defines the expected behavior in
> this context, in my view. So I would like to start with minimal possible
> coverage, why do you think that is not a good idea here ?

I would argue the current implementation covers pretty much every 
transport which could ever need to do polling on shmem, so the 
implementation is generic and inline with the specification. Also, the 
current implementation is some 20 lines, so I think it is minimalistic?

What would you propose we do here ?

-- 
Best regards,
Marek Vasut

