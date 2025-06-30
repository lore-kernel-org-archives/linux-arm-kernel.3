Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C07C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXhs+7c29L9IAJEbOQqIYkoOXotVjhRkPNd/dFJbyKQ=; b=vF3ULiMa0xHSnp4X1rv4Suo24m
	2K64NzbJk5l+grGK61kZMX4sdEFZAccwEleJTsFR5zK5ryXWA7jrVraT9UaZbXpdkJM97U7Aaxvgu
	Hjd+JG2AkO9RFJf6s7NXByvUxqI7dpK+jKTZW7s3JRRwTh/VPA+MgANkaxXE+/Ks2bim0g8HeG5GI
	P9OjwrHJxW0Zny5Lu7Zr/Wz72HZJMJEOfzNkFSVUYYrj/mmXkfOhboN2K1SGDF5RN06QHkkHLS12J
	8xc3Z2zOGsS/DYTW6IVvIyHiMYY0hUo+85gqK0iPiticZ7sCahVtuDkR1C6os6u849PgLaEzOb6jJ
	i6Xkj9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWC3G-00000001wQb-1PHI;
	Mon, 30 Jun 2025 10:47:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBdW-00000001sBJ-3DPp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 10:21:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20C931D34;
	Mon, 30 Jun 2025 03:21:02 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD3323F58B;
	Mon, 30 Jun 2025 03:21:15 -0700 (PDT)
Message-ID: <ee89d23e-db04-4646-a556-27117e94b5ed@arm.com>
Date: Mon, 30 Jun 2025 11:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: Support FEAT_LSFE (Large System Float
 Extension)
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org
References: <20250627-arm64-lsfe-v1-0-68351c4bf741@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250627-arm64-lsfe-v1-0-68351c4bf741@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_032118_846287_A6093A4C 
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

Hi Mark,

On 6/27/25 18:20, Mark Brown wrote:
> FEAT_LSFE is optional from v9.5, it adds new instructions for atomic
> memory operations with floating point values.  We have no immediate use
> for it in kernel, provide a hwcap so userspace can discover it and allow
> the ID register field to be exposed to KVM guests.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Mark Brown (3):
>        arm64/hwcap: Add hwcap for FEAT_LSFE
>        KVM: arm64: Expose FEAT_LSFE to guests
>        kselftest/arm64: Add lsfe to the hwcaps test
> 
>   Documentation/arch/arm64/elf_hwcaps.rst   |  4 ++++
>   arch/arm64/include/asm/hwcap.h            |  1 +
>   arch/arm64/include/uapi/asm/hwcap.h       |  1 +
>   arch/arm64/kernel/cpufeature.c            |  2 ++
>   arch/arm64/kernel/cpuinfo.c               |  1 +
>   arch/arm64/kvm/sys_regs.c                 |  4 +++-
>   tools/testing/selftests/arm64/abi/hwcap.c | 21 +++++++++++++++++++++
>   7 files changed, 33 insertions(+), 1 deletion(-)


I have looked through the series and it looks good to me modulo a couple 
of minor comments left on the patches. Bare in mind fairly new here and 
this is the first use of hwcap3 so I expect more experienced review is 
required.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

> ---
> base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> change-id: 20250625-arm64-lsfe-0810cf98adc2
> 
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
> 
> 


Thanks,

Ben


