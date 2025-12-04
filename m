Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D60D29FAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 18:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIYMYXNy0X/wdnrZZA/TT8clhZcHVDag4MD/z6V+eRk=; b=LLlGg3wju/j9dN8fsCoop+ZEaP
	BjIvxU7Cmq4AX5coLf4kkTVs8A+yzcoumZsdYMRSR5Rva+EyjQF5iNOhKh2cV20TRmCJkPW41Ytfi
	mJd+LoN0XnpA+dFHg007W6WEWv6hgZSxX9u6QBN1bi808VFf+e6qibqScJ1hPZZEfK94g0b1YUdUb
	rlZOOC5qD1mBu6p8tCcoIYAFNsfiZB+NA3s11R5giSB/QygQNxMPBgOvDN4+ZWhAj08eVhtdC1eTN
	WNCG3re+/p/eBs+9pG4/arWLtkUModdmwKjeLLc8sWaQb6ljkj7hz44SIRRRxv0Xh6vphyzsAZ057
	M9TVpO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRDvq-00000008Qrl-0kEH;
	Thu, 04 Dec 2025 18:19:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRDvl-00000008Qr0-1NbB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 18:19:57 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dMjTK6gwbzJ46CH;
	Fri,  5 Dec 2025 02:19:33 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 7AED740086;
	Fri,  5 Dec 2025 02:19:42 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 4 Dec
 2025 18:19:41 +0000
Date: Thu, 4 Dec 2025 18:19:40 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, Pavan Kondeti
	<pavan.kondeti@oss.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <jean-philippe@linaro.org>, <praan@google.com>,
	<smostafa@google.com>, <robin.murphy@arm.com>
Subject: Re: PRI support in arm-smmu-v3 driver
Message-ID: <20251204181940.000062ab@huawei.com>
In-Reply-To: <20251125180353.GC520526@nvidia.com>
References: <1256faaa-e9cd-46a6-9a42-25aa74b984a8@quicinc.com>
	<aSXupxMeHLajOmDW@willie-the-truck>
	<20251125180353.GC520526@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_101955_317894_A3EE4C49 
X-CRM114-Status: GOOD (  27.32  )
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

On Tue, 25 Nov 2025 14:03:53 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Nov 25, 2025 at 06:00:07PM +0000, Will Deacon wrote:
> > [+iommu list and usual suspects]
> > 
> > Hi Pavan,
> > 
> > On Tue, Nov 25, 2025 at 02:22:05PM +0530, Pavan Kondeti wrote:  
> > > I am trying to understand IO fault handling in Linux w/ SMMUv3. While reading
> > > the code, I understand that SVA domain creation allows taking IO pagefaults.
> > > arm_smmu_enable_iopf() checks if the master support stall upon fault
> > > feature or not. How do we handle page faults for PCIe devices, for which 
> > > transactions cannot safely be stalled? IIUC, The PRI handling in the
> > > driver i.e arm_smmu_priq_thread()->arm_smmu_handle_ppr() is not doing
> > > anything. In the SVA support for SMMUv3 series v7, I see the support for
> > > PRI via "Add support for PRI" patch [1] but it is not merged. 
> > > 
> > > Can you please clarify if we can support SVA with PCIe devices w/o
> > > pinning the memory?
> > > 
> > > [1]
> > > https://lore.kernel.org/all/20200519175502.2504091-25-jean-philippe@linaro.org/  
> > 
> > The only SVA client we've had for SMMUv3 in the upstream kernel is the
> > "uacce" thing from HiSilicon which is a platform device (rather than a
> > PCIe device) and so I think the PRI support just fell by the wayside due
> > to lack of an upstream user and no ability to test it.  
> 
> Right, we only support "stall" mode in the driver, not PRI right
> now. PRI has a bunch of differences at the SMMU level.
> 
> > I'm not sure whether or not Jason has plans to implement PRI but maybe
> > it's something you could help with if you have hardware?  
> 
> I've been waiting for someone who has HW to take this on.
> 
> Honestly, I'm not entirely sure what the missing gaps are, at least I
> think we need to get the PRI information and package it into the fault
> queue and link it back to a PRI response.

Long ago we did some testing using various 'interesting' PRI supporting
test setups (they weren't what you would call real devices but did let
us exercise the support).

IIRC the above stuff from JPB worked at the time. Given we didn't have
any real endpoints, we didn't push for it to merge.

No idea what status would be today though. It is on our list to come
back to.

Jonathan

> 
> Jason
> 


