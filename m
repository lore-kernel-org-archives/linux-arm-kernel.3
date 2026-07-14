Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DAEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omsZoMDSFlK21W/kFzfRTsjHGU/KSp26P3Yjq95JwaU=; b=TuZahUig6URiHm
	TmerH6DBcKUzFsSBjTM40wmKpuNs0luJsUtVXEudvCoI8xVGfO7tmszLt9c7NFQMIbNiV/y5oCMZp
	B0/qbaVWVvMQ6/uFcPs/fYKuNTTQGarPTWW2VTMieetGX2Qj3H4Zkrs6H0ZNJYlhhgK/X2nMmwSk0
	PRhiXUX40VVbmIYhV2ZVp8JUIP8SuOlj1BmrfDbtgCEg0wnzlUpJfmESLTqbHZ19rIy76XIBLEeHE
	+3AFiciBiMsAkhc6JwdeVaBeaGbOksWOgdp4mGLaoiudEZVh11RpR1hEAbOiFRSnFTON/sN7DXPL7
	G3zByyj7Or5mX/GFmUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjatT-0000000BdRQ-1VEW;
	Tue, 14 Jul 2026 11:01:43 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjatP-0000000BdQZ-3CKY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:01:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=omsZoMDSFlK21W/kFzfRTsjHGU/KSp26P3Yjq95JwaU=;
	b=JY1BsHGwOTxLxMCNNrKe9f0cPtuMFYLOU/4/xIOI+jevGejmbk+Wy62dJzR6vuVBVhhELI/CI
	oMv3/5Ovto2ri2AO3YNOb5R2TOU1TEP7JIukNv1xOi/8wT4iMu7V+7Ec5dUr3AS+hl19sz2vlrw
	N+zCrxJKm+iASU96Yxzc4o4=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gzx2g3nb4zLlTK;
	Tue, 14 Jul 2026 18:52:11 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 4F4D140586;
	Tue, 14 Jul 2026 19:01:29 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 19:01:28 +0800
Message-ID: <c74719b5-879f-415f-9ed6-faf921525fe0@huawei.com>
Date: Tue, 14 Jul 2026 19:01:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 25/36] arm64: sysreg: Add definitions for immediate
 versions of MSR ALLINT
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-26-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-26-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_040140_411542_69755569 
X-CRM114-Status: GOOD (  15.45  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Mark Brown <broonie@kernel.org>
> 
> Encodings are provided for ALLINT which allow setting of ALLINT.ALLINT
> using an immediate rather than requiring that a register be loaded with
> the value to write. Since these don't currently fit within the scheme we
> have for sysreg generation add manual encodings like we currently do for
> other similar registers such as SVCR.
> 
> Since it is required that these immediate versions be encoded with xzr
> as the source register, provide asm wrappers which ensure this is the
> case.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/interrupts/common_flags.h | 16 ++++++++++++++++
>  arch/arm64/include/asm/sysreg.h                  |  2 ++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
> index 6ce60d1519e8..72ed6e75d146 100644
> --- a/arch/arm64/include/asm/interrupts/common_flags.h
> +++ b/arch/arm64/include/asm/interrupts/common_flags.h
> @@ -44,6 +44,22 @@ typedef enum arm64_exc_context {
>  	CRITICAL_CONTEXT,
>  } arm64_exc_context_t;
>  
> +
> +#ifdef CONFIG_ARM64_NMI
> +static __always_inline void _allint_clear(void)
> +{
> +	asm volatile(__msr_s(SYS_ALLINT_CLR, "xzr"));
> +}
> +
> +static __always_inline void _allint_set(void)
> +{
> +	asm volatile(__msr_s(SYS_ALLINT_SET, "xzr"));
> +}
> +#else
> +static __always_inline void _allint_clear(void) {}
> +static __always_inline void _allint_set(void) {}
> +#endif /* CONFIG_ARM64_NMI */

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>


> +
>  static __always_inline
>  arm64_exc_hwstate_t __arm64_exc_hwstate_of_process_context(void)
>  {
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 7aa08d59d494..6d2c6bc1b985 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -179,6 +179,8 @@
>   * System registers, organised loosely by encoding but grouped together
>   * where the architected name contains an index. e.g. ID_MMFR<n>_EL1.
>   */
> +#define SYS_ALLINT_CLR			sys_reg(0, 1, 4, 0, 0)
> +#define SYS_ALLINT_SET			sys_reg(0, 1, 4, 1, 0)
>  #define SYS_SVCR_SMSTOP_SM_EL0		sys_reg(0, 3, 4, 2, 3)
>  #define SYS_SVCR_SMSTART_SM_EL0		sys_reg(0, 3, 4, 3, 3)
>  #define SYS_SVCR_SMSTOP_SMZA_EL0	sys_reg(0, 3, 4, 6, 3)


