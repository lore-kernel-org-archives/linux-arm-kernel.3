Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE7F606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0lghexw6;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=rYNvpH8O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTfcY3KbdiQmLNtrA7EgWSIO5XWoep6EANOAU6klbBo=; b=0lghexw6X9TrnogInVU6rNfoJu
	qd/3Icd5nIEnV9pdkdqHT6u7PduEB2HctrprvRAzaqWq48Ns0cQZzVERhConH6mMvmom+KVOghcRo
	8nTLNwMDNRTuDuK4tnZaAExLSA9pdLZYSX/v+WZ2V8CGcpIMYMfCL7bUKtgkIc3ANqAwJT/JlXBSG
	SWXnzrJUBInIZl7mCywaOvTognAR6BAG/bCeap4zHRNzfLfzT4dIpn/tUAT+KiMbXHI330UNDhmPE
	gqO5iB5dKz8RXqFxEMaRSSTATD1OgpHhFX4gcVy1MJaJlPw8m/jawCnHk72PjOGd0uvlAfTu0JPsD
	9MC7n1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ496-000000091F2-0jte;
	Tue, 20 Oct 2026 07:20:28 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ491-000000091DO-3yCg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 07:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1792480830; x=1824016830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=refqq25nv2RRzQpG9iY5BlA9ExyL3HdRLNTWhTg6kFM=;
  b=rYNvpH8O9EiIy1XnR4AoRkUfW036JrB8HExZjS76Dx9+RIOG2oIwXPxQ
   PV8BAp/RO4Cm+V3WL3JZ13y7Sm7f1Yr3y01vizQVvoyJxMmnM0C0xZU+m
   q0CPQaeEUVx7u6UaYSWhXaYGVhoPjo0v2pcc+cmMC6eJHCMzt6GUNO4yX
   iG3LuYpnfncjAmW7vIg7HD+fT/upSl3tGDKlPOzk+BiZnx6necUkXKIrg
   +MvioFumbTEUT1Kpb5HqVC9y8eeJ4/LZi1pSjSrnRvQXb7MATdNwG6085
   gXgvv4Fjg6gyfI5ow+hwRJoSHknhtauc9PDzZAkLBlMR/b5Zc22fa5493
   A==;
X-CSE-ConnectionGUID: 52Omokx7SHG8EmXFaUsjnQ==
X-CSE-MsgGUID: AQClQqOgSY2/rKhUQn15lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="236538195"
X-IronPort-AV: E=Sophos;i="6.27,168,1786978800"; 
   d="scan'208";a="236538195"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 16:20:27 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1A7E310000CB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:20:21 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C0C88C01836
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:20:20 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.226.149])
	by az2nlsmom4.fujitsu.com (Postfix) with SMTP id A09772000281;
	Tue, 20 Oct 2026 07:20:13 +0000 (UTC)
Date: Tue, 20 Oct 2026 16:20:12 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 4/4] irqchip/gicv3: Add workaround for FUJITSU-MONAKA
 erratum E#030003
Message-ID: <atcTtojPd1BSS8fr@FCCLS0092175.localdomain>
References: <20261016-monaka-fix-for-upstream-v2-0-fc7ede7f9f48@fujitsu.com>
 <20261016-monaka-fix-for-upstream-v2-4-fc7ede7f9f48@fujitsu.com>
 <87wlrg8qc7.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wlrg8qc7.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_002025_175693_45FC971F 
X-CRM114-Status: GOOD (  37.26  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/17 13:27, Marc Zyngier wrote:
> On Fri, 16 Oct 2026 11:00:48 +0100,
> Tomohiro Misono <misono.tomohiro@fujitsu.com> wrote:
> > 
> > From: Kohei Enju <enju.kohei@fujitsu.com>
> > 
> > On affected FUJITSU-MONAKA CPUs, the erratum may occur when an SGI is
> > generated by writing to ICC_SGI0R_EL1, ICC_SGI1R_EL1, or ICC_ASGI1R_EL1,
> > if the operation races with CPU interface processing triggered by the
> > arrival of a higher-priority interrupt, an update to a pending
> > interrupt, or a transition of the PE to the Sleep state. When the
> > erratum occurs, the SGI is lost and the system register write does not
> > complete, causing the issuing core to hang.
> > 
> > Guest accesses to these registers are not affected by this erratum, as
> > they are trapped to EL2 and handled without issuing the affected system
> > register write.
> > 
> > Work around the erratum by writing 1 to the bit corresponding to the
> > target SGI INTID in GICR_ISPENDR0 of each target PE's GIC Redistributor,
> > instead of writing to the affected system registers.
> > 
> > Accessing a target PE's GICR_ISPENDR0 requires its Redistributor base to
> > have been discovered. Affected platforms conform to SBBR, which requires
> > PSCI for secondary CPU boot. They therefore do not use the ACPI Parking
> > protocol, which sends an IPI before the secondary CPU has initialized
> > its Redistributor. With PSCI, a secondary CPU discovers its
> > Redistributor before becoming an IPI target.
> > 
> > Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> 
> You are posting a patch on behalf of someone else, you need to add
> your own SoB:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.3-rc7#n448

Thanks for pointing this out. I'll let Tomohiro know.

> 
> > ---
> > Changes in v2:
> > - Clarify the erratum description and document that virtual accesses are
> >   unaffected.
> > - Remove the gic_send_sgi_via_rdist() helper.
> > - Remove the write-count rationale.
> > - Use the CPU MIDR instead of the SoC ID for filtering.
> > 
> > Note that I have left the dsb(st) after the GICR_ISPENDR0 writes
> > unchanged, pending clarification of the required completion point. If
> > the writes must be observed by a specific component before
> > gic_ipi_send_mask() returns, I will use the appropriate mechanism to
> > provide that guarantee.
> 
> See below.
> 
> [...]
> 
> > @@ -1386,6 +1391,17 @@ static void gic_ipi_send_mask(struct irq_data *d, const struct cpumask *mask)
> >  	 */
> >  	dsb(ishst);
> >  
> > +	if (static_branch_unlikely(&gic_fujitsu_030003_erratum)) {
> > +		for_each_cpu(cpu, mask) {
> > +			void __iomem *base = gic_data_rdist_sgi_base_cpu(cpu);
> > +
> > +			writel_relaxed(BIT(d->hwirq), base + GICR_ISPENDR0);
> > +		}
> > +
> > +		dsb(st);
> 
> What is this DSB achieving? As far as I can tell, not much. The memory
> type is nGnRE, so DSB doesn't force writes to reach the end-point, and
> only guarantee ordering that system register SGI generation doesn't
> provide.

Yes, you're right.

> 
> So either
> 
> (a) there is a functional requirement on this HW to have a DSB, and
>     needs to be documented,
> 
> (b) or there is a need for end-point synchronisation, which needs to
>     be enforced by a read back (knowing that the sysreg doesn't
>     provide this guarantee), and this needs to be documented,
> 
> (c) or this is completely superfluous and can be dropped
> 
> Which case are we in?

I think this falls under (c). As far as I can tell, there is no
requirement for ipi_send_mask() to wait for the writes to be observed by
the hardware. I'm not aware of any hardware-specific requirements for
this DSB either. I'll drop the DSB and test the change on our hardware.

Thanks,
Kohei

