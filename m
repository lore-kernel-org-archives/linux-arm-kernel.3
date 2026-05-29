Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4171CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACwquFOLw/0jKm4fKqth53Ztrx1fpIWYUQOFT1jyt3E=; b=4ksSJ5c0dScfwmAjqBTJK3HQdv
	j846MudlzaQE5oJzBgeyVaxjbVqxDU0Hl+4dcfKl5jzfU9kxJ7bhi6c2H7OFvejMmKY5jcTGdl+yh
	dRE9g6migModDI7i9Q2kqpOYRTQWy7AB2k8txIBLlRA7/MobuQkDXDK/puUpc+cZOPMHm0bFFoVCM
	QYigxOu9kPu5tUAg3pW34tORmnINSO6lb6R0rn+g9qfWJyowCa6Giqrd6pUG+YXEyf+imRcOKnLiq
	m5noi7fph3Jl67Qd0F7PQUIAgGxxACKXp35ebuCsBhtNkWkc2alSp5oVgnG0cH6KxQ7nsz2gaNMwx
	uZU5RscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsnU-00000006yIe-4944;
	Fri, 29 May 2026 08:42:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsnS-00000006yI8-17lQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:42:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A376E204C;
	Fri, 29 May 2026 01:42:19 -0700 (PDT)
Received: from [10.1.26.144] (unknown [10.1.26.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93BE83F632;
	Fri, 29 May 2026 01:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780044144; bh=AqR1rgWXEAXIlDqc3S6o5bYfI/ctZcgtp61gxbnNDAM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jUImnIYEBKOSJQYKz4x0DaqpeEuJ9Qr9MWkEiUoVlXISyZLeGWboNtVdv107aJtWp
	 LTyx6SzO+LnBvYKDBDg5u7ci/lQi63GA/SoHgDZKce8rCceTGyyTdJOSk8z1q/gpvo
	 PF/Je2bUH9nlgCJs8wQ8XuDc3jDe3tRwN2v5IAtA=
Message-ID: <b097ee0f-e517-47e3-9bfc-167f72e177a3@arm.com>
Date: Fri, 29 May 2026 09:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/18] arm64: sysreg: Add FPCR and FPSR
To: Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
 maz@kernel.org, oupton@kernel.org, tabba@google.com, will@kernel.org
References: <20260528165446.701944-1-mark.rutland@arm.com>
 <20260528165446.701944-11-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260528165446.701944-11-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014226_351697_B5D711FF 
X-CRM114-Status: GOOD (  15.04  )
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

On 5/28/26 17:54, Mark Rutland wrote:
> Add sysreg definitions for FPCR and FPSR.
> 
> Some versions of LLVM will refuse to assemble accesses to FPCR and FPSR
> unless the "fp" arch extension is enabled, which we don't currently do
> for read_sysreg() and write_sysreg(). In general, handling feature
> dependencies would complicate read_sysreg() and write_sysreg(), and it's
> simpler to use read_sysreg_s() and write_sysreg_s() instead, requiring
> sysreg definitions.
> 
> The values used can be found in ARM ARM issue M.b:
> 
>   https://developer.arm.com/documentation/ddi0487/mb/
> 
> ... in sections:
> 
> * C5.2.8 ("FPCR, Floating-point Control Register")
> * C5.2.10 ("FPSR, Floating-point Status Register")
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/tools/sysreg | 45 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 6c3ff14e561e6..8b219d6566608 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3790,6 +3790,51 @@ Field	1	ZA
>  Field	0	SM
>  EndSysreg
>  
> +Sysreg	FPCR	3	3	4	4	0
> +Res0	63:27
> +Field	26	AHP
> +Field	25	DN
> +Field	24	FZ
> +Enum	23:22	RMode
> +	0b00	RN
> +	0b01	RP
> +	0b10	RM
> +	0b11	RZ
> +EndEnum
> +Field	21:20	Stride
> +Field	19	FZ16
> +Field	18:16	Len
> +Field	15	IDE
> +Res0	14
> +Field	13	EBF
> +Field	12	IXE
> +Field	11	UFE
> +Field	10	OFE
> +Field	9	DZE
> +Field	8	IOE
> +Res0	7:3
> +Field	2	NEP
> +Field	1	AH
> +Field	0	FIZ
> +EndSysreg
> +
> +Sysreg	FPSR	3	3	4	4	1
> +Res0	63:32
> +Field	31	N
> +Field	30	Z
> +Field	29	C
> +Field	28	V
> +Field	27	QC
> +Res0	26:8
> +Field	7	IDC
> +Res0	6:5
> +Field	4	IXC
> +Field	3	UFC
> +Field	2	OFC
> +Field	1	DZC
> +Field	0	IOC
> +EndSysreg
> +
>  Sysreg	FPMR	3	3	4	4	2
>  Res0	63:38
>  Field	37:32	LSCALE2
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


