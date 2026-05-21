Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADC1CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmI8dqfwbVa2sCs5QMum2ZGRY4QfY/CkieqaiRErmL4=; b=CJhFXBfdRc6w3Zq47K7RkctIZN
	sYsqfd+KqbLYqYJWMrlOyzXVgE74n+2f2IkyzHFLhPaNB6jpYYpZ3E2RFBDrXaLzxTFXIojoK1+Ou
	eTHJaSnQSPjeEWo4jhnZ63uR9lVT2GOst4GI/QXFLVkb3e0SQw4wLQRlKBALXJT2Q/aEkoOOupFmP
	sblFthn1EiWblOpjI7nWCbDbqhCiJGZD/ivUI5S62kSqvGmq5MtIyR0+DkbMYBYG5JunF8J4CXy7g
	dQXhkGPFznmjh9g29uLTI6aG48jkWYXcONe8uskkp/6lzU5PfAqGoK7VJtl5/2oFhCbh/CvjaHfvY
	8pU8/Sjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ00r-00000007Mdr-0Wmy;
	Thu, 21 May 2026 09:48:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ00p-00000007Md7-15t1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:48:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 957023D4B;
	Thu, 21 May 2026 02:48:11 -0700 (PDT)
Received: from [10.57.91.210] (unknown [10.57.91.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D39CF3F7B4;
	Thu, 21 May 2026 02:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779356896; bh=I1igY6byiAjI8Q/ivTGS1HbZflb65Cl/d4J5xRl+oT8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X9/CfiHaz/oFMO8092Kn48SADgX8OE0FaBuUJbJ8BdPRjgX6dRyAWagamrJ+5YL+/
	 rJLFUkcfC5++AdiNLlSnMqG0fUqWKITHrnW/2GUtb1JZOG9F0c3mhfNNhnj9qF1sei
	 k65gIEKSOHJcGS6598z+nLHikHac7AOsF2xJ8CGY=
Message-ID: <92d46358-e347-4fd6-bf20-19927fb5dad7@arm.com>
Date: Thu, 21 May 2026 11:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: mm: Add note about overlays in PIE_EL1
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly
 <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
 <20260521-poe_futex-v1-1-1da286b8f9b2@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260521-poe_futex-v1-1-1da286b8f9b2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024819_347536_507CBE0D 
X-CRM114-Status: GOOD (  15.11  )
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

On 21/05/2026 11:42, Kevin Brodsky wrote:
> It isn't completely obvious why user page types do not have overlays
> applied in PIE_EL1. Add a comment to that effect, to avoid
> unpleasant surprises in the future.

Should probably s/PIE_EL1/PIR_EL1/ in this whole patch.

I'm also tempted to rename PIE_E* to PIR_E* to avoid anyone else's brain
being confused like mine... The extension is called PIE, but this is
really about the register configuration, i.e. PIR.

- Kevin

> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable-prot.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index 212ce1b02e15..6e2f99820909 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -175,6 +175,13 @@ static inline bool __pure lpa2_is_enabled(void)
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY),      PIE_R_O)   | \
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED),        PIE_RW_O))
>  
> +/*
> + * Regular user page types such as _PAGE_SHARED must not have overlays applied
> + * in PIE_EL1. If POE is enabled at EL1, and in the absence of FEAT_LSUI, this
> + * would break futex atomic operations on user memory with a non-default
> + * POIndex; the privileged atomic load/store instructions would be mistakenly
> + * checked against POR_EL1.
> + */
>  #define PIE_E1	( \
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \
>

