Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE525D42BA2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePhJTRSWpIB4qZQQxI6gKAtILe/DrFCFslH9XH90ljg=; b=Zj+3+LD2zr9j4coFvHj6unvdjs
	0hqq4R5IXjaDmYf0Ah9fsjUevYhr3bZF2/sjyzs5JzImIM3SMgqA0z3hv5yBYji6UO1Ymuf5gy2LE
	bzMsmIX05J00XGniSpPBrtPDTPiqZxqt+KKvVBXy0E57krSMgvjXHRhkM5UQCnQCx0CyzsVyZ1GeS
	q9mT6aJLn7tc9t0+MmciTZjxl87SwibOmqv2/kyuYHsNTnmr/36/SVOcqEBHn6m/2I5t5ZhTSYbcK
	gNMfd22JqhTokjfFYOgjJ3DBmkjUVj5Zm5lTONTLvgBossoWZ8Cv3niXykNSIlY2w3Qy9DIWU504Y
	6qQNg3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtM6-000000043js-3gSZ;
	Tue, 12 Nov 2024 16:03:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtHH-000000042R1-2t6d
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Nov 2024 15:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ePhJTRSWpIB4qZQQxI6gKAtILe/DrFCFslH9XH90ljg=; b=MakporpnEoSqv4aXdfByghEk0E
	9mWEdp63nM28NfDc1uOEtRCYzh6UqSmc8oM3jGWYW1tP46wQkjhok/zQ5UetpaT3tt4RMQcaLJ/sc
	fqZxuvKZh3IHSoHLhfUD4+cKe6RvfxUH3Gc8Xg1vl+1ihbiTS3oM9Ox0M1hOigzB0aFNI2q15+O3n
	EQSR3Ri1imTpFKCNeByecM2ErH3kzbIRvNPzX0qLymxvcbEGSq9rjbx7jpisyTU5MHUqouP29lF6m
	V5tpgYTBkYeuP2F9YzBs3GM8flDecrgcdYVD4hznD/MrIrWTOANH7W7dklSzu6GaYeQmfx9WJoGjE
	HfZdCKeQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtHD-0000000D6QP-3zyK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 15:58:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C2CE5C57E8;
	Tue, 12 Nov 2024 15:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57781C4CECD;
	Tue, 12 Nov 2024 15:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731427076;
	bh=xcV5aO8dDT6Bs99PMcY0mZnf3cBIhNXhkkKn6XfKDc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJ3RTisRVF+zCRCxLTEWfl/lJB2uMheSYI7+nmqZvoAlREmIJwdEnm1P6wdwd0piC
	 rMYmBDQSHPcES2A16wTw2fdWOcKwgJM+HHCfWuycyd0ufFKOlp17R3x9ZizXTd+LZe
	 p7V7JJQkqnmSGfW/BXXsvEq5GFDoCDPLot0MdRHz/8R5sskqLvyE+RufH8C25asPq+
	 Xk5hAqQ2BxHtESKXrVmh5Hy+k+R7XgzHTzn3G7I7nKyL3Nw0A+Afo0r3qLZ+BmJCMx
	 PXVFFqjou7rKrPhC8I1iGqRQ1fnWqjbRHxM9xgItrW/JVENqrRAFa8vvLT71I9m2/9
	 4BBAjNIYw+WMA==
Date: Tue, 12 Nov 2024 15:57:52 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2.5/3] iommu/arm-smmu-v3: Undo SMMU enable on probe
 failure
Message-ID: <20241112155750.GC21479@willie-the-truck>
References: <cover.1731088789.git.robin.murphy@arm.com>
 <0812e9f61234cbcdc5cab7de307e1c9a8e3c9498.1731422868.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0812e9f61234cbcdc5cab7de307e1c9a8e3c9498.1731422868.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_155800_538744_A1D480DC 
X-CRM114-Status: GOOD (  15.79  )
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

On Tue, Nov 12, 2024 at 02:49:59PM +0000, Robin Murphy wrote:
> If SMMU probe fails afer arm_smmu_device_reset(), we leave the SMMU
> enabled with an empty Stream Table, silently blocking all DMA. This
> proves rather annoying for debugging said probe failure, so let's handle
> it a bit better by putting the SMMU back into (more or less) the same
> state as if it hadn't probed at all.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 7908fca962fe..566d66e9c91e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4640,6 +4640,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	iommu_device_sysfs_remove(&smmu->iommu);
>  free_iopf:
>  	iopf_queue_free(smmu->evtq.iopf);
> +	arm_smmu_device_disable(smmu);
>  	return ret;
>  }

Heh, this is starting to look an awful lot like arm_smmu_device_remove()...

Will

