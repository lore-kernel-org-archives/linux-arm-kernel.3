Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68A8C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 03:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MUPcI9cmqC3aUypbZqtXOEO2f8CqTwiFzHdEbsgWe4=; b=dqi7GVfJ/tOrK3IzfSDgeADh1V
	J/WUQTZZcsR7XoF0baEMgaKefl1E4zziwZtwrErNr52LbndVEolQ6BxtwntannKQkSg2U+YLhxIsB
	MWaTVLfmrPQAWLkGK7lfiUs9ENVNsNsTQzblBJlg+0jZDqS1N+grNuoU+/PC2XA7RediBVkiBeQ3M
	tb0bUbLyE/AkqZJuyRRvCOsEfn+lerA38NHubVG23AYvY9460CDAH//kI9ChtJHjuF6qk46dV0kn3
	qIgChiXJbnvX80Bl3OInNxyjY+6OzpJefzOGgE+JTpzH6RZS+OFLj2vTZPZgJyiBNH95uOwkqNmoV
	dM1S4sFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yOr-0000000BbyE-0Txf;
	Wed, 30 Apr 2025 03:46:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xK2-0000000BWdb-1WfQ;
	Wed, 30 Apr 2025 02:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0MUPcI9cmqC3aUypbZqtXOEO2f8CqTwiFzHdEbsgWe4=; b=CH560dFcfvsSzCjcwDUUnutBwU
	rSNBPbO77t0wdN4iqKCw71y7gKWhWrB2+UBX+LOAJe+toQiK2myALsUROjEIz6GR1aiJvLFXpqC7J
	gcBhb5Thn8qpXn3shfDCSfsiZGvh6Pdu/QL9+PwdaikZeVHm7iV+7r//mA82mUI2BEJhWKQ/D3cqk
	MIrBovuQbuPflMEcUF7VilPyI+UETppH13mUa5x4H3Rh9j8oAMhoi3A40TxjQzeO+AnZVjiwDp2LA
	aJ8mrgL43mh03FCVcFKv+roPdhrUp2/XtLruABXXdIt6l4ncsp3Vc544NY390nhpXGSOeeVyD0SNL
	3XisVGSw==;
Received: from mgamail.intel.com ([198.175.65.14])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9xJy-0000000De8r-3fI6;
	Wed, 30 Apr 2025 02:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745980635; x=1777516635;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UeVWVQMtCSgoY6I17XEsqNEXKT0TWbHaFTIMLOeTnTs=;
  b=kQPC8tLSmMmROAf3PSFKKgM88usvOiueYDPvESnp+ogBfLU63eybnHh8
   RtMUTsJcPbUWIf3r0iSMCbw6QeEQRJ41KnLaGmt8UeeL+mzClM8LzFUd2
   qYjxFRoAWp3lCVQQ0Oq7pGn6ZWx816gSxHw8reLo6MfR6yoqH5RsT/xAK
   rxWy0flmFAXoUj7nQYcNtVBMjlpo7WXpbfWq9WzBoMejYe9lyS0q77NYL
   dDbtM8nbcKcnhRMheUQL8Tx0Rva5Vm/V3Qye0UzpKkHbUt1LWA18i9wcb
   UENU6ZQhdM4utDpLkw6YcKX17QP4RTmZUkq3EKN3yQCUiNmZAkL8DHTbx
   w==;
X-CSE-ConnectionGUID: fb4fMSmqQ86HmlySG60Kiw==
X-CSE-MsgGUID: lueR3U/hQXaGuKjVieY/Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51445222"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="51445222"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 19:37:10 -0700
X-CSE-ConnectionGUID: rPKpQb86Qv+hi9Gbn/bOCw==
X-CSE-MsgGUID: eN7Ab3jZTbWZDraScrUmnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134508430"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 19:37:00 -0700
Message-ID: <0a5f2f46-f474-49d3-baee-59f2ad0a6f0a@linux.intel.com>
Date: Wed, 30 Apr 2025 10:32:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] iommu: Remove ops.pgsize_bitmap from drivers that
 don't use it
To: Jason Gunthorpe <jgg@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>,
 Orson Zhai <orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 virtualization@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: patches@lists.linux.dev
References: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_033715_447465_9734B9EF 
X-CRM114-Status: GOOD (  10.50  )
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

On 4/29/25 22:34, Jason Gunthorpe wrote:
> These drivers all set the domain->pgsize_bitmap in their
> domain_alloc_paging() functions, so the ops value is never used. Delete
> it.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/apple-dart.c       | 1 -
>   drivers/iommu/intel/iommu.c      | 1 -
>   drivers/iommu/iommufd/selftest.c | 1 -
>   drivers/iommu/riscv/iommu.c      | 1 -
>   drivers/iommu/virtio-iommu.c     | 6 ++----
>   5 files changed, 2 insertions(+), 8 deletions(-)

For intel vt-d driver,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

