Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD9BF9D0C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBdItcm4SpsvDcMo6VDP8MI5QdRVaF4W043aa/ZGUhQ=; b=uzkW2qojAaiv0+4VKqQpSe7RD8
	lhysojoSb7akshkgBW3HIQqO7rM1iJOqhMDugAZcSsSSTss6tI6by0G8dYQ7Zu64RdWLPblR1NxL6
	Nl4eP7Yt20o5wsGOLmYQnoJAZkfZIkNLVLlqDMu9QRTUijl8a8Jf+qmSqC1CsMPbnqidgk89MBQO2
	/N+SmPVKcoPN7fDVTF7JAAP/vIzCLp7mOgPzPfoc1i5TBrrMU9BFqyTs0kjxOlIrgUf/zo7bfdnW8
	wPS1lmTNoDnDgNbKIJAMD4XwMY8LDOdZ3d1QcmOqxQsLyP7YGgZYA/thKlJc8ByaKm8Hv52nt0YvJ
	PJEtF0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcWP-0000000HH4i-296y;
	Tue, 14 Apr 2026 12:05:37 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcWN-0000000HH4J-1b5z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 12:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=JBdItcm4SpsvDcMo6VDP8MI5QdRVaF4W043aa/ZGUhQ=; b=prh3cNO7H5DIoCudtpYHbVGQ8z
	95eGPGtTkFLexvqs6odwc4SN9rzEuqkklN8ahwVaX+79xwM49vqQ7z1PtADTAucfFiOTt5uQDo9sa
	OYfJgJYGOUOTssGMffcBJQ24LGrBo6xoPO2Ou1DPx7Kv+82mU2sAaEI6Bsah622mpfCEa6MbeyOrc
	S9fsJCkEn60d/jlrsapqNOmZrdC6QNHORD9oQX0pedBDJ6rV3uzYyC4EgHbD0BE3CTjDZ7Oemadm9
	Nq7Ce8n1QibO23zbDWVXBSHKmMOUIsAiphi1hhgmoqXvn9vlQgGU5XmJ+3WjoGOuBweRbnda0AaT7
	QAeTGLvA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCcW1-00D3Kj-1S;
	Tue, 14 Apr 2026 12:05:13 +0000
Date: Tue, 14 Apr 2026 05:05:07 -0700
From: Breno Leitao <leitao@debian.org>
To: "lihuisong (C)" <lihuisong@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	lpieralisi@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pjaroszynski@nvidia.com, guohanjun@huawei.com, sudeep.holla@kernel.org, 
	linux-arm-kernel@lists.infradead.org, rmikey@meta.com, kernel-team@meta.com
Subject: Re: [PATCH RFC] ACPI: processor: idle: Do not propagate
 acpi_processor_ffh_lpi_probe() -ENODEV
Message-ID: <ad4tXOlXITpREkLb@gmail.com>
References: <20260413-ffh-v1-1-301704f69e2f@debian.org>
 <af9c679d-899c-4832-b902-e621b5987f12@huawei.com>
 <ad4UWJ__dnDQtrj8@gmail.com>
 <6694ca7c-13bf-4e7d-9621-bc992cbf96a7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6694ca7c-13bf-4e7d-9621-bc992cbf96a7@huawei.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_050535_504018_AD2281F3 
X-CRM114-Status: GOOD (  29.57  )
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

On Tue, Apr 14, 2026 at 07:31:29PM +0800, lihuisong (C) wrote:
> 
> On 4/14/2026 6:21 PM, Breno Leitao wrote:
> > Hello Huisong,
> > 
> > On Tue, Apr 14, 2026 at 05:43:51PM +0800, lihuisong (C) wrote:
> > > But it is a real issue. Thanks for your report.
> > > I think the best way to fix your issue is that remove this verification in
> > > psci_acpi_cpu_init_idle().
> > > Because it is legal for platform to report one LPI state.
> > > This function just needs to verify the LPI states which are FFH.
> > Thank you for the prompt feedback.
> > 
> > Would this approach work?
> > 
> > commit 6c9d52840a4f778cc989838ba76ee51416e85de3
> > Author: Breno Leitao <leitao@debian.org>
> > Date:   Tue Apr 14 03:16:08 2026 -0700
> > 
> >      ACPI: processor: idle: Allow platforms with only one LPI state
> >      psci_acpi_cpu_init_idle() rejects platforms where power.count - 1 <= 0
> >      by returning -ENODEV. However, having a single LPI state (WFI) is a
> >      valid configuration. The function's purpose is to verify FFH idle states,
> >      and when count is zero, there are simply no FFH states to validate —
> >      this is not an error.
> >      On NVIDIA Grace (aarch64) systems with PSCIv1.1, power.count is 1 for
> >      all 72 CPUs, so the probe fails with -ENODEV. After commit cac173bea57d
> >      ("ACPI: processor: idle: Rework the handling of
> >      acpi_processor_ffh_lpi_probe()"), this failure propagates up and prevents
> >      cpuidle registration entirely.
> >      Change the check from (count <= 0) to (count < 0) so that platforms
> >      with only WFI are accepted. The for loop naturally handles count == 0
> >      by not iterating.
> >      Fixes: cac173bea57d ("ACPI: processor: idle: Rework the handling of acpi_processor_ffh_lpi_probe()")
> >      Signed-off-by: Breno Leitao <leitao@debian.org>
> > 
> > diff --git a/drivers/acpi/arm64/cpuidle.c b/drivers/acpi/arm64/cpuidle.c
> > index 801f9c4501425..7791b751042ce 100644
> > --- a/drivers/acpi/arm64/cpuidle.c
> > +++ b/drivers/acpi/arm64/cpuidle.c
> > @@ -31,7 +31,7 @@ static int psci_acpi_cpu_init_idle(unsigned int cpu)
> >   		return -EOPNOTSUPP;
> >   	count = pr->power.count - 1;
> > -	if (count <= 0)
> > +	if (count < 0)
> >   		return -ENODEV;
> >   	for (i = 0; i < count; i++) {
> 
> This count already verified in acpi_processor_get_lpi_info.
> 
> I suggest modifing it as below:
> 
> -->
> 
> git diff
> diff --git a/drivers/acpi/arm64/cpuidle.c b/drivers/acpi/arm64/cpuidle.c
> index 801f9c450142..c68a5db8ebba 100644
> --- a/drivers/acpi/arm64/cpuidle.c
> +++ b/drivers/acpi/arm64/cpuidle.c
> @@ -16,7 +16,7 @@
> 
>  static int psci_acpi_cpu_init_idle(unsigned int cpu)
>  {
> -       int i, count;
> +       int i;
>         struct acpi_lpi_state *lpi;
>         struct acpi_processor *pr = per_cpu(processors, cpu);
> 
> @@ -30,14 +30,10 @@ static int psci_acpi_cpu_init_idle(unsigned int cpu)
>         if (!psci_ops.cpu_suspend)
>                 return -EOPNOTSUPP;
> 
> -       count = pr->power.count - 1;
> -       if (count <= 0)
> -               return -ENODEV;
> -
> -       for (i = 0; i < count; i++) {
> +       for (i = 1; i < pr->power.count; i++) {
>                 u32 state;
> 
> -               lpi = &pr->power.lpi_states[i + 1];
> +               lpi = &pr->power.lpi_states[i];
>                 /*
>                  * Only bits[31:0] represent a PSCI power_state while
>                  * bits[63:32] must be 0x0 as per ARM ACPI FFH Specification

Ack, I will respin.

Thanks for your help,
--breno

