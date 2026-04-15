Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736AAF419B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 14:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUEUiRGlmPY2mseaWmxVfdTWYErUp9wSt8W/hdYt0g0=; b=UnrueOtS7ibHCtleJ7ULCegadP
	mkZxlrUhwWFkvngglSGZWZ7L2gAcd08KTBYYHdcOlhJTH3IAAzaVBABeUuC29iaE9NtBRw3E56hUY
	JFIdX04jzRSm4sE6M2mBD6LbL46gfs/kKqxrp7jX6KDPO/T0t3jM0oIzpxWlqussPr3qZ8bhZCSvt
	UdBfFkoB+DFp8SMUUkcMRtGcYTmSagTvgzD+bD/arD7jhqybX83F4hLlrbydAgUikGalltH6s1NcP
	3jgvZny79MeCiRRwTaRisYxEmm5gRGGZBVzjudnmcFhSrTAgO99gamigeQFBMxJXMHTHpkrc/LW1G
	OFW0bmyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0q6-00000001D6t-0QaB;
	Wed, 15 Apr 2026 14:03:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0q3-00000001D6X-1iSD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 14:03:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 076264454A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 14:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06EBC2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 14:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776261809;
	bh=5pS4SfD0lWDbRwrU5/HiL/ioGrDgnmIiFIPZChr5qes=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G8a67CT9i9eC93CYW+yJKIVxfGColVv7omAwr4rBgTVUWXesxWhu+KWVrn+dRk4Hm
	 /D4+5p1BXqRCV0CUL469IcePDSK4wl3qSHui2mPMa6VkC8OmLxtuBEF0/HFWhOPyVo
	 YWxvQDpwYZe5t4kp8N3Vjt5PsqGGDiHavUcc+JiyRzzawH1Gfvx29FQ3E2QguA4QWT
	 9GCW3mrsTqJCQNzqb/NoyAErhdTsYe3SezAApwLys3uH+u02BZzNly77ni1fuzEJm6
	 s0A+CdRrQ59jMIf125pJNmpcAig6He+V/y00T47JjTj8mMH1KqtKKWP69caY5R6lSg
	 mfi0E7oRw2onw==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-68a5e7b5b52so2842279eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 07:03:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9XYSY9bsFKtsD5Isr94OHEum0JadiX/+MRgsAwKCre4RBrooq4u1e6vlgznL0knBgHiuFVngn9iXzUOuDie2D5@lists.infradead.org
X-Gm-Message-State: AOJu0YyVDQz6igyKw4EK+MVJvfBIeeRvaxb+nHJrlVZLMDDzkcqANC0U
	J4xlouQqZayNtU0E0QL0wPK5j+CU9vCPrDv/flDak4dlnKDK6SYeuCqD7MUke/9SClt1fUHIVq/
	0Lupak484f1Xbxe+ATVui7A2j3Iq1Xpk=
X-Received: by 2002:a05:6820:218:b0:687:bbfa:2158 with SMTP id
 006d021491bc7-68bf6aebec2mr9587988eaf.13.1776261806782; Wed, 15 Apr 2026
 07:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-ffh-v1-1-301704f69e2f@debian.org> <af9c679d-899c-4832-b902-e621b5987f12@huawei.com>
 <ad4UWJ__dnDQtrj8@gmail.com> <6694ca7c-13bf-4e7d-9621-bc992cbf96a7@huawei.com>
 <20260414-cute-shapeless-dolphin-c5b2fc@sudeepholla> <33c15199-25ea-4d39-bff9-91af0b49633e@huawei.com>
In-Reply-To: <33c15199-25ea-4d39-bff9-91af0b49633e@huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 15 Apr 2026 16:03:15 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hftnagiLTPCEjqviyug5g5NQCztX1o0w5NOY8d=5cz+g@mail.gmail.com>
X-Gm-Features: AQROBzARfwQzbblVS4HwmI4PAiTiOq-oHuuggUND-Sc3bt1HPaVjtyZCd_Xm8_o
Message-ID: <CAJZ5v0hftnagiLTPCEjqviyug5g5NQCztX1o0w5NOY8d=5cz+g@mail.gmail.com>
Subject: Re: [PATCH RFC] ACPI: processor: idle: Do not propagate
 acpi_processor_ffh_lpi_probe() -ENODEV
To: "lihuisong (C)" <lihuisong@huawei.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Len Brown <lenb@kernel.org>, lpieralisi@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pjaroszynski@nvidia.com, guohanjun@huawei.com, 
	linux-arm-kernel@lists.infradead.org, rmikey@meta.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_070331_511703_51276C31 
X-CRM114-Status: GOOD (  33.75  )
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

