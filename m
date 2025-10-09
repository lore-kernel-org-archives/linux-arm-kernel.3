Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF00CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 01:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgJqPRZu2Oxx8PV8Tv5wwY4dRvm1ewwNlKmjKtGu1vI=; b=YdW47Fcg70oIF/6cben/Tnw7qy
	nzbO9sJS9TNhuas8GKY/BQ8sp+GpTuXuxvnirPBhfZooLGKj8Lm2F5jIT5tqehYa0FwoU/Z5WQQQ+
	aQUl8u7FtdGsqaQbkIvdDiQnmxmFNdh/Y4VYfqdCN9Zqm9Tjnw4bm9mwDH4YXUfkf7zYJcglr//aP
	WsW/gTWo3Nwz858ZVJcJMur/oRTVpteVdIz5jerzu04iZvfmClfQPLKaxhCrF2vobUHNyDqFhEUMQ
	5cMad9flvWIW9yw1sRgI+hk1lTg0evpu4BqJgCb1gnHX++Tz8VCm3mgrfpyPQHv0zQXK/RIshMacM
	KkJj7hwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7f-00000004uSy-3zMY;
	Thu, 09 Oct 2025 01:07:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7d-00000004uRn-2eHx;
	Thu, 09 Oct 2025 01:07:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E03562142;
	Thu,  9 Oct 2025 01:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6FAC4CEE7;
	Thu,  9 Oct 2025 01:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972028;
	bh=1CdwuT+kYcmte8eivy456G2ecK75wHvT2qHam+/7tKI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Cpsu6soKqutgxCtUfPezdkxx5CskZoUCgqzxXo1GLczYtT2CWVv8zYILvo1MH+poW
	 8DhXILNkc/IhfRwPBJ7pkQy0hiD+DaTrCdzXG6qb0D0NXeOCimbRprobtFWuTn47ho
	 tQbo9vk0bTVjq7sibNH0YszQlPI6Jcarcu66BF/sInizjAkBMDCmXfi46DTJc27HSW
	 hcP8a7f9wEppJoIJVEDXf2evkRhdga2TKzVhWETk+l1nHvvhF8r7ZY2NaJEr80vbqL
	 YSkN+7gJaSYfvUVuv4qhYaECiIXdJzyycgv5G4S97GOwlGR0oNXYlAJZEkpT9yJhuT
	 hJ49LeKwxzDEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F473A41017;
	Thu,  9 Oct 2025 01:06:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/8] Add SBI v3.0 PMU enhancements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175997201703.3661959.2204934721349838885.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:06:57 +0000
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, will@kernel.org,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 mchitale@ventanamicro.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, seanjc@google.com
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

This series was applied to riscv/linux.git (for-next)
by Anup Patel <anup@brainfault.org>:

On Tue, 09 Sep 2025 00:03:19 -0700 you wrote:
> SBI v3.0 specification[1] added two new improvements to the PMU chaper.
> The SBI v3.0 specification is frozen and under public review phase as
> per the RISC-V International guidelines.
> 
> 1. Added an additional get_event_info function to query event availablity
> in bulk instead of individual SBI calls for each event. This helps in
> improving the boot time.
> 
> [...]

Here is the summary with links:
  - [v6,1/8] drivers/perf: riscv: Add SBI v3.0 flag
    https://git.kernel.org/riscv/c/8c8d0f002b76
  - [v6,2/8] drivers/perf: riscv: Add raw event v2 support
    https://git.kernel.org/riscv/c/656ef2ea30a9
  - [v6,3/8] RISC-V: KVM: Add support for Raw event v2
    https://git.kernel.org/riscv/c/190b74154299
  - [v6,4/8] drivers/perf: riscv: Implement PMU event info function
    https://git.kernel.org/riscv/c/adffbd06d003
  - [v6,5/8] drivers/perf: riscv: Export PMU event info function
    https://git.kernel.org/riscv/c/880fcc329e24
  - [v6,6/8] RISC-V: KVM: No need of explicit writable slot check
    https://git.kernel.org/riscv/c/41f4d0cc331a
  - [v6,7/8] RISC-V: KVM: Implement get event info function
    https://git.kernel.org/riscv/c/e309fd113b9f
  - [v6,8/8] RISC-V: KVM: Upgrade the supported SBI version to 3.0
    https://git.kernel.org/riscv/c/dbdadd943a27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



