Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72766CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUDmGsLuzt7y0qWak8NiOpLtPu0rSZCLo1L1cHvQHAU=; b=2idJQRBv1+ZhlqkcP88uJ+M4ol
	OctxiEMZBP8vZjsdzi/eyjOFrIqI+6diGWy9Vo279QnKlnK1xE4yM/iB7Bm0lqRfyI2ZNqtMRwWkP
	Apoufn6F0KNWGslyrdI+i7Lk88Tinr3DG+2hpvozZNjg5GZJxM2U3eBfZPlxlg/9xj7sDPtEVBTMz
	bG9UOiyCjC1Rh4jWFB/PskHQk8P+lvB0bU2IFnBJ+7l2Rb1Vc/589bzMikiY0WVytaspf5vg5VpEM
	lEQwRo6GRPkuVPE1ySHSgzZ+8S5dhQWQ8gN6SfmUWQpP3QIq4bIjYYW+tsBi9t/z+5atEKD226yhG
	bgoW80tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbxL-0000000AvRt-0m43;
	Thu, 13 Nov 2025 18:22:03 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbxI-0000000AvQq-0vHd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:22:01 +0000
Date: Thu, 13 Nov 2025 10:21:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763058114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NUDmGsLuzt7y0qWak8NiOpLtPu0rSZCLo1L1cHvQHAU=;
	b=KYaFV0zdSrAsy3+bs3d+Njo5HH7l5LDFC+vVwJNgeam5lFDlKGiqBaEIq/Pop6uDctz6CU
	K0dpQsv9myUU67EubhxWDnd2mb53KLfuGzpRQG4ohGsdzYHYWBxrjKy/RUU++EuOdUrsuF
	dh8lf+UmmKCYpFgOfbnxuQ8tAnSn+/U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jiaqi Yan <jiaqiyan@google.com>, Jason Gunthorpe <jgg@nvidia.com>,
	maz@kernel.org, duenwen@google.com, rananta@google.com,
	jthoughton@google.com, vsethi@nvidia.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com,
	corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 0/3] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
Message-ID: <aRYhrmLz__AbnCFN@linux.dev>
References: <20251013185903.1372553-1-jiaqiyan@google.com>
 <20251020144646.GT316284@nvidia.com>
 <CACw3F528D6odL3MJWb28Y4HVOLo56tMQXBpvti5nhczdpMxOdQ@mail.gmail.com>
 <wuuvrqxezybzdnijarlom4wvxlfgzgjoakwt7ixittz2jb4mal@ngjvq2rrt2ps>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wuuvrqxezybzdnijarlom4wvxlfgzgjoakwt7ixittz2jb4mal@ngjvq2rrt2ps>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_102200_495895_E46C6F98 
X-CRM114-Status: GOOD (  25.99  )
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

On Thu, Nov 13, 2025 at 02:54:33PM +0100, Mauro Carvalho Chehab wrote:
> Hi,
> 
> On Mon, Nov 10, 2025 at 09:41:33AM -0800, Jiaqi Yan wrote:
> > On Mon, Oct 20, 2025 at 7:46 AM Jason Gunthorpe <jgg@nvidia.com> wrote:
> > >
> > > On Mon, Oct 13, 2025 at 06:59:00PM +0000, Jiaqi Yan wrote:
> > > > Problem
> > > > =======
> > > >
> > > > When host APEI is unable to claim a synchronous external abort (SEA)
> > > > during guest abort, today KVM directly injects an asynchronous SError
> > > > into the VCPU then resumes it. The injected SError usually results in
> > > > unpleasant guest kernel panic.
> > > >
> > > > One of the major situation of guest SEA is when VCPU consumes recoverable
> > > > uncorrected memory error (UER), which is not uncommon at all in modern
> > > > datacenter servers with large amounts of physical memory. Although SError
> > > > and guest panic is sufficient to stop the propagation of corrupted memory,
> > > > there is room to recover from an UER in a more graceful manner.
> > > >
> > > > Proposed Solution
> > > > =================
> > > >
> > > > The idea is, we can replay the SEA to the faulting VCPU. If the memory
> > > > error consumption or the fault that cause SEA is not from guest kernel,
> > > > the blast radius can be limited to the poison-consuming guest process,
> > > > while the VM can keep running.
> 
> I like the idea of having a "guest-first"/"host-first" approach for APEI,
> letting userspace (likely rasdaemon) to decide to handle hardware errors
> either at the guest or at the host. Yet, it sounds wrong to have a flag
> called KVM_EXIT_ARM_SEA, as:
> 
>     1. This is not exclusive to ARM;
>     2. There are other notification mechanisms that can rise an APEI
>        errors. For instance QEMU code defines:
> 
>     ACPI_GHES_NOTIFY_POLLED = 0,
>     ACPI_GHES_NOTIFY_EXTERNAL = 1,
>     ACPI_GHES_NOTIFY_LOCAL = 2,
>     ACPI_GHES_NOTIFY_SCI = 3,
>     ACPI_GHES_NOTIFY_NMI = 4,
>     ACPI_GHES_NOTIFY_CMCI = 5,
>     ACPI_GHES_NOTIFY_MCE = 6,
>     ACPI_GHES_NOTIFY_GPIO = 7,
>     ACPI_GHES_NOTIFY_SEA = 8,
>     ACPI_GHES_NOTIFY_SEI = 9,
>     ACPI_GHES_NOTIFY_GSIV = 10,
>     ACPI_GHES_NOTIFY_SDEI = 11,
>     ACPI_GHES_NOTIFY_RESERVED = 12
> 
>  - even on arm. QEMU currently implements two mechanisms (SEA and GPIO);
>  - once we implement the same feature on Intel, it will likely use
>    NMI, MCE and/or SCI.
> 
> So, IMO, the best would be to use a more generic name like
> KVM_EXIT_APEI or KVM_EXIT_GHES - or maybe even name it the way it really
> is meant: KVM_EXIT_ACPI_GUEST_FIRST.

This is not the sort of thing that I'd like to seen dressed up as an
arch-generic interface.

What Jiaqi is dealing with is the very sorry state of RAS on arm64,
giving userspace the opportunity to decide how an SEA is handled when a
platform's firmware couldn't be bothered to do so. The SEA is an
architecture-specific event so we provide the hardware context to
the VMM to sort things out.

If the APEI driver actually registers to handle the SEA then it will
continue to handle the SEA before ever involving the VMM. I'm not
aware of any system that does this. If you're lucky you'll take an
*asynchronous* vector after to process a CPER and still have to deal
with a 'bare' SEA.

And of course, none of this even matters for the several billion
DT-based hosts out in the wild.

Thanks,
Oliver

