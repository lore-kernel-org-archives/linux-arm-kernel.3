Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542BBCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XibKYyB8nk5riR4qnhOFzfgg/dI0v3FkhOkL7BNvwgI=; b=pih8kxumro2l06G5CySdur4IFK
	h0EeOfzwhoKHlj4MBCS9o8H1x3rcWJ3bFiJDS2dVGnnm0+b7ef43wGrMVw4vdAH9/4IIt2jrimCC5
	scn3rRW3efnsulbt5LYTF3QQ5+vUNjFkigYRBmkEAvMuBzW0ZZCj63ANrgyYKvbiUQCXQRChdxa7G
	cpvimcNQrxcV44RoBvlz7vsf1ZROlRjeCUT4gtt2btPQrz4z6s9BTAygIkQ7HfubOLAbK3+PHQWTd
	AMaxbjHfjDJwjanuwGYBNB7T+oquf+Wj5/dZrKYrlv50Y39MsG+nMRYeoqwFD8CRp7wzkMqnX90oy
	ymwwhx+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDnq-0000000HPO2-1vm3;
	Thu, 18 Sep 2025 12:31:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDno-0000000HPNq-1zwO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:31:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98DC96020F;
	Thu, 18 Sep 2025 12:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABDBC4AF09;
	Thu, 18 Sep 2025 12:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758198715;
	bh=9YE8xRlSzp0qtaXULH+Q+S0tyjvcR7V5a6iVKARxGWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKhAH4sTdDcS42MZJjyQjOGuZgD3/4jy171TaLbjCTGU3FRaZc4/90465vNUoGnlV
	 /gv1qZUHGvREwprA6mY4T0RuAFcIbLvJsqNe/lMntY+4WpUwwVymsoFERsgiQVBTnD
	 Zp+OjcIaDNgtSSTVqX9enOeXx2njaLZJ/AO6dlLz9PMDBCzh7alQPxshl3UaOH6Psb
	 ayRPpeoDbYC4okqeVsaBvb8s8dNs3q7awhNnOTKyjEYrgUFK4eSRnnqvXR1L2bjkkf
	 bxydSLbYzzJYarwnd859HDu/IBnu0dQmK1qgZWogRAD99nR3eT91Cn4AEcY4ROpsNO
	 nqo1EiabPe0Tw==
Date: Thu, 18 Sep 2025 13:31:49 +0100
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, catalin.marinas@arm.com,
	gshan@redhat.com, aneesh.kumar@kernel.org, sami.mujawar@arm.com,
	sudeep.holla@arm.com, steven.price@arm.com
Subject: Re: [PATCH v2 3/3] arm64: acpi: Enable ACPI CCEL support
Message-ID: <aMv7tbA3JGd7ZcbW@willie-the-truck>
References: <20250908223519.1759020-1-suzuki.poulose@arm.com>
 <20250908223519.1759020-4-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908223519.1759020-4-suzuki.poulose@arm.com>
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

On Mon, Sep 08, 2025 at 11:35:19PM +0100, Suzuki K Poulose wrote:
> Add support for ACPI CCEL by handling the EfiACPIMemoryNVS type memory.
> As per UEFI specifications NVS memory is reserved for Firmware use even
> after exiting boot services. Thus map the region as read-only.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v1
>  - Map NVS region as read-only, update comment to clarify that the region
>    is reserved for firmware use.
> 
> ---
>  arch/arm64/kernel/acpi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index 4d529ff7ba51..93b70f48a51f 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -360,6 +360,17 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>  			prot = PAGE_KERNEL_RO;
>  			break;
>  
> +		case EFI_ACPI_MEMORY_NVS:
> +			/*
> +			 * ACPI NVS marks an area reserved for use by the
> +			 * firmware, even after exiting the boot service.
> +			 * This may be used by the firmware for sharing dynamic
> +			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
> +			 * as read-only.
> +			 */
> +			prot = PAGE_KERNEL_RO;
> +			break;
> +

Shouldn't this be merged with the other case handling read-only mappings?
e.g. something like:

		switch (region->type) {
		case EFI_LOADER_CODE:
		case EFI_LOADER_DATA:
		case EFI_BOOT_SERVICES_CODE:
		case EFI_BOOT_SERVICES_DATA:
		case EFI_CONVENTIONAL_MEMORY:
		case EFI_PERSISTENT_MEMORY:
			if (memblock_is_map_memory(phys) ||
			    !memblock_is_region_memory(phys, size)) {
				pr_warn(FW_BUG "requested region covers kernel memory @ %pa\n", &phys);
				return NULL;
			}
			/*
			 * Mapping kernel memory is permitted if the region in
			 * question is covered by a single memblock with the
			 * NOMAP attribute set: this enables the use of ACPI
			 * table overrides passed via initramfs, which are
			 * reserved in memory using arch_reserve_mem_area()
			 * below. As this particular use case only requires
			 * read access, fall through to the R/O mapping case.
			 */
			fallthrough;

		case EFI_RUNTIME_SERVICES_CODE:
			/*
			 * This would be unusual, but not problematic per se,
			 * as long as we take care not to create a writable
			 * mapping for executable code.
			 */
			fallthrough;

		case EFI_ACPI_MEMORY_NVS:
			/*
			 * ACPI NVS marks an area reserved for use by the
			 * firmware, even after exiting the boot service.
			 * This may be used by the firmware for sharing dynamic
			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
			 * as read-only.
			 */
			prot = PAGE_KERNEL_RO;
			break;


With that, I'm happy to pick up the series (let me know if you want me
to make the change above locally to save you a resend).

Will

