Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF857606F623
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PhptWXVr;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GApZLW3s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fpeI5xCCAbNRv2edwRMBg6hx8Gz/r5TkEihn42aKnQs=; b=PhptWXVrWebGeb
	jUc30/sXAA4t+dsfJv9/mlEVhp9B2rh9JG2QcIqOlujblCVdBCx1fdmKWeiHbYCGQJRBPuOHwDwv0
	+DDNstAy34AsCkC17Kt0lpbhTSFt+ZtAudrpGBFCESdk/GqNrMvj6+erS3qS4JUrz5LnSvlfh1sHP
	s265a2Dl/eeiTNR+l5q9XL2FR6jppIN0YHSOTEjX/cLvR+Jz0VSCqoynZi/b5Lq9LSedtuxJpuc1y
	YKp2Sn4vUwO6l1dKr9tCyLThhfCQMF0lcB3BpgCt2fBRmC3hp/6dotNY5v3k+8eBrMLSR6NZfOhLo
	auk58ugcdvg/oR+9V4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGDx-00000002tja-2HM1;
	Tue, 03 Nov 2026 15:14:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGDv-00000002tgm-0mY7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:14:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EEF31595;
	Tue,  3 Nov 2026 07:14:51 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 547F43F673;
	Tue,  3 Nov 2026 07:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793718894; bh=3HKe2lu0Za8JcJiKkaHesTFYMnbN4ggiqN7ow3agR9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GApZLW3s4CjcqNBAmeZD9b1rQ0nDB2NN6EHkG4ncFPJypEo6wyyyi27TgLMy8kx8m
	 l8ANWIogR3y740vLkrqcG8x7igY4XgZukA81JYjbO1E5XBr/Fw3HgfC+irtrK7jat+
	 bjQeZJ4eicPcxS93SbbjZRRLQOvEEk9Fe5oP/FFc=
Message-ID: <e958ad39-d81c-4410-ad69-bdcc975219cb@arm.com>
Date: Tue, 3 Nov 2026 15:14:50 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 02/10] arm_mpam: resctrl: Rename ctrl_comp in
 mpam_resctrl_alloc_domain()
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <adeb2b33540572b5da5edb79d2ddacc9fc098e01.1792443633.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <adeb2b33540572b5da5edb79d2ddacc9fc098e01.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_071455_362714_305D8B8C 
X-CRM114-Status: GOOD (  23.20  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Reinette,

On 19/10/2026 23:07, Reinette Chatre wrote:
> mpam_resctrl_alloc_domain() looks up the component of the resource's
> class that contains the CPU and fails the domain allocation if there is
> none. The component is held in a local variable named ctrl_comp and, when
> the resource supports allocation, it also backs the control domain.
> 
> The lookup and its check apply to every resource, including one that
> supports only monitoring. For such a resource the component does not
> back a control domain, so the name ctrl_comp is misleading. The name also
> makes a comment in the same function ambiguous. The comment notes that
> there may be no ctrl_comp for the L3, which is true of the control
> domain's component but contradicts the local variable, which always
> refers to a component once the lookup succeeds.
> 
> Rename the local variable to comp. Keep the ctrl_comp name for the
> control domain's reference to its component because it only ever refers
> to the component that backs the control domain. Leave the comment
> unchanged since it now unambiguously refers to that component.
> 
> No functional change.
> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>

Makes sense.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

> ---
>  drivers/resctrl/mpam_resctrl.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 3d5f90f9f1f3..b07e5dd895dd 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1623,14 +1623,14 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  	struct rdt_l3_mon_domain *mon_d;
>  	struct rdt_ctrl_domain *ctrl_d;
>  	struct mpam_class *class = res->class;
> -	struct mpam_component *ctrl_comp;
> +	struct mpam_component *comp;
>  	struct rdt_resource *r = &res->resctrl_res;
>  
>  	lockdep_assert_held(&domain_list_lock);
>  
> -	ctrl_comp = find_component(class, cpu);
> +	comp = find_component(class, cpu);
>  	/* class has no component for this CPU */
> -	if (WARN_ON_ONCE(!ctrl_comp))
> +	if (WARN_ON_ONCE(!comp))
>  		return ERR_PTR(-EINVAL);
>  
>  	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
> @@ -1638,10 +1638,10 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  		return ERR_PTR(-ENOMEM);
>  
>  	if (r->alloc_capable) {
> -		dom->ctrl_comp = ctrl_comp;
> +		dom->ctrl_comp = comp;
>  
>  		ctrl_d = &dom->resctrl_ctrl_dom;
> -		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, r->rid, &ctrl_d->hdr);
> +		mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
>  		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
>  		err = resctrl_online_ctrl_domain(r, ctrl_d);
>  		if (err)


