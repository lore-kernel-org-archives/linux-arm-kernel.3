Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7714AC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 00:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEjVb0+qxLyWKPnYmSY5giDsCfnGo55jKL5ClAYyGNE=; b=H5NOvohKE4wyKVFP7Op+pK/4jb
	OmpTHnC9F565tFstqs9BhTuPmA94RJ2YowEAakwii8HaPJuX5mQP+S7kQdwd++6cRseJV1WLidm53
	DkXmVS+GLlbFLu69kaariIXEazV9LktTOYRuzi7YmgjEo38rPVkcWmDJhEWKlsWCYsZlgsZJSXI+I
	80vGX5dv+iGa2a3LAM0Tcg2RNL2qfhoud3W9ITtKrnwt/IHrY1bHMPtzdc8prH7gRixG3rxWPtszM
	+2eQ4a4HGguLLO5BXOSCOorIHmN6DFj4SE42wjqbAKnLphNt3iKsFMvm3UUPfkpQG/bMADtXL+1xu
	iThywCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Hhb-00000000neo-01JY;
	Fri, 04 Sep 2026 00:22:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2HhY-00000000neR-0rtU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 00:22:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C30B2153B;
	Thu,  3 Sep 2026 17:22:34 -0700 (PDT)
Received: from [192.168.20.93] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 267F03F673;
	Thu,  3 Sep 2026 17:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788481358; bh=KkqA4JfpC+qZOcDSnPV5aLKF2fE3aJNceKGtVymIhq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KYh/XthKzWv3g/3lQJv5JF/5Ky5DX9BV4DT9cklnPx5jre4t8JO5Pqpx+ej9aRHLN
	 NpPWsHrFvZK/YnpCJdAcsJeVqhDgy+Ri1ycxSm4qBtaxcuMsph/jCVrcDsshkl44Gy
	 +hBfOkMhIuhYtnrGwBfwjTGS5+91RLTb2kIQ3tQ4=
Message-ID: <bbbc33a1-cfd6-4cac-82c0-253888ca933a@arm.com>
Date: Thu, 3 Sep 2026 19:22:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tools: linux/types.h: Add 128-bit integer types
 for arm64 UAPI structures
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 David Matlack <dmatlack@google.com>, stable <stable@vger.kernel.org>
References: <20260626141730.5976-1-will@kernel.org>
 <20260626141730.5976-2-will@kernel.org>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20260626141730.5976-2-will@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_172240_359940_4849CE0A 
X-CRM114-Status: GOOD (  16.36  )
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

Hi,

Please consider this for all supported stable/LTS kernels.

Without this commit, older kernel trees will fail to build tools on 
systems running newer kernel headers.

Upstream commit:

10a47fb67340 ("tools: linux/types.h: Add 128-bit integer types for arm64 
UAPI structures")

Thanks,

Cc: stable@vger.kernel.org


On 6/26/26 9:17 AM, Will Deacon wrote:
> The arm64 UAPI exposes some 128-bit integer types to represent things
> such as fpsimd registers in the sigcontext. In preparation for defining
> these using the '__u128' typedef implemented by uapi/linux/types.h, copy
> that typedef over to the private linux/types.h header used by the tools
> directory.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
> Cc: David Matlack <dmatlack@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>   tools/include/linux/types.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tools/include/linux/types.h b/tools/include/linux/types.h
> index d41f8a261bce..b6c473b7920d 100644
> --- a/tools/include/linux/types.h
> +++ b/tools/include/linux/types.h
> @@ -23,6 +23,11 @@ typedef enum {
>   	__GFP_HIGH
>   } gfp_t;
>   
> +#ifdef __SIZEOF_INT128__
> +typedef __signed__ __int128 __s128 __attribute__((aligned(16)));
> +typedef unsigned __int128 __u128 __attribute__((aligned(16)));
> +#endif
> +
>   /*
>    * We define u64 as uint64_t for every architecture
>    * so that we can print it with "%"PRIx64 without getting warnings.


