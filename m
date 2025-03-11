Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62789C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTInLBZAi6dngAdI5tqAttPHHYifpveKWKtHyNBTHCw=; b=nM/X5lu5izS8g+kl9OVFGEauqJ
	CnXQcayUxBWeNaFOxNXyV+eOOXkrdtb3sOzbiUMw+9ytNK6Gu/FvQcddxhkYrk0e5rE08SeR7vp1/
	Dh5muiMmcoC6UZ6CZrdUaYscA6fQMGfqMFJ/5GNZdzf84mR6t0KzPqVbVS1T5KFe+z1R6Zo3Umfpn
	KmJeEU21wteqOfXre9voEGHvBwEPVtBb3rBPUJAQj7PDHDrnG9UpGIymEBDxQZOvDEgcVjDrEQfh4
	559Q7u/72x/7e09WnO4qilPe9iLmGkmzqLTIrw88oPzN7CbESM05N+g/s7aA8XJGpmgOeVAgmaJhF
	0qsus05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trxet-00000005Rx5-3mcy;
	Tue, 11 Mar 2025 11:20:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trxdG-00000005Reo-0a7N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 11:18:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1A9A5C5D1D;
	Tue, 11 Mar 2025 11:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC84C4CEE9;
	Tue, 11 Mar 2025 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741691925;
	bh=eV1Ot+6YRrZcBA7zWzuNDm7nIRQcDW2LUambjbhiAhs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aR5Xv+JXW/OGpjkpBu6OK786z2RKa6Uftin8rPAQP29jmSSBS7ZZSdyHN0j1A5RIO
	 KopJBmyosJTsEE8bck5mz6EKpGpxitwM6TLjkSfHGP2IjlPunbngwds6yIFPkNo9yq
	 b2+QqXvJ9g7mV+9ZnlLbH9O2pejE0Cj8b9Dt0n5lW9PthEqBPXTDQw1qNxha32mm4K
	 wexs1y1c72xFIlrENyFXdBemKuVmVPsM3pwtNn2+o/w5DK3zY11vswz+QFWG1yBRlb
	 NUfpjSoD8h+3WmMwAKrHJQoqLsaYfPlXMShejU/4CewkdungRFrJcRgIQbeRobBZVh
	 m+MFd1Dd7nYYQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trxdB-00CVMK-Ga;
	Tue, 11 Mar 2025 11:18:42 +0000
Date: Tue, 11 Mar 2025 11:18:40 +0000
Message-ID: <86r033olwv.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	"oliver.upton@linux.dev"
	<oliver.upton@linux.dev>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com"
	<yuzenghui@huawei.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"ryan.roberts@arm.com"
	<ryan.roberts@arm.com>,
	"shahuang@redhat.com" <shahuang@redhat.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"david@redhat.com"
	<david@redhat.com>,
	Aniket Agashe <aniketa@nvidia.com>,
	Neo Jia
	<cjia@nvidia.com>,
	Kirti Wankhede <kwankhede@nvidia.com>,
	"Tarun Gupta\
 (SW-GPU)" <targupta@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>,
	Andy
 Currid <acurrid@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	John
 Hubbard <jhubbard@nvidia.com>,
	Dan Williams <danw@nvidia.com>,
	Zhi Wang
	<zhiw@nvidia.com>,
	Matt Ochs <mochs@nvidia.com>,
	Uday Dhoke
	<udhoke@nvidia.com>,
	Dheeraj Nigam <dnigam@nvidia.com>,
	Krishnakant Jaju
	<kjaju@nvidia.com>,
	"alex.williamson@redhat.com"
	<alex.williamson@redhat.com>,
	"sebastianene@google.com"
	<sebastianene@google.com>,
	"coltonlewis@google.com" <coltonlewis@google.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"yi.l.liu@intel.com"
	<yi.l.liu@intel.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"gshan@redhat.com"
	<gshan@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ddutile@redhat.com" <ddutile@redhat.com>,
	"tabba@google.com"
	<tabba@google.com>,
	"qperret@google.com" <qperret@google.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using VMA flags
In-Reply-To: <SA1PR12MB7199DD985C45943A663E7003B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20250310103008.3471-1-ankita@nvidia.com>
	<20250310103008.3471-2-ankita@nvidia.com>
	<861pv5p0c3.wl-maz@kernel.org>
	<SA1PR12MB7199DD985C45943A663E7003B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ankita@nvidia.com, jgg@nvidia.com, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com, lpieralisi@kernel.org, david@redhat.com, aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com, dnigam@nvidia.com, kjaju@nvidia.com, alex.williamson@redhat.com, sebastianene@google.com, coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org, ddutile@redhat.com, tabba@google.com, qperret@google.com, seanjc@google.com, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_041846_258829_BA5FBF38 
X-CRM114-Status: GOOD (  32.49  )
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

On Tue, 11 Mar 2025 03:42:23 +0000,
Ankit Agrawal <ankita@nvidia.com> wrote:
>=20
> >> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 When FWB is unsupported KVM ne=
eds to do cache flushes
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 (via dcache_clean_inval_poc())=
 of the underlying memory. This is
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 only possible if the memory is=
 already mapped into the kernel map.
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 Outright reject as the cacheab=
le device memory is not present in
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 the kernel map and not suitabl=
e for cache management.
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >> +=C2=A0=C2=A0=C2=A0=C2=A0 if (cacheable_devmem && !stage2_has_fwb(pgt)=
) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D -EINVAL;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto out_unlock;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +
> >
> > These new error reasons should at least be complemented by an
> > equivalent check at the point where the memslot is registered. It
>=20
> Understood. I can add such check in kvm_arch_prepare_memory_region().
>=20
>=20
> > maybe OK to blindly return an error at fault time (because userspace
> > has messed with the mapping behind our back), but there should at
> > least be something telling a well behaved userspace that there is a
> > bunch of combination we're unwilling to support.
>=20
> How about WARN_ON() or BUG() for the faulty situation?

Absolutely not. Do you really want any user to randomly crash the
kernel because they flip a mapping, which they can do anytime they
want?

The way KVM works is that we return to userspace for the VMM to fix
things. Either by emulating something we can't do in the kernel, or by
fixing things so that the kernel can replay the fault and sort it out.

Either way, this requires some form of fault syndrome so that usespace
has a chance of understanding WTF is going on.

> > Which brings me to the next point: FWB is not discoverable from
> > userspace. How do you expect a VMM to know what it can or cannot do?
>=20
> Good point. I am not sure if it can. I suppose you are concerned about er=
ror
> during fault handling when !FWB without VMM having any clear indications
> of the cause?

No, I'm concerned that a well established API (populating a memslot)
works in some case and doesn't work in another without a clear
indication of *why* we have this behaviour.

To me, this indicates that userspace needs to buy in this new
behaviour, and that behaviour needs to be advertised by a capability,
which is in turn conditional on FWB.

> Perhaps we can gracefully fall back to the default device mapping
> in such case? But that would cause VM to crash as soon as it makes some
> access violating DEVICE_nGnRE.

Which would now be a regression...

My take is that this cacheable PNFMAP contraption must only be exposed
to a guest if FWB is available. We can't prevent someone to do an
mmap() behind our back, but we can at least:

- tell userspace whether this is supported
- only handle the fault if userspace has bought in this mode
- report the fault to userspace for it to fix things otherwise

	M.

--=20
Without deviation from the norm, progress is not possible.

