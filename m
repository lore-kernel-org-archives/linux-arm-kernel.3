Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B494BC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 17:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUl371QxsVQA8yzTyY6OemGINi+Eom6R2ogihNjEg7w=; b=iPvubhPAGOgAmsdhdh1THDBxyS
	vA5zdLeTmLn9Yg8W7zMur43jFn92F3nG4bmdVeaDCsmj/oJzk5dAEb/nZAI2ybg2Zq3nvRDxB9fXP
	4pyDP2x8kqwnuQAa/ty+F0nuY8PTRVUSVRPRaCbIh4ED615Or8bAdJ+Suh1Gm5MGbyAB01StdUDIM
	kGprPZyeDzjbaoLMyVT2Oim9ZBWxl2rtEU1iOxO+WHgl24yBv3ZdR0zS4Vh0JBQ83uzusfQ56t3de
	VsTtXyG6ivUyuORk3vj6Zw0uqAt9PMvvwxGmMblyMsQcsIQ68dv+hsH/KSY32hQwDU4668vzw8Jp0
	cUHxYlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKh4g-0000000GHxL-3SLx;
	Thu, 29 May 2025 17:29:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKh2U-0000000GHZb-1Wgh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 17:27:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A979043C9F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 17:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A41C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748539653;
	bh=qH4v453/dendpSvOjjh1ZKW/R1SsJgK2XoSkPc/H1O4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t8+N4dZwEfhe+LFdQdFK8MJrzNy7bvLmeld55BQDnlTZUtyshocGIoHG9Q40WZcPw
	 sQjwhnS0pE4+6v1cuKiyCYdZNSqdystTTX9qPQa/JQQDunaV7D1OTBHrpYfvBH8rWR
	 I4bt4WKKQRFnD7KDw5+1is9ziv9jMmW2lYcwx7DVz4OyepjgwIVGLz3qMzuVnQMnjr
	 lifyHr/Wgb/uXXY+3Jej4XdsCuWpCspYzVUXaxBgQIBkyw3VPsoQZuxuMNcjWZ9TSB
	 lectM9/hGEwmawfAB/TYKRzSY600fKZ22CRpVeBgU8mxb/yFrwZrYK8/55QJg8x0RB
	 JrBjN0tSGQ21Q==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-604bf67b515so2092036a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 10:27:33 -0700 (PDT)
X-Gm-Message-State: AOJu0YxuM2nzSW093YZ4zVG0sls3bQBeRUxj7Q/5GWU435bZNaqBzshm
	o7DZtMALEYu9mTcZyDsOu76F+sEMyWRdlgompEx1TtDyr/s8voCqTYf+/5y7QS9xx4pRvyieJ1U
	G0Z+jv8xEBliHSi3xGNXinEmDa7RCsQ==
X-Google-Smtp-Source: AGHT+IG8vuuuHmnAkDYhc0wSUHyMMZZ4pVnP2sLktIt9BGUIiU4Wla89J8p0IqYHCL/M3OMkUGaMQGKSpkLntPI8/WI=
X-Received: by 2002:a17:907:2d12:b0:ad2:2d75:d7fb with SMTP id
 a640c23a62f3a-adb322fa1c2mr29287066b.55.1748539652145; Thu, 29 May 2025
 10:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org>
 <20250520-arm-brbe-v19-v22-5-c1ddde38e7f8@kernel.org> <925bf014-cea8-4cf0-9517-46291db729f2@linaro.org>
In-Reply-To: <925bf014-cea8-4cf0-9517-46291db729f2@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 29 May 2025 12:27:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ3t5UvWMBgLEkm_-sD_S7NEor+vWfVkU-d7va6u9xsmQ@mail.gmail.com>
X-Gm-Features: AX0GCFuZiRqbTownBtX9p_AAnxqssjZP9dZ9VucncBlXoHjZthrkTUHlQWalK88
Message-ID: <CAL_JsqJ3t5UvWMBgLEkm_-sD_S7NEor+vWfVkU-d7va6u9xsmQ@mail.gmail.com>
Subject: Re: [PATCH v22 5/5] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_102734_441988_66E0943C 
X-CRM114-Status: GOOD (  29.24  )
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

On Wed, May 21, 2025 at 11:03=E2=80=AFAM James Clark <james.clark@linaro.or=
g> wrote:
> On 20/05/2025 11:27 pm, Rob Herring (Arm) wrote:
> > The ARMv9.2 architecture introduces the optional Branch Record Buffer
> > Extension (BRBE), which records information about branches as they are
> > executed into set of branch record registers. BRBE is similar to x86's
> > Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
> > (BHRB).

[...]

