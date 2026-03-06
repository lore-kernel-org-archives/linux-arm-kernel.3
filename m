Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64173F01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbUf5V4dSHyx12bdQZeMYQLh7XaMppZE49rgn4CHXPI=; b=NxV3vcnXho0GE9FvoROj/pkcoc
	F1JEsGc19XMaxq8vq9251+u8lXmYOv2Wl6SzGWPU3lFDa9muSAsFLjj5teUqV3/lvn1CbyPeYCe5n
	uLy7xu652+SESC/ZtTukVa9So7acRrq8ucOj4ZYZJ/QF7fT/KowR6bY3UClgq8AtX2ky6g9JEh/oN
	XSo/KcsLr85KmWI3vYCSxqR2UPtstAcMP3F9BD89KY9zjJwMZm4ZfPyyX/yjbxgdW//OzzOMPJM5Y
	eQIFr79OrQRsuaFLp4nYA6r6vhdjp2AWZGvYUUwM5cnLe2CVATtyI7fi3OW61yjRzHmk8kYU4jb1M
	IHPZ+HpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyV8J-00000003joY-4BNC;
	Fri, 06 Mar 2026 13:22:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyV8H-00000003joA-20TE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:22:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD4CD497;
	Fri,  6 Mar 2026 05:22:13 -0800 (PST)
Received: from [10.57.57.97] (unknown [10.57.57.97])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE9CC3F836;
	Fri,  6 Mar 2026 05:22:13 -0800 (PST)
Message-ID: <60d77adc-d5a6-40e2-a497-a57004f23e7e@arm.com>
Date: Fri, 6 Mar 2026 13:22:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, joro@8bytes.org, bhelgaas@google.com, rafael@kernel.org,
 lenb@kernel.org, praan@google.com, kees@kernel.org,
 baolu.lu@linux.intel.com, smostafa@google.com,
 Alexander.Grest@microsoft.com, kevin.tian@intel.com,
 miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, vsethi@nvidia.com
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com> <aanygWWZLA1htDdQ@Asurada-Nvidia>
 <20260305234158.GB1651202@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260305234158.GB1651202@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_052221_567691_A14406ED 
X-CRM114-Status: GOOD (  16.40  )
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

On 2026-03-05 11:41 pm, Jason Gunthorpe wrote:
> On Thu, Mar 05, 2026 at 01:15:45PM -0800, Nicolin Chen wrote:
> 
>> You mean in arm_smmu_cmdq_issue_cmdlist() that issued the timed
>> out ATC command?
> 
> Yes, it was my off hand thought.
> 
>> So my test case was to trigger a device fault followed by an ATC
>> command. But, I found that the ATC command submission returned 0
>> while only the ISR received:
>>      CMDQ error (cons 0x03000003): ATC invalidate timeout
>>      arm_smmu_debugfs_atc_write: ATC_INV ret=0
>>
>> It seems difficult to insert a CMDQ_OP_CFGI_STE in the submission
>> thread?
> 
> I didn't look, but I thought the CMDQ stops on the ATC invalidation,
> flags the error and the ISR NOP's the failing CMDQ entry and restarts
> it to resume the thread? Is that something else?
> 
> If so you could insert the STE flush instead of a NOP

Nope, sadly the timeout is asynchronous, and CERROR_ATC_INV_SYNC is only 
reported on the *next* CMD_SYNC - it can't even tell us which 
CMD_ATC_INV(s) had a problem. Also there is no NOP; currently the only 
command rewriting we do is for CERROR_ILL, where we turn the illegal 
command into a CMD_SYNC.

We couldn't necessarily rely on being able to rewind the hardware CONS 
pointer from a CMD_SYNC, as by that point we're likely to have observed 
it and updated llq->cons, such that other threads could move llq->prod 
forward and fill that space with new commands.

Thanks,
Robin.

> Otherwise the arm_smmu_cmdq_issue_cmdlist() can just push another CMD
> to the queue and sync, it is obviously in a context that can do that.
> 
> Jason


