Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E53B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MQ09J3PB;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GT9Zlh9b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qcokdDgL4mvoHte5dbQtGJJPejEfezJaBPHvPpNg2A8=; b=MQ09J3PBM2C47QUSsJWibjdh+s
	z5Ruad83GVeDHl7Ylqt1ZwowQzYPZswGpCjDAKQUqwHYsudfhEw0+hukLvAz1+v0E1u/8PFQzw0Ux
	Lx7x5R9KKezrBzscgqMGWbjmyJJUmXw2ZHhfzyoe3lm01P8o9+8HNgZ6ip9GUt40+/PYxMIxl1zay
	+vxnTXCEL2Y34vJgWi3hJZ3GqVuaCCTTz7T8G208iTzQCQfbFN7L6aMehr0HxwL9ShpUBaqw6euMs
	Z6mPPri7RK+cUSdKl6QP7JXoh5v9gcYfsrjLCAyi4hLInVA35GWiSfCRKq3SEL+DLjX97xCERWtqA
	ncbMbX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Pv-00000006oyw-2wBP;
	Wed, 28 Oct 2026 11:02:03 +0000
Received: from out-27.mta0.migadu.com ([2001:41d0:1004:224b::1b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Ps-00000006oyU-422x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 11:02:02 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=rh4zM0t9OB8EXFXZvzLi8a+hQvyHbDJz8WyuNEI5q98=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793185318; v=1; x=1793790118;
 b=GT9Zlh9bSUChRFRkHkl3nWeUPuJhSh4nj7YSkZtz0NglVTJpBDiOi27Em8Gs0KZeESLBKptW
 m1fuxWUQPiKg0cGmV6g8BF718+m6Imgn4HyLJQFY1HwTioWU7uK2Wus2OpKYzuBvIn4GJCjn1Wn
 wnQooQFsMNpRa6gX4IAHX3KU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fce9bb1bd75e2616;
	Wed, 28 Oct 2026 11:01:58 +0000
X-Mizu-Trace-ID: fce9bb1bd75e2616
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so7475e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 04:01:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxwmqlyi4mnv5aSRSRUQgLQq8r1Q479XL4yJkFXwVioFLsO6zq/tsj8bpoSz1nP+8b7ZB/HNVOJfwJj4pX2d5E+@lists.infradead.org
X-Gm-Message-State: AFq9FYLhJ2JuekJ5Hx06weGMmarZ8FndNhZyxiM1R3jypHWusWf115wk
	Fm3RYnXtQFomAqkwg59n87I5Y2XhhlYqX9xd0aTQv8DLtadI99KsSIaZOxSDfOWZTeq1hia+BOn
	GwKYjZrx6xvelo7yhaLC6GGplAD1sbbyUdEtz+koB
X-Received: by 2002:a05:6512:3a86:b0:5bb:27df:415f with SMTP id
 2adb3069b0e04-5bfcd0262a4mr142862e87.15.1793185311685; Wed, 28 Oct 2026
 04:01:51 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027081147.498183-1-fuad.tabba@linux.dev> <20261027081147.498183-3-fuad.tabba@linux.dev>
 <auCFa2VPEmxx2ZcC@google.com>
In-Reply-To: <auCFa2VPEmxx2ZcC@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 28 Oct 2026 11:01:15 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzS_rqHYR+bxvMkJt6KAagrDE9VJecAaS4qimqTQa3LjQ@mail.gmail.com>
X-Gm-Features: AclHuK-N-iC_NAvcm9TdrzyXjqM3xFcWr7x8zL-7NgW85hvGrrNZ88luGxX9CiU
Message-ID: <CA+EHjTzS_rqHYR+bxvMkJt6KAagrDE9VJecAaS4qimqTQa3LjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Pass the PMU events to the hyp vCPU of
 non-protected guests
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Oculytic <oculytic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_040201_363592_A12E1822 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 at 11:05, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> > +#ifdef CONFIG_HW_PERF_EVENTS
> > +static void flush_pmu_state(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +     if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +             hyp_vcpu->vcpu.arch.pmu.events = hyp_vcpu->host_vcpu->arch.pmu.events;
> > +}
> > +#else
> > +static void flush_pmu_state(struct pkvm_hyp_vcpu *hyp_vcpu) {}
> > +#endif
>
> nit: Could save a couple of lines by just doing?

The coding style says to "Prefer to compile out entire functions,
rather than portions of functions", as do similar functions here.

[...]
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> Tested-by: Vincent Donnefort <vdonnefort@google.com>

Thanks!
/fuad

