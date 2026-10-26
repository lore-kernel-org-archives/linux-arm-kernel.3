Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2723606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HK7VW2QC;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=uNqZM3HM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ihE3J0tMhcm8xJUaaHT/JhbOlKVqb9U5D80ilvr1OUQ=; b=HK7VW2QCNlrG1G
	q3qs/e3XzC8QCdzXamsOiTIk4xQOggWTJb3Ycid/6knT0vKyTv5s4SjAphbqcYDX2p8DLJRs1n+OV
	A6hWQj3hY7fK6880vE18sZn3jGU8N3m89/ZHyd6syxq29ahiKNJ7qdfFVrQjfUCvOhvDj8vm8gnyo
	Fy4P3KPxB5hzg7qduxV+R0Zjas2xP+gRb0OVVHafiF9zQrr+lsmAreP5BQ9CNui0lWQ255rrdXFe+
	bE1VDmd+vvNPIgxrB02tA/jE9I0jrKd+VUv81ga8dZd44oGyibPMHs9wX3Wih9t70jkblFtgIEziB
	uMPboQ71qRLYnwpniZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJzz-00000002WTy-2CVG;
	Mon, 26 Oct 2026 12:40:23 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJzu-00000002WTI-2nYx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:40:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ihE3J0tMhcm8xJUaaHT/JhbOlKVqb9U5D80ilvr1OUQ=;
	b=uNqZM3HMTQk9Xu0sNLqrju0QZDjawzqeIsP44Uzit3ceBjCo26aeQZ5A0ydLfrwhewGbTQkXv
	e8bfZW6CITdgUHVckYH7sONZYnXt/JUb3hMIw4EGjTCeSww7wtZYWv/JyKKWEjklt62bJFtQsYC
	e5HBTHxLlvihKPry+4HlAY8=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jCtW470pPzKm9S;
	Mon, 26 Oct 2026 20:40:00 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D49CB40586;
	Mon, 26 Oct 2026 20:40:08 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 20:40:08 +0800
Message-ID: <d77ead72-4c5c-42bb-b002-f5928c2ae496@huawei.com>
Date: Mon, 26 Oct 2026 20:40:07 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/10] arm_mpam: resctrl: Rename struct
 mpam_resctrl_dom to mpam_resctrl_ctrl_dom
To: Reinette Chatre <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<james.morse@arm.com>, <Dave.Martin@arm.com>, <fenghuay@nvidia.com>
CC: <tony.luck@intel.com>, <yu.c.chen@intel.com>, <babu.moger@amd.com>,
	<fustini@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <fe38eaea025896ace1baa536fa8e73b409f22b9a.1792443633.git.reinette.chatre@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <fe38eaea025896ace1baa536fa8e73b409f22b9a.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_054019_420468_D06E7F92 
X-CRM114-Status: GOOD (  16.48  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/10/20 6:07, Reinette Chatre 写道:
> struct mpam_resctrl_dom holds the control domain of a resource, while
> its monitoring domain is held by struct mpam_resctrl_mon_dom. Unlike the
> name of the monitoring structure, the name struct mpam_resctrl_dom does
> not say which kind of domain the structure holds.
> 
> Rename it to struct mpam_resctrl_ctrl_dom to match its monitoring
> counterpart.
> 
> No functional change.

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
>  drivers/resctrl/mpam_internal.h |  2 +-
>  drivers/resctrl/mpam_resctrl.c  | 18 +++++++++---------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1df439ecb055..dc304e4e0dc0 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -432,7 +432,7 @@ struct mpam_msc_ris {
>  	struct mpam_garbage	garbage;
>  };
>  
> -struct mpam_resctrl_dom {
> +struct mpam_resctrl_ctrl_dom {
>  	struct mpam_component		*ctrl_comp;
>  	struct rdt_ctrl_domain		resctrl_ctrl_dom;
>  };
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index ce5519635c51..022920be1862 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1375,7 +1375,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>  	struct mpam_config *cfg;
>  	struct mpam_props *cprops;
>  	struct mpam_resctrl_res *res;
> -	struct mpam_resctrl_dom *dom;
> +	struct mpam_resctrl_ctrl_dom *dom;
>  	enum mpam_device_features configured_by;
>  
>  	lockdep_assert_cpus_held();
> @@ -1384,7 +1384,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>  		return resctrl_get_default_ctrl(r);
>  
>  	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
> -	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
> +	dom = container_of(d, struct mpam_resctrl_ctrl_dom, resctrl_ctrl_dom);
>  	cprops = &res->class->props;
>  
>  	/*
> @@ -1435,7 +1435,7 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>  	struct mpam_config cfg;
>  	struct mpam_props *cprops;
>  	struct mpam_resctrl_res *res;
> -	struct mpam_resctrl_dom *dom;
> +	struct mpam_resctrl_ctrl_dom *dom;
>  
>  	lockdep_assert_cpus_held();
>  	lockdep_assert_irqs_enabled();
> @@ -1448,7 +1448,7 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>  	 * resctrl_arch_update_domains() relies on this.
>  	 */
>  	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
> -	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
> +	dom = container_of(d, struct mpam_resctrl_ctrl_dom, resctrl_ctrl_dom);
>  	cprops = &res->class->props;
>  
>  	if (mpam_resctrl_hide_cdp(r->rid))
> @@ -1618,7 +1618,7 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
>  static int mpam_resctrl_setup_ctrl_domain(unsigned int cpu,
>  					  struct rdt_resource *r,
>  					  struct mpam_component *comp,
> -					  struct mpam_resctrl_dom *dom)
> +					  struct mpam_resctrl_ctrl_dom *dom)
>  {
>  	struct rdt_ctrl_domain *ctrl_d = &dom->resctrl_ctrl_dom;
>  	int err;
> @@ -1710,10 +1710,10 @@ static struct mpam_resctrl_mon_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu
>  	return NULL;
>  }
>  
> -static struct mpam_resctrl_dom *
> +static struct mpam_resctrl_ctrl_dom *
>  mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
>  {
> -	struct mpam_resctrl_dom *dom;
> +	struct mpam_resctrl_ctrl_dom *dom;
>  	struct rdt_resource *r = &res->resctrl_res;
>  
>  	lockdep_assert_cpus_held();
> @@ -1730,7 +1730,7 @@ static void mpam_resctrl_add_cpu_ctrl_domain(unsigned int cpu,
>  					     struct mpam_resctrl_res *res)
>  {
>  	struct rdt_resource *r = &res->resctrl_res;
> -	struct mpam_resctrl_dom *dom;
> +	struct mpam_resctrl_ctrl_dom *dom;
>  	struct mpam_component *comp;
>  
>  	lockdep_assert_held(&domain_list_lock);
> @@ -1780,7 +1780,7 @@ static void mpam_resctrl_remove_cpu_ctrl_domain(unsigned int cpu,
>  						struct mpam_resctrl_res *res)
>  {
>  	struct rdt_resource *r = &res->resctrl_res;
> -	struct mpam_resctrl_dom *dom;
> +	struct mpam_resctrl_ctrl_dom *dom;
>  
>  	lockdep_assert_held(&domain_list_lock);
>  

-- 
Best regards,
Jinjie


