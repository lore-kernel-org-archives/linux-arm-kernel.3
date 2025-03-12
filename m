Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016C9C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkR9vupVBVbud3/iroPIdL/tBvmGsIfH0+azzikauak=; b=sJumPA2YN4reo7Blt0RkqQ92uV
	hE516xCTq+P60rzrRuCr5P8t+AoQTeGLqVW/J2mz0nFZsERz1sxf7QOoXxAKxXM9BMVwIDM63i0GI
	1Moa2qIinA3VeHPcrNB0wbRtCCtrFKBls0u4++/z5whsTUhlo+L8l06/R+Sm7gGNnXnmBCoOipQyf
	6bEz6b/KpZxJA8Q26nAJqP2tmT/pH/1eoR/7S6NUR2e79L1SHL5O+Y4k777QcoyaCRrSbei9+smiE
	3z18XDqrG9K1HgcbhUAcxFtiRh8jHSWR0AnwinL1rFJ/O9RGr3OY82GWG38MS0wZHv91KuP1obrGp
	PD5GIt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNCN-00000008hzu-1paP;
	Wed, 12 Mar 2025 14:36:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNAj-00000008ht9-1nte
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Mar 2025 14:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VkR9vupVBVbud3/iroPIdL/tBvmGsIfH0+azzikauak=; b=YK7Q9oc2f3XBrYY8Ic4aGtfkvd
	8261HiJjnKSqEVrrSHYjjDIgJPGv4C7w6l4lhC8SSYjfrW72hlEz52fU35zHNY1amHf+Y4Ehm3MD1
	hcvu/LTLwuvfR3jvWU2/jBHeUwuYJl+riYJmuYnzAuh7asZkDmVNEzeRog4289lQvddOWl1KUiyb9
	tznjHq5m9343XpTriP7qnpjcwNM48H5WOCKWzUZRwRIXtGUR+yWZcV44GZb8nfN+YrWHRPbyNxr5O
	LtpvegsrjbMg0MTZwWz8/qZsIooT2TcXwVwcJV5uQIZ5WugGFf6hh9b2OerCGM0C7HZ1+/ILiTRpJ
	nvJ0WUHQ==;
Received: from mgamail.intel.com ([198.175.65.18])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNAg-00000002Pwf-1FLy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 14:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741790099; x=1773326099;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ebScttk5wf21qkysq9N90DUvetPC+A0oagMmOoMp+8c=;
  b=FZdn8LzE6zslJk3q2Z1F4QqwxFKrgARvDnvtLGUZ7W2Sb/x43VD12JJ9
   Bbs/5wMFBdaw+tT8ew2XQ/tlla/xivbvA00akqqfN1mmM239qKFulTMPs
   x7YxdPFtqdLNhyImq6dgBUqS3zo/ZicaFH/zr3au6uph8IprK6yOeIDNO
   IuC5Cid+VR3lSYQkPV9fpiT3SQRQeHyDU7hhhGP4zSA7Tm9hvE2/JS/LI
   jboXs1s3in+SGshgg3mbWgZSCwaoFemfrCiBE1Bhz2lmQMmQHHTRj0Poj
   M1JaC8lUlhnXOiCu/XhCRGUfc8ifVROsAT3NqK9FFv7kJ/m4s9n9XfS6a
   g==;
X-CSE-ConnectionGUID: 5GNLs8jfTXW3FrLupL55BQ==
X-CSE-MsgGUID: CJmfC8/WRyuDcm8gTSvL8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43052919"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="43052919"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 07:34:54 -0700
X-CSE-ConnectionGUID: sFBG6gFDTvCWxZkjv8+Hiw==
X-CSE-MsgGUID: 5A+2JwY4R8eOUGbmazHX+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="157828188"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.240.153]) ([10.124.240.153])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 07:34:47 -0700
Message-ID: <f30eabf8-86dc-48f3-9f6c-0c1600527cac@linux.intel.com>
Date: Wed, 12 Mar 2025 22:34:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta
 <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <Z9CEIlXoQJ-A0t-d@8bytes.org> <d55240a4-fe4a-48ea-b3a8-9a997bb7267c@arm.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <d55240a4-fe4a-48ea-b3a8-9a997bb7267c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_143458_722624_9E626B6D 
X-CRM114-Status: GOOD (  11.94  )
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

On 2025/3/12 18:10, Robin Murphy wrote:
> On 2025-03-11 6:42 pm, Joerg Roedel wrote:
>> Hi Robin,
>>
>> On Fri, Feb 28, 2025 at 03:46:33PM +0000, Robin Murphy wrote:
>>> +    /*
>>> +     * And if we do now see any replay calls, they would indicate 
>>> someone
>>> +     * misusing the dma_configure path outside bus code.
>>> +     */
>>> +    if (dev->driver)
>>> +        dev_WARN(dev, "late IOMMU probe at driver bind, something 
>>> fishy here!\n");
>>
>> This warning triggers on my workstation (with an AMD IOMMU), any ideas?
> 
> Argh! When I moved the dma_configure call into iommu_init_device() for
> v2 I moved the warning with it, but of course that needs to stay where
> it was, *after* the point that ops->probe_device has had a chance to
> filter out irrelevant devices. Does this make it behave?

Yes. It works on my end.

Thanks,
baolu

