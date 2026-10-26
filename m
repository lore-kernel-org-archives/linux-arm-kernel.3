Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A95A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CtE43jQL;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=YXSpTftf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QFUFENIciwLZFoUCVayw48AKayBa+G1hl0ibvcGBtzQ=; b=CtE43jQLLIHXnQTedfL2nIg+4n
	3JM4zSpw8o4HCZ4Z6OmDGwKWPIIclF3SvFMwMc4sv8y3xhGBZu/4hosieq5FY13WvKk6k2gxw2OTm
	dWrNltUA5dJpMydyB0w2L2Zb7OW/4wtHtD9h3Ih53uY2lxIx1iC9MY+k7//lnA2V6ezRBFlmwHUAV
	1YUJnQBk+yzM4nNmMWuMPaDjgXM73Jdw5xx4u6Cl7SJVCUT8q11x8KJysXYbeRvlxPIt0pohLBBq7
	6yr0zZuJTFthYhRbXuiWyRaaCkkNV+S4KeQDyvOfkCHcbQcZ/WRRs9QdH7RGXM0rh0RZAiIRIi6ku
	lJIkpouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKRa-00000002ZOh-19oB;
	Mon, 26 Oct 2026 13:08:54 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKRX-00000002ZOJ-0LNy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:08:52 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c247f6687dcso446461066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 06:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793020128; x=1793624928; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QFUFENIciwLZFoUCVayw48AKayBa+G1hl0ibvcGBtzQ=;
        b=YXSpTftfoj8sEhfvMEP4syXpgq/UlJFkJWtmQvgM+a+rCqEotJRCqQxLvBTf9DNzo9
         AkVbzlNLY0xWAO45QfPB4d/RmGXgdvIF5DNMWe58oxruTmcxPN9VZxQVrHmrDTKU65gv
         jeRLxZ3BlmeLZWqx/aJABOj3FMhTA06a07iT1I7A2y+fPjl1jP+wPV1k/M7QSiOXcxQM
         VyhTt65780HfEeQ0BHmhpXoOuuqW1vWxc2vDcuWp7h8WRdduNMi/SedaCzH0XfjhxGsu
         T2YQtFidrDj5TJoFlD31ooWhubf7Yw6szz+30TEnjBujN7lRKOXrtBVsRmK0nLnFAUte
         mKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020128; x=1793624928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFUFENIciwLZFoUCVayw48AKayBa+G1hl0ibvcGBtzQ=;
        b=IACnPsx+eL8AGz9LulRuZM2rmJ9CNNtEi2ww2nwhO5Qx7f7QsyzpsNYFAjF5Rsze+c
         7T1IjfMcZdnpU/dY2Aw5gaY1xW7AHQvKgtHby4cegl1dzslPABB8RfGNGzSENC0P79Fq
         R6HV4f5ZCwusdl2y81MtprwPmd2s+kIYbCLpyuj8u8TeHTMv3IeJkTAt4/k1E2Tdhaw5
         Wisnb9b/yjmklECl4B5hqBOyoRcXVTcR0yFhWdIgt0mT/lI0PUDJnnatv8D/D/Zpr5SC
         a8pDAH9DfAYSWD2RVOI0e7wXW7BpLW4O1PHaEBl5T1yYlNYS6ay4M30IDh+j0klGMtL1
         Xu8w==
X-Forwarded-Encrypted: i=1; AKwUvBxDIy16JwzsvLKeKCvNNottQ7FwUf/FykD+sz7ACjnLy875cc+ZxkTphE2BkACne+bTBb5FGIIexdR1bEmP/t/S@lists.infradead.org
X-Gm-Message-State: AFq9FYLuN0hHA1zfVcTpSD+UlWX/VA/mspdShXvQbypE0WmHjFQguT/O
	pdr4zSbIMz5rxiTOvqVOxsHvrReu22hdsIkaAJ2Ku9ztAqdsf3l6xOVdheAH4sfx5g==
