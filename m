Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7FEE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvQtbSsuf4cyUl5HvKiz6fhbwwd7A/7LU8qzOzgTbu4=; b=RD2s90kOZnPXKa/k5de1TtZ8SO
	k3R6+T2xxyZB63aCu6AbdsjCA+M2AMLraqnebMcK+Uwu9mK58+dJpsPz6JTl5NCxhQkW45b17at1/
	LW1ZpYlq+LyszbZAw/4+I99yj6fWD8QcwdEBBROY4yDmEjL4HmRa+bjWSkKwnIiL2pq+8RD0Anyg0
	coS6nsXgj0iFNO1gelVYBEoePkBWl5Io3ZSv7vbC7LNByQaqW3K7AFpdXyctm3BYDxgDupp+xMeho
	rVmD0x2nWiPcFiDv6HwSJdgbxQar3OP6p9Qil6zlWnKwj2gv7LDXjIGcsdqmLhBh1HSDqQ+jyicTR
	Ru98mRyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOV-0000000GWa6-2dhr;
	Wed, 11 Dec 2024 23:45:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFy-0000000GKWy-0NYx;
	Wed, 11 Dec 2024 22:32:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F3C85C67F1;
	Wed, 11 Dec 2024 22:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D537C4CED2;
	Wed, 11 Dec 2024 22:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956353;
	bh=RRuLfKZeC8+vc2RY1vIgr2/93ygrFKjc9DELDSjP76w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cdV8cioAnhLMhQZutiHWY+WBHtcIFtIO7iItL4IlV2Bzx7Yz/2CAAoAyrasboVtnp
	 xh4aWdm0kZuPQSolZrnbAUGw58tQb9l0Y6cZv6qcNqH8mEbq27Z0Hj5HfIMVysNzfG
	 bt2GP1vrfXVtkoYpM3nXRqlvBz9JAVp3o9t7nLPrNR/hywSHGgtYtz49Ec8FaDxkXM
	 Sga9jYw2unkD8pN1JCnG8Za6O16kvgH+Xjjav4mmvgMOyS48Nr/1w81nw8RgHTtPDy
	 oqPIBVAWpJujhC6gFG/yhxP5XJsGd/+zZ39jvKK7QfWZLenlfexA1w3IMUz2AUcXE8
	 4fEPvRXqWfT2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D41380A965;
	Wed, 11 Dec 2024 22:32:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/8] Refactor cpuid and metric table lookup code
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395636900.1729195.10506266683827384224.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:49 +0000
References: <20241107162035.52206-1-irogers@google.com>
In-Reply-To: <20241107162035.52206-1-irogers@google.com>
To: Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, john.g.garry@oracle.com, will@kernel.org,
 james.clark@linaro.org, mike.leach@linaro.org, leo.yan@linux.dev,
 peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, kan.liang@linux.intel.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, chenhuacai@kernel.org,
 maobibo@loongson.cn, atrajeev@linux.vnet.ibm.com, ben717@andestech.com,
 alexghiti@rivosinc.com, sandipan.das@amd.com, bgray@linux.ibm.com,
 xu.yang_2@nxp.com, ravi.bangoria@amd.com, clement.legoffic@foss.st.com,
 yangyicong@hisilicon.com, mhiramat@kernel.org, dima@secretsauce.net,
 linux@treblig.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143234_209761_2367370B 
X-CRM114-Status: GOOD (  12.11  )
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

This series was applied to riscv/linux.git (fixes)
by Arnaldo Carvalho de Melo <acme@redhat.com>:

On Thu,  7 Nov 2024 08:20:27 -0800 you wrote:
> Xu Yang <xu.yang_2@nxp.com> reported issues with the system metric
> lookup:
> https://lore.kernel.org/linux-perf-users/20241106085441.3945502-1-xu.yang_2@nxp.com/
> These patches remove a lot of the logic relating CPUIDs to PMUs so
> that the PMU isn't part of the question when finding a metric table.
> For time reasons, it doesn't go as far as allowing system metrics
> without a metric table as a metric table is needed for metrics to
> refer to other metrics, and the refactoring of that resolution is a
> hassle.
> 
> [...]

Here is the summary with links:
  - [v2,1/8] perf jevents: fix breakage when do perf stat on system metric
    https://git.kernel.org/riscv/c/4a159e6049f3
  - [v2,2/8] perf header: Move is_cpu_online to numa bench
    https://git.kernel.org/riscv/c/c6fafe36bab3
  - [v2,3/8] perf header: Refactor get_cpuid to take a CPU for ARM
    https://git.kernel.org/riscv/c/cec0d6572a44
  - [v2,4/8] perf arm64 header: Use cpu argument in get_cpuid
    https://git.kernel.org/riscv/c/538737da9625
  - [v2,5/8] perf header: Avoid transitive PMU includes
    https://git.kernel.org/riscv/c/7463ee17a740
  - [v2,6/8] perf header: Pass a perf_cpu rather than a PMU to get_cpuid_str
    https://git.kernel.org/riscv/c/494c403ff159
  - [v2,7/8] perf jevents: Add map_for_cpu
    https://git.kernel.org/riscv/c/0434410fa45c
  - [v2,8/8] perf pmu: Move pmu_metrics_table__find and remove ARM override
    https://git.kernel.org/riscv/c/8f997865ee9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



