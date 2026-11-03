Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDCB606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ItkKAF79;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XJDplvXf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+5PLFHNYvI6hooOQPVoYk381jXL7ECOUIpIdtIa4bbI=; b=ItkKAF79ExvALz
	Ql//ZBoq42B61yvF5PAKR/zbxPiBREwRFiePg/JZ3Y++xgBviy4xsIrkXvnYoyqQXBtkNggGxYyVq
	O54IlgOUdpFDPxuYbkJ2bsAHeQ3fLvw9YsVxOoJ7s1MgKczd+RpOkSoe8Jb/DxZOB6z+yqLgw560u
	B700p/q2LFS4LF0uamnyrYqwLyYAJjzPaZSCXVgqAPgu7k0dw3pYMgniOg44ltulVON3fLtnA7vRn
	S1JYZuztxIeAiq0t6RPUO1nS8d0NY6FemoUBpbtNRkiKbFips3VInkP8t7Cd4KdnpDY/VD1FuPeVa
	6I67Zxnd6NoMeUGKh9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHMO-000000037Wq-3Rju;
	Tue, 03 Nov 2026 16:27:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHMM-000000037Vh-2MXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:27:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC42C1595;
	Tue,  3 Nov 2026 08:27:37 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 518803F628;
	Tue,  3 Nov 2026 08:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793723261; bh=T+7vmJQXaSpuHN4NQcYqhOks+C9X4fCqNSJv3hn3SJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XJDplvXfcxus5djwB5e/QMx9m4tfrZNnG1V5cRyKth8kDvHRIvrvWAXpsNvpvd5ty
	 gnNGddgyxQrKzm4RMlH4m+Uv6h0DteyPhHf6sYl/9zOrwV9nVoO939XosBkh6Ea1xj
	 jTS1txaXomlx1M9HpXVL/VtBbecU8GUpTQOguISc=
Message-ID: <c7f180d1-f81e-495e-91be-b76a4c4df21d@arm.com>
Date: Tue, 3 Nov 2026 16:27:37 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 10/10] arm_mpam: resctrl: Update the comment on
 monitoring domain setup
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <f6080eca2696f4a06777725854447a563aa29696.1792443633.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <f6080eca2696f4a06777725854447a563aa29696.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_082742_769382_A9F784F7 
X-CRM114-Status: GOOD (  23.59  )
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
> The comment in mpam_resctrl_setup_mon_domain() explains that the L3
> component IDs need to be used for a monitoring domain because there may
> be no control component for the L3. It also describes searching each
> event's class for a component with overlapping CPUs.
> 
> Neither matches the code. The monitoring domain has its own structure
> and is set up independently of the control domain, so whether a control
> component exists has no bearing on it. Each event's class must have a
> component that contains the CPU, and all components of the domain must
> cover the same CPUs, which is stricter than overlapping.
> 
> Rewrite the comment to say where the domain's ID comes from and what is
> required of the components that back the domain's events.
> 
> No functional change.
> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
> Note to maintainers: This comment update is kept as a separate patch to
> make it easy to review. It can be folded into "arm_mpam: resctrl: Give
> the monitoring domain its own structure" and "arm_mpam: resctrl: Require
> monitoring components to cover the same CPUs" if preferred.

Yes, I think squashing those 3 patches together would be good.

Thanks,

Ben

> ---
>  drivers/resctrl/mpam_resctrl.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index c3ea61a40bb2..61fbde9c0960 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1647,11 +1647,12 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
>  	int err;
>  
>  	/*
> -	 * Even if the monitor domain is backed by a different
> -	 * component, the L3 component IDs need to be used... only
> -	 * there may be no ctrl_comp for the L3.
> -	 * Search each event's class list for a component with
> -	 * overlapping CPUs and set up the dom->mon_comp array.
> +	 * The monitoring domain takes the L3 cache ID as its ID even when its
> +	 * events are backed by components of other classes, see
> +	 * mpam_resctrl_pick_domain_id().
> +	 * Find the component of each event's class that contains the CPU and
> +	 * set up the dom->mon_comp array. All these components must cover the
> +	 * same CPUs.
>  	 */
>  
>  	for_each_mpam_resctrl_mon(mon, eventid) {


