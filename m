Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F1CC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 13:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EJuVDN2500jJA40ZSMUWsiqTqSCe4i7cd+5j27aUKE=; b=RqioJZLCHjgkTBrhCBY2O41kwO
	1/GzwZ3AVSOzrbQ0Pd/ZI+DvkKECKyaaSWDe7HsGFHOazVngQnnVrJGJFVyZk+2YO84fD63i3wIOz
	dmoim+AC78p7tF8BFqIUo7+ZN7nAW51yxi6NnILlpaGUpCEn82WHaGm2kSoeByst1ZuDENe2bVXUT
	WI82UIhcVm34cJof8degynxsXxjziyCk8THLjlvcUqpkbcv9DxQb0bClaQDYmISWryUS8s222Lnxm
	K/wP4AOBZLVKGl3a0xRefaG9J7jwWrnSWkunMDN2hL7qGeGwbqb+iGhEn8C4AfEVdnxWE3mUZLbE4
	QIJAylwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQEN-0000000BvDy-3oOJ;
	Mon, 10 Aug 2026 13:39:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQEL-0000000BvDb-0enY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 13:39:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF6D01477;
	Mon, 10 Aug 2026 06:39:46 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2801C3F632;
	Mon, 10 Aug 2026 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786369190; bh=shjp+/Kq2EUtVklUKcPCO+yUW41T8QLuqSuqfQiMTGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qV8cUqo1g6z+Re7R1Xtl3U0Nwkjfma7+DQc3f8eMZI7x4pi03LvMCi53zYsH5Vpns
	 0xKIa8B+YEvq27O+bA4KaBlmMLjcOkODDCPpV02MzaPkoYCtAxqtE2oEaVObCWpJUc
	 ZlOKsNtSIdpN7i3wt2i7yMuaccabLvA1BiyctuoM=
Date: Mon, 10 Aug 2026 14:39:44 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 06/23] firmware: arm_scmi: Add basic Telemetry support
Message-ID: <annUoAwdtF4unA7q@pluto>
References: <20260802145618.1952804-7-cristian.marussi@arm.com>
 <AFD5A4D3-916E-4989-9F38-F23E7A2BED0B@contoso.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AFD5A4D3-916E-4989-9F38-F23E7A2BED0B@contoso.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_063953_272030_D9842853 
X-CRM114-Status: GOOD (  22.10  )
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

On Mon, Aug 03, 2026 at 11:53:11PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,
> 

Hi,

> I found a few error-path consistency issues inline.
> 
> > 	tde->de.tstamp_support = !!tde->ts_type;
> > 	/* Count timestamped DEs */
> > 	ti->num_des_tstamp += !!tde->de.tstamp_support;
> > 	tde->de.fc_support = IS_FC_SUPPORTED(desc);
> > 	tde->de.name_support = IS_NAME_SUPPORTED(desc);
> > [...]
> > 	if (rx_len < payld_sz)
> > 		return -ENOSPC;
> 
> num_des_tstamp is incremented before all variable parts of the descriptor
> and the optional fast-channel mapping have been validated.
> 
> If a later validation or ioremap operation fails, the descriptor is
> rejected but the timestamp count is not rolled back. GET_ALL state checks
> can then compare against an inflated timestamp count.
> 
> Please update this counter only after the complete descriptor has been
> validated and successfully registered, or undo it on every later failure.

Fixed in V8.

> 
> > err:
> > 	/* DE not enumerated at this point were created in this call */
> > 	if (discovered)
> > 		scmi_telemetry_free_tde_put(ti, tde);
> >
> > 	return ret;
> 
> At this point descriptor parsing may already have changed fields in tde and
> its associated scmi_telemetry_de_info. The object is returned to the free
> list without resetting that partial state.
> 
> Can the descriptor be fully reset before it is made available for reuse,
> or can parsing be done into temporary state that is committed only after
> all validation succeeds?

Fixed in V8 by clearing the tde descriptor on put.

> 
> > 	for (int i = 0; i < ti->info.base.num_groups; i++) {
> > 		struct scmi_telemetry_group *grp = &rinfo->grps[i];
> > [...]
> > 		grp->des = no_free_ptr(des);
> > 		grp->des_str = no_free_ptr(des_str);
> > 		/* Reset group DE counter */
> > 		grp->info->num_des = 0;
> > 	}
> > [...]
> > 	rinfo->num_groups = ti->info.base.num_groups;
> 
> The per-group allocations are transferred out of automatic cleanup during
> the loop, but rinfo->num_groups is only assigned after every group
> succeeds.

Fixed in v8.

> 
> If allocation for a later group fails, resources_free() calls
> scmi_telemetry_groups_free(), which iterates rinfo->num_groups. Since that
> is still zero, allocations already installed in earlier groups are leaked.
> 
> Please increment a cleanup-visible group count as each group is committed,
> or make cleanup iterate base.num_groups and safely free NULL members.
> 
Added also a rollback logic in V8 (which needs a small further fix in V9
apparently listening to Sashiuko complains....)

Thanks,
Cristian


