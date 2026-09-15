Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CB5C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DG4qsnB/WbUm9zjfIABFjU6D41zon6CNpHxg6sLQC0=; b=SsQkZT8JwhoOhMrVDU41eyy/O8
	sStibNSK87yAHS7L4PWsAI9jNPPBz26EqaUNk8B7lug0cRE3cQAGla1uK8krHv9P6N/thXTI629HY
	cEvU18mULryLvahYdvRVgq6r3dlEy0qKxSNeV5ZSbEzbNRUr4bliHH/jCXhtSi5ASvELTQiP3tJ+P
	iMXGsFgHlp+y4LswrEgvx+7fey7No2Ay+TjB+AmP/A7IVSf6+9jv4nZqeGR36bPhJAFqovmHeXC/2
	26GQccK4kzxLvY1XXbUhu80/xvpnWhFkIex1HThfOI9losfCRTYRZ2+x/8pJsXa4FQJrtKtbllH7y
	WP+Os/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SCu-00000006Ttk-1JUY;
	Tue, 15 Sep 2026 12:24:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SCt-00000006TtQ-0qpR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/DG4qsnB/WbUm9zjfIABFjU6D41zon6CNpHxg6sLQC0=; b=JdO1iLd6hBtZs4Ye0jiFxrvHJ4
	lnTDH6lTWOka9bjLvEDaiWJru1B1ahQPVp6auBXizTl12smPMuimS/KZDJEPZgk8D5MNLSxvOk+Sz
	XYkA1Ewy/ZMZfXL0ij8KZCJSgnlJi1UEi6kG6yvbJzC7wd+j69BvKOPvcz007Xa6Pl5GyUhON+n/B
	BGHKm2vNMGgQtfevfalgAqBD/56Y0wxeAQVu4ThLujcHJ6MGT11hVFML36/mSGefxCgEK1WIWn8ZA
	qzkj3rsZf0ENCv/r9N0W80fzLGAFq03GqGEFydRJOe5fkopzTj/tUQCz8UUaDrpJ9v7nLTREkqZLT
	zVmeKesg==;
Received: from esa1.hc1455-7.c3s2.iphmx.com ([207.54.90.47])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6SCp-00000006jKG-14Yc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789475051; x=1821011051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=18Wi83CNhlzACjOHe6SRF3KvHUzXVD4Y+YHs4xCXX7M=;
  b=KL156wbQyF9qC8+e3ehzwbtDySq/N00X+cj/zX9BMXmH75vXry27EM2G
   80Fqmms0eA3bZAszaTSDK+vH032iB5gh55ITsrdwwB9NTrR/gA+XDVrhd
   sjjWF/IqTn0wrPdGwskPZKqTnr7sf8kXzWJIxTH69L1iS/JsgNSS7BD5e
   mEjd1DGi7MpEkfhp0hGd9gBepnvJYuHJBP0QO8/fZJzNnxTr5MD2p9Hvj
   bK4eigFw37cAMGJMdCrHCo1DoCfj94uTmaTQULBR47s/OozNb+4pX20L8
   YsCnq9YYONHOF+kaOR20nEqU/3MJK18XQqdmSzE4gN5T/CAFnH2PFZTLE
   A==;
X-CSE-ConnectionGUID: SKDntvthS++O5EgihdXW1g==
X-CSE-MsgGUID: 90nIqoCCS4GDTlUHsTiMmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="255126654"
X-IronPort-AV: E=Sophos;i="6.27,103,1786978800"; 
   d="scan'208";a="255126654"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:24:07 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8458142A33F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 12:24:06 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2918E1C002FD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 12:24:06 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.185.122])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with SMTP id EE8BE1800156;
	Tue, 15 Sep 2026 12:23:57 +0000 (UTC)
Date: Tue, 15 Sep 2026 21:23:49 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 44/45] KVM: arm64: CCA: Require ICH_HCR_EL2.TDIR for
 realms
