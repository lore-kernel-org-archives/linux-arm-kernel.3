Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27EECE9D42
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzfytsTx5OuJykh2EQGDSp2F3z2kINU6fegXuSn6DAs=; b=LzJ/rcdOvf1EjWWnNp6/9d2TzQ
	H12eVQL+2VuXf0zKoT+YD6f57znowwmzAbq71fFxr2UJK7WT6nFNy0Swt+gq9RkJCcPn0MyDWCZuu
	fcPp2+WjCqvgIGqBHIwQMg4nBdRaDwp8+DGWs4icNrwlzHMuY1vwBr23go4ttca0S5GvgJv9HyuAS
	Kj/m/JZc12qh/KYjPyo2f7PC0U5P5NpmHbudf4Po935AjC3WdHrGp3nYSUfqDBRAvkQHAT4AK3yBQ
	+L9iuzH4YsqvOJAzwpNVf2FOCOTMLmtoHIQi5Q+JJ70G8aHx860V2M/tDuqmkCuKyGTib3aJ74ylx
	L8gY9Niw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8MV-0000000DKLd-2X9a;
	Tue, 06 Jan 2026 14:48:43 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8MT-0000000DKKu-1mxn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:48:42 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlvDf2FXKzHnH6K;
	Tue,  6 Jan 2026 22:48:34 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id A1F8740086;
	Tue,  6 Jan 2026 22:48:38 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 14:48:36 +0000
Date: Tue, 6 Jan 2026 14:48:35 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>
Subject: Re: [PATCH v2 37/45] arm_mpam: resctrl: Add empty definitions for
 assorted resctrl functions
Message-ID: <20260106144835.00007dca@huawei.com>
In-Reply-To: <20251219181147.3404071-38-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-38-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_064841_754849_7C5B9FE3 
X-CRM114-Status: GOOD (  23.19  )
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

On Fri, 19 Dec 2025 18:11:39 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> A few resctrl features and hooks need to be provided, but aren't needed or
> supported on MPAM platforms.
> 
> resctrl has individual hooks to separately enable and disable the
> closid/partid and rmid/pmg context switching code. For MPAM this is all the
> same thing, as the value in struct task_struct is used to cache the value
> that should be written to hardware. arm64's context switching code is
> enabled once MPAM is usable, but doesn't touch the hardware unless the
> value has changed.
> 
> For now event configuration is not supported, and can be turned off by
> returning 'false' from resctrl_arch_is_evt_configurable().
> 
> The new io_alloc feature is not supported either, always return false from
> the enable helper to indicate and fail the enable.
> 
> Add this, and empty definitions for the other hooks.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

FWIW given I didn't check what these all are, just that they are indeed
stubs that do the obvious things.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 27 +++++++++++++++++++++++++++
>  include/linux/arm_mpam.h       |  9 +++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 84f517cb047a..059148c38a38 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -93,6 +93,23 @@ bool resctrl_arch_mon_capable(void)
>  	return exposed_mon_capable;
>  }
>  
> +bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
> +{
> +	return false;
> +}
> +
> +void resctrl_arch_mon_event_config_read(void *info)
> +{
> +}
> +
> +void resctrl_arch_mon_event_config_write(void *info)
> +{
> +}
> +
> +void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d)
> +{
> +}
> +
>  bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
>  {
>  	switch (rid) {
> @@ -1131,6 +1148,16 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>  	return 0;
>  }
>  
> +int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
> +{
> +	return false;
> +}
> +
>  static int mpam_resctrl_control_init(struct mpam_resctrl_res *res,
>  				     enum resctrl_res_level type)
>  {
> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
> index 86d5e326d2bd..f92a36187a52 100644
> --- a/include/linux/arm_mpam.h
> +++ b/include/linux/arm_mpam.h
> @@ -67,6 +67,15 @@ struct rdt_resource;
>  void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
>  void resctrl_arch_mon_ctx_free(struct rdt_resource *r, enum resctrl_event_id evtid, void *ctx);
>  
> +/*
> + * The CPU configuration for MPAM is cheap to write, and is only written if it
> + * has changed. No need for fine grained enables.
> + */
> +static inline void resctrl_arch_enable_mon(void) { }
> +static inline void resctrl_arch_disable_mon(void) { }
> +static inline void resctrl_arch_enable_alloc(void) { }
> +static inline void resctrl_arch_disable_alloc(void) { }
> +
>  static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
>  {
>  	return val;


