Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43912D78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UsKIbitNoOVnvjSQgb/bxdxA/XOzYu4LYNREJNlkZY=; b=O6JIpr9J5yKxVlmk8DDYDcK9+A
	UL+fNI83MYhL8j1j1LBauX9ssNh3JJRrKE8CLAwYifO8Dk2OSmuQUDI734+YM507Jy4gwG3KopSH4
	KYK1xIDeIg2rT/eoxAUrGUV0KgmXwXCoe16x2cM9v8B2dxmo1W4gQkgAh4RijdlbradH1PXLk8WRP
	uZ/3pddBgF/SJ0SDSB09m64VVZdWy4dv8f0CP671uw/QhmFDiqYHb4T/A3Gv1fADDjtT3eOz+Xuka
	f3xRVzxtqaOHEyxFFSEV4WOFp4S8Gk49L7LTp2DxPjPG3/xKyqZzTt56fpWCSEI16Yx3+VjzK7DXJ
	UrqZGgyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI93b-00000006ngZ-2x9j;
	Mon, 02 Dec 2024 16:13:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8kQ-00000006juM-1jUI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:54:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B7491007;
	Mon,  2 Dec 2024 07:54:33 -0800 (PST)
Received: from [10.57.68.33] (unknown [10.57.68.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2EE673F58B;
	Mon,  2 Dec 2024 07:54:03 -0800 (PST)
Message-ID: <932062a6-1d77-44f8-9efd-25f2eae34891@arm.com>
Date: Mon, 2 Dec 2024 15:54:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MAINTAINERS: Add CCA and pKVM CoCO guest support to
 the ARM64 entry
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Keir Fraser
 <keirf@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Steven Price <steven.price@arm.com>,
 Quentin Perret <qperret@google.com>
References: <20241202145731.6422-1-will@kernel.org>
 <20241202145731.6422-3-will@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241202145731.6422-3-will@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_075406_518884_DB3AA6E6 
X-CRM114-Status: GOOD (  13.49  )
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

On 02/12/2024 14:57, Will Deacon wrote:
> Commits 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for
> realm") and a06c3fad49a5 ("drivers/virt: pkvm: Add initial support for
> running as a protected guest") added arm64 guest-side support for
> running in CCA and pKVM confidential computing environments
> respectively.
> 
> Unfortunately, these changes were not accompanied by a MAINTAINERS
> entry and so aren't automatically picked up by the get_maintainer.pl
> script. Since the initial support was merged via the arm64 tree, extend
> the ARM64 entry to cover the two new directories.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e930c7a58b1..9378c0c4bbc9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3376,6 +3376,8 @@ S:	Maintained
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
>   F:	Documentation/arch/arm64/
>   F:	arch/arm64/
> +F:	drivers/virt/coco/arm-cca-guest/
> +F:	drivers/virt/coco/pkvm-guest/
>   F:	tools/testing/selftests/arm64/
>   X:	arch/arm64/boot/dts/
>   


FWIW,

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>