Message-ID: <aqk4TTHgBiKUvvew@FCCLS0092175.localdomain>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-45-steven.price@arm.com>
 <anlZCIauOq4Lvv0I@FCCLS0092175.localdomain>
 <bdd0cf41-05e8-4d66-930b-5a7a1b3e643a@arm.com>
 <apAwQeTW-JvCISEt@FCCLS0092175.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <apAwQeTW-JvCISEt@FCCLS0092175.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_132411_909839_EE235578 
X-CRM114-Status: GOOD (  54.29  )
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

On 08/27 21:45, Kohei Enju wrote:
> On 08/24 15:50, Steven Price wrote:
> > On 10/08/2026 05:58, Kohei Enju wrote:
> > > On 08/03 14:44, Steven Price wrote:
> > >> KVM advertises realm support when the RMM is available, and allows
> > >> userspace to create a VM with KVM_VM_TYPE_ARM_REALM on that basis.
> > >>
> > >> On CPUs that lack ICH_HCR_EL2.TDIR, KVM uses ICH_HCR_EL2.TC for
> > >> normal guests so that ICC_DIR_EL1 is still trapped via the common GICv3
> > >> CPU interface trap. Realms cannot rely on the normal hyp-side trap
> > >> handling for that fallback, so advertising RMI support on such systems
> > >> lets userspace create a realm that cannot safely run.
> > >>
> > >> Require the finalized ARM64_HAS_ICH_HCR_EL2_TDIR capability when
> > >> reporting KVM_CAP_ARM_RMI and when accepting KVM_VM_TYPE_ARM_REALM.
> > >> This leaves normal VM creation unchanged on systems that need the TC
> > >> workaround.
> > > 
> > > Hi Steven,
> > 
> > Hi Kohei,
> > 
> > Sorry for the slow response.
> > 
> > > Thanks for your work on upstreaming CCA.
> > > 
> > > In the v15 discussion [0], you asked whether the system I was testing was a
> > > "hacked up test system" or closer to "production hardware", and I said I would
> > > share more when the time came. I can now say that this is not a hacked-up test
> > > system. At Fujitsu, we have real hardware (FUJITSU-MONAKA) which implements CCA
> > > (FEAT_RME) but does not implement FEAT_GICv3_TDIR. The hardware details are as
> > > follows:
> > 
> > Cool, I suspected that might be the case - it's good to know there's
> > real hardware on it's way.
> > 
> > >   - GICv4.2 compliant implementation
> > >   - Supports FEAT_GICv3, FEAT_GICv3p1, FEAT_GICv4, FEAT_GICv4p1, and FEAT_GICv3_NMI
> > >   - Does not support FEAT_GICv3_LEGACY (deprecated)
> > >   - Does not support FEAT_GICv3_TDIR (ICH_VTR_EL2.TDS == 0)
> > > 
> > > For reference, compared with Arm Neoverse V3, the virtual GIC configuration is
> > > largely equivalent. The only missing non-deprecated architectural feature is
> > > FEAT_GICv3_TDIR.
> > > 
> > > The issue I see is that the CCA KVM code currently does not support a
> > > configuration (non-TDIR/common-trap) that normal KVM already supports. For
> > > normal guests, KVM handles systems without TDIR by using ICH_HCR_EL2.TC and the
> > > existing GICv3 CPU interface emulation path. However, Realm guests currently
> > > fail because the CCA path bypasses that existing emulation path, as Marc also
> > > pointed out in [1].
> > > 
> > > Also, this is not limited to systems that actually lack TDIR. The same failure
> > > can be reproduced on a TDIR-capable system by booting with:
> > >   kvm-arm.vgic_v3_common_trap=1
> > 
> > As Marc says that's a debugging option - handy for those of us who don't
> > have a platform without TDIR to test with.
> > 
> > > So it seems that the current CCA KVM implementation does not yet cover a
> > > configuration that normal KVM already supports today, rather than this being a
> > > limitation of the RMM specification or the underlying hardware.
> > > 
> > > I've included a patch below which reuses the existing GICv3 early emulation
> > > path for Realm sysreg exits. This patch does not add any new vGIC emulation
> > > code, and leaves the existing vGIC emulation code unchanged. So I believe this
> > > is in line with Marc's request in [1]. With this patch, Realm guests can run
> > > when the common CPU interface trap path is enabled.
> > > 
> > > I tested the exact patch both on our real silicon and on QEMU, and
> > > confirmed that all Realm-related tests in kvm-unit-tests-cca passed.
> > > 
> > > I'm not attached to this exact implementation, and I'm happy if the solution is
> > > reworked to better fit into the next revision. 
> > > 
> > > Given that this configuration can be supported by reusing the existing KVM
> > > emulation infrastructure, I think it would be reasonable for CCA to support the
> > > non-TDIR/common-trap configuration rather than requiring ICH_HCR_EL2.TDIR
> > > unconditionally for Realm support. 
> > > 
> > > Supporting this configuration would also allow us to validate the upstream CCA
> > > KVM implementation on real silicon using upstream code paths, and contribute
> > > additional real-hardware testing coverage as the implementation
> > > evolves.
> > > 
> > > I'd be very interested in hearing your thoughts.
> > 
> > So personally I think your patch is a good compromise. It gets the
> > hardware working and I'm keen to enable real-hardware testing. Marc has
> > a very valid point that in terms of performance this could be very bad.
> > Pseudo NMI in particular will be terrible because accesses to GIC
> > registers are used to "emulate" the NMI so the number of traps will be
> > large, and the traps are much more expensive with CCA.
> 
> Yes, in that case ICV_PMR_EL1 would be accessed frequently, and the
> resulting traps would be expensive.
> 
> > 
> > So I'll attempt to incorporate the changes in your patch, but obviously
> > you'll have to decide for yourself whether the performance of the
> > product is suitable.
> 
> Thanks for the clarification.
> 
> I agree with the performance concern, and I'll run some benchmarks on
> our hardware.