> > +/*
> > + * BRBE is configured with an OR of permissions from all events, so th=
ere may
> > + * be events which have to be dropped or events where just the source =
or target
> > + * address has to be zeroed.
> > + */
> > +static bool filter_branch_privilege(struct perf_branch_entry *entry, u=
64 branch_sample_type)
> > +{
> > +     /* We can only have a half record if permissions have not been ex=
panded */
> > +     if (!entry->from || !entry->to)
> > +             return true;
> > +
> > +     bool from_user =3D access_ok((void __user *)(unsigned long)entry-=
>from, 4);
> > +     bool to_user =3D access_ok((void __user *)(unsigned long)entry->t=
o, 4);
> > +     bool exclude_kernel =3D !((branch_sample_type & PERF_SAMPLE_BRANC=
H_KERNEL) ||
> > +             (is_kernel_in_hyp_mode() && (branch_sample_type & PERF_SA=
MPLE_BRANCH_HV)));
> > +
> > +     /*
> > +      * If record is within a single exception level, just need to eit=
her
> > +      * drop or keep the entire record.
> > +      */
> > +     if (from_user =3D=3D to_user)
> > +             return ((entry->priv =3D=3D PERF_BR_PRIV_KERNEL) && !excl=
ude_kernel) ||
> > +                     ((entry->priv =3D=3D PERF_BR_PRIV_USER) &&
> > +                      (branch_sample_type & PERF_SAMPLE_BRANCH_USER));
> > +
> > +     // Fixup calls which are syscalls
> > +     if (entry->type =3D=3D PERF_BR_CALL && from_user && !to_user)
> > +             entry->type =3D PERF_BR_SYSCALL;
> > +
> > +     /*
> > +      * Record is across exception levels, mask addresses for the exce=
ption
> > +      * level we're not capturing.
> > +      */
> > +     if (!(branch_sample_type & PERF_SAMPLE_BRANCH_USER)) {
> > +             if (from_user)
> > +                     entry->from =3D 0;
> > +             if (to_user)
> > +                     entry->to =3D 0;
> > +     }
> > +
> > +     if (exclude_kernel) {
> > +             if (!from_user)
> > +                     entry->from =3D 0;
> > +             if (!to_user)
> > +                     entry->to =3D 0;
> > +     }
> > +     return true;
> > +}
> > +
> > +static bool filter_branch_type(struct perf_branch_entry *entry,
> > +                            const unsigned long *event_type_mask)
> > +{
> > +     if (entry->type =3D=3D PERF_BR_EXTEND_ABI)
> > +             return test_bit(PERF_BR_MAX + entry->new_type, event_type=
_mask);
> > +     else
> > +             return test_bit(entry->type, event_type_mask);
> > +}
> > +
> > +static bool filter_branch_record(struct perf_branch_entry *entry,
> > +                              u64 branch_sample,
> > +                              const unsigned long *event_type_mask)
> > +{
> > +     return filter_branch_type(entry, event_type_mask) &&
> > +             filter_branch_privilege(entry, branch_sample);
>
> filter_branch_privilege() sometimes changes the branch type for
> PERF_BR_SYSCALL so I think it should come before filter_branch_type(). I
> didn't see any actual issue caused by this, but it's a bit hard to
> review to see if it's working correctly.

Looking at this again, I think we can drop that with this change:

diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
index 2f254bd40af3..acdde61a8559 100644
--- a/drivers/perf/arm_brbe.c
+++ b/drivers/perf/arm_brbe.c
@@ -546,7 +546,7 @@ static const int
brbe_type_to_perf_type_map[BRBINFx_EL1_TYPE_DEBUG_EXIT + 1][2]
        [BRBINFx_EL1_TYPE_INDIRECT_LINK] =3D { PERF_BR_IND_CALL, 0 },
        [BRBINFx_EL1_TYPE_RET] =3D { PERF_BR_RET, 0 },
        [BRBINFx_EL1_TYPE_DIRECT_COND] =3D { PERF_BR_COND, 0 },
-       [BRBINFx_EL1_TYPE_CALL] =3D { PERF_BR_CALL, 0 },
+       [BRBINFx_EL1_TYPE_CALL] =3D { PERF_BR_SYSCALL, 0 },
        [BRBINFx_EL1_TYPE_ERET] =3D { PERF_BR_ERET, 0 },
        [BRBINFx_EL1_TYPE_IRQ] =3D { PERF_BR_IRQ, 0 },
        [BRBINFx_EL1_TYPE_TRAP] =3D { PERF_BR_IRQ, 0 },

AFAICT, the only cases for BRBINFx_EL1_TYPE_CALL are SVC, SMC, and HVC.

Rob

