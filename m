Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOjWwGv2nw53G+APikUFfBY+ZYUqNzOtt9GdaYYwpvE=; b=0A9Qftd1FDZktGXJzE8P4vTSOq
	f7miI5Y38fTpYyUb6lXLJKtlij+PrwEb1mMslpPzpptAX8zRt4U7RCk4QdwJIVfQCdbr5wDGpDkRH
	sit0TkoQyTbJomGnNo6f+kqljJ5unK0qjwm/3FFtgSoAnSrRudThMRuZz1geN+MdaO8OGpeDfIiPs
	lXUQHcdvvqZ68SwKqD2l50qIWhJJ8Vbjm0PaQvBqx6smrM5PXZxHDVlXOcjtbba8OGVLBo4wy2mC9
	aQHiLMikSqENqzOlt9OMo0H54VdGe7lwT3ztQqKiTkYX+VoAv2gwuWJjZnYqOqG7nAs9OC0d7ZTGV
	vc6Ay93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7vk-0000000FLld-2wjd;
	Tue, 07 Jul 2026 15:41:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7vh-0000000FLkL-3a0x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:41:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EB481AED;
	Tue,  7 Jul 2026 08:41:43 -0700 (PDT)
Received: from [10.57.38.146] (unknown [10.57.38.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F0913F905;
	Tue,  7 Jul 2026 08:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783438907; bh=xMFTUswuraT98QQrkLx1TpVKtw83hgxNIbc8hHyXcSM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YcCuSd4USWQ9JvBOwgdQS/XGW7fN5UF5gHXcM0Ogcbv+GMTsGplKLOKCsaQ73/VF8
	 1xuAF2K12iBvJ56gFYBusyY7CPREK4DmWCZ4DbU0txiXaoauL4t7iPzZRJzuP3+6Uq
	 EAUVgOWIKMO2gsIMqcbYolSuec2zbVTSCMm62+CI=
Message-ID: <8d6b24ea-3a63-497e-9ce9-6a8e4d340665@arm.com>
Date: Tue, 7 Jul 2026 16:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/22] coco: arm64: s390: powerpc: Mark secure guests
 with CC_ATTR_GUEST_MEM_ENCRYPT
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Cc: Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
 Petr Tesarik <ptesarik@suse.com>, Alexey Kardashevskiy <aik@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, Xu Yilun
 <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-9-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260701054926.825925-9-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_084149_940988_D4728570 
X-CRM114-Status: GOOD (  12.11  )
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

On 01/07/2026 06:49, Aneesh Kumar K.V (Arm) wrote:
> arm64 Realms, powerpc secure guests and s390 protected virtualization
> guests currently report CC_ATTR_MEM_ENCRYPT, but not
> CC_ATTR_GUEST_MEM_ENCRYPT.
> 
> These environments are all secure guest configurations. Their
> force_dma_unencrypted() implementations also treat the same secure guest
> state as requiring unencrypted DMA. Report CC_ATTR_GUEST_MEM_ENCRYPT for
> the same condition so generic confidential-computing code can distinguish
> guest memory encryption from host memory encryption instead of relying only
> on CC_ATTR_MEM_ENCRYPT.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>


For arm64 bits:



> ---
>   arch/arm64/kernel/rsi.c                      | 1 +
>   arch/powerpc/platforms/pseries/cc_platform.c | 1 +
>   arch/s390/mm/init.c                          | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index 92160f2e57ff..207e36db1e7a 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -27,6 +27,7 @@ bool cc_platform_has(enum cc_attr attr)
>   {
>   	switch (attr) {
>   	case CC_ATTR_MEM_ENCRYPT:
> +	case CC_ATTR_GUEST_MEM_ENCRYPT:
>   		return is_realm_world();
>   	default:
>   		return false;

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


Suzuki

