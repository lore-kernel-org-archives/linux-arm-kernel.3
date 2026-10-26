Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jH1F71uH;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WTkj1Hz9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LChBFc7NyA4kYe4eWX6P8OUX1NQ9dlfzg5VF5MaM0QQ=; b=jH1F71uHL4SmNJ
	fldpMAjB2YI5/DDH/mxba3IlF66EOoVfHvnRIyDvFHYpO7qbXH2vPWj7P6lfNvC2WSOVH+YLJIxpU
	egCQ2oEEvwi5SloaWKQIqqK0EBB1llnJuh6KR1g63YXtGAEcdVXK2S94Hp8mV/0X8u9O1GiX0qfXJ
	2ksUpEz7bGCq+9NGFO3QkKYEJm1xhUjJSeyGmBlgz3XjFgU9gdeDKrNvvBPa+DoOevjkGzv7pQ3XM
	w9dwnDjWsrU+xTcg3FsFfUIwfy2Kw/zbn39OOphA1b+V/Yl6sKGhoooKUI01rqY6C0G+JeHcgJLwL
	EQU6pE32rp0Aom/LZT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKXn-00000002a1E-1l9M;
	Mon, 26 Oct 2026 13:15:19 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKXj-00000002Zzj-3Llt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:15:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LChBFc7NyA4kYe4eWX6P8OUX1NQ9dlfzg5VF5MaM0QQ=;
	b=WTkj1Hz98KtbFvD5jQZgc5A9tiEOtCFlXYcuRZDUmncC+ctfEjtQL7bIKLjyuGoa8fnjIv3TP
	I3dhb7S9tqk3koarvwaJAiz1JTH+SXMXwaJM9x3a0pOfMtPoyoZArP8zf4lCX8Pj1xZW6SJltVM
	DrodVf9ZMa0Ao8lFm8Z+Nlk=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jCvHK44Bzz1prQ6;
	Mon, 26 Oct 2026 21:14:53 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 925744056D;
	Mon, 26 Oct 2026 21:15:00 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 21:14:59 +0800
Message-ID: <ce191ccd-1948-448f-8279-b30008191b8b@huawei.com>
Date: Mon, 26 Oct 2026 21:14:59 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 07/10] arm_mpam: resctrl: Warn when no monitoring
 component is found for a CPU
To: Reinette Chatre <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<james.morse@arm.com>, <Dave.Martin@arm.com>, <fenghuay@nvidia.com>
CC: <tony.luck@intel.com>, <yu.c.chen@intel.com>, <babu.moger@amd.com>,
	<fustini@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <1c68a6ae981095ec93250cf0e394bb4df15c7e66.1792443633.git.reinette.chatre@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <1c68a6ae981095ec93250cf0e394bb4df15c7e66.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_061516_334685_C694A128 
X-CRM114-Status: GOOD (  16.64  )
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
> Setting up a monitoring domain fails if no monitoring class has a
> component that contains the CPU. This is not expected to happen: a
> resource only supports monitoring when at least one monitoring class
> was picked, and only classes that cover all possible CPUs are picked
> for monitoring.
> 
> The failure path calls WARN_ON_ONCE(0), which never warns. The
> unexpected failure is thus silent and the CPU is left without a
> monitoring domain with nothing reporting why.
> 
> Warn when no monitoring component is found for the CPU, as is already
> done when setting up a control domain finds no component in the
> resource's class.
> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 022920be1862..63c5bf45856d 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1665,10 +1665,8 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
>  		if (mon_comp)
>  			any_mon_comp = mon_comp;
>  	}
> -	if (!any_mon_comp) {
> -		WARN_ON_ONCE(0);
> +	if (WARN_ON_ONCE(!any_mon_comp))
>  		return -EFAULT;
> -	}

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  	mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
>  	mon_d->hdr.type = RESCTRL_MON_DOMAIN;

-- 
Best regards,
Jinjie