X-Gm-Gg: AYBFou07fbO6EhroDEcECgFkZi8i7pDEhDfl7FDXRaQ4cyQiR0C8+5N0m8bt4e2J2IZ
	wS4xALjAvZCqOSIxpF9m5R+/9aDExT8N548jCVarmb62+YdxSCXh6rSNn3qBWdDzwQ2LVOndLFJ
	jD7ZKbVDy9DpZWktG5sGp3SmDQv1Tv8Px0hxYkaI8p99C3AoQOXshTFqCdveYH7Nhrz2i1dH/kQ
	qU7xX5TMu6rvr/h6Mb32cyOQAxfvB77lHFpWJYvvhEeCPA/WqqcSGSHfXyeuMMwpXd/6t6vt0Zf
	ZAxp0OXqAzHHDdQoQHPbM1sv1kek0qddl2ySlvRGzPkPhrQ/L2IVOwC3GyFq3NEcMh0Hz57XhXq
	Xr43Mwhv48dzvbF5Q3OOeXhBkpsGZc8f3Oy4Ovbc1DEeWrCxXkefa6s6TpUZl6HWqJI/kf/k+Ps
	fbvNUEH0QOyEa8BuLdp2N+gJ8H1Zu9/ruXj2FC3Knr7YheKhfDcKbMHnSaBSAR3HYybRUsyuRP2
	/m36m+eOJian8I/nc9q97VzbpAy7Lj0upzkczClcCzOaEGnXO5rt5F1QBC3LKYFUIih7wpEWAwO
	AW88OtnBIRqmT3HSakBP3qGF
X-Received: by 2002:a17:907:3ccc:b0:c40:6ed9:b962 with SMTP id a640c23a62f3a-c46bdc2a4b5mr786978166b.26.1793020127574;
        Mon, 26 Oct 2026 06:08:47 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e99a2sm323829166b.24.2026.10.26.06.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:08:43 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:08:39 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev
Subject: Re: [PATCH v1] KVM: arm64: Use the host kvm_host_data for
 nr_event_counters
Message-ID: <at9Q1-tbXDcRbeyq@google.com>
References: <20261023092007.3918848-1-vdonnefort@google.com>
 <86cxt0zj6u.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86cxt0zj6u.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_060851_197972_2B2E867F 
X-CRM114-Status: GOOD (  28.16  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 01:37:45PM +0100, Marc Zyngier wrote:
> On Fri, 23 Oct 2026 10:20:07 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > nr_event_counters is only used by the host to populate mdcr_el2.
> > However, host_data_ptr() for pKVM switches between the hypervisor copy
> > of kvm_host_data before it is deprivileged to the host copy after.
> > 
> > So kvm_init_host_debug_data() initialises nr_event_counters in the
> > hypervisor's kvm_host_data, while kvm_arm_setup_mdcr_el2() reads the
> > host copy which is 0. With a HPMN of 0, this stops programmable event
> > counters from counting a non-protected guest.
> > 
> > Always use the host copy for nr_event_counters.
> > 
> > Fixes: 2417218f2f23 ("KVM: arm64: Get rid of __kvm_get_mdcr_el2() and related warts")
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > ---
> >  arch/arm64/kvm/debug.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
> > index f4d7b12045e8..a00771339c62 100644
> > --- a/arch/arm64/kvm/debug.c
> > +++ b/arch/arm64/kvm/debug.c
> > @@ -44,7 +44,7 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
> >  	 * to disable guest access to the profiling and trace buffers
> >  	 */
> >  	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
> > -					 *host_data_ptr(nr_event_counters));
> > +					 __this_cpu_read(kvm_host_data.nr_event_counters));
> >  	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
> >  				MDCR_EL2_TPMS |
> >  				MDCR_EL2_TTRF |
> > @@ -80,8 +80,8 @@ void kvm_init_host_debug_data(void)
> >  								   ID_AA64DFR0_EL1_PMUVer_SHIFT);
> >  
> >  	if (pmuv3_implemented(pmuver))
> > -		*host_data_ptr(nr_event_counters) = FIELD_GET(ARMV8_PMU_PMCR_N,
> > -							      read_sysreg(pmcr_el0));
> > +		__this_cpu_write(kvm_host_data.nr_event_counters,
> > +				 FIELD_GET(ARMV8_PMU_PMCR_N, read_sysreg(pmcr_el0)));
> >  
> >  	*host_data_ptr(debug_brps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, BRPs, dfr0);
> >  	*host_data_ptr(debug_wrps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, WRPs, dfr0);
> > 
> 
> This really looks like the wrong approach.
> 
> host_data_ptr() should be reliable, and always point at the correct
> data, irrespective of the backend. If host_data_ptr() returns a
> pointer to stale data on pKVM, then it is purely a pKVM bug, and
> that's what needs fixing by synchronising the two copies by whatever
> means necessary.

I'll update both copies and make a common series Fuad.

Thanks

-- 
Vincent


> 
> Randomly picking a different accessor is not an acceptable outcome.
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

