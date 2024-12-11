Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231A0E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 22:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VVwQMuijOjziCXZZKAW4cvD2IGvlh9RbjZUlmERjXw=; b=fxZVEEmCMB0T/tJPpkiOJE4u6F
	vpo6Bly55cn6DvNYhlc5BGe2SyaRS9/f6D0gbd8ZpgURhC0M3Wv60Y3PTtRQvlIeZz9O55oAFS08N
	vuoxf5hGp7w/7Eypwp+Tr3gdakOHDm9LTNkQvDh3UaJEt7yI5IGxyBpbzOx8yc7zrRPbi/WiNpeER
	EHgvkPshTPLMdKctBku2c3ohpcOlnqCGcWwfyxTu58h+ycyoQj0nbliRXKACOE+UmO26NBN1XQout
	sBu7OsihAaqGnBnyCTaq6/C6SCw/f0DsyxPGJdsbNO/ZkUDvA5/qvxwJidXPD/AlQ+KuwHeOx4tnO
	WuKDq5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGn-0000000GL8T-06Ow;
	Wed, 11 Dec 2024 22:33:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFg-0000000GKIH-01Mw;
	Wed, 11 Dec 2024 22:32:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5B6C4A41D7E;
	Wed, 11 Dec 2024 22:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AA3C4CED2;
	Wed, 11 Dec 2024 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956334;
	bh=H8GLjR52AOObBuTGRF97jUFOPtYaGcj14R3/x3FDoxo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lmF1fS0zHS+wP2mJFmAvBAT0uY006ohKN/qRAdUT3w17Jl2nhVTsKlFEbNZip+aER
	 BFU//jH27hu2mcsj5VlcxQDRcusC9jwZB8GxY+Ncjs8mHLjLTwEa+u2pQKz98uvCz+
	 +V1ILKanbZ1h3ZH6t0mNGKaaur3anEyK7cjG0EBkcx3F+AKPNgPg3nwMBQwPZ3DyF3
	 2yQ0/Vcs0ov6Kjt3XXx3hjacpMOZhtkv4Y8Sy+WwwcD543RecaQKzzZkHd2aiEhf75
	 blJ0BtUiDFW8KFswUcm8yNqx+6Wm8xXzQSxIsusD7Iv2m38B0ghf1VD0zOG4FJtAvU
	 o144tp4L+hcIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD74380A965;
	Wed, 11 Dec 2024 22:32:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 00/20] Remove PERF_HAVE_DWARF_REGS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395635051.1729195.13191557882673334015.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:30 +0000
References: <20241108234606.429459-1-irogers@google.com>
In-Reply-To: <20241108234606.429459-1-irogers@google.com>
To: Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, kan.liang@linux.intel.com, john.g.garry@oracle.com,
 will@kernel.org, james.clark@linaro.org, mike.leach@linaro.org,
 leo.yan@linux.dev, guoren@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, terrelln@fb.com,
 mhiramat@kernel.org, changbin.du@huawei.com, amadio@gentoo.org,
 yangjihong@bytedance.com, adityag@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 masahiroy@kernel.org, maobibo@loongson.cn, chenhuacai@kernel.org,
 kjain@linux.ibm.com, atishp@rivosinc.com, liangshenlin@eswincomputing.com,
 anup@brainfault.org, oliver.upton@linux.dev, sesse@google.com,
 linux@treblig.org, cp0613@linux.alibaba.com, dima@secretsauce.net,
 przemyslaw.kitszel@intel.com, davem@davemloft.net,
 aleksander.lobakin@intel.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143216_182044_6E7B50A9 
X-CRM114-Status: UNSURE (   8.62  )
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Namhyung Kim <namhyung@kernel.org>:

On Fri,  8 Nov 2024 15:45:45 -0800 you wrote:
> These changes were originally on top of:
> https://lore.kernel.org/lkml/20241017001354.56973-1-irogers@google.com/
> 
> Prior to these patches PERF_HAVE_DWARF_REGS indicated the presence of
> dwarf-regs.c in the arch directory. dwarf-regs.c provided upto 4
> functions:
> 
> [...]

Here is the summary with links:
  - [v4,01/20] perf bpf-prologue: Remove unused file
    https://git.kernel.org/riscv/c/2bf7692eadc5
  - [v4,02/20] perf dwarf-regs: Remove PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
    https://git.kernel.org/riscv/c/6ac75289b288
  - [v4,03/20] perf dwarf-regs: Add EM_HOST and EF_HOST defines
    https://git.kernel.org/riscv/c/ae894b77923e
  - [v4,04/20] perf disasm: Add e_machine/e_flags to struct arch
    https://git.kernel.org/riscv/c/cd6c9dca9d4b
  - [v4,05/20] perf dwarf-regs: Pass accurate disassembly machine to get_dwarf_regnum
    https://git.kernel.org/riscv/c/9fc4489a16f4
  - [v4,06/20] perf dwarf-regs: Pass ELF flags to get_dwarf_regstr
    https://git.kernel.org/riscv/c/a784847c2da1
  - [v4,07/20] perf dwarf-regs: Move x86 dwarf-regs out of arch
    https://git.kernel.org/riscv/c/bf4e799a0a33
  - [v4,08/20] perf arm64: Remove dwarf-regs.c
    https://git.kernel.org/riscv/c/6f8e8add5a0a
  - [v4,09/20] perf arm: Remove dwarf-regs.c
    https://git.kernel.org/riscv/c/0c0a20ecdf67
  - [v4,10/20] perf dwarf-regs: Move csky dwarf-regs out of arch
    https://git.kernel.org/riscv/c/d4a0c4f22121
  - [v4,11/20] perf loongarch: Remove dwarf-regs.c
    https://git.kernel.org/riscv/c/1d37bd8366d8
  - [v4,12/20] perf mips: Remove dwarf-regs.c
    https://git.kernel.org/riscv/c/8a768a2f6592
  - [v4,13/20] perf dwarf-regs: Move powerpc dwarf-regs out of arch
    https://git.kernel.org/riscv/c/285b523c2da2
  - [v4,14/20] perf riscv: Remove dwarf-regs.c and add dwarf-regs-table.h
    https://git.kernel.org/riscv/c/a90c4519186d
  - [v4,15/20] perf s390: Remove dwarf-regs.c
    https://git.kernel.org/riscv/c/b232b704a781
  - [v4,16/20] perf sh: Remove dwarf-regs.c
    https://git.kernel.org/riscv/c/04150f29e212
  - [v4,17/20] perf sparc: Remove dwarf-regs.c
    https://git.kernel.org/riscv/c/85567a2a8d42
  - [v4,18/20] perf xtensa: Remove dwarf-regs.c
    https://git.kernel.org/riscv/c/a4747c09507d
  - [v4,19/20] perf dwarf-regs: Remove get_arch_regstr code
    https://git.kernel.org/riscv/c/3ef6b89a129a
  - [v4,20/20] perf build: Remove PERF_HAVE_DWARF_REGS
    https://git.kernel.org/riscv/c/ddbfb6f20c1b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



