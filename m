Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980F4C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i89CWz1fIlXdtlTup9CBJv8aVcses5qMsrwBP/A0m/I=; b=KGhmt0Fn9uNQFjgzM1YTMhu/Zd
	RhMbAQnqgNbK4HhM9+A8msYYVng8MQKwWxiJiS+rT6KFzHm0wL5ZRa29wiZ8ywuK04p1CR8KO2KbN
	EPi1CdO3+QdIDkhvIYvMeOMihq7jvAEq8xNomgodGPRAWLJBm6MvlyxSx3xk674m0Wi5M0EzuNxp7
	svoWF2cYmKNAOSjXMOGxOUGl2YOrkR+Wxoscm5ZG0HGVvuMgisHUS59yD9DhoyUcnbpX/DpG0yK2e
	SK5NPyNPp645AxsZjJcLcJrZe2+IGb0wJcX3cfhFBMh2d2PbSgmm7SbkIIV1+53Cg/kUfOnui5kop
	ZokL1/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBe7-00000001sHs-3W60;
	Mon, 30 Jun 2025 10:21:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBQx-00000001q9p-1yHi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 10:08:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB3251D34;
	Mon, 30 Jun 2025 03:08:02 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 974EE3F58B;
	Mon, 30 Jun 2025 03:08:16 -0700 (PDT)
Message-ID: <1d825680-4275-42cb-9e3c-dc49f828f7a8@arm.com>
Date: Mon, 30 Jun 2025 11:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] kselftest/arm64: Add lsfe to the hwcaps test
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org
References: <20250627-arm64-lsfe-v1-0-68351c4bf741@kernel.org>
 <20250627-arm64-lsfe-v1-3-68351c4bf741@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250627-arm64-lsfe-v1-3-68351c4bf741@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_030819_552983_A0B2FBAB 
X-CRM114-Status: GOOD (  16.69  )
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
> This feature has no traps associated with it so the SIGILL is not reliable.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/arm64/abi/hwcap.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
> index 35f521e5f41c..9dfca2eb7c41 100644
> --- a/tools/testing/selftests/arm64/abi/hwcap.c
> +++ b/tools/testing/selftests/arm64/abi/hwcap.c
> @@ -17,6 +17,8 @@
>   #include <asm/sigcontext.h>
>   #include <asm/unistd.h>
>   
> +#include <linux/auxvec.h>
> +
>   #include "../../kselftest.h"
>   
>   #define TESTS_PER_HWCAP 3
> @@ -165,6 +167,18 @@ static void lse128_sigill(void)
>   		     : "cc", "memory");
>   }
>   
> +static void lsfe_sigill(void)
> +{
> +	float __attribute__ ((aligned (16))) mem = 0;
> +	register float *memp asm ("x0") = &mem;
> +
> +	/* LDFADD H0, H0, [X0] */
> +	asm volatile(".inst 0x7c600000"
Same effect, but isn't this the release variant, LDFADDL?
> +		     : "+r" (memp)
> +		     :
> +		     : "cc", "memory");
> +}
> +
>   static void lut_sigill(void)
>   {
>   	/* LUTI2 V0.16B, { V0.16B }, V[0] */
> @@ -758,6 +772,13 @@ static const struct hwcap_data {
>   		.cpuinfo = "lse128",
>   		.sigill_fn = lse128_sigill,
>   	},
> +	{
> +		.name = "LSFE",
> +		.at_hwcap = AT_HWCAP3,
> +		.hwcap_bit = HWCAP3_LSFE,
> +		.cpuinfo = "lsfe",
> +		.sigill_fn = lsfe_sigill,
> +	},
>   	{
>   		.name = "LUT",
>   		.at_hwcap = AT_HWCAP2,
> 

Thanks,

Ben


