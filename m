Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ED0C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 21:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpb/UkWmV+lc+Yh3ZWbYd4u6Rm/pcvfIGdb+Xlljj7Y=; b=sht5U6BusqUV5xohy/tEph7sjq
	SRormczm5I0r8Q3M6fwn5+lMQ9gnRFOoVM8ECZBG3Y+9XcVGkh8SXwDxXTHHy7Cy54ka4iSoFA++p
	1PeTyIZxknyCCpNh9E28d4vGyDT3i2S4i8P8sJT45pVVBbVGzH/l+UE+V4bQyebo2uctE6z9G5GoD
	H1ZufabYb2MEzjb09H7+K60L7AO7f54y/7wBh8yhRZmcZGJLIckeHsBRi7voMs3tz39foUukmumdu
	ZNm5q3rEAYwExH8XNTXslIiMx5TeUbsBadfyhpdxFEHQ03sCGKFtVZLNXkSt+lSXECffjXkNfSXx0
	oxqqGuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDhn-000000062uj-3y9S;
	Sun, 10 Aug 2025 21:35:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDL4-00000005zgy-3wWD;
	Sun, 10 Aug 2025 21:12:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD24B44295;
	Sun, 10 Aug 2025 21:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC32C4CEEB;
	Sun, 10 Aug 2025 21:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860342;
	bh=TpZL3AcXPmyv/k3MtGxAsY7Rjx/rL1aPCdabb8/uY6o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pTS5TYzExZlSe4Ia4SJ5Ji5trT801OfzUS5fyuw1JHoDtyMISoC59GkMVDZRTW/jE
	 vUGTN6tabeS/ymliRBPyeFpo1wxHwKHg2cyied70C6IdCg9MBXd1kB0e8rAzdfVolz
	 B9qdEVcdNDmdXgqbZ0zWYQxP/qKo2C1yO1M/lc8AvuxbwyYAvqwXZE7setGJv98Kr1
	 rJa2B5aIp7Bog9Y0S3BmHY2vNU+VfXTAIEQiHaqFOuRKHEgU+g0cthS48HiQckPdAP
	 VET8IBlSmE4xOnLd1zmxP/qD09hNIC/krrZgeRVC/5AdIwovZ77hz8vEnEbIGZLdi/
	 MO5JJaQHVpS0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BEC39D0C2B;
	Sun, 10 Aug 2025 21:12:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 00/22] RV: Linear temporal logic monitors for RT
 application
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486035499.1221929.1151596162296259392.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:34 +0000
References: <cover.1745999587.git.namcao@linutronix.de>
In-Reply-To: <cover.1745999587.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, gmonaco@redhat.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de, pmladek@suse.com, senozhatsky@chromium.org,
 mingo@redhat.com, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141222_999863_0FAD5110 
X-CRM114-Status: UNSURE (   9.10  )
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

This patch was applied to riscv/linux.git (fixes)
by Steven Rostedt (Google) <rostedt@goodmis.org>:

On Wed, 30 Apr 2025 13:02:15 +0200 you wrote:
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
  - [v6,18/22] riscv: mm: Add page fault trace points
    https://git.kernel.org/riscv/c/a37c71ca412d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