Hi Steven and Marc,

Sorry for the late response.

The results confirm your concern. Our initial hackbench measurements showed
considerable performance overhead for the non-TDIR Realm configuration with
pseudo-NMI enabled. Due to restrictions on disclosing performance data for our
hardware, I cannot share the absolute results or further platform details.

However, with pseudo-NMI disabled, performance was comparable to the
TDIR-capable configuration. The difference was at most a few percent across
runs.

There is a real need to run Realm VMs in environments that do not require
pseudo-NMI, and non-TDIR hardware can meet that need. Pseudo-NMI is not enabled
by default in many commonly used distributions, and native NMI support through
FEAT_NMI may also reduce the need for pseudo-NMI in the near future. As a
result, the number of use cases in which the observed performance limitation is
relevant is likely to decrease. Therefore, the pseudo-NMI result does not
necessarily make non-TDIR Realm support impractical for all current or future
use cases.

Note that the initial measurements used pre-production versions of TF-RMM and
TF-A. During our evaluation, we applied preliminary tuning to these firmware
components and have already observed substantial performance improvements.

For the production release of our hardware, we plan to further tune the
software stack, including these firmware components, together with the hardware
configuration. We therefore believe that there remains meaningful room for
further performance improvement, although we cannot yet quantify the final
improvement.

I agree that non-TDIR has a performance limitation for trap-intensive
configurations. However, given the actual customer demand for running CCA
workloads that do not require pseudo-NMI, I believe that supporting Realm VMs
on non-TDIR hardware still has clear practical value. It would also allow us to
accelerate validation of the upstream CCA KVM implementation on real silicon
using upstream code paths and contribute additional real-hardware test coverage
as the implementation evolves.

Thanks,
Kohei

> 
> Thanks,
> Kohei
> 
> > 
> > Thanks,
> > Steve
> > 

