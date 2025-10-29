Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EF7CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 20:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjWyo6uOfN+xF80KKFI5BtoiaYMueiNClbqh3PY0wpI=; b=09L0y8MncrIfjbXKqx/58kaSoR
	MzJsIiYPjiz23hl2n/Rc8bZ9dVXIP3lfnUGc+Qa24rjv5nqKH6pbyHlc0SDHHJJeXE3Iw+2xe544z
	AArYIBzlq88GOSPEzvDjg1OU/2cxsX723P/jE3Yfneb9oZHtk5iJoOvWpsHKtVER1YhQ3WneLFbD2
	AxL2y3iFfZ/Xm/ncx+HD0971t2VvAUOVm+lktGFZWjJ+rBXM/JZXx+uf0oIToOB1pUlUwX+8yKF0B
	grIZ0nCCrRhtg5qAc4Qew6Bc6ct6C09FmcxBrinkUbvvXDBSBX7OtBBrNWbcMX/FQTJSsQ2+N0Q7P
	Yz7fLUFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vED2t-00000002qH2-47wD;
	Wed, 29 Oct 2025 20:45:27 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vED2q-00000002qFu-3X08
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 20:45:26 +0000
Date: Wed, 29 Oct 2025 13:45:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761770720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hjWyo6uOfN+xF80KKFI5BtoiaYMueiNClbqh3PY0wpI=;
	b=cDUZ9O0J21zXqhP2dHUhcwFujSNAC6y/8SVTyl1TJZ+/KF/5mr+B4mG8uv5x1qwaJyCM8Q
	AqzfI26kFG4jEcgCi+yIaqJVIJZjHHRAxoIQdNPj2Thm/A/q1ZKihK9SVthLU7FvjEhSLD
	ZPooe3pbRgDNnhWhlmRquAimlOyMl9k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Ben Horgan <ben.horgan@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	shuah@kernel.org
Subject: Re: [PATCH 2/3] KVM: arm64: selftests: Remove
 ARM64_FEATURE_FIELD_BITS and its last user
Message-ID: <aQJ8so_oAXfeyxn_@linux.dev>
References: <20251014102108.2442391-1-ben.horgan@arm.com>
 <20251014102108.2442391-3-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014102108.2442391-3-ben.horgan@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_134525_037364_48201D27 
X-CRM114-Status: GOOD (  16.85  )
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

Hi Ben,

On Tue, Oct 14, 2025 at 11:21:07AM +0100, Ben Horgan wrote:
> ARM64_FEATURE_FIELD_BITS is set to 4 but not all ID register fields are 4
> bits. See for instance ID_AA64SMFR0_EL1. The last user of this define,
> ARM64_FEATURE_FIELD_BITS, is the set_id_regs selftest. Its logic assumes
> the fields aren't a single bits; assert that's the case and stop using the
> define. As there are no more users, ARM64_FEATURE_FIELD_BITS is removed.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  arch/arm64/include/asm/sysreg.h                 | 2 --
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 8 ++++++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 6455db1b54fd..d9aa76d08e13 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -1129,8 +1129,6 @@
>  #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
>  #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
>  
> -#define ARM64_FEATURE_FIELD_BITS	4
> -
>  #ifdef __ASSEMBLY__
>  
>  	.macro	mrs_s, rt, sreg

You can send this diff as a separate patch. Selftests actually uses the
definition from tools/arch/arm64/include/asm/sysreg.h, so you'll want to
drop that definition along with the change to set_id_regs.

Thanks,
Oliver

