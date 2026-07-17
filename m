Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359CFC44521
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nd8Wh11LfMKJFN4KnQ5d4/7IUQBKx2wq5Zn8/6KCdKc=; b=BpCOLaTZQZWPULbPDilFzRmEL/
	Vy+rAA53fY7jkRyP2/rUIZ5IAHEeQKu0COH+EMR65/b20RJTqADafFuvl877q3wMTZ4oQ3/DVMv+Q
	5rmJLzQVnUp5VfYAnIm3X8nNIyp0xxBHlYSkvR9cIQoZKIJE8g2zU2UET0F8vTiIfpBMnv/Es3Su2
	8PV/OTe0TJwLLX9iOSmctnXfoZ6Vh6TDlN+tR3wcowdxvfLXjH3ItHXGEHJnA6VXVwDM7j9K7qv0R
	nCTMe0A++bK6+7/u2Qh7rbKpwy2wVA1xWXudVDOPd8e9WWtFP9vQhvgm4Xn/AfVzjUCcyABqb/MFT
	hzl1jLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhiC-00000002ID0-1Fdv;
	Fri, 17 Jul 2026 12:30:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhi9-00000002ICK-1aI2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:30:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E9841476;
	Fri, 17 Jul 2026 05:30:31 -0700 (PDT)
Received: from [10.57.84.220] (unknown [10.57.84.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B58A3F7B4;
	Fri, 17 Jul 2026 05:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784291435; bh=VughRvZS3iel7qOa0HOxMdU0JGPYnF1hquaPOHQ7V2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dnwbk61c//Ro+a5eEjiWYqY+mydSl9pQFPNRcoRGiC3zmU2ACKQh4KPeY5M8DvbTY
	 ONBIzrrAMIInP2pev4eRDrecGDNOikY7Aaa7Rn9y9if8dfiGE9O2OCgVud9Is7W4MQ
	 CxDUYX2C1F/uatWwkExaY4PvwxEmqEpdH0V0RvC0=
Message-ID: <38a7c29a-7859-4f38-b36d-473cae61cb56@arm.com>
Date: Fri, 17 Jul 2026 13:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/8] Arm Core Local Accelerator Driver
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jean-Philippe Brucker <jpb@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, maz@kernel.org,
 oupton@kernel.org, hch@infradead.org, jgg@nvidia.com
References: <20260717104759.123203-1-ryan.roberts@arm.com>
 <aloS_T3LQvpHeZUV@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aloS_T3LQvpHeZUV@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_053037_502654_F5C31AE8 
X-CRM114-Status: GOOD (  38.44  )
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

Hi Will,

On 17/07/2026 12:33, Will Deacon wrote:
> Hi Ryan,
> 
> I haven't bothered to look at the code (looks like Sashiko is having fun
> with that), but I'm going to jump at this bit:

Thanks for the quick reply!

JP and I had a quick glance at the Sashiko feedback; looks like some useful
stuff, and a few false alarms. Nothing cricial though. Not that it matters too
much for this stage of discussion.

> 
> On Fri, Jul 17, 2026 at 11:47:44AM +0100, Ryan Roberts wrote:
>> * User space availability: The kernel driver exposes the capabilities of the
>>   hardware to user space. Arm plans to open source a user space driver, but does
>>   not yet have any committed date. I'd like to understand if the availability of
>>   this component will be a prerequisite for upstream acceptance of the kernel
>>   driver; either way, I'm hoping we can at least progress with some discussion
>>   in its absence.
> 
> From my perspective, I'm not particularly interested in having code in
> the upstream kernel tree that we can't meaningfully exercise or benefit
> from. I also think that the incentive for Arm to open source the
> user-space driver practically disappears if we merge the kernel part
> first. So, at the moment, this just looks like a burden to me, especially

Understood. Now that I have such a clear statement, hopefully I can use that to
work internally to get commitments and dates to build a proper plan. What I'm
trying to get out of this RFC though, is "is having an open source user space
the main blocker, or are there other significant challenges here too?".

> as it appears to create a brand new, device-specific UAPI for what is
> ostensibly a form of SVA - something which the community is actively
> working on already.
> 
> Relatedly, is there a spec and/or fastmodel/qemu (sorry...) support for
> this?

They both exist internally of course. There is a plan to publish the spec, but I
don't think we will converge on a timeframe until after the summer now. I'll
follow up regarding fastmodel.

> 
>> I'm deliberately constraining the scope to bare-metal support for now.
>> Virtualization is something we are considering (and have prototyped), but plan
>> to post a separate RFC for that as follow-up, once we have agreement on
>> direction for the bare-metal driver.
> 
> I'd actually like to see what the virtualisation part looks like first
> because doing it as a bolt-on later feels like the wrong approach. The
> structure you have at the moment is remarkably clean, given the
> architectural/CPU interactions (this thing even apparently builds as a
> module, nice!), but I'm unsure how far you can push the separation once
> you need to start hacking at KVM. Maybe the MMU notifiers are enough,
> but I can't tell.

The virtualization implementation is not as advanced as bare-metal and JP can
probably comment on it in more detail, but the intention is to expose the HW
using VFIO-MDEV (mediated device framework). We will need exported functions
from (the arm64 part of) KVM to grab the S2 pgdir and to get/put the VMID - we
would not be using MMU notifiers but instead sharing the pgtable and VMID and
piggybacking the CPU's TBLI operations. My current expectation is that it can be
made to work without deep KVM integration and still as a module, but let's see
where we get to with the code. (I have spoken with Marc about this briefly - I
would say he doesn't love it, but agreed to look at the code when we have it).

But I think I'm hearing that to get into a deeper discussion we will need to
post virt support? In which case, I'll prioritise getting something together.
I'm about to be on sabbatical for 4 weeks though, so probably won't be until
~early Sept.

Thanks,
Ryan


> 
> Will


