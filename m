Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBB0D5B871
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dyQIGswOKbsgnVwgu5ftO7OW53QMFBD2De7rwb0CbQ=; b=dWD4OVYDDVuu7xhh5lpzfdwZeo
	xaJTG4xauHO/X2yVOykh1Eiwg9jb6tCz9jppnEMJzlzysSOGj1CELMOlUuHj2enAWdPxDYmKlMgdY
	SkhEMd25Pb5bEDTqnT/yagnZjyNZMkDw8X/DmHL5A2l9DDIQCX4dtfquYvt2GWD9F4P1SARP8Nyuy
	nAVHOaF6FdvNguYY+ITol+Od3pN9fpw23+1cGmaL1L9FyMVoHRCqGu5odSV2PPelTHLmTTYuRnLDk
	xk7Jyz4DX8alUce8fuJ7lKBrlZlDpHLik/NCntuzue/ukn3LzsW+R0FtDFFPHrmScgE7HkWfzF8Z5
	bvu5Z9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGL4-00000004JfK-379O;
	Mon, 15 Dec 2025 21:42:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGL1-00000004Jet-18qV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:42:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C55FFEC;
	Mon, 15 Dec 2025 13:42:29 -0800 (PST)
Received: from [10.57.78.22] (unknown [10.57.78.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97E3D3F73B;
	Mon, 15 Dec 2025 13:42:34 -0800 (PST)
Message-ID: <f080bfaf-9946-42ee-98c4-b31badc65621@arm.com>
Date: Mon, 15 Dec 2025 21:42:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 01/35] arm64/sysreg: Add new SPE fields
Content-Language: en-GB
To: Alexandru Elisei <alexandru.elisei@arm.com>, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, yuzenghui@huawei.com,
 will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: james.clark@linaro.org, mark.rutland@arm.com, james.morse@arm.com
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-2-alexandru.elisei@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251114160717.163230-2-alexandru.elisei@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_134239_385246_813ABB7C 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

On 14/11/2025 16:06, Alexandru Elisei wrote:
> Add the PMBSR_EL1.MSS2, PMBISR_EL1.MaxBuffSize, PMBLIMITR_EL1.nVM and

minor nit:                ^PMBIDR_EL1

> PMBIDR_EL1.AddrMode fields, which will be used by KVM.
> 

The defintions look correct to me.

Suzuki


> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>   arch/arm64/tools/sysreg | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 1c6cdf9d54bb..1e7b69594f04 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3070,7 +3070,9 @@ EndSysreg
>   
>   Sysreg	PMBLIMITR_EL1	3	0	9	10	0
>   Field	63:12	LIMIT
> -Res0	11:6
> +Res0	11:8
> +Field	7	nVM
> +Res0	6
>   Field	5	PMFZ
>   Res0	4:3
>   Enum	2:1	FM
> @@ -3085,7 +3087,8 @@ Field	63:0	PTR
>   EndSysreg
>   
>   Sysreg	PMBSR_EL1	3	0	9	10	3
> -Res0	63:32
> +Res0	63:56
> +Field	55:32	MSS2
>   Enum	31:26	EC
>   	0b000000	BUF
>   	0b100100	FAULT_S1
> @@ -3112,13 +3115,20 @@ Field	7:0	Attr
>   EndSysreg
>   
>   Sysreg	PMBIDR_EL1	3	0	9	10	7
> -Res0	63:12
> +Res0	63:48
> +Field	47:32	MaxBuffSize
> +Res0	31:12
>   Enum	11:8	EA
>   	0b0000	NotDescribed
>   	0b0001	Ignored
>   	0b0010	SError
>   EndEnum
> -Res0	7:6
> +Enum	7:6	AddrMode
> +	0b00	VM_ONLY
> +	0b01	BOTH
> +	0b10	RESERVED
> +	0b11	nVM_ONLY
> +EndEnum
>   Field	5	F
>   Field	4	P
>   Field	3:0	ALIGN


