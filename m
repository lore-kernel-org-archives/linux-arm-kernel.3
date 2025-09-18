Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5C7CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ChxvvI26hZI07uL6I6U4zLG64uov430MusmAXyujx4=; b=3WgfnGMdIa6MFfqFLcKl0gYlR0
	Y9fBnD7UGOAFShyMpAnVhAH1VSqDsZHRp4BLo/fsxMlv/oL1IhQ6Ybmm9ugoYXG0du4tjExSDomux
	G81I+jKm0a4+GWGegWVPbZXTbOMWRKdCTTNIPy2C3c6ceaxr9d9QBdrd11v32POY74lI4CJ34gC89
	Cgt6ByVAvpkXh4+iga6+Uqrz5eQ18XHYu9sUJ/nZT8ed7QGdGE87AM3uaq66H0Y2SlthsP5lXHl81
	tOyNHJ+aerSByOE08YXfdym+AGEv5Yhda+iuxBfNs5380wQt6w+dqO9G3FQSk22v3OztgsNhj05Ag
	X3F4Rs5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGQd-00000000LMZ-08KC;
	Thu, 18 Sep 2025 15:20:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGQb-00000000LLU-0tNK;
	Thu, 18 Sep 2025 15:20:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84EBB601BC;
	Thu, 18 Sep 2025 15:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA81C4CEE7;
	Thu, 18 Sep 2025 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208808;
	bh=WtFvBNz1kJ7pD7bo4mQcWpsZ1ssTGarDzTz4XC7qwVU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=n49SMoE5Zt1WozM4r5I7FeD2ewGouOsP2e2IevUVtRyRC0LAPna1MaCaTClXqFwTj
	 7wEJGLQk4Q9BT8ewfa8KTYJvri6JYRmfKnZlhJegGrrzWTORDKTzAsAKwJA4oJYfUj
	 YZY7HQi4xeNpO34JScJdzKRisVDd5jyZTnaxFHbWgtRikFi81Y0onbNtZf8Xpsu4S7
	 4x/IAMmM31spNaQbp0aNwomP8/86h/rm4k8ivzFLkXtPU7pG26flLaaKqVpZ7ftEq8
	 Z+zye+fFsehsVlS5Zyv78mYcNT1sEBb2S6fSLi+HScdyx+7Eyuv3lJypyQ4C9rWVLm
	 WE0TtZ3w/aG3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CA139D0C28;
	Thu, 18 Sep 2025 15:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drivers/perf: riscv: Remove redundant ternary operators
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175820880826.2459453.293698691705893286.git-patchwork-notify@kernel.org>
Date: Thu, 18 Sep 2025 15:20:08 +0000
References: <20250828122510.30843-1-liaoyuanhong@vivo.com>
In-Reply-To: <20250828122510.30843-1-liaoyuanhong@vivo.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: linux-riscv@lists.infradead.org, atish.patra@linux.dev,
 anup@brainfault.org, will@kernel.org, mark.rutland@arm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
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

This patch was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Thu, 28 Aug 2025 20:25:09 +0800 you wrote:
> For ternary operators in the form of "a ? true : false", if 'a' itself
> returns a boolean result, the ternary operator can be omitted. Remove
> redundant ternary operators to clean up the code.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - drivers/perf: riscv: Remove redundant ternary operators
    https://git.kernel.org/riscv/c/01dc937ac18d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



