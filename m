Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65271CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XxTzVRyT27q9PM1Z030sc58oUMNmZa8dvMrzpdz1OY=; b=byFGA4/bOawZzUGXEreFpRFkLo
	pGKbwcDBZAuABUo6Ec70hnKPSwi8Kg2a0w0zJe6BAz9zHH3LQN8+SUxXfwAipdjAyKZjrhI7omiuZ
	fzZKsfJiMn3v/uTRHxN+G+cNm22ZtKq/8UV4+fPC5iY/RxeH0DT4aKZ5OVHVEwwZ2pM9gth2jCfI7
	W+GGkGoWD5PKZZiDE2fBAWYWQFJDcaSyA3YoWbyLwHdr2txwtSp7cQxwCCIqXLggZOGr8XPZdbHEZ
	h+CettRVAURaQj64mhRZwDWzc1eASc1x+8SQ2rVX1m/YczGqRuBEMHn48GqnyTXWnNGuMdMNJJrvp
	BTM6StXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdDn-00000003NKa-324p;
	Fri, 19 Sep 2025 15:40:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdDl-00000003NIn-0hBX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:40:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E191169C;
	Fri, 19 Sep 2025 08:40:14 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FDC53F673;
	Fri, 19 Sep 2025 08:40:21 -0700 (PDT)
Date: Fri, 19 Sep 2025 16:40:18 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Lixiang Mao <lixiang.mao@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: FW: [PATCH] firmware: arm_ffa: Add support for IMPDEF value in
 the memory access descriptor
Message-ID: <20250919-tested-dogfish-of-advertising-f4bd9e@sudeepholla>
References: <20250915150119.3106344-1-sudeep.holla@arm.com>
 <PH0PR02MB8779B445EF229898D0440D6A8514A@PH0PR02MB8779.namprd02.prod.outlook.com>
 <e9fb292b-4a31-4a1e-8136-c99ab4e9482c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9fb292b-4a31-4a1e-8136-c99ab4e9482c@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_084025_281638_70A2B66B 
X-CRM114-Status: GOOD (  32.69  )
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

On Tue, Sep 16, 2025 at 01:14:53PM +0800, Lixiang Mao wrote:
> Let me reply this by my OSS mail username.
> 

For some reason this got marked spam and landed in junk emails.
Sorry for the delay in finding/responding.

