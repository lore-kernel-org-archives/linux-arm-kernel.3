Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1810E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfI/scOYdyVDz39soqDWExKfJ6jU6ay7KKVl5Qql66A=; b=t08UvfQVE41wkLh0oSODTFRZHi
	wuY14r5IjtSrHcJtzpKeLYnP+YJ9bL9WgaK9PgHUxo6IOprDJBLgc/2LvUJ60Hd6A3nsHz9INjmDH
	IM3FyHisKe/3CoEXcEU4HJdOgun/svVC1zR/zFvkz6G3qf2AtgMJFRJrIKSF5LwHhBkJcgyiP3376
	9ZHEzvgUafsuHLn92ybpU9hCqeX97ivhZ+ofSGxqMoN2+gCjQOv8WmQm1T61RcioOr7fp9ymdZYGO
	oCzc52Iffq8nILCGRB6ZAZpMO0/qqIlx+KtywVePAxgWJ3+6GYid6dhZQfGoowpgr9riEZvaYASGW
	pUHha3yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOEm-0000000ArsU-0CRn;
	Thu, 02 Jan 2025 16:39:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOA2-0000000Aqdi-2QUx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:35:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4486911FB;
	Thu,  2 Jan 2025 08:35:30 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC5FB3F673;
	Thu,  2 Jan 2025 08:35:00 -0800 (PST)
Date: Thu, 2 Jan 2025 16:34:58 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: james.morse@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathan.cameron@huawei.com,
	xiexiuqi@huawei.com,
	"Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 4/5] arm_mpam:
 Automatically synchronize the configuration of all sub-monitoring groups
Message-ID: <Z3bAMmIFKBYSG0Ix@e133380.arm.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
 <20241207092136.2488426-5-zengheng4@huawei.com>
 <Z1sM7TMK+BHQEwgI@e133380.arm.com>
 <65e556b6-61e1-7d84-ab8a-becaf55dbb18@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65e556b6-61e1-7d84-ab8a-becaf55dbb18@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_083502_677867_0F2D8874 
X-CRM114-Status: GOOD (  26.40  )
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

Hi,

On Fri, Dec 20, 2024 at 05:36:23PM +0800, Zeng Heng wrote:
> 
> 
> On 2024/12/13 0:18, Dave Martin wrote:
> > Hi,
> > 
> > > @@ -3072,9 +3080,20 @@ struct mpam_write_config_arg {
> > >   static int __write_config(void *arg)
> > >   {
> > > +	int closid_num = resctrl_arch_get_num_closid(NULL);
> > >   	struct mpam_write_config_arg *c = arg;
> > > +	u32 reqpartid, req_idx;
> > > +
> > > +	WARN_ON(c->partid >= closid_num);
> > > -	mpam_reprogram_ris_partid(c->ris, c->partid, &c->comp->cfg[c->partid]);
> > > +	/* Synchronize the configuration to each sub-monitoring group. */
> > > +	for (req_idx = 0; req_idx < get_num_reqpartid_per_closid();
> > > +	     req_idx++) {
> > > +		reqpartid = req_idx * closid_num + c->partid;
> > > +
> > > +		mpam_reprogram_ris_partid(c->ris, reqpartid,
> > > +					 &c->comp->cfg[c->partid]);
> > > +	}
> > >   	return 0;
> > >   }
> > 
> > I haven't decided whether this iteration belongs here or in
> > mpam_resctrl.c.
> > 
> > Your approach looks like it should work; I do it in
> > resctrl_arch_update_one() instead [1], but I think the approaches are
> > pretty much equivalent -- but let me know if you have any thoughts on
> > it.
> > 
> 
> Yes, the actual functions of these two locations are essentially the
> same. However, at the __write_config position, we can reduce the
> repeated judgments of cfg[partid] in mpam_update_config() and also
> decrease the times of smp_call remote invocations.
> 
> What about your option towards it?

I think either can be done.  I was aiming to keep things as simple as
possible for now, and contain all the mapping logic in mpam_resctrl.c.

I think that with my version of the code, changing the
mpam_apply_config() interface to accept a PARTID range instead of a
single PARTID might be a natural way to do this.

This probably does make sense, in order to avoid excessive SMP cross-
calling; I will have a go and see whether this works.


(Note, there is likely to be redundant cross-calling already, which is
one reason why I did not pay close attention to this issue.  If we
could batch updates separately per group of CPUs then we could reduce
the number of cross-calls, though care would be needed if CPUs can be
hotplugged while processing a batch of updates.  I think that a change
to the resctrl core interface might be necessary if we want the arch
code to be able to queue and schedule updates in this way; resctrl
currently assumes that each update is applied immediately.)

Cheers
---Dave

