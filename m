Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC860CD5BCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 11:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kstUxXctzALc3r6mHu6J3NJbeAPLhvcpKA5iAHi8E80=; b=PAC1dhsP0lLil62UtMdVtj22Oz
	pSXnqf/Pk5+DNkYNtVRBkkcdZBlIeheBNkYh+NDuhZSSJmjSMwHW7XZywh8qw+ip0TaZilghhyYiT
	eVoE84uVCA6EaS2/WJbJDdIk4ksQ4kftiJIhBfkuDwplCz4X2zI3WLCVT9K8aNUV3nxJyvbFfstae
	ILwVy5shgMqPJSY6RXFrB/0lyvcpZpEWmDry0fLIYMHEfR3dD4OApLrS2PjYQmxBghnnWpJMLHXoR
	gJ9y/m1s+XnCBntDFDfJiHHjLt8Ecae8R3S3ac+5070m8eI9oDPFoPDjP1Cusv74hxopzn+7D0XAy
	7SETW0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVar-0000000AOpN-16Df;
	Thu, 13 Nov 2025 11:34:25 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVao-0000000AOnK-3yry
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 11:34:24 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d6dTC663Vz9t9s;
	Thu, 13 Nov 2025 12:34:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1763033647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kstUxXctzALc3r6mHu6J3NJbeAPLhvcpKA5iAHi8E80=;
	b=lkhjf2bugBr8TeoCb0ZzOBM0DsINKupPBIdRwGnhRqoTv2mFtNO1B8+oWW3FtNoI1aR6Y5
	lgCYLSgrWZLc1v01kB/g7qw/zsDs7iyvBDzg6yXJiwuFAk/k2i1+CxlG6HFK1/RtSv2H+1
	WpKP4kIBl9vqND3Vuu/E88hm1AKtQKvSY7kwDlErNfF9HAWhJhpLiZK/Cg1GWkJEDXfVAH
	02ujI/5S/pMV6GYs4RlT/tpeb5niqTrV4A6tB0mZ9LYLA+6DY5rDIGDAyID8JaNmQR0h/w
	Hb5zD+lQLV9yssY2mB7uoZOrg9Uih1isCNOWRrSEHkmSSs/moMZ+/PcbW2ndzw==
Message-ID: <032bfb41-413d-4d59-aa66-7f109af4422d@mailbox.org>
Date: Thu, 13 Nov 2025 12:34:03 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto> <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
 <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org> <aRW7BZimWdpq4TyX@pluto>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aRW7BZimWdpq4TyX@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e9d5488ffa9da467466
X-MBO-RS-META: e53boqqq1douzuw15mwdychamyjjxw4y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_033423_165054_33EBB5FF 
X-CRM114-Status: GOOD (  19.89  )
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

On 11/13/25 12:03 PM, Cristian Marussi wrote:

Hello Cristian,

> bit of a late reply...

No worries, I am buried under email myself, take your time.

>>>> On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
>>>>> Document new property arm,poll-transport, which sets all SCMI
>>>>> operation into
>>>>> poll mode. This is meant to work around uncooperative SCP
>>>>> implementations,
>>>>> which do not generate completion interrupts. This applies
>>>>> primarily on mbox
>>>>> based implementations, but does also cover SMC and VirtIO ones.
>>>>
>>>> Hi,
>>>>
>>>> ..indeed I was thinking a while ago about exposing the existing
>>>> force- polling
>>>> switch but in my case it was purely a testing-scenario
>>>> configuration, so a
>>>> no-no for the DT, things are different if you have to describe an HW
>>>> that has
>>>> no completion IRQ also on the a2p channel...
>>>
>>> Correct, at least until the SCP on this hardware is updated.
>>>
>>>> ...having said that, though, usually polling-mode is reserved to a few
>>>> selected commands in a few chosen scenarios (as you may have seen),
>>>> 'carpet-polling' non-for-testing for all the commands on A2P seems a lot
>>>> inefficient and heavy...is it really a viable solution ? or these
>>>> systems use such a low rate of SCMI messages that polling after each and
>>>> every message is negligible ?
>>>>
>>>> ..just to understand the context...
>>>
>>> These systems are early in development and it is likely that the SCP
>>> will be updated to generate interrupts properly. Currently, this is not
>>> the case, hence the carpet-polling, until this is resolved.
>>
>> While I was going through the SCMI spec, DEN0056F , page 209 , section "4.1
>> Shared memory based transport" , bullet • Completion interrupts, I found it
>> explicitly states:
>>
>> "
>> This transport supports polling or interrupt driven modes of communication.
>> In interrupt mode, when the callee completes processing a message, it raises
>> an interrupt to the caller. Hardware support for completion interrupts is
>> optional.
>> "
> 
> Oh, yes...I knew that...it is just that till now, no systems were really
> ever developed that lacked the completion IRQ as a whole, it was, till now,
> more of a case of having the capability NOT to use it selectively at runtime
> and instead use polling when wanted (like for clock ops in ISR context)
> 
> I am not sure what is the reason why this only-polling scenario was never
> supported in the HW description, this indeed pre-dates my work on SCMI....
> ...I would/will check with Sudeep, when he's back, what are the reasons for
> this (if any)...

Thank you !

-- 
Best regards,
Marek Vasut

