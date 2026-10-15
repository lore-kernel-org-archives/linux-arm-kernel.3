Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE39CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaDbBwek0DrGn1G+W/BjvsVrUHrK/XL/V0+PGH+Cvxg=; b=EA7fWx4hyBRlxRvLg9fa4aaryB
	E7Cvi2pp4rF3B20mRO2x+cMRolI/5Gs3y9RVeFx1Dbu6CXjrjBRFxIgUmGwQQyN6vuPuITDFUPTP+
	WiL5KvXSe7QyIkds5mFJ9W4iaIlGLu/7R7vOTw2EX8x21yQ0+lpbLfuU4rpU0Q/SxQ3F7Qv1LpFoH
	258xUSJezAL5b9enh8PSo6zhOWQH14RuO00wLXteXMoRr8JtqlPtyPYPKWTJ1AfaXB2rfra5ugy1o
	a6ltB3YfXjCgKtgIk4/hn4XFPRmZO4LYpQ5WzHNzn0AsyhhC1nwAKcxZ9uH/WnGV/Y4JRBZUemruB
	qBb+/PuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNqd-00000000dRh-1fmw;
	Thu, 15 Oct 2026 15:58:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNqW-00000000dR7-1tJS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 15:58:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A18FD14BF;
	Thu, 15 Oct 2026 08:58:13 -0700 (PDT)
Received: from [172.29.20.205] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62F583F7B4;
	Thu, 15 Oct 2026 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792079896; bh=RwSvBW+5qY6o5GnUvl5eXAsWejcZRilDh8Rf5t5xz/4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NALJudrA4lgJCcD7bslUebtXL7OvBjAGi+CO8Ba2Y8hqJZODH17lbJCHoP/3KN4w9
	 n9EHXDnmE0SLze7joM8Fvv8V7AHUTQq6z1qhMLfhgGy7QKO84pNrCLm4FJ7RoPdssm
	 3mxoLY3x9XplYQpm8Mn0H8WOfEV+Zmkh6ByFBO/M=
Message-ID: <14d16970-915b-4c86-afeb-bfc3058564df@arm.com>
Date: Thu, 15 Oct 2026 10:58:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_spe: Support heterogeneous ACPI systems
To: Johnny Fan <johnny.fan@cixtech.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, will@kernel.org, mark.rutland@arm.com,
 james.clark@linaro.org, leo.yan@arm.com, cix-kernel-upstream@cixtech.com,
 bob.zhang@cixtech.com, jie.fu@cixtech.com, fugang.duan@cixtech.com
References: <20261015062908.3565761-1-johnny.fan@cixtech.com>
 <86mrsf1bnv.wl-maz@kernel.org> <atC+lsWALy6ueGAB@JohnnyFan>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <atC+lsWALy6ueGAB@JohnnyFan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_085820_572179_C2442312 
X-CRM114-Status: GOOD (  25.43  )
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

Hi,

On 10/15/26 6:52 AM, Johnny Fan wrote:
> On Thu, Oct 15, 2026 at 11:49:24AM +0100, Marc Zyngier wrote:
>> This is a bit odd: at the beginning, you are stating that the SPE
>> interrupt being 0 is an indication of SPE not being supported. Then
>> you check for PMSVer for the same properly. This seems pretty wrong.
>>
>> It should be possible to build the mask of SPE-enabled CPUs without
>> IPI-ing the other CPUs, and only rely on the firmware table.
> 
> Agreed. The MADT walk already tells us which CPUs implement SPE, so the
> whole PMSVer probing (including the hotplug compensation for CPUs that
> were offline at probe time) can go away: the driver already consumes
> platform_get_irq_affinity(), so once the mask comes from the GICC
> entries it needs no changes at all.

I don't think the GICC is sufficient, you have to consider actual 
heterogeneous machines that have differing SPE implementations with the 
same PMSVer, which mean you have to keep the PPTT hetid check, and set 
the mask based on both it and the GSIV. Then, like DT create multiple 
platform devices. Which is true with the current patch as well, the 
hetid still needs to be there even if you have differing PPI's because 
it could have more than two differing implementations.


> 
>> This "optional" parameter feels very wrong. We now have an
>> infrastructure to get a set of affinities for an interrupt (see
>> 5324fe21ba9b7 and following patches). What this needs is ACPI to be
>> plumbed into this.
>>
>> Unfortunately, ACPI is awkward and very badly abstracted in this area,
>> but that doesn't mean we should make the driver code more bizarre.
>>
>> Treating SPE and TRBE differently is just as odd, and there is no
>> reason to do other than suiting your particular platform.
> 
> Also agreed -- the TRBE overflow interrupt has the same per-CPU
> semantics in the GICC, so both devices can share one code path: build
> the mask of CPUs reporting a non-zero interrupt, and require a single
> GSI across that mask. The current hetid check is replaced by the GSI
> consistency check.
> 
> The part I'm unsure about is how to convey the MADT-derived mask to
> platform_get_irq_affinity() for these devices: they are synthesized by
> arm_pmu_acpi.c without an fwnode, so neither the of_node path nor the
> _CRS-based ACPI path can reach them. Would you rather see the mask
> registered with the GIC domain keyed by GSI, with a fallback in
> get_irq_affinity() that resolves by IRQ number, or something simpler at
> the platform_device level?
> 
> Happy to implement whichever shape you prefer.
> 
> Thanks,
> 
> Johnny


