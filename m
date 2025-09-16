Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F38CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6Vx/vPz8WWILqH/66UWZZGBUgvsTnoWDzuyzUYEU7k=; b=NnvgEPWOzjdNwmZysAteYzYL0V
	S6EZWawJQwrwe40SY8pc0P/mNfzVVv6uHf1jJWnFzS0lkZBsFCwVAuI1IGgBjf2pjuxri6IYPKPBe
	8q726cTIgeLtRI2TmALE0q9B8c8wQL5S10T3v950XObFVekakLlHFveAXuvH8g8spcrP0lgDPpGZV
	FHQfzqHnTDeTb13l4waGQTLtEiRzGT8ix9z/jYffSQ3SrKF31z00V1NUJc34JpC6NXfVLGvvus0OJ
	LobF9V2kZ7JeXqlkPKlBfUeZlIeB2p4LPHNcLNAq576LIHxJQ7UxDLx3drRi19hrCUhLdwgH8YWF/
	3pXwnH7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd2A-000000099hk-0s32;
	Tue, 16 Sep 2025 21:16:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd29-000000099hd-3a7L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AA9E601D9;
	Tue, 16 Sep 2025 21:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C74C4CEEB;
	Tue, 16 Sep 2025 21:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758057377;
	bh=kBpRtBbR+gU+md5yBa0FD4QWFI0+TqFLBQcEyMNvqzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKyomrt1JRvKIxDsoHZ5RjY7ESCGT5FkYIOKfsYA4OxM5cGB5broh7qIsKFDXA3eo
	 AE5NDwCZNf90YmdbD0W9Y6iSAl8rTD/TKsstIg+6Dss8rUOUfWLLx0lpZ7gh+FxlK/
	 7V9+1b4Fq8c36CoWdHwmGFC58wLFyxuG3KfZ6bBXr2xKrtU8UaAC00+VEAJ6OtPHx1
	 g2pF7d0aJ3aTxk7YIVenmL+hz6Ue9Tz+jSUkKPVnJN/kfDBTjEP4Xx2MHKU8jGljmn
	 mxrSZIId+RAtBN753bs3jROu32b16taWBY7WzbXgLC4Qr+UGr4QQ86ljNlWVB7FSF4
	 A9w+xY1gPqgXg==
Date: Tue, 16 Sep 2025 22:16:11 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 3/3] kselftest/arm64: Add lsfe to the hwcaps test
Message-ID: <aMnTm59nrA5lBxN5@willie-the-truck>
References: <20250818-arm64-lsfe-v3-0-af6f4d66eb39@kernel.org>
 <20250818-arm64-lsfe-v3-3-af6f4d66eb39@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-arm64-lsfe-v3-3-af6f4d66eb39@kernel.org>
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

On Mon, Aug 18, 2025 at 08:21:20PM +0100, Mark Brown wrote:
> This feature has no traps associated with it so the SIGILL is not reliable.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/abi/hwcap.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
> index 002ec38a8bbb..941890f69df6 100644
> --- a/tools/testing/selftests/arm64/abi/hwcap.c
> +++ b/tools/testing/selftests/arm64/abi/hwcap.c
> @@ -17,6 +17,8 @@
>  #include <asm/sigcontext.h>
>  #include <asm/unistd.h>
>  
> +#include <linux/auxvec.h>
> +
>  #include "../../kselftest.h"
>  
>  #define TESTS_PER_HWCAP 3
> @@ -169,6 +171,18 @@ static void lse128_sigill(void)
>  		     : "cc", "memory");
>  }
>  
> +static void lsfe_sigill(void)
> +{
> +	float __attribute__ ((aligned (16))) mem = 0;
> +	register float *memp asm ("x0") = &mem;
> +
> +	/* LDFADD H0, H0, [X0] */
> +	asm volatile(".inst 0x7c200000"
> +		     : "+r" (memp)

Doesn't this corrupt H0 without the compiler knowing? It's probably
easier to use STFADD.

> +		     :
> +		     : "cc", "memory");

Why do you need the "cc" clobber?

Will

