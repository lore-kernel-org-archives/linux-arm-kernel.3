Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F3CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ooe2kYw9bdSye0w1HNwoE0S/zimzdgE6VNoua5g1jAc=; b=OOr7y/nW9caisNhyEJHJM9yQm1
	GvuiFsSiQPuDDn29Tmfj+X2JuLN11fdttCCJ29k2V+BsBRHotBnvQMZQsDZVuDyxzlq7pcvT3nC9A
	YUI8hl10yvss9IJKca2HG9dwoH9S8sFKNkitiBnhpymDdQ5EoIrnlrWn/6NFU1fXUhFquL8TQwWdb
	GLM1PMIs3yF/b7LViyaun0mWoWj4tHLrKM9OgyVOBd22X+djJXfZNccku+s5uGyG8RtsxSaNls4sc
	1U3w9G5E1tWFFn46yJ6PF+UMHpIywhsAlY+js2CRzcDpjYyZma9M6SymLidSe2bmfzyDagYA1QWAh
	x4zJA/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0Zv-00000003GUT-1CL5;
	Mon, 16 Jun 2025 03:32:11 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0Si-00000003FH6-270D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 03:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750044284; x=1781580284;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nQlTpBtnZoIiH+wLV1PriCQvFOj3vAZit6p9w/vLTNA=;
  b=HipRNz99qJml7qTNajmN5h4rxoNFkAVg+NaqO3VjozSj2FLHJ6ZPlM1J
   V5vBWXkpJobgFR/Z1+QG6NFDAut/WHUc6cUIVwtdqKa2/X0HL97qpuTRu
   sipdZsPWJgVIRVilw4XerdxPK3dzFm2lt1QyUWxr/Eb5Um8MHnXkIceWW
   ARLGdTFnL9zk6L12+y3pNmPYUVvlFl5w4Tn7HJAiNqkxQHtuduHv5oSxM
   4Q7ijJB+bBhECWN2WwnnEAXbRialEefWj53MXawQ1elIdRGOuINcAvBf5
   twSHfz9fIcqP2Ke9mBs7ZFAzC6btTyy2LSSVdhv40uaDyQZWs8BWG3+ac
   w==;
X-CSE-ConnectionGUID: tCf+g12SQiqdkMiObN+44w==
X-CSE-MsgGUID: 6RIzomCOTka6EJBDkjUcdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62449366"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="62449366"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:24:43 -0700
X-CSE-ConnectionGUID: 4+NUI3u4SVK7JFAdYkwgtg==
X-CSE-MsgGUID: VvrxDRXxSZGE38Fhwmm2VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="148205460"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:24:40 -0700
Message-ID: <1cd66b51-5d73-4d28-8b63-8df5a5bf7ee8@linux.intel.com>
Date: Mon, 16 Jun 2025 11:23:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] iommufd: Apply obvious cosmetic fixes
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <9132e1ab45690ab1959c66bbb51ac5536a635388.1749882255.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <9132e1ab45690ab1959c66bbb51ac5536a635388.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_202444_793984_DE129115 
X-CRM114-Status: UNSURE (   4.54  )
X-CRM114-Notice: Please train this message.
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

On 6/14/25 14:35, Nicolin Chen wrote:
> Run clang-format but exclude those not so obvious ones, which leaves us:
>   - Align indentations
>   - Add missing spaces
>   - Remove unnecessary spaces
>   - Remove unnecessary line wrappings
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

