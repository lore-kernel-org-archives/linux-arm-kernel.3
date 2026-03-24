Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC4AF532DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 06:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xY/iX3X4dbe9FDFeE6twyShfCC7N3zPgZo9Ph84ske0=; b=Cd6vSKDIBhuEC+eN99HEmr1DrP
	+8B7IM2EUzgFR+tYko8Jkn1G2ejJUdukpUmpHbX3XHhExXD8S9GRJXUAN+wprGv1cDG9KIWUxxQFC
	B+KLxdJiKEPp+yRSJlE1FaEw8wZgoQ3i0nT9bUCizaTQxar5DmjOxIJZTPXSO6BOyVi8zfPp/GjFx
	/rkiCLVHMxZvdg7VCF8sFkDoptBfDl8l+7H2SzNUNrgSA+PMGU/c2m1KrtdH9MbSXr23yRRHb+lYh
	jBDaqHkg2B3gJJbbfhwG1uqq33+EPhXIIutYUDnpi+TWk4+6/r4sgQwX0ajv8sn6Y+u2bNh2AOM28
	1fIdmVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uva-00000000dNZ-0w0F;
	Tue, 24 Mar 2026 06:07:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvY-00000000dLh-3CY1;
	Tue, 24 Mar 2026 06:07:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19FFF60154;
	Tue, 24 Mar 2026 06:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F80C2BCB2;
	Tue, 24 Mar 2026 06:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332463;
	bh=qbtmamIzBSBJ7lpyvZvoyrHXaqJIdPVwSL2Ans8iygw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T25GCUMXCJbgJNXbwA+0n5tbTiAl//E0VrJFT0gZialhbokB2EymjYWj2mUVvpoe7
	 4X/cQehNhSFYLbgNYGso68/1gnjInlilS5gkzOuRhP6R3A2ZY5OwYE2S8nKgoJ3mKi
	 iaHaHXNV/rXqHya6c2TBvMpULR87MOI5IqKk7aj1W8mm9l6Uj3B3tb+zEbZpqFQjAr
	 mIZxnNXG1oFfR3uvT0+JZ7Mem7/qpcZdGy9+5M0ntGFakAS6wazJnm4EKpONIs2ywJ
	 Hm3HSib9PW2HT7scszTKUWJbqYweow2uJz50p71WaqwxkHAlQfjsTabaoEUPv/vvsh
	 nmMEt0uJDwm1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2EEB63808200;
	Tue, 24 Mar 2026 06:07:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [Patch v3 0/4] Perf tools: perf-regs bug fix and optimization
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433245177.469836.2784785880641063798.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:31 +0000
References: <20260203024356.444942-1-dapeng1.mi@linux.intel.com>
In-Reply-To: <20260203024356.444942-1-dapeng1.mi@linux.intel.com>
To: Mi@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Dapeng <dapeng1.mi@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, alexander.shishkin@linux.intel.com,
 john.g.garry@oracle.com, will@kernel.org, james.clark@linaro.org,
 mike.leach@linaro.org, guoren@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, zide.chen@intel.com, thomas.falcon@intel.com,
 dapeng1.mi@intel.com, xudong.hao@intel.com
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Arnaldo Carvalho de Melo <acme@redhat.com>:

On Tue,  3 Feb 2026 10:43:52 +0800 you wrote:
> Changes:
>  v2 -> v3:
>   * Fix the abort issue for "-I" or "--user-regs" options. (Patch 1/4)
>   * Address Ian's comments.
> 
>  v1 -> v2:
>   * Fixing "PERF_REG_EXTENDED_MASK" redefinition building error by
>     changing the "asm/perf_regs.h" header path to relative UAPI path.
>     (Patch 1/3)
>   * Spliting xxx_reg_mask() and xxx_sdt_arg_parse_op() conversion into 2
>     patches.
> 
> [...]

Here is the summary with links:
  - [v3,1/4] perf regs: Fix abort for "-I" or "--user-regs" options
    https://git.kernel.org/riscv/c/c2e28ae2946f
  - [v3,2/4] perf arch: Update arch headers to use relative UAPI paths
    https://git.kernel.org/riscv/c/e716e69cf67b
  - [v3,3/4] perf regs: Remove __weak attributive arch__xxx_reg_mask() functions
    (no matching commit)
  - [v3,4/4] perf regs: Remove __weak attributive arch_sdt_arg_parse_op() function
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



