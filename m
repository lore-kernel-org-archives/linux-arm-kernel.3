Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4862EF532DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 06:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaWeCDl5JBHtBxHsYaW0gafbKodlagSCHpiXEMVywus=; b=apOUE7crcVc4+dLSKfM9vs6+QK
	X0ASpFzZ98tvMhRZ8+xPRmNSHpCzpGW5fEvr09Thg6jAvoa3ODIS8MS+Oa9ZdpcW29ocoTnu7nPxS
	AgXwxZtdiUsg6LLqjACkfxFhD2ZYsAj1mThuY03CZkpI0y9EFI5Fx+7C4RopTrF/dYNiIrrO9Fbpy
	ek4IgFAdV4IYhvpJZqVaHKFQiTGoIZQDFjmtcT0hi+Ff3/Ww2a0sUEPnGg/Oo1N1n1IwWnNTX3R8G
	hEcxz+1M/qNXwa4dZVDvkU9G9411bhu10/T98UytNzN9SeiDAkr9/CqO+UFqvl/yKp0Qz8L+bzX5B
	kWNoLHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvS-00000000dGv-0vhs;
	Tue, 24 Mar 2026 06:07:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvR-00000000dGk-1FXN;
	Tue, 24 Mar 2026 06:07:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0E8560128;
	Tue, 24 Mar 2026 06:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98825C19424;
	Tue, 24 Mar 2026 06:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332455;
	bh=GxPGKG/6w8349y5HsiaeOu43dZr4SR2srv5wsN2Tv+4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c+DnWlXQvKGtO+8n/KZE5Zo2Ki19YvlnyKUQA9d/7tCrzTSDAD2PmimVz0/RTZ4LI
	 CM1cK/b7eKlrVfPSG2TYd+B7eG3XAD7gsbF2I+fLnS1HTy5k+TWfV7Iyc3J4H5ieM7
	 jZnZ9664OYwnqg5dZu3S724CJxFOzRlida7evmb+jmkd7oLQDdf+0rMT2sbCOhYTaM
	 UXR9GQmBdlrdJPqb0ISIZhg11RvHQbMoyoCVBgVE5wZwF4gMVcxxG/3LrodL24GEZk
	 8gKWh9pxg8JnPMo6nwNhOIfTH3GYAaHx/u1s4j/62u0/9WOjOjzAdO27WFhVla0/Pv
	 nTcigVyeQF74A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id E73C03808200;
	Tue, 24 Mar 2026 06:07:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 1/5] perf kvm stat: Remove use of the arch directory
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433244380.469836.9953865947941993562.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:23 +0000
References: <20260203182640.3911987-2-irogers@google.com>
In-Reply-To: <20260203182640.3911987-2-irogers@google.com>
To: Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, acme@kernel.org, aditya.b1@linux.ibm.com,
 adrian.hunter@intel.com, ajones@ventanamicro.com, ak@linux.intel.com,
 alex@ghiti.fr, alexander.shishkin@linux.intel.com, anup@brainfault.org,
 aou@eecs.berkeley.edu, ashelat@redhat.com, atrajeev@linux.ibm.com,
 blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com,
 dvyukov@google.com, howardchu95@gmail.com, james.clark@linaro.org,
 john.g.garry@oracle.com, jolsa@kernel.org, leo.yan@linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mingo@redhat.com, namhyung@kernel.org,
 palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org,
 shimin.guo@skydio.com, swapnil.sapkal@amd.com, thomas.falcon@intel.com,
 will@kernel.org, ysk@kzalloc.com, zhouquan@iscas.ac.cn
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

On Tue,  3 Feb 2026 10:26:36 -0800 you wrote:
> `perf kvm stat` supports record and report options. By using the arch
> directory a report for a different machine type cannot be
> supported. Move the kvm-stat code out of the arch directory and into
> util/kvm-stat-arch following the pattern of perf-regs and
> dwarf-regs. Avoid duplicate symbols by renaming functions to have the
> architecture name within them. For global variables, wrap them in an
> architecture specific function. Selecting the architecture to use with
> `perf kvm stat` is selected by EM_HOST, ie no different than before
> the change. Later the ELF machine can be determined from the session
> or a header feature (ie EM_HOST at the time of the record).
> 
> [...]

Here is the summary with links:
  - [v3,1/5] perf kvm stat: Remove use of the arch directory
    https://git.kernel.org/riscv/c/ceea279f9376
  - [v3,2/5] perf kvm: Wire up e_machine
    https://git.kernel.org/riscv/c/43af54843677
  - [v3,3/5] perf session: Add e_flags to the e_machine helper
    https://git.kernel.org/riscv/c/07ad6f31b674
  - [v3,4/5] perf header: Add e_machine/e_flags to the header
    https://git.kernel.org/riscv/c/c4f4392264b4
  - [v3,5/5] perf thread: Don't require machine to compute the e_machine
    https://git.kernel.org/riscv/c/84cb36da8141

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



