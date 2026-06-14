Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B49CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 23:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rbjK59HUTf0wE3NhmbrJC+irGOkjOo/XNW6yQgv5do=; b=v3C6M7WNPZOOyedJeuY8wL3rbU
	1EOrYwfFh5ow2WHbHjnc8Ep6jUsgOa+cUSOnO0QVNE0Day2owylvkhNXeU9ZO959MCb5g2jvWtYsK
	SgKTo8PwE6W3Gw/pmXlwhuGkmjpm+T/IxVMA/3Iob8AdHuCiO9o8aBdGvE9jGNmj0S8yQopdZdnBf
	1ykr/eaJU1tKMR77UnoJaW+5IkgeIuCFUciR5PnFOcZ7NPLzMxUsoCs2cExEWvafAzs208ZTJ7Zv+
	B1tgD7XkmaAc8VzEg0Q21sjfbc1AieEYXouoOa2yhoMbrU3gst9txHCMDmozKxtBTUARGkI4pqZ8F
	ps1YqSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYuHN-0000000DMG5-313u;
	Sun, 14 Jun 2026 23:30:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYuHM-0000000DMFy-1h9x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 23:30:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24F4360132;
	Sun, 14 Jun 2026 23:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1241F000E9;
	Sun, 14 Jun 2026 23:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781479809;
	bh=/rbjK59HUTf0wE3NhmbrJC+irGOkjOo/XNW6yQgv5do=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lkDvCDE6RMD8G5/LvLDstEOtWKW3qYZnvDKAkirS3ZRQ1e4DjIJMv+wIsrCVftQu/
	 SwwQOt7+n2s8FVoYyGBqEeS/iZIdtX/oboGnZhsjS508f5JwhOciNbONguC52q8Cpi
	 TyE+T70fzf7tCLi7Q/G/sEwSJCaiCjfhKsjxSNc8pvGk4VefKGdmGVkoI6/u2sSc/z
	 +chmkkiAnRJeHB2OLlp2rtimjFLmoSiHq9JonTMlZLHviDpRx2D27jH61dQkceOwAK
	 VNpuY72kcyOXNPgItk5csB+PITWpppuyfnwe4HcV3elu7Mi3hAJVTV73AopQ9Yx975
	 NvLyIURINvuPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93BD53A566CC;
	Sun, 14 Jun 2026 23:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next] arm64: mm: Remove misleading pte_none() comment
 from
 ptep_try_set()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178147980539.2349009.4002197585422309428.git-patchwork-notify@kernel.org>
Date: Sun, 14 Jun 2026 23:30:05 +0000
References: <20260614210209.2371030-1-tj@kernel.org>
In-Reply-To: <20260614210209.2371030-1-tj@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, ast@kernel.org,
 andrii@kernel.org, daniel@iogearbox.net, martin.lau@linux.dev,
 memxor@gmail.com, akpm@linux-foundation.org, david@kernel.org,
 rppt@kernel.org, arighi@nvidia.com, emil@etsalapatis.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
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

On Sun, 14 Jun 2026 11:02:09 -1000 you wrote:
> This comment was thoughtlessly copied from the x86 version and doesn't
> apply to arm64. Remove it.
> 
> Reported-by: Will Deacon <will@kernel.org>
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>  arch/arm64/include/asm/pgtable.h | 4 ----
>  1 file changed, 4 deletions(-)

Here is the summary with links:
  - [bpf-next] arm64: mm: Remove misleading pte_none() comment from ptep_try_set()
    https://git.kernel.org/bpf/bpf-next/c/16deef8de06e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



