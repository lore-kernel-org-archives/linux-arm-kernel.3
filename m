Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D88E909D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 16:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCwMruxlpjec1xfWAL85VuiIFN2j5Ld4KHWlaGonawQ=; b=nRUUeKKj0JA8H4GUp9Rix5AhvA
	othFgvAyD2bCfkjySCMQ2KnI0h48QfV2bsd9KDk4Tfr6rgfegbEAHx7LIG+EvxZQY0crSVcuxlkHz
	wnz8SEDUVpD7itAQO+uFs2S6FBXclxNRGHVUOJMDYsF+Jvt36knqR+10HR1G+cUdOh4D63KNr3t4Q
	WuCuZSr/JecDcyK4bsOxr83yy7/kqwaYgeowcodJx1ZD2HwaOB645vbWeoT0kEiDyAVPO1/M8MtBB
	trksfqxzR9pP1onbdh4/ithK6Eh4clSTr/5XLwBvLA9oeg4/3B+67u+YdeWj2Bj7XKy8cAysP2fuo
	/gsmF+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOO1-00000008bdv-2ERF;
	Tue, 17 Feb 2026 16:57:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsONt-00000008bce-47Jz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 16:57:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B9C91477;
	Tue, 17 Feb 2026 08:57:06 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E3853F62B;
	Tue, 17 Feb 2026 08:57:11 -0800 (PST)
Date: Tue, 17 Feb 2026 16:57:08 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: insn: drop NOP from steppable hint list
Message-ID: <aZSd5O0gdGM9dUkR@J2N7QTR9R3.cambridge.arm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
 <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
 <20260217133855.3142192-3-khaja.khaji@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217133855.3142192-3-khaja.khaji@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_085715_334048_8B62B4DB 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: catalin.marinas@arm.com, dev.jain@arm.com, linux-kernel@vger.kernel.org, yang@os.amperecomputing.com, linux-arm-msm@vger.kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org, mhiramat@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Feb 17, 2026 at 07:08:55PM +0530, Khaja Hussain Shaik Khaji wrote:
> NOP is already handled via instruction emulation and does not require
> single-stepping. Drop it from aarch64_insn_is_steppable_hint().
> 
> Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
> ---
>  arch/arm64/include/asm/insn.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index e1d30ba99d01..9429f76906e0 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -456,7 +456,6 @@ static __always_inline bool aarch64_insn_is_steppable_hint(u32 insn)
>  	case AARCH64_INSN_HINT_BTIC:
>  	case AARCH64_INSN_HINT_BTIJ:
>  	case AARCH64_INSN_HINT_BTIJC:
> -	case AARCH64_INSN_HINT_NOP:
>  		return true;
>  	default:
>  		return false;

The intent is that aarch64_insn_is_steppable_hint() says whether an
instruction is safe to step, not whether it *must* be stepped. I think
we can leave NOP here unless this is causing some functional problem?

Mark.

