Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184EF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HM/Zpnfa;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IGCjqBvL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W1HmmaCLaDmxQDxSww48MVKAfAl+hw686KsydqXGP8E=; b=HM/ZpnfasKQ+Up72oiCiz6ukWk
	xN4DvhuD7daFG+aHj+MYCdMLToAtqeUhVjUogCNMwmgw/TZwoRQJB2L6gu2KAP0fM4I7Va/KN0fw1
	cKHG/EGR0ptDm5UmSIC2Bg5rxbLcutOVw/0TiZw6HS+Um+deiZzTeyOM+gt3gN3WR6Rb9bvNheCpa
	iyozWMIAyLHL3IKUWhE0zf8X/4qDcWUtX0Lj+BGYenp15I6HjiYaic+EHoaKI45W4Oi0N0BbTkAVc
	fqWFbPPWaYJ81Ze6tu8INgM8QTN8hnctC4e36OcYqecViOPoquxIQvWwVqtBp6FoudDKnYkdJExR/
	iPFCHiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3hk-000000073ev-3GXr;
	Wed, 28 Oct 2026 13:28:36 +0000
Received: from out-57.mta0.migadu.com ([2001:41d0:1004:224b::39] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3hi-000000073e3-2mFt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:28:36 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9P2Z/y6NjVdpld2CTv7DpvYDbQvScjoFFhdxAr3DRcA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793194112; v=1; x=1793798912;
 b=IGCjqBvLozUm87yG2dy3UJmL15lp3CINIWHdzTAzeAOqo7RO9TCyxYe1ERKkbfVAnQI8IpT5
 runaDwNrJNGyk2r0ZqQzlchWc0rtkqs8lp88Djmo/zDO/RX+fPvPvFEpQxaKycLivaaOz+TlcNN
 ASDsLcUQUBxwMcaXbJnQop4o=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ce9bdb8787da67b5;
	Wed, 28 Oct 2026 13:28:32 +0000
X-Mizu-Trace-ID: ce9bdb8787da67b5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be58ad9600so8331e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:28:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxpBFjpUkL6/nIylt5SiY0NpSTTQC85fYl3Wze5bBidznX1uilY5OMBY50ybv1euKWftRpgPOnAia6T2BQl3Xae@lists.infradead.org
X-Gm-Message-State: AFq9FYLBJZTxo7tJM/yEbi6mGGFtkKbvjD6kRmZa+tU7jfJFPNTEc01n
	6ngDjpmzQJYBngQ1NAVmV2TPGqQkV1c97/Fmf39N/1wgs/wYLE9pGyqaUWySRafp/BNZmoGdszp
	I8js/ejD3hqktJK+PCWV0jkExKUwQdFCg5KQ5XJNP
X-Received: by 2002:a05:6512:3191:b0:5bf:a191:c132 with SMTP id
 2adb3069b0e04-5bfcadddf9cmr156064e87.2.1793194106543; Wed, 28 Oct 2026
 06:28:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028110739.2366566-1-fuad.tabba@linux.dev>
 <20261028110739.2366566-4-fuad.tabba@linux.dev> <86mrryxa0b.wl-maz@kernel.org>
In-Reply-To: <86mrryxa0b.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 28 Oct 2026 13:27:50 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzNWj06JAJsJJgojC1j+TuZbfQbyB-5s+h=9DbOtYU1BQ@mail.gmail.com>
X-Gm-Features: AclHuK-dO70Ki_OMkN_Ee00KAstB-ItAriaRWTmXYHNfORmvfHh-SoeIMyJdhEA
Message-ID: <CA+EHjTzNWj06JAJsJJgojC1j+TuZbfQbyB-5s+h=9DbOtYU1BQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Disable host PMU counters for
 protected guests
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Oculytic <oculytic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_062834_896627_B71DF98B 
X-CRM114-Status: GOOD (  13.55  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 at 12:52, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 28 Oct 2026 11:07:39 +0000,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
[...]
> > +static u64 __pmu_stop_host_counters(struct kvm_vcpu *vcpu)
> > +{
> > +     u64 pmcnten;
> > +
> > +     if (!vcpu_is_protected(vcpu) || !system_supports_pmuv3())
> > +             return 0;
> > +
> > +     pmcnten = read_sysreg(pmcntenset_el0);
> > +     if (pmcnten)
> > +             write_sysreg(pmcnten, pmcntenclr_el0);
>
> It feels a bit odd to change the individual counter enables, rather
> than just use PMCR_EL0.E, which is designed for this purpose.
>
> It probably doesn't change much, but it'd certainly make the intent a
> bit more obvious. Or am I missing something?

Nope, my miss. I'll move to PMCR_EL0.E in v3.

Thanks,
/fuad

