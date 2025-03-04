Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17120C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szOppPgoHSww+MEV8ZRpzOvJW5CaOVf8uD/jEpBDfcM=; b=PVUpI9Bjj0xNNfj/aVYj7zFe6c
	LCa/2JVLS3zXWqxe99GL8KI8wYJTtC3ebL8QvDFInGvgNusrCxDLQHFr9byr+gwmuhYvOjBjv1T20
	sG1UmVBFvTJey0//PbL7XCZ94EZf2uJlSz9e0N0gjsDk6TjYXXT7kO6K7XWGN70KQ8jOT9GDdrYCu
	a7WDajkjbNw98i5ITmX6I0kh6iv8kRGYE/937RjiYkOGcq4Xdvz08DeptUG3he3aO64cDDd5owOfg
	rbhJl27pEmlwqA+rKEx9xzpS0iiy4DGqwo/EX2PJsuwd6ge6HqLWmFzQV+3JNmJ7zbYIFwCsdcJo5
	JC1gn7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKmH-0000000386L-02Kw;
	Tue, 04 Mar 2025 05:25:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKXd-000000035h3-1wPV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6FA46A4516B;
	Tue,  4 Mar 2025 05:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E757DC4CEE5;
	Tue,  4 Mar 2025 05:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741065004;
	bh=wO5x2dvF229R64tAvyWDQAOJOp4+JsHPcpkIUjPAMAs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nmy2uixtSZBKKKmRXdxlVANrfaYlP8NmJalgl4qyFuxZWHZqakqvEuznkaEdvVb2y
	 DJ7FMOMH3SyY6rwNoNqtGcQJte47YpAgbSnG4m6w67MmYf/0jeUdCAF27QvjtatcNH
	 cdPQya9Yuu7Eo3f3d1dbUdIJZW/RrhjWr2jb0/XW3PqCdpX2sPcB5wJUAoXZMVu91M
	 uDWN9fYKslvkFxtNOQynGwhqpfomFtCNUxgQxUFRr8zastq3oclEmoPRLCu/4cpfFN
	 1MTUnqcMp/ZU8fvtWvzrX5w4/S8HWyvOBWIWTc4wUDtDBsEc4KqXBWDAEVmf44PqF9
	 X0HNe8XVJrwSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1F7380AA7F;
	Tue,  4 Mar 2025 05:10:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v6 0/6] Introduce load-acquire and store-release BPF
 instructions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174106503648.3866937.5658954004964289425.git-patchwork-notify@kernel.org>
Date: Tue, 04 Mar 2025 05:10:36 +0000
References: <cover.1741049567.git.yepeilin@google.com>
In-Reply-To: <cover.1741049567.git.yepeilin@google.com>
To: Peilin Ye <yepeilin@google.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bpf@ietf.org,
 ast@kernel.org, xukuohai@huaweicloud.com, eddyz87@gmail.com,
 void@manifault.com, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, corbet@lwn.net, paulmck@kernel.org,
 puranjay@kernel.org, iii@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 catalin.marinas@arm.com, will@kernel.org, qmo@kernel.org, mykolal@fb.com,
 shuah@kernel.org, ihor.solodrai@linux.dev, longyingchi24s@ict.ac.cn,
 joshdon@google.com, brho@google.com, neelnatu@google.com, bsegall@google.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_211005_568002_10779FB7 
X-CRM114-Status: GOOD (  10.51  )
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

This series was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Tue,  4 Mar 2025 01:05:41 +0000 you wrote:
> Hi all!
> 
> This patchset adds kernel support for BPF load-acquire and store-release
> instructions (for background, please see [1]), including core/verifier
> and arm64/x86-64 JIT compiler changes, as well as selftests.  riscv64 is
> also planned to be supported.  The corresponding LLVM changes can be
> found at:
> 
> [...]

Here is the summary with links:
  - [bpf-next,v6,1/6] bpf: Introduce load-acquire and store-release instructions
    https://git.kernel.org/bpf/bpf-next/c/e24bbad29a8d
  - [bpf-next,v6,2/6] arm64: insn: Add BIT(23) to {load,store}_ex's mask
    https://git.kernel.org/bpf/bpf-next/c/4170a60c473d
  - [bpf-next,v6,3/6] arm64: insn: Add load-acquire and store-release instructions
    https://git.kernel.org/bpf/bpf-next/c/248b1900dd95
  - [bpf-next,v6,4/6] bpf, arm64: Support load-acquire and store-release instructions
    https://git.kernel.org/bpf/bpf-next/c/1bfe7f657cf4
  - [bpf-next,v6,5/6] bpf, x86: Support load-acquire and store-release instructions
    https://git.kernel.org/bpf/bpf-next/c/14c0427b8a09
  - [bpf-next,v6,6/6] selftests/bpf: Add selftests for load-acquire and store-release instructions
    https://git.kernel.org/bpf/bpf-next/c/953df09aa42c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



