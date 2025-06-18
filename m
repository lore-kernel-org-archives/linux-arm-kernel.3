Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23894C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiB1EkSqut4rMTxm/+LXeEUSnbbYUA2oGnQOe+U4MvU=; b=lJF9FuHNRpdRNzXRXGPF5RS7fh
	EWyutBIrOa1d71kBOvVRYTmD9H6kj/fk29j7yzltZjiOnZV7s5oZmDMK2X+FTXMbJInI0LIOpjUNf
	2TOomO/MPF3qqgKgQGAd8QncYUZ6/RykXUJcuIwgLm3wXV8FBKhINpzgPRdgWGWwe4krRQyzTeobl
	qcwVn5ZMVERB7Eeu9bT2H6nb/2LoCCbEUoQxzdozml+UgNg+pUPuId7Th1tM9j2f9bLbTPbsyQzRP
	UqLgQk1WSPl7UF5Zd4H3Qjk25lNV1bXWqBFPNPTtAe4HEXBGMemtNRirA3dk0nnZqujdTcbJYEmGW
	cY/JACgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvcy-0000000AjE3-3MfH;
	Wed, 18 Jun 2025 16:27:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtsk-0000000ASZI-3rrV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 14:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 467996112A;
	Wed, 18 Jun 2025 14:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7A5C4CEE7;
	Wed, 18 Jun 2025 14:35:10 +0000 (UTC)
Date: Wed, 18 Jun 2025 15:35:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com,
	lpieralisi@kernel.org, david@redhat.com, ddutile@redhat.com,
	seanjc@google.com, aniketa@nvidia.com, cjia@nvidia.com,
	kwankhede@nvidia.com, kjaju@nvidia.com, targupta@nvidia.com,
	vsethi@nvidia.com, acurrid@nvidia.com, apopple@nvidia.com,
	jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com,
	mochs@nvidia.com, udhoke@nvidia.com, dnigam@nvidia.com,
	alex.williamson@redhat.com, sebastianene@google.com,
	coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
	ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
	linux-mm@kvack.org, tabba@google.com, qperret@google.com,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
Subject: Re: [PATCH v7 1/5] KVM: arm64: Rename symbols to reflect whether CMO
 may be used
Message-ID: <aFLOnN_Ha3s724rK@arm.com>
References: <20250618065541.50049-1-ankita@nvidia.com>
 <20250618065541.50049-2-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618065541.50049-2-ankita@nvidia.com>
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

On Wed, Jun 18, 2025 at 06:55:37AM +0000, ankita@nvidia.com wrote:
> -static bool kvm_is_device_pfn(unsigned long pfn)
> +static bool kvm_can_use_cmo_pfn(unsigned long pfn)
>  {
> -	return !pfn_is_map_memory(pfn);
> +	return pfn_is_map_memory(pfn);
>  }

I wonder, why not just use pfn_is_map_memory() directly? At a quick
grep, it's only used in one place and your patches don't seem to modify
this function further.

-- 
Catalin

