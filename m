Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8EACA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvt2ugLjZQs5rLl8VNsL2B4wCvzmh9bG+V9hEAZNgRs=; b=Ml7g4+8H+WqqM7S9EIZsdt+r+b
	mq5M1zQyS84QFPtxvkmNK3j0ognVbavjMQOc15lHUwUWypbjpOK08P8HIeUKb6G4dPv2kqhvrUIz5
	q1qKUowWHJ/6CPSvunMuTIvi2haclv5I41o0TIICFC3iiq0FtumzIe8+ftF+VaUHNkipykMZ47e2z
	145i3CTV/SHMchkBv3q2ToNnnIXn//Y5CwP9A/d8XchIBCxxfCFctkr7pYOlB5f4Jf07TOxTbnLTw
	olaCzKbqB7WnPX579egLikmTfx+k7Z/wOftyKufp9ig1IergIch1vyVylSWpzHaB3mnaxFW/MKqWa
	7ZEa+rhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFwg-000000093pe-3mqT;
	Thu, 01 Oct 2026 12:31:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFwe-000000093oc-4Bf4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:31:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F9E2497;
	Thu,  1 Oct 2026 05:31:22 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DCD03F959;
	Thu,  1 Oct 2026 05:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790857885; bh=eERKWhF85t94Bs7+PLZLWpYGNSLRDVTFxjP7kuqbi2Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YDDMJ5noT9LRN+ABKXzOFFVO4Gzf23cFQ6JGn4tFKTHHb4RNAOJoCPsDUaI7h4JYm
	 Dk/O9jDw+L3A0dNXfnakaOtM9g4lhSmVVo/WKhsvQjRsqZHW7uk0KIIdt6UrFWVAoH
	 2WJWT0mcCpXOuGbS/HyA59sR21t9nK/vaysmWLTY=
Message-ID: <d9e249b7-baf9-4ad3-a3ae-b9765feca5d8@arm.com>
Date: Thu, 1 Oct 2026 14:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Linus Walleij <linusw@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260929203634.32998-1-pmazzini@gmail.com>
 <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
 <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_053129_084086_16AC30E7 
X-CRM114-Status: GOOD (  20.49  )
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

Hi Linus,

On 10/1/26 14:06, Linus Walleij wrote:
> On Wed, Sep 30, 2026 at 5:27 PM Andre Przywara <andre.przywara@arm.com> wrote:
> 
>> Yes, this is a known issue, and I already provided a quite different fix
>> for this[1]: the A523 manual actually lists a PortA GPIO interrupt, even
>> though this is pretty likely not functional. But specifying this IRQ in
>> the DT fixes the problem as well.
>> The DT binding does not say how the IRQs are assigned to the GPIO ports,
>> so from that point of view my solution is similarly usable as yours -
>> though admittedly yours looks a little better and more future proof.
>>
>> I guess we now need to figure out how we want to handle this in the
>> future, and add an explanation to the binding. The A733 has a similar
>> problem: PortA does not exist. This time the manual does not explicitly
>> specify a GPIO IRQ, but conspicuously leaves a gap before the PortB GPIO
>> IRQ, so we can use that as well.
>>
>> Linus, Chen-Yu, Jernej: what do you think?
> 
> Can't we do both patches? Maybe there is something I don't get with this
> code...

Well, if we change the DT and the code, they fight each other, and would 
be off by one again. So we need to decide for one solution, and since 
this affects the DT, this has compatibility implications. At the moment 
the code assumes that GPIO IRQ counting starts with PortA, regardless of 
whether this implemented or not. That does not sound very future proof: 
while A523 specifies an IRQ for PortA (even though it's not 
implemented!), I am afraid future SoCs might not.
So having Pablo's patch would make a lot of sense, but would break with 
the just changed DT for the A523. That former DT change was fine, since 
it never worked before, and the new v7.2 DT should work on older kernels 
even.
So we could revert the DT patch, and take Pablo's code patch, with a 
Fixes: tag, but that would create some broken combinations meanwhile.

And in any case we should add a word to the binding document, to pin 
down what's expected here.

Cheers,
Andre.


