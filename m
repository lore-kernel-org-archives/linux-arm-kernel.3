Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB127E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0sHIhJSSf+4UpazjkVw6pWh1O3ktUbcSsQjruMDpEc=; b=rtK+PXKQhbkbskrrsXsupZo8VX
	rXo35eHFyi9gK/GT3/g0rvrHtWV/cCb7h3aczjU8MRiDB9i3A1ys14+QWDDNyyINyv54yJWzxiboI
	aJq7cEAiICHlqDzmPwEnPBIzzqqKLHkqbPUv6LaY4ngeJzt1IOikTcepr4QMc4iFeSogZCCd4XJZz
	8YIDEKCVnNRXPKnVJ+wiFqVvNE+DBds4QkvL+oeMS988XHtnTyubDCGVTVqNO4uUgmmgH06Y1fzy4
	NiOIjy3dcBMs7Lgq0w0w412PFiYpddpPgt0FeTCSbCilqGnzhd/lgyddksrcSXH/zKfr4F6s8qhzn
	XvrsJUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOLt-0000000AsvE-3hAR;
	Thu, 02 Jan 2025 16:47:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOKg-0000000AsmK-2wVK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:46:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23E1F11FB;
	Thu,  2 Jan 2025 08:46:30 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C91E43F673;
	Thu,  2 Jan 2025 08:46:00 -0800 (PST)
Date: Thu, 2 Jan 2025 16:45:58 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: james.morse@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathan.cameron@huawei.com,
	xiexiuqi@huawei.com,
	"Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 0/5] arm_mpam:
 Introduce the Narrow-PARTID feature for MPAM driver
Message-ID: <Z3bCxn4L0SsxIMw8@e133380.arm.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
 <Z1sMtF9bvw5NZOC6@e133380.arm.com>
 <acf5c82f-1d33-4cd4-ff50-5f7c37f49a1e@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acf5c82f-1d33-4cd4-ff50-5f7c37f49a1e@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_084602_858756_17CDD9D1 
X-CRM114-Status: GOOD (  44.09  )
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

On Fri, Dec 20, 2024 at 06:59:31PM +0800, Zeng Heng wrote:
> 
> 
> On 2024/12/13 0:17, Dave Martin wrote:
> > Hi,
> > 
> > On Sat, Dec 07, 2024 at 05:21:31PM +0800, Zeng Heng wrote:

[...]

> > > For a mixture of MSCs system, for MSCs that do not support narrow-partid,
> > > we use the PARTIDs exceeding the number of closids as reqPARTIDs for
> > > expanding the monitoring groups.
> > 
> > Mixed systems still seem not to be handled completely by this series?
> > 
> > You do cope with the scenario where some MSCs support Narrowing and
> > some do not, but there is still the problem of incompatible controls.
> > 
> > If a non-Narrowing MSC has controls that are not of the "partition
> > bitmap" type, then splitting a resctrl control group across multiple
> > PARTIDs is going to change the hardware regulation behaviour.  There
> > does not seem to be any way to work around this be programming
> > different control values (for example).  So, there may be over- or
> > under-allocation of resources compared with what the user requests in
> > resctrlfs.
> > 
> > So, I think there is still a need to check which controls are present,
> > and either disable the use of non-identity intPARTID<->reqPARTID
> > mappings if incompatible controls are present (or don't expose those
> > controls to resctrl).
> > 
> > (If you were not trying to address this issue yet then that is not a
> > problem for an RFC, but it is best to be clear about the
> > limitations...)
> > 
> 
> In the v3, the limitation you mentioned has not yet been handled.
> V3 has not yet determined how to define this limitation well. Additionally,
> for v3, I was still uncertain whether a large-scale
> refactoring was still necessary at that time.
> 
> In fact, I take this limitation very seriously, and I will try to define
> the limitation in next version, explaining it separately as a distinct
> patch.

Fair enough.  I just wanted to make sure that this issue is not missed
(since this is where a lot of the complexity comes from!)


[...]

> > This approach looks reasonable overall, and in this version the changes
> > do seem to be better localised in the mpam_resctrl.c glue code now.
> > 
> > I had also been working on a similar approach, so I have posted it for
> > comparison [1] -- though the two approaches are doing pretty much the
> > same thing, some details differ.
> > 
> > (Note, I have not addressed PARTID Narrowing at all yet; however,
> > I think more thought is needed for that.)
> > 
> 
> Yes, localize the narrow-partid feature within mpam_resctrl.c file is
> the biggest restructuring improvement in this version. Of course, thanks
> for your meticulous review and insightful comments.
> 
> In the meanwhile, I have roughly read through the patch set you sent
> out, especially patch 4 (arm_mpam: Introduce flexible CLOSID/RMID
> translation). If I have any comments worth discussing, I will try to
> share them.

I would appreciate that, thanks!

> 
> > 
> > Note: Are there bisection issues with some of the patches in the
> > series?  It looks like not all of the ID conversions are applied in the
> > same patch, so I'm wondering whether strange behaviour may be seen at
> > the intermediate commits.
> > 
> 
> The original intention of splitting the patch set was to facilitate review.
> I will merge the part of patch 5 into patch 2 and consider
> making the patch set be friendly for bisection issues.
> 
> 
> Best regards,
> Zeng Heng

Understood.

James may have a view on how important bisectability is, since this is
not upstream code -- but it is probably a good idea to maintain full
bisectability if at all possible.

Cheers
---Dave

