Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95130C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 05:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awjZKh7j/ZRrPK+GXT6udEHhIXB9OMAIaNBEONO6aO4=; b=zdlttih0WYJIsOO+8W2+iAWUc5
	mMj2vwQ/JTz41b0E/WS9IhiK1unUihMkx4hKyJSVDU0ateL7UoFPCwN3hAA8nPtrLUrQduQW5h3V/
	25H7JtuVTuu0W5LDza6hSZA/9kAOcvPasUY4rhEEnU3/XigZnLis5tT8uszq6eEB1CXI0tSb6f/Cp
	KvD8/I4ORoHYDUY44MPVWQtJ53a2OvwM+2ZCkrXW0K8wP98K/HNr008qZrunfj+u+xFoS+kpKrQdU
	8o6CetdZBaW2Zx3JqnirYavjj6VLvP00h9+tc1gruuQYvCqC6ok7oj+Ho3bHe/UonvcPysyK2Okf2
	XJZLpJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yob-00000002LWD-17Bj;
	Mon, 14 Sep 2026 05:01:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yoZ-00000002LW5-3rrq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 05:01:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5993E40762;
	Mon, 14 Sep 2026 05:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FE51F00893;
	Mon, 14 Sep 2026 05:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789362071;
	bh=awjZKh7j/ZRrPK+GXT6udEHhIXB9OMAIaNBEONO6aO4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=MzfrEe12hYSqbGVTplWa4njgyWOrfqH7Bu4RHAp6yEb8dnGCFMV/sLgfs+a4N7Q0Y
	 m7vjGW1XU4foQpTw48Fu9PGF2fB8rTymKQ7nYTu4GaCSLCliipPxN2LfnWwx8KcU4E
	 qjm5eaBQ7KNqlAz3C+j6Xs7ayTFFvaUBnxOqJIWqKtclQ+TkFgxTfqK21IfCYDyqML
	 tqUG5ItUIvt7xZw1Ab931fdECl0ewhSrYP9aprus88AJ6wPOyYGAgiIAv03t6M0T8t
	 ohwjI7O5RKPARbcZhh2tBsiUSx0P8SJmo8UHeoOK9yo8PQytXTXMMJFOZZ5akMgH9t
	 KBzPGYVW+KP+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AB9380AA63;
	Mon, 14 Sep 2026 05:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf v3 0/2] bpf,
 arm64: fix the exception callback's frame pointer
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178936200639.325205.5759223935386282492.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 05:00:06 +0000
References: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
In-Reply-To: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: ast@kernel.org, andrii@kernel.org, catalin.marinas@arm.com,
 daniel@iogearbox.net, eddyz87@gmail.com, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, jolsa@kernel.org, memxor@gmail.com,
 mark.rutland@arm.com, martin.lau@linux.dev, puranjay@kernel.org,
 shuah@kernel.org, song@kernel.org, will@kernel.org, xukuohai@huaweicloud.com,
 yonghong.song@linux.dev, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
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

This series was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Mon,  7 Sep 2026 22:06:22 +0900 you wrote:
> The arm64 JIT does not set BPF_REG_FP in the prologue of an exception
> callback, so the callback runs with whatever x25 held when bpf_throw()
> was called. A callback that materializes the register, for instance to
> pass the address of a local variable to a helper, then works on the
> frame of the subprogram that threw.
> 
> Patch 1 sets ctx->fp_used on that path, the same fix commit b114fcee766d
> ("bpf, arm64: Fix fp initialization for exception boundary") made for
> the exception boundary. Patch 2 adds a selftest that reaches the case.
> 
> [...]

Here is the summary with links:
  - [bpf,v3,1/2] bpf, arm64: set up the frame pointer for the exception callback
    https://git.kernel.org/bpf/bpf/c/ef1fb82f1218
  - [bpf,v3,2/2] selftests/bpf: cover the exception callback using its own BPF stack
    https://git.kernel.org/bpf/bpf/c/26a43a5f8c31

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



