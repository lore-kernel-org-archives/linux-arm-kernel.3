Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD601C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 17:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbjK09Oo/KaBZYVKJXBavz+0zUWrLWJSsqESbFdRw2A=; b=axFdcBy7s9EZIWNErMWOP9gM6C
	0XheHFnAuvnzE8GIn0YDaKE8eDdbdi7cgjc/uxUVs2JD0fzfCmobpQvOC0Cfrhq9NpBNpfiJqnSMo
	YviFEN5EKGxD73+DLC1Yk/klC+Dl726ppac6xDt6koSYWu3cl7wg9WJPSQMsznb4qPOf/j9HCY7Mh
	C+KH6eRUP94NYomoWNeqOVHZmKeKoeTclsFWqFgo73u+ySsUlX+GhvBExu7sjZDuHZmDDRKfTYNoS
	7KlaPTec9qnoppr+GOqJsjLurhugUT5oQcJ7E/jXdKc5+3GeDgNgGwI4dnziiwcsiSMZGeZculBQl
	trgSSUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDzy-0000000G62t-3Btk;
	Thu, 05 Jun 2025 17:03:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDue-0000000G5ZH-10bX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 16:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A0FB440F3;
	Thu,  5 Jun 2025 16:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99E9C4CEE7;
	Thu,  5 Jun 2025 16:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749142674;
	bh=pjV3bNzBf1YJf1rM+e/SvZsaxG6fHSEEd/WI3ExKBGY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rrONN9qW1aHmF5/UQgqLlnYMX7Q4VsokJ4R22HjDxXA934YUU0zNzq6yjAiwujQMa
	 KT2BDFGdKRzP/RiPPMOj3guszhi3/xzuwAkbC8zf2uYgpL1CGRX07vzgnZ+LbK+xoO
	 S2POrMn3TLOiLPh2aqFY3eGuyCbLN4ntVHjMM3uDVAdrSljSC7F2eLY7W2WdHOS1SE
	 cy2QFsEcSrC8D7r4pgLvv2jWy1wy9HjfqVoMuyJZ3jhsnzspvg/5ibV+eTyT0dIGxA
	 rMpal3yosEluCov6TPplKm4A0gxOA4DKDDgyiLlBBzwaH/JJD+eU+Jm3ASXDOvhYFq
	 Mtl+lu6HSwUZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1FD39D60B4;
	Thu,  5 Jun 2025 16:58:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix compile error of
 bin_attribute::read/write()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174914270651.3142609.5571647506914286281.git-patchwork-notify@kernel.org>
Date: Thu, 05 Jun 2025 16:58:26 +0000
References: <tencent_A6502A28AF21A3CA88B106F3421159869708@qq.com>
In-Reply-To: <tencent_A6502A28AF21A3CA88B106F3421159869708@qq.com>
To: Rong Tao <rtoax@foxmail.com>
Cc: andrii@kernel.org, eddyz87@gmail.com, rongtao@cestc.cn, mykolal@fb.com,
 ast@kernel.org, daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 peterz@infradead.org, ameryhung@gmail.com, juntong.deng@outlook.com,
 oleg@redhat.com, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_095756_298378_D9DDEA30 
X-CRM114-Status: UNSURE (   7.86  )
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
by Alexei Starovoitov <ast@kernel.org>:

On Wed,  4 Jun 2025 13:53:22 +0800 you wrote:
> From: Rong Tao <rongtao@cestc.cn>
> 
> Since commit 97d06802d10a ("sysfs: constify bin_attribute argument of
> bin_attribute::read/write()"), make bin_attribute parameter of
> bin_attribute::read/write() const.
> 
> Signed-off-by: Rong Tao <rongtao@cestc.cn>
> 
> [...]

Here is the summary with links:
  - [bpf-next] selftests/bpf: Fix compile error of bin_attribute::read/write()
    https://git.kernel.org/bpf/bpf-next/c/4b65d5ae9714

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



