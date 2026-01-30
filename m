Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B88E6BF16
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohD4fI+v6BUJchb3BE7zTKKbwrKDvCt2jFDaTb4YLGY=; b=IOZIMNzKylQCwQ890cQmthdyg9
	h3Xcpow4CHAoQTPeEa16IiFz69xxTVNZaZrL/C6wcnDp8rh3FhCc50bjr5JpQR91duEEdn4PU8uf/
	AXbGP+nMnM4w2dw9Uicol2tF8c3aPYcoGS83S/3ZOBTZwd8zewc5bAX1C2YXD2wvruOMAGrLQDuh7
	toaoYYW+oM9yiJRBly4UUC/OSyWTjDf7bQ6SqYBVpcB7ChErLqtpS3b4KdlAmLi7tY6cyVGh4fAwL
	GTMHA/moYZVdK2NVPOKkzahHKzLZ9sCXBO2ewbXFueRCEYswhKqZo53ICLh/oy4SCCJCquH4ZIf6T
	/gPY4tZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpAs-00000001Z8d-3c7L;
	Fri, 30 Jan 2026 14:08:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpAq-00000001Z8H-2Hjr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 14:08:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4484A153B;
	Fri, 30 Jan 2026 06:08:28 -0800 (PST)
Received: from [10.57.54.50] (unknown [10.57.54.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC9383F632;
	Fri, 30 Jan 2026 06:08:33 -0800 (PST)
Message-ID: <5607f0f3-d1d4-46d2-a857-8dfde185d2b1@arm.com>
Date: Fri, 30 Jan 2026 14:08:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
To: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Stefan_D=C3=B6singer?=
 <stefandoesinger@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev, Jun Nie <jun.nie@linaro.org>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
 <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com>
 <2936803.ElGaqSPkdT@grey>
 <9325c1b8-40f8-4403-8098-b924124e3868@app.fastmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <9325c1b8-40f8-4403-8098-b924124e3868@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_060836_721886_43482C81 
X-CRM114-Status: GOOD (  29.57  )
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

On 2026-01-30 8:58 am, Arnd Bergmann wrote:
> On Thu, Jan 29, 2026, at 20:38, Stefan Dösinger wrote:
>> Am Donnerstag, 29. Januar 2026, 01:00:08 Ostafrikanische Zeit schrieb Arnd
>> Bergmann:
>>> On Wed, Jan 28, 2026, at 21:34, Stefan Dösinger wrote:
>>
>> I am certain switching to EL3 is working here because I am using it in the
>> same way to set up ICC_SRE_EL*. (And yes, I know this code doesn't belong in
>> this place. It's just more comfortable for my development tree for now)
> 
> Ok

If you can do that, then:

a) You're starting in Secure SVC, which explains the GIC issues (since 
we usually expect to be dealing with the Non-Secure side of the GIC)

b) Monitor mode exists, which means EL3 is in AArch32 state (and I would 
imagine the SoC is wired to boot that way), which means you'd need to 
rewrite the entire firmware for AArch64 (most likely including an 
AArch32 stub to RMR itself into AArch64 state initially) before you 
could consider running lower ELs in AArch64.

>>> I've never seen a Cortex-A53 without FPU and NEON, but since this
>>> is optional, it was a matter of time before we got one ;-)

They certainly exist in various networking gear and other embedded 
applications, they've just never (directly) asked to run mainline Linux ;)

Cheers,
Robin.

>> The ZTE 3.4 kernel code suggests that there is/was a zx297520v2 that was
>> Cortex A9 based, and then ZTE replaced the Cortex-A9 with a Cortex-A53 and
>> left the rest of the system unchanged.
>>
>> A later version of this SoC, zx298501 switched to 64 bit, including kernel +
>> userland. But I don't have any hardware based on either of them.
> 
> Right, it's quite possible that v3 was a node shrink and Cortex-A9
> was not available for the new process.
> 
>>> Support for 64-bit cores is actually quite rudimentary in 32-bit
>>> more, as we are missing a lot of the errata workarounds and ARMv8
>>> specific features in the kernel. If you can figure out how to
>>> use 64-bit kernel mode, that would be ideal.
>>
>> One of my co-hackers is giving it another try. Pairing a 64 bit kernel with 32
>> bit userspace seems reasonable. Of course the other question is what quirks
>> are hiding in the hardware when we run them in a mode the vendor never tested.
> 
> Right, that is clearly a risk. I see that we do support FPU-less
> systems, e.g. 82e0191a1aa1 ("arm64: Support systems without
> FP/ASIMD"), but I doubt that this code path is well tested.
> 
> For the core itself, I would expect fewer problems with 64-bit
> kernels than 32-bit ones, but the problems are going to be different
> of course.
> 
> For 32-bit compat userspace, there is a chance that you have
> device drivers missing compat ioctl handlers, especially if you
> need non-upstream drivers. There are also a few differences in
> handling of deprecated instructions like ARMv6 style barriers
> or unaligned ldm/stm data accesses, which require you to enable
> the workarounds at boot time on 64-bit kernels.
> 
>       Arnd
> 


