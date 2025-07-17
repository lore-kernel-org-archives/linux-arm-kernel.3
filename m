Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839FCC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 01:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQ7sz9jSdryZy65v29omXfEbj/QlEOEo/SktB7nfe8E=; b=Uy2yElCQCqARM9lcy6iVP2QXny
	wFJeUcNSisn/tmDxKGVyfR+DvTX9Ml9Yaf+xFP6t4Zv/DBdrdHhgaHwgVMxvQc8rWcEau5dd0zqIl
	s/HBecBPX4zMEN6DcEjBgPP6LyzV1k9D8YnW/DyfpQ1QE2/kQcH8JUuWuYeygAClYF5/BEH7Vcnbi
	ShfJc05AUMx61OdCpdis8j9AYNH/erDTHRHchzDxbyEEAg/HUDBtPV4brwMKIYl/sIvoKmdQ29tZ6
	vK4a31eG6gz5Be8JMojsRO7S1Xjeye5o800/9DDsGRPiwf842zw3/IjUEoUKyPUTkLphVURNz8LHS
	HPSMF4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucDTy-00000008zf0-1FUb;
	Thu, 17 Jul 2025 01:32:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucDRW-00000008zDK-06Nl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 01:29:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57F82A575A8;
	Thu, 17 Jul 2025 01:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE572C4CEE7;
	Thu, 17 Jul 2025 01:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752715789;
	bh=4ZNCZwXvNH9vuMgkk/NS1R5HXJ7/MpNDC0QStIdElmA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YjhE2soT7mhlqrz+/hkv3UjIrd5XJxlzIWKRy4zyAirX+U4A0rLCOdVJwIcMAKtkF
	 EhftIpSOliE6OCY8gTiRvb2rYVSFqA+VyPfVRzBwB7Ae9Ii2EdpNA47RpiuSpQiSym
	 PVgiVPuUPCqNbS3LUCrQEP4AFeqqYfkB1N06MBSOQCcLjm/q7jEGCYNJssogem0mRK
	 rQ799N8bkepZb/UQ6iPmhDA1sD9VyJfvMMBha52u1ql5LGmVsyKmSiAhpUn89fw1iG
	 /PDFnM3DngrNaJY6ET5b5fAAzinjgQLualv6oSvVbESwkarCId05yWhVkQk6cWYVVc
	 CcPguFCGX43ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 593D0383BA38;
	Thu, 17 Jul 2025 01:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] bpf, arm64: relax constraint in BPF JIT compiler
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175271580926.1388574.2871718742808894447.git-patchwork-notify@kernel.org>
Date: Thu, 17 Jul 2025 01:30:09 +0000
References: <20250709-arm64_relax_jit_comp-v1-0-3850fe189092@bootlin.com>
In-Reply-To: <20250709-arm64_relax_jit_comp-v1-0-3850fe189092@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9_=3Calexis=2Elothore=40bootlin=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 xukuohai@huaweicloud.com, catalin.marinas@arm.com, will@kernel.org,
 mykolal@fb.com, shuah@kernel.org, ebpf@linuxfoundation.org,
 thomas.petazzoni@bootlin.com, bastien.curutchet@bootlin.com,
 ihor.solodrai@linux.dev, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_182950_129998_3A381D72 
X-CRM114-Status: GOOD (  11.80  )
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

On Wed, 09 Jul 2025 10:36:54 +0200 you wrote:
> Hello,
> this series follows up on the one introducing 9+ args for tracing
> programs [1]. It has been observed with this series that there are cases
> for which we can not identify accurately the location of the target
> function arguments to prepare correctly the corresponding BPF
> trampoline. This is the case for example if:
> - the function consumes a struct variable _by value_
> - it is passed on the stack (no more register available for it)
> - it has some __packed__ or __aligned(X)__ attribute
> 
> [...]

Here is the summary with links:
  - [1/2] bpf, arm64: remove structs on stack constraint
    https://git.kernel.org/bpf/bpf-next/c/dc704d0cfa43
  - [2/2] selftests/bpf: enable tracing_struct tests for arm64
    https://git.kernel.org/bpf/bpf-next/c/4a760d2d7aa6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