On Wed, Apr 15, 2026 at 3:32=E2=80=AFAM lihuisong (C) <lihuisong@huawei.com=
> wrote:
>
>
> On 4/14/2026 8:25 PM, Sudeep Holla wrote:
> > On Tue, Apr 14, 2026 at 07:31:29PM +0800, lihuisong (C) wrote:
> >> On 4/14/2026 6:21 PM, Breno Leitao wrote:
> >>> Hello Huisong,
> >>>
> >>> On Tue, Apr 14, 2026 at 05:43:51PM +0800, lihuisong (C) wrote:
> >>>> But it is a real issue. Thanks for your report.
> >>>> I think the best way to fix your issue is that remove this verificat=
ion in
> >>>> psci_acpi_cpu_init_idle().
> >>>> Because it is legal for platform to report one LPI state.
> >>>> This function just needs to verify the LPI states which are FFH.
> >>> Thank you for the prompt feedback.
> >>>
> >>> Would this approach work?
> >>>
> >>> commit 6c9d52840a4f778cc989838ba76ee51416e85de3
> >>> Author: Breno Leitao <leitao@debian.org>
> >>> Date:   Tue Apr 14 03:16:08 2026 -0700
> >>>
> >>>       ACPI: processor: idle: Allow platforms with only one LPI state
> >>>       psci_acpi_cpu_init_idle() rejects platforms where power.count -=
 1 <=3D 0
> >>>       by returning -ENODEV. However, having a single LPI state (WFI) =
is a
> >>>       valid configuration. The function's purpose is to verify FFH id=
le states,
> >>>       and when count is zero, there are simply no FFH states to valid=
ate =E2=80=94
> >>>       this is not an error.
> >>>       On NVIDIA Grace (aarch64) systems with PSCIv1.1, power.count is=
 1 for
> >>>       all 72 CPUs, so the probe fails with -ENODEV. After commit cac1=
73bea57d
> >>>       ("ACPI: processor: idle: Rework the handling of
> >>>       acpi_processor_ffh_lpi_probe()"), this failure propagates up an=
d prevents
> >>>       cpuidle registration entirely.
> >>>       Change the check from (count <=3D 0) to (count < 0) so that pla=
tforms
> >>>       with only WFI are accepted. The for loop naturally handles coun=
t =3D=3D 0
> >>>       by not iterating.
> >>>       Fixes: cac173bea57d ("ACPI: processor: idle: Rework the handlin=
g of acpi_processor_ffh_lpi_probe()")
> >>>       Signed-off-by: Breno Leitao <leitao@debian.org>
> >>>
> >>> diff --git a/drivers/acpi/arm64/cpuidle.c b/drivers/acpi/arm64/cpuidl=
e.c
> >>> index 801f9c4501425..7791b751042ce 100644
> >>> --- a/drivers/acpi/arm64/cpuidle.c
> >>> +++ b/drivers/acpi/arm64/cpuidle.c
> >>> @@ -31,7 +31,7 @@ static int psci_acpi_cpu_init_idle(unsigned int cpu=
)
> >>>             return -EOPNOTSUPP;
> >>>     count =3D pr->power.count - 1;
> >>> -   if (count <=3D 0)
> >>> +   if (count < 0)
> >>>             return -ENODEV;
> >>>     for (i =3D 0; i < count; i++) {
> >> This count already verified in acpi_processor_get_lpi_info.
> >>
> >> I suggest modifing it as below:
> >>
> >> -->
> >>
> >> git diff
> >> diff --git a/drivers/acpi/arm64/cpuidle.c b/drivers/acpi/arm64/cpuidle=
.c
> >> index 801f9c450142..c68a5db8ebba 100644
> >> --- a/drivers/acpi/arm64/cpuidle.c
> >> +++ b/drivers/acpi/arm64/cpuidle.c
> >> @@ -16,7 +16,7 @@
> >>
> >>   static int psci_acpi_cpu_init_idle(unsigned int cpu)
> >>   {
> >> -       int i, count;
> >> +       int i;
> >>          struct acpi_lpi_state *lpi;
> >>          struct acpi_processor *pr =3D per_cpu(processors, cpu);
> >>
> >> @@ -30,14 +30,10 @@ static int psci_acpi_cpu_init_idle(unsigned int cp=
u)
> >>          if (!psci_ops.cpu_suspend)
> >>                  return -EOPNOTSUPP;
> >>
> >> -       count =3D pr->power.count - 1;
> >> -       if (count <=3D 0)
> >> -               return -ENODEV;
> >> -
> > It was intentionally designed this way, as there is little value in def=
ining
> > only WFI in the _LPI tables. In the absence of a cpuidle driver/LPI ent=
ry,
> > arch_cpu_idle() is invoked, which is sufficient and avoids unnecessary
> > complexity, only to ultimately execute wfi() anyway.
> Yeah, it's correct. The code flow will be more simple and high-efficiency=
.
> This looks good to me.
>
>
> But cpuidle sysfs under per CPU is created when firmware just reports
> WFI state before
> my commit cac173bea57d ("ACPI: processor: idle: Rework the handling of
> acpi_processor_ffh_lpi_probe()").
> However, these platforms will no longer be created now and some
> statistics for state0 are also missing.
> This change in behavor is visiable to user space.I'm not sure if it is
> acceptable.
> What do you think, Rafael?

I think that it would be good to restore the previous behavior,
especially if it has been changed inadvertently.