> The comments was inline.
> 
> > -----Original Message-----
> > From: Sudeep Holla<sudeep.holla@arm.com> Sent: Monday, September 15,
> > 2025 11:01 PM
> > To:linux-arm-kernel@lists.infradead.org
> > Cc: Sudeep Holla<sudeep.holla@arm.com>; Lixiang Mao<liximao@qti.qualcomm.com>
> > Subject: [PATCH] firmware: arm_ffa: Add support for IMPDEF value in the memory access descriptor
> > 
> > WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
> > 
> > FF-A v1.2 introduced 16 byte IMPLEMENTATION DEFINED value in the endpoint memory access descriptor to allow any sender could to specify an its any custom value for each receiver. Also this value must be specified by the receiver when retrieving the memory region. The sender must ensure it informs the receiver of this value via an IMPLEMENTATION DEFINED mechanism such as a partition message.
> > 
> > So the FF-A driver can use the message interfaces to communicate the value and set the same in the ffa_mem_region_attributes structures when using the memory interfaces.
> > 
> > The driver ensure that the size of the endpoint memory access descriptors is set correctly based on the FF-A version.
> > 
> > Fixes: 9fac08d9d985 ("firmware: arm_ffa: Upgrade FF-A version to v1.2 in the driver")
> > Reported-by: Lixiang Mao<liximao@qti.qualcomm.com>
> > Signed-off-by: Sudeep Holla<sudeep.holla@arm.com>
> > ---
> >   drivers/firmware/arm_ffa/driver.c | 46 ++++++++++++++++++++++++++-----
> >   include/linux/arm_ffa.h           |  1 +
> >   2 files changed, 40 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> > index cf6e44429ecd..2ea30ce93d78 100644
> > --- a/drivers/firmware/arm_ffa/driver.c
> > +++ b/drivers/firmware/arm_ffa/driver.c
> > @@ -654,6 +654,41 @@ static u16 ffa_memory_attributes_get(u32 func_id)
> >          return FFA_MEM_NORMAL | FFA_MEM_WRITE_BACK | FFA_MEM_INNER_SHAREABLE;  }
> > 
> > +static u32 ffa_emad_size_get(u32 version) {
> > +       struct ffa_mem_region_attributes *ep_mem_access;
> > +       u32 sz;
> > +
> > +       if (version <= FFA_VERSION_1_1)
> > +               sz = sizeof(*ep_mem_access) - sizeof(ep_mem_access->impdef_val);
> > +       else
> > +               sz = sizeof(*ep_mem_access);
> > +
> > +       return sz;
> > +}
> > +
> > +static void ffa_emad_impdef_value_init(u32 version, void *dst, void
> > +*src) {
> > +       struct ffa_mem_region_attributes *ep_mem_access;
> > +
> > +       if (version > FFA_VERSION_1_1)
> > +               memcpy(dst, src, sizeof(ep_mem_access->impdef_val));
> > +       else
> > +               memset(dst, 0, sizeof(ep_mem_access->impdef_val));
> > +}
> > +
> > +static void
> > +ffa_mem_region_additional_setup(u32 version, struct ffa_mem_region
> > +*mem_region) {
> > +       if (version <= FFA_VERSION_1_0) {
> > +               mem_region->ep_mem_size = 0;
> > +       } else {
> > +               mem_region->ep_mem_size = ffa_emad_size_get(version);
> > +               mem_region->ep_mem_offset = sizeof(*mem_region);
> > +               memset(mem_region->reserved, 0, 12);
> > +       }
> > +}
> > +
> >   static int
> >   ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
> >                         struct ffa_mem_ops_args *args) @@ -683,16 +718,13 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
> >                  ep_mem_access->composite_off = composite_offset;
> >                  ep_mem_access->flag = 0;
> >                  ep_mem_access->reserved = 0;
> > +               ffa_emad_impdef_value_init(drv_info->version,
> > +                                          ep_mem_access->impdef_val,
> > +                                          args->attrs[idx].impdef_val);
> 
> Lixiang: We shouldn't reach next emad by increasing ep_mem_access if the
> negotiated version is V1.1. For V1.1 emad, we should increase 16 bytes for
> every iteration.

Agreed, I missed that.

> 
> >          }
> >          mem_region->handle = 0;
> >          mem_region->ep_count = args->nattrs;
> > -       if (drv_info->version <= FFA_VERSION_1_0) {
> > -               mem_region->ep_mem_size = 0;
> > -       } else {
> > -               mem_region->ep_mem_size = sizeof(*ep_mem_access);
> > -               mem_region->ep_mem_offset = sizeof(*mem_region);
> > -               memset(mem_region->reserved, 0, 12);
> > -       }
> > +       ffa_mem_region_additional_setup(drv_info->version, mem_region);
> > 
> >          composite = buffer + composite_offset;
> >          composite->total_pg_cnt = ffa_get_num_pages_sg(args->sg); diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h index 0a0132c6ae3e..a1b0ee11c4a6 100644
> > --- a/include/linux/arm_ffa.h
> > +++ b/include/linux/arm_ffa.h
> > @@ -347,6 +347,7 @@ struct ffa_mem_region_attributes {
> >           * an `struct ffa_mem_region_addr_range`.
> >           */
> >          u32 composite_off;
> > +       u8 impdef_val[16];
> Lixiang:If we add the implementation defined value here, we must take care
> when use sizeof(struct ffa_mem_region_attributes). At least we should make a
> replacement of the one in function ffa_mem_desc_offset. Change sizeof(struct
> ffa_mem_region_attributes) to ffa_emad_size_get().


Yes, will quickly rework and repost it. I still need your help to validate
as I don't have a setup to check this imdef_value usage.

-- 
Regards,
Sudeep

