Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F475C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sduzMZAWqcdU7RvDNKD9b3+CiTnarb8EZs2paegcjU=; b=Dtntf99gXhQEPELoW0jrwW1TJg
	ZSvRftvKFjQ8kqNZk83I8YNNnjdnvyPITXqgCWJqckoyhnpMxsPBXb0MGNgSqFdua6JK8+2w5ufaZ
	uCY859mA77UykwU1d8VuOfSAEI5UWxIz0p4ImUfHsVBooHZeDZNY9oZO037pJwA/EsLPGnqXm0ogD
	FweE30vV7D6k/JILoXB6sGKogR8VU/gYWVBoj2PT1q2PvTuI/dCl3XB7Q5B6GOn2VrNIUj2qy5GOY
	nMt9CUF/bxlAIq4Y4dolMe6eMaOsqaVxrbRn5Wc9NhPkD3wPC9wB/tJwL2kmNRRb5mhf6UEkyMaSk
	dcJI6dKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubpHt-00000006QFp-2UmJ;
	Tue, 15 Jul 2025 23:42:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubpFS-00000006Q0b-1wAW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 23:39:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DED5646909;
	Tue, 15 Jul 2025 23:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9497C4CEE3;
	Tue, 15 Jul 2025 23:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752622785;
	bh=q3QIBc/TsdXBWirwIMIHxwp+8kRlnWdwqh1CRlQ82NU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EotaRwYUI7AAtHpn69V6T63FUu/TQgcsEuWQOrGJo5F/IWGf/z8IHUenYw8Wive+q
	 SW+2AYdXXZnmnd1P07d86pJso5KevSYAytDeXBV8yKUD8jzz8mYgCQGDyf91U4sHFq
	 P6IMnFoISHnRqz3EQjKoshItmjaTR2ckZ6hVNdApnhi06fRk7/SC1Ug8Fzsqatr2IY
	 Dx9rJYvDkp/2iyFt4NSFObtVDPvbC0Wy40Fs2/gScMSVKTw2qrM83nX406DfumOpWO
	 fDyy21UbuPE1UQBOdAlXT8ewL0TuaC6fcxGrIBpcfh3CdnUH2vzUnPkpaADF5HJmS1
	 w9ZyS9PBNsmhg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7167E383BA30;
	Tue, 15 Jul 2025 23:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: intel: populate entire
 system_counterval_t in get_time_fn() callback
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175262280626.617203.5242260114409933910.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jul 2025 23:40:06 +0000
References: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
In-Reply-To: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
To: =?utf-8?b?TWFya3VzIEJsw7ZjaGwgPG1hcmt1c0BibG9jaGwuZGU+?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, tglx@linutronix.de,
 lakshmi.sowjanya.d@intel.com, richardcochran@gmail.com, jstultz@google.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 markus.bloechl@ipetronik.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_163946_521958_FEB6713D 
X-CRM114-Status: UNSURE (   8.59  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 13 Jul 2025 22:21:41 +0200 you wrote:
> get_time_fn() callback implementations are expected to fill out the
> entire system_counterval_t struct as it may be initially uninitialized.
> 
> This broke with the removal of convert_art_to_tsc() helper functions
> which left use_nsecs uninitialized.
> 
> Initially assign the entire struct with default values.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: intel: populate entire system_counterval_t in get_time_fn() callback
    https://git.kernel.org/netdev/net/c/e6176ab107ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



