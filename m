Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66137CD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plNYBzzaUu+CjxUfVgmwKMU0d70IRGPw0rK3BmwuPjc=; b=V6M7d1RbdccCN1RqEZJC4aHHEJ
	42Yz+DrJtm3XPmzhmoXhaT37iFJ1jqa5SYQBOWzK8MGIjue9gtVg5ByUKiLJgXfWXrVdC/8Px4vTs
	0fWW5PvINvdFm559lzbU5hFnapLr+9/+2luLB7GdKWPoIivixxsLhn0hO3hP0ReTBurEWOVoKbPVD
	aqFI34mHYdQIfRa/QxNFjTD5J89oRDgWJTLM/SR6cUQ3wOfNP69CBVgZo34dsRWKeBPGYTkk+UPsb
	yzVWoRr35KL1RdRI/Ix6ts41zcoNiM67ZBGV3HhWznHthbmq8qg5CqintDOGnDP4W7pN9Dy2Et9Rd
	DLk4Syvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXTU-00000003Lsv-0XdD;
	Mon, 08 Jun 2026 10:44:56 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXTR-00000003Lqn-0mwt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:44:55 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260608104448euoutp02462bcf49bb960e5e74d4dfba6373e0ce~3FTN8Nl8Y2450824508euoutp02S;
	Mon,  8 Jun 2026 10:44:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260608104448euoutp02462bcf49bb960e5e74d4dfba6373e0ce~3FTN8Nl8Y2450824508euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1780915488;
	bh=plNYBzzaUu+CjxUfVgmwKMU0d70IRGPw0rK3BmwuPjc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=JoCZ/WKIAI4ynKcKsLsemvNM9WajLCXA73D5zw2xoD7lCL3z54ZkMrkLh/JyPdEyE
	 /kqCaIilwuycoqSIz0z02aXZrhcLMotd35EHMU7drq2vG8mZar/SYgy1xT2vcdWCN6
	 uGoRfxIdzyZOSLqUCzO80yrI3lBIVEMsvs8BDl3o=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260608104448eucas1p1685dd3246a9e2b35613d32758481919c~3FTNnAVOb0713807138eucas1p1-;
	Mon,  8 Jun 2026 10:44:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260608104446eusmtip22e466d5ec2468bd35b4ff28e72e16298~3FTMH8FJe2930429304eusmtip2T;
	Mon,  8 Jun 2026 10:44:46 +0000 (GMT)
Message-ID: <4d30ec2d-72e4-4d5d-98aa-d2519ed6737e@samsung.com>
Date: Mon, 8 Jun 2026 12:44:45 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 05/20] dma-pool: track decrypted atomic pools and
 select them via attrs
To: Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V"
	<aneesh.kumar@kernel.org>
Cc: Michael Kelley <mhklinux@outlook.com>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, Robin Murphy <robin.murphy@arm.com>, Will
	Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price
	<steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
	Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Mostafa
	Saleh <smostafa@google.com>, Petr Tesarik <ptesarik@suse.com>, Alexey
	Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, Xu
	Yilun <yilun.xu@linux.intel.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, "x86@kernel.org" <x86@kernel.org>, Jiri Pirko
	<jiri@nvidia.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260604182419.GC2487554@ziepe.ca>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260608104448eucas1p1685dd3246a9e2b35613d32758481919c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260604182425eucas1p172fc82b218cbed92f71a093549902d3a
X-EPHeader: CA
X-CMS-RootMailID: 20260604182425eucas1p172fc82b218cbed92f71a093549902d3a
References: <20260522042815.370873-1-aneesh.kumar@kernel.org>
	<20260522042815.370873-6-aneesh.kumar@kernel.org>
	<SN6PR02MB415754E94A9505C2B9739E4DD4092@SN6PR02MB4157.namprd02.prod.outlook.com>
	<yq5afr35sciu.fsf@kernel.org>
	<SN6PR02MB4157D9955A93244014AB7978D4122@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20260603005454.GM2487554@ziepe.ca>
	<SN6PR02MB4157F94C902B78E55E99372DD4102@SN6PR02MB4157.namprd02.prod.outlook.com>
	<yq5apl26qrof.fsf@kernel.org>
	<CGME20260604182425eucas1p172fc82b218cbed92f71a093549902d3a@eucas1p1.samsung.com>
	<20260604182419.GC2487554@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_034453_824382_FC73EC2E 
X-CRM114-Status: GOOD (  14.85  )
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

On 04.06.2026 20:24, Jason Gunthorpe wrote:
> On Thu, Jun 04, 2026 at 08:27:36PM +0530, Aneesh Kumar K.V wrote:
>> I already sent a v6 in the hope of getting this merged for the next
>> merge window. Should I send a v7, or would you prefer that I do the
>> rename on top of v6?
> I think it is too late for such a major change, but this should be
> imaginged to be for rc2ish next cycle. You also have to spell out how
> the pkvm patch will get sequenced as well, it would be best to push
> that it gets picked up right away.


I would like to give this a bit of time in linux-next so it is a bit too
late for v7.2, but before merging it I would also like to have this code
reviewed by someone with confidential computing knowledge.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


