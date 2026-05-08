Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE20CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 09:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1jCOVqxUTmwpgXP8ny02/M4Ut73nTiReI4y3CRTH+c=; b=4+dIddrGa2KtHqkNgcL1h0ewDt
	ItJ12Ix84gI/WlWhrhoBiu40TNKal1IfflI+Kr7WTUhFRIkajAubtw8D0wxBDOGoS1tReu39Jinjr
	jTTgiMZEkNdPEto7X49zOZTPuB67d73tiiagvPIhn5mf8n7HSNTjgZftTP6SYQkMTRv/ywiPF5TPX
	QSQtZnbItwnCgu6eVOFB2PGzAdtjwcWioPjygcmp0z5CChL2EBTvunACXjFIdlEMZHstzTDGLdiqi
	XvNDz4ryBbiNWkefUPtsSmqpyL1wA++yO8gSr2crW608ufd0G2GsglQdkXSC62TE77XKYmUhsthvV
	BfTtXFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHwl-00000006AhV-3m4n;
	Fri, 08 May 2026 09:56:39 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHwk-00000006Agu-0M2c;
	Fri, 08 May 2026 09:56:39 +0000
Received: from [100.79.201.50] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6CF7820B7165;
	Fri,  8 May 2026 02:56:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6CF7820B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1778234192;
	bh=n1jCOVqxUTmwpgXP8ny02/M4Ut73nTiReI4y3CRTH+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QJ6oUHjrogYVM+kjRGk/5FN3Kaqyj4GlCgXNgUf9P0S+nw1wg2ye/8oHu64jq8lPQ
	 CMOhwNPm/6iMwgQU/93VXi34h8th9BR0Xss2y1PX6XpYNudLxhI968GRgCveOmj6Wd
	 6uOeIJ3fQL1Hw1yrrCTaANeT8bv9dpGVG/B1oA8k=
Message-ID: <3415fe72-0572-429c-aeff-a078dab5a930@linux.microsoft.com>
Date: Fri, 8 May 2026 15:26:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] arm64: hyperv: Add support for
 mshv_vtl_return_call
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Michael Kelley <mhklinux@outlook.com>,
 Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, vdso@mailbox.org,
 ssengar@linux.microsoft.com
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
 <20260423124206.2410879-8-namjain@linux.microsoft.com>
 <aeolHwXHFH4AnX_n@J2N7QTR9R3.cambridge.arm.com>
 <f4059f5d-a82b-40c2-942e-3e24cefab94f@linux.microsoft.com>
 <86mryaxng3.wl-maz@kernel.org>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <86mryaxng3.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_025638_153886_11494E19 
X-CRM114-Status: GOOD (  18.26  )
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



On 5/8/2026 2:55 PM, Marc Zyngier wrote:
> On Wed, 29 Apr 2026 10:56:11 +0100,
> Naman Jain <namjain@linux.microsoft.com> wrote:
>>
> 
> [...]
> 
>> Merging threads for addressing comments from Mark Rutland and Marc
>> Zyngier on this patch.
>>
>> Thanks for reviewing the changes. Please allow me to briefly explain
>> the use case here and then address your comments.
>>
>> Hyper-V's Virtual Trust Levels (VTLs) provide hardware-enforced
>> isolation within a single VM, analogous to ARM TrustZone. The kernel
>> runs in VTL2 (higher privilege) as a "paravisor", a security monitor
>> that handles intercepts for the primary OS in VTL0 (lower
>> privilege). The VTL switch (mshv_vtl_return_call) is functionally
>> equivalent to KVM's guest enter/exit. It saves VTL2 state, loads
>> VTL0's GPRs other registers from a shared context structure, issues
>> hvc #3 to let VTL0 run, and on return saves VTL0's updated state back.
> 
> No, this is fundamentally different. KVM is purely architectural,
> doesn't try to "sanitise" anything, and context switches *all* of the
> guest state. No ifs, no buts, no "reserved registers".
> 
> [...]

Acked.

> 
>> Regarding Non-SMCCC "hvc #3" call, I have a limitation here owing to
>> the ABI that is defined by the Hyper-V hypervisor. Fixing this
>> requires a hypervisor-side change to support SMCCC-style dispatch for
>> VTL return. Until then, hvc #3 is the only working interface. Moreover
>> there would be backward compatibility issues with this new ABI
>> interface, if at all it is added.
> 
> Left hand, please talk to right hand. This is not the first time we
> push back on this, and we already had this annoying discussion back
> when arm64 as a Hyper-V guest was first proposed (6, 7 years ago?).
> 
> What has changed since? Absolutely nothing.
> 
> If the Hyper-V folks decide to ignore the standard and go their own
> way, that's fine. They only get to keep the pieces.
> 
> Thanks,
> 
> 	M.
> 

Thanks for the feedback. I understand your and Mark’s concerns with this 
approach now, and I’ve initiated internal discussions with the team to 
explore potential solutions.

Regards,
Naman

