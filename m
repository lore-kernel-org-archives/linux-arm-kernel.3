Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CD6D11711
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 16:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouQXuzIraPB2D4kvwgqomW1JSJU+R5g72qD/eXUPvvw=; b=qTQGVn5PZeND/DRkjKOXFzCdeD
	6ulC5MKLbh3rD5eOzaPwcK+Y3RuBlbl9mU59heNqzAkMggMYma4bj1LIbCijiyzEOgNFGZKDAQy3E
	z8UaMX2++Y7y7fPNTu20nolwnOrq52YFlToybaNt+/Z3dFBujFsBXf3WGOdvfJYxbJfK6Nj53F/Nq
	IZu3Vo0ooCK4p67AsaLQs/BSrV+7ozIu8CAUO416P3Xcilqr6j41kUvedqXHBUfpQ9wi0UXWHyYbE
	A4ocp7siWo+5XmkT4QInAVQcmYgMbBTcgBpFNi3kjg1aA/uchgvgvwwckAFLS8sTbvZluIE/vr8H0
	ibaP/9dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTNC-00000005cwn-1ENb;
	Tue, 02 Dec 2025 16:37:06 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTN8-00000005cw5-2QHr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 16:37:04 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLRHr3bFbz9tPF;
	Tue,  2 Dec 2025 17:36:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764693416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ouQXuzIraPB2D4kvwgqomW1JSJU+R5g72qD/eXUPvvw=;
	b=TD/7tCNK7xPkEzXu1K6i6i0oJ+JPL0/9upqdLYIRjNpUCk8SgRS2tjNyFrrXxH24BUd5Ml
	TJdUSoMSllooOJK6PRPLDIKfQZ+RpEd/anVN+Si6BRF8leyiV1TjGOJf8a5JJHGiz6qTH6
	Sck77NrE4BvZNZ6PC9Lc0nO19XQmcMO54916VDnVvauCsAyXPKfrbY07dqLfwZ5VZGtlus
	edEmHw51yrLEDVd3bkDxq3GfZUaIDOK3uKIpQgoOxJTc4ED4i7HaX7E+G028VKtzIblbK2
	NRYZuKHUCmjdbMR9p/HYOHSPvZWKBQw4HrO9CSi3cLQ5HxBN8L7YxXQ3gJSeCA==
Message-ID: <66257fcf-9024-454f-b776-4ba584963ebe@mailbox.org>
Date: Tue, 2 Dec 2025 17:36:53 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto> <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
 <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org> <aRW7BZimWdpq4TyX@pluto>
 <20251202-evasive-neon-rhino-d2745e@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251202-evasive-neon-rhino-d2745e@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ef09950386f662b3642
X-MBO-RS-META: xnxgf58ioag4dimis9zusdeen8x8huea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_083703_317586_188828B8 
X-CRM114-Status: GOOD (  21.21  )
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

On 12/2/25 3:52 PM, Sudeep Holla wrote:

Hello Sudeep,

>>> While I was going through the SCMI spec, DEN0056F , page 209 , section "4.1
>>> Shared memory based transport" , bullet • Completion interrupts, I found it
>>> explicitly states:
>>>
>>> "
>>> This transport supports polling or interrupt driven modes of communication.
>>> In interrupt mode, when the callee completes processing a message, it raises
>>> an interrupt to the caller. Hardware support for completion interrupts is
>>> optional.
>>> "
>>
>> Oh, yes...I knew that...it is just that till now, no systems were really
>> ever developed that lacked the completion IRQ as a whole, it was, till now,
>> more of a case of having the capability NOT to use it selectively at runtime
>> and instead use polling when wanted (like for clock ops in ISR context)
>>
> 
> Indeed.
> 
>> I am not sure what is the reason why this only-polling scenario was never
>> supported in the HW description, this indeed pre-dates my work on SCMI....
>> ...I would/will check with Sudeep, when he's back, what are the reasons for
>> this (if any)...
>>
> 
> As you mentioned earlier, no platform has required this before. I’m fine with
> adding it, but we need to be more explicit about what it implies for SCMI. The
> transport may be shared with other system components, and enforcing polling
> for SCMI while the same transport generates interrupts for another user could
> lead to issues.

How do you imagine this -- a transport shared with other components, one 
which does generate IRQs and one which does not -- would look like ? Can 
you think of an example ?

> Clearly defining these constraints would be helpful. It may also be useful to
> note that this is primarily intended for mailbox transports, if that’s
> accurate. Alternatively, we could keep the DT binding definition broader but
> emit warnings when a transport other than mailbox is used. That approach might
> make it easier to move forward.

DEN0056F refers to this polling mode in Shared memory based transports, 
that can be other than mailbox transports, it includes e.g. SMC or OPTEE 
transports.

I don't think a warning is justified, if the behavior follows the 
specification. But I do agree the behavior is ... suboptimal.

-- 
Best regards,
Marek Vasut

