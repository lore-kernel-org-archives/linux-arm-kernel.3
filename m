Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54091CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 21:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEgDFuF7dNbeggU0OE65xmL7cwPuttL2VrnsIwdjxrU=; b=j63VZfnmZDPYGsTToSB0TVj76n
	/XR26s2m7D7por+/KtLBKtC2ldCGBRhn6olL7ykBuzMojpcj1pxOGcoydlFGt/aLq08gh3Fr6ZIev
	eUPcrj3A/0Bprqa/hN06daEwLNxJRjw+W/+kuEhsYc2/lHAJRZksvfdVcDyx0NDlEoVUAhVDyUwJV
	2RaXOF63gOD4YtG23Lc+wbGJtMavJKzdbUMa7thQ6MYH523vdvQ9QWJbXZRkV9/RPgJlHdOcOvHgH
	grMSM9CbYwBeCLg9cRpQf7cUKisbQG1/wmbBnS+yxOfC7kNfyanrzLLI1eSqU2JE/E+PiKgAF26Ht
	G0Lmbd1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDkL-00000006387-11OA;
	Sun, 10 Aug 2025 21:38:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDL6-00000005ziW-3PhC;
	Sun, 10 Aug 2025 21:12:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 200236140D;
	Sun, 10 Aug 2025 21:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF3DC4CEEB;
	Sun, 10 Aug 2025 21:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860343;
	bh=yRbP+oFQvp5Mj7FrKsFdMK9infUY9PonnL86PYiVBnw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Kj+bgK+NikRS6j+5KuqA5m32GVrOSHFpxkDD3zr8z2LuYDbuouFghXO0QaIqmvfuT
	 DBrT5xS1Xesv7U9O+l7hcHJHhp8zE84+TBUvPjVN9Me74E+oySfW5OX+O8wKLcBqs5
	 KL+IlE8PNvp738oizwmJUBZ7GZaXRWXQFTba+nqylbVAw+Th9d3CNneSaUjMygUyf5
	 d4e8nZX+5c0+ICauxy3GuwAKz6JfbWugwImFesV4AU7uqJk1YwfUKvBvFqC5lN9p8e
	 Gyd1ZhM/3295gyxRhOQbCoczZZfZS+eCZkO6FbvyXWi6MUwLbAL4hE03JVB8Vh/7OZ
	 RVA6hwk6jrSIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC4F39D0C2B;
	Sun, 10 Aug 2025 21:12:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 00/22] RV: Linear temporal logic monitors for RT
 application
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486035649.1221929.6695545562552022137.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:36 +0000
References: <cover.1746776116.git.namcao@linutronix.de>
In-Reply-To: <cover.1746776116.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, gmonaco@redhat.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de, pmladek@suse.com, senozhatsky@chromium.org,
 mingo@redhat.com, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
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

This patch was applied to riscv/linux.git (fixes)
by Steven Rostedt (Google) <rostedt@goodmis.org>:

On Fri,  9 May 2025 10:11:59 +0200 you wrote:
> Real-time applications may have design flaws causing them to have
> unexpected latency. For example, the applications may raise page faults, or
> may be blocked trying to take a mutex without priority inheritance.
> 
> However, while attempting to implement DA monitors for these real-time
> rules, deterministic automaton is found to be inappropriate as the
> specification language. The automaton is complicated, hard to understand,
> and error-prone.
> 
> [...]

Here is the summary with links:
  - [v7,18/22] riscv: mm: Add page fault trace points
    https://git.kernel.org/riscv/c/a37c71ca412d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



