Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF07C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 14:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTZVrB2Z788paJx88CJOZXdlM3w336VO5KUgklclXNc=; b=o4Cha4/AAo1OQ6Afa4h3ElzqPy
	DqUCquIwD/Iv/egin4yJ/RbUGCWANrK6pLVzzN442Z8vxQt07WpL4yyAgDvMqVkdQBArVNcM/Uibe
	pyVAde0PDVqccBy4NZwUD8yzUAYQPCI1pkcEhd/y0mxdAAth/9UbXqpDTFqKVu1iueM7iFQ4yHZY1
	ttSHc0DWq9bzjs3BPd5uLJEcb1oIwsdnOTL9SiVMX4kNITpmoRaPsksjYfgBdh/wz/Ys9TsrYC52x
	pb8cWDYJedFNn4wryx7V2Paaia9HXz4cykNcZW5t2Rpnb2LzKUeWOoXu1DEqgimW2ti9fOCV2YBdI
	S/nGKRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVGg-00000008wnt-19Zy;
	Thu, 30 Jan 2025 14:11:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVFK-00000008wLZ-3pwq;
	Thu, 30 Jan 2025 14:10:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83505A41ABA;
	Thu, 30 Jan 2025 14:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078F6C4CEE0;
	Thu, 30 Jan 2025 14:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738246218;
	bh=9+g/CdbDGQY0MKh8KuXIORy84Cune0MY5qj0W7Kj2Qs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tjr7SdDBr3+Fs5IbJYELFc574X1htZLZbpExQuJpDk6mlc5B3WtoRHftpc2AuN4jI
	 xquntxyf3Wx3YVhFUFadZRK2T/ZZIBkq38GU5TeMsAXqXcwyEAFvoj8SvpmmHK1a4D
	 o4U2lBqkVv1HLfl5so3xYsMVWLVHMKLUth3KVKM6KGPPAY/NBHXJy30Zyc8U34a1KE
	 k1GkM8ffZTFa6U1c5ldyoqgp0Gy8/UsZpsuO8Jqj7HjN/Ud9VjP1+NAgI6zSpV7qjG
	 vZZt+SxdpF0paX7sLwgIwnwZwCKwu3BvJfJqMBdSimzREinVNOGl7tUsnk/ZfhrOSU
	 hs20squu2pOCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71114380AA66;
	Thu, 30 Jan 2025 14:10:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/4] defconfig: drop RT_GROUP_SCHED=y
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173824624400.971083.13259437466133760961.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jan 2025 14:10:44 +0000
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
In-Reply-To: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 anup@brainfault.org, heinrich.schuchardt@canonical.com,
 chenhuacai@kernel.org, kernel@xen0n.name, ysato@users.sourceforge.jp,
 dalias@libc.org, glaubitz@physik.fu-berlin.de, linux@armlinux.org.uk,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 rjui@broadcom.com, sbranden@broadcom.com, tony@atomide.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org, charlie@rivosinc.com, xry111@xry111.site,
 wahrenst@gmx.net, treding@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_061019_016575_8852E100 
X-CRM114-Status: UNSURE (   9.69  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 15 Jan 2025 04:41:19 +0800 you wrote:
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
> needs an RT budget assigned, otherwise the processes in it will not be able to
> get RT at all. The problem with RT group scheduling is that it requires the
> budget assigned but there's no way we could assign a default budget, since the
> values to assign are both upper and lower time limits, are absolute, and need to
> be sum up to < 1 for each individal cgroup. That means we cannot really come up
> with values that would work by default in the general case.[1]
> 
> [...]

Here is the summary with links:
  - [v4,1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
    https://git.kernel.org/riscv/c/26f2d6de4179
  - [v4,2/4] loongarch: defconfig: drop RT_GROUP_SCHED=y
    (no matching commit)
  - [v4,3/4] sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
    (no matching commit)
  - [v4,4/4] arm: defconfig: drop RT_GROUP_SCHED=y from bcm2835/tegra/omap2plus
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



