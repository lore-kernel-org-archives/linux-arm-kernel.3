Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAF0C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 19:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjecqTzCVjKyUMqJsZlchSRC7uTnPEoveMbIb89DyeA=; b=KOLC+S5vij3opAyJS8aVDnsy0z
	snz3StZJvH3TGzkltgoIRf12kdJKXuWd6KTek28rQcoJybcIpHnFh3dxaMJs+fgc29NijLLWFHbue
	Px1YFv6O6WXrSfTNCRzP0hQ6aZXrr4ldTl1MXNlGiYuxd9imJvaAywgjEFp2iF1QquCXg3lej9Ab/
	Xc2gNExgBsSZ9i2sVCF5MiAMuWQGE1QyE2KCH6g3eIXVdruF9qpmFF1aV3ymWpElPm01jObo2ZWMM
	DQ0xIWwHE/w679b8SGs4SJBH8njKGuTRanakCVqza3ih/0jCnteeMWEljKlVbaauZpu0T4OfjLWSb
	M3dBfC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpB2o-000000020eg-26n0;
	Mon, 03 Mar 2025 19:01:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpB1D-000000020Tw-33Ce
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 19:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82267A44F19;
	Mon,  3 Mar 2025 18:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128A5C4CED6;
	Mon,  3 Mar 2025 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741028398;
	bh=Gp5b4c1zf97/draGEaY8yH71AhQTNUbCkCfT2p04Ckc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q5M2YMHe2LJCMAbfg7cXsul2vfgCw+jK6xbaoDHy22zAQaeRbjIZEptLtF5zMYf2C
	 NI7lQsAuXzCRPPtzU7mkqF8IW3uvEJUESZyhXBOQnhz7bu+jsMeTL/Vuau/sq4Qy4J
	 n6h2XyRXx/tOQNduulh93PuocfF1B2AgiKHgtrSI05RAhObY7hep2TIxQ9Vc6Kv6C7
	 GGKJmVYricZwzhj/TFjAKEaZWiRoHfV2MYIOnPnciB6l8WrlNMfYhjvV6m6uyFXySN
	 pjF4vfPXj87/eo0t/8HnVzmsCUBpPMRXg/WAHewjVtACWEjqKC+yrXBDgXwMySrGMP
	 EspRmDXAUFzYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEF23809A8F;
	Mon,  3 Mar 2025 19:00:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v4 00/10] Introduce load-acquire and store-release
 BPF instructions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174102843076.3686766.17440507185363251083.git-patchwork-notify@kernel.org>
Date: Mon, 03 Mar 2025 19:00:30 +0000
References: <cover.1740978603.git.yepeilin@google.com>
In-Reply-To: <cover.1740978603.git.yepeilin@google.com>
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
X-CRM114-CacheID: sfid-20250303_105959_903558_ADD7539F 
X-CRM114-Status: GOOD (  10.29  )
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

On Mon,  3 Mar 2025 05:36:27 +0000 you wrote:
> Hi all!
> 
> This patchset adds kernel support for BPF load-acquire and store-release
> instructions (for background, please see [1]), including core/verifier,
> arm64/x86-64 JIT compiler and Documentation/ changes, as well as
> selftests.  riscv64 is also planned to be supported.  The corresponding
> LLVM changes can be found at:
> 
> [...]

Here is the summary with links:
  - [bpf-next,v4,01/10] bpf/verifier: Factor out atomic_ptr_type_ok()
    https://git.kernel.org/bpf/bpf-next/c/b2d9ef71d4c9
  - [bpf-next,v4,02/10] bpf/verifier: Factor out check_atomic_rmw()
    https://git.kernel.org/bpf/bpf-next/c/d430c46c7580
  - [bpf-next,v4,03/10] bpf/verifier: Factor out check_load_mem() and check_store_reg()
    https://git.kernel.org/bpf/bpf-next/c/d38ad248fb7a
  - [bpf-next,v4,04/10] bpf: Introduce load-acquire and store-release instructions
    (no matching commit)
  - [bpf-next,v4,05/10] arm64: insn: Add BIT(23) to {load,store}_ex's mask
    (no matching commit)
  - [bpf-next,v4,06/10] arm64: insn: Add load-acquire and store-release instructions
    (no matching commit)
  - [bpf-next,v4,07/10] bpf, arm64: Support load-acquire and store-release instructions
    (no matching commit)
  - [bpf-next,v4,08/10] bpf, x86: Support load-acquire and store-release instructions
    (no matching commit)
  - [bpf-next,v4,09/10] selftests/bpf: Add selftests for load-acquire and store-release instructions
    (no matching commit)
  - [bpf-next,v4,10/10] bpf, docs: Update instruction-set.rst for load-acquire and store-release instructions
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



