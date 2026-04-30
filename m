Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D77FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 01:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SI6/88qlhZ0cweXTNnvBg/3Dk3fOrWssgy4gxEQqYjs=; b=KK0WZz3jwiDHw8LMHFpFFPbMRv
	5fMkHw2BJinrCoG2HF3VFQbh25KgcxmO0f08/3tsjeFwsO71IHqs62J70RTRvqYwggjKngWqaL7WO
	z1yUr31+g+6Psj2ujt+NpyWHnXOvYyt5JfQWc9yM8a81o+VMKv0cmMPHUrzWjQ/ZSP0brS0d447sg
	rn+WpdSuVMFWjJVEs0NcgOwir+QMCHw3e2e0D6LFH23IJ8+1M5OQeX6Y/geecq/SDTSssCGZhT2Ru
	XoeoyNZcl+MumEzR0H/6AIzNCmNL26/awR8Q22F6u0OJj5WAVkxW871UmLHHSuxYBh/+u9oAgLP1v
	UYosa+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIFm4-00000004MSr-46pz;
	Thu, 30 Apr 2026 01:01:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIFm3-00000004MSi-2gtS;
	Thu, 30 Apr 2026 01:01:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C24EB61330;
	Thu, 30 Apr 2026 01:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910EDC19425;
	Thu, 30 Apr 2026 01:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777510862;
	bh=Kop4YNUipvs6vp1kt9DE1V8i3VRKn2Vpku3AP8lFstM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QeZpOU2BZfJCl3y/7wzyVhwznzzTKL/dU7z5PLW13n2UBB6Rjcl3nZhhIZ0kxS+H0
	 N1rb6l8O0CX1Gf948BK1QrEa9/AnnBYo1s7r1fcTYgqYO/QDUkLI1S5mMrhP4hS6c/
	 7GOYwHtk7mNLWRe048uJ6j5eHrBXewisWeCxJIFKp//LU6IC9r41NH3Ke0SxP5BfXt
	 MjF7WK+MNbs2DRz5uMjHOqfpSe9VcjIUM/nKI1WAj/wV4aVepfDtfwO57Yy0DlYrrh
	 Yt+PolCIWslh7U0xqV0ZUf2GXUhg0+7AJdYGxGXNORo1d5akta14NuU0LfWAwq+06B
	 OGZKkXItouw6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C563809A33;
	Thu, 30 Apr 2026 01:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Rename get_src_port_id callback in
 get_sport
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177751081754.2244169.1115345882578217600.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 01:00:17 +0000
References: <20260428-airoha-get_src_port_id-callback-v1-1-3f765c91c1e8@kernel.org>
In-Reply-To: <20260428-airoha-get_src_port_id-callback-v1-1-3f765c91c1e8@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 28 Apr 2026 07:23:38 +0200 you wrote:
> For code consistency, rename get_src_port_id callback in get_sport.
> Please note this patch does not introduce any logical change and it is
> just a cosmetic patch.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++-----
>  drivers/net/ethernet/airoha/airoha_eth.h |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Rename get_src_port_id callback in get_sport
    https://git.kernel.org/netdev/net-next/c/c06a2f2903f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



