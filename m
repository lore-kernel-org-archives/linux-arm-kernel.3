Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753A6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5ERXJLtgLvtpfa6RvbVKrW20WwVDgBMq5aPoHyIxtQ=; b=zMFrGJjd91Ccg3XZBJY+wRxfWy
	zzyFGc9Th4xIoRDCCbplk+qWkHuS+MRHQos9GlGykrHD9fY9MvvM1IIWPJP1xzkJvL0bP/Ukxpaep
	O+Yg5/IusnMH0nGVzELcRVp6CD+hMeXDOJmO+kbx83P3j5oUJ/xx0nrCR5p8ptQRWr2wHoUw0oRfl
	UqEn6GSQ6rsXwiFX9lDa9fdJtcwUx7hEjQzPWIJFnX0CSt3dDVpIVNhve3dN1IhHzDxUD8d91ANtL
	0Sp1J4S2AhGKXiNzvzJH2uBSCb0CAmvJh1WBgGZMobDNcPqzSsPNSG8tASHhgpl1cEsgiIk9QfTq6
	dR1UTdjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jVU-0000000CFau-33ie;
	Fri, 04 Apr 2025 16:03:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSZ-0000000CF1Y-1pgq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 16:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 125784504A;
	Fri,  4 Apr 2025 15:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8E5C4CEDD;
	Fri,  4 Apr 2025 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743782398;
	bh=WrZEF9Yxb5ULBShRbFH48qvpHj9RvDQIE9VPe6LC7pI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LAEp/ntu2bwl+Irpk6BuOuLI2cgXnKNQat2ed18ZIW5NctNUL1ZzhUd0SiXglWQhU
	 wIgNo+pKH0sDGZc3CfjfhKe1E6uLnrSyFFyYIl3nEmcFKvLiqsr900F+GMsCUafUM2
	 DSN9Sby7QD1DZoyazHYKnflfzSSO66Ayv/hTocDCBinOtlm/T1P9gOKgzbM39naJXN
	 L1UOjaY0n+Afa09d9XFzORjYckdqmIc35buJxrJshty8ZLuuq6Vq+JbSVc52McYwxi
	 37zgbu6RCMIJzQo2jfoX/8U0wTXaJ1N8Vtp20CSSmQEpFEPYwjCQEiSc5BKkPgBSae
	 0UqgzEXJK8QwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE4F33822D28;
	Fri,  4 Apr 2025 16:00:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] selftests/bpf: Convert comma to semicolon
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174378243553.3310001.5428425724896312604.git-patchwork-notify@kernel.org>
Date: Fri, 04 Apr 2025 16:00:35 +0000
References: <20250401061546.1990156-1-nichen@iscas.ac.cn>
In-Reply-To: <20250401061546.1990156-1-nichen@iscas.ac.cn>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 peterz@infradead.org, ameryhung@gmail.com, juntong.deng@outlook.com,
 oleg@redhat.com, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_085959_491443_1BCFEA2C 
X-CRM114-Status: UNSURE (   9.35  )
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

This patch was applied to bpf/bpf-next.git (master)
by Andrii Nakryiko <andrii@kernel.org>:

On Tue,  1 Apr 2025 14:15:46 +0800 you wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Here is the summary with links:
  - selftests/bpf: Convert comma to semicolon
    https://git.kernel.org/bpf/bpf-next/c/c9661394850d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



