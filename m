Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4877DCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0x4g40B8648bbU3/kOtBTIkHC1ZK0HoFNIKuNPpRxTY=; b=pthTW5AUiOE758MumoynAmUvny
	dqAIqnCGIe0VeLkJxYYs9E1szkBxF3sevcCpA0jCnB0KcOA3rVoTbxbjNh3kU/ZqX+UbARjfOluIu
	1HXEw63WdzgeT6rZgjNk4btzvQmf+Lk0C0SX4XqsICSmB15Bal2Qt/mW2C5ZzCKaTr4Z5v47JoiHq
	UNXt5BiznrQSRFO+eVg1D2kS4Kv8vZpFnsQEN771FCH9QpJCIfXp2z06bTveAUrOo+mzzdZEaW09s
	8UiXzNTSGm6tZu94QWfs0leNs7phMZviOLRaoUjivpaOjbxUnvr63NRxdEUyllP6dgoy//SHslfLc
	8fH0o7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyX7D-00000008Cre-0FUY;
	Tue, 16 Sep 2025 14:57:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyX7C-00000008CrV-0uJO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:57:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67D60601A3;
	Tue, 16 Sep 2025 14:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC69C4CEEB;
	Tue, 16 Sep 2025 14:57:01 +0000 (UTC)
Date: Tue, 16 Sep 2025 15:56:59 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: Will Deacon <will@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	yangyicong@hisilicon.com, maz@kernel.org, oliver.upton@linux.dev,
	corbet@lwn.net, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, shuah@kernel.org,
	shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	tangchengchang@huawei.com, wangzhou1@hisilicon.com
Subject: Re: [PATCH v4 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
Message-ID: <aMl6u7xTDLhrZmqK@arm.com>
References: <20250715081356.12442-1-yangyicong@huawei.com>
 <20250715081356.12442-6-yangyicong@huawei.com>
 <aL7Fgx__LeLfbDyU@willie-the-truck>
 <5d2ba565-715b-9b17-951b-f805dde5988b@huawei.com>
 <aMLvtpaCgRqPAU2Z@willie-the-truck>
 <20250912144736.00007673@huawei.com>
 <666e3588-2e42-2275-f9ec-94ba0954bdc6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <666e3588-2e42-2275-f9ec-94ba0954bdc6@huawei.com>
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

On Mon, Sep 15, 2025 at 04:29:25PM +0800, Yicong Yang wrote:
> On 2025/9/12 21:47, Jonathan Cameron wrote:
> > On Thu, 11 Sep 2025 16:50:14 +0100
> > Will Deacon <will@kernel.org> wrote:
> >> On Tue, Sep 09, 2025 at 09:48:04AM +0800, Yicong Yang wrote:
> >>> per ARM DDI0487 L.b section C3.2.6,
> >>>
> >>>   When the instructions access a memory type that is not one of the following,
> >>>   a data abort for unsupported Exclusive or atomic access is generated...  
> >>
> >> That's about the memory _type_. I'm talking about a supported memory type
> >> (e.g. writeback cacheable) but when the physical location doesn't support
> >> the instruction. That's captured a little later in the same section:
> >>
> >>   | If the target memory location does not support the LD64B or ST64B
> >>   | instructions, then one of the following behaviors occurs:
> >>   |  * A stage 1 Data Abort, reported using the DFSC code of 0b110101,
> >>   |    is generated.
> >>   |  * The instruction performs the memory accesses, but the accesses
> >>   |    are not single-copy atomic above the byte level

Is this a new addition to the L.b release of the ARM ARM? Maybe it was
there before in some other form (or a different place). At least it
doesn't say "unpredictable".

> >> and I think that's a bad interface to expose blindly to userspace solely
> >> as a boolean hwcap.
> > 
> > Nasty, so now I'm curious. Any thoughts on how to expose what regions it is appropriate
> > for?  I can think of various heavy weight options but wondering if there is a simple
> > solution.
> 
> in my understanding the hwcap only describes the capabilities of the CPU but not
> the whole system. the users should make sure the function works as expected if the
> CPU supports it and they're going to use it. specifically the LS64 is intended for
> device memory only, so the user should take responsibility of using it on supported
> memory.

We have other cases like MTE where we avoid exposing the HWCAP to user
if we know the memory system does not support MTE, though we intercepted
this early and asked the (micro)architects to tie the CPU ID field to
what the system supports.

> may raise the similar question if use other atomic instructions (e.g. LSE) on the
> memory does not support atomicity. find this restriction in ARM DDI0487 L.b section B2.2.6
> 
>   Some system implementations might not support atomic instructions for all regions of the
>   memory

With exclusives or atomics, we require that the general purpose (system)
RAM supports the feature, otherwise Linux won't work properly (I don't
think we specifically documented this but it would be fairly obvious
when the kernel doesn't boot or user-space randomly crashes).

> and if perform atomic instruction on unsupported memory it's allowed to implement as
> 
>   * The instruction generates a synchronous External abort.
>   * The instruction generates a System Error interrupt.
>   * The instruction generates an IMPLEMENTATION DEFINED MMU fault reported using the Data
>     Abort Fault status code of ESR_ELx.DFSC = 110101.
>   * The instruction is treated as a NOP.
>   * The instructions are performed, but there is no guarantee that the memory accesses were
>     performed atomically in regard to other agents that access memory. In this case, the
>     instruction might also generate a System Error interrupt.
> 
> if instruction performed without generate a SEI in the last implementation, it's quite similar
> to the condition of LS64.

The difference is that we don't support Linux on such systems.

Arguably, the use of LD/ST64B* is fairly specialised and won't be used
on the general purpose RAM and by random applications. It needs a device
driver to create the NC/Device mapping and specific programs/libraries
to access it. I'm not sure the LS64 properties are guaranteed by the
device alone or the device together with the interconnect. I suspect the
latter and neither the kernel driver nor user space can tell. In the
best case, you get a fault and realise the system doesn't work as
expected. Worse is the non-atomicity with potentially silent corruption.

So, to Will's point, the HWCAP is not sufficient for user space to make
an informed decision on whether it can safely use the LS64 instructions.
Can a (generic) device driver tell or do we need additional information
in firmware tables to advertise the correct behaviour?

-- 
Catalin

