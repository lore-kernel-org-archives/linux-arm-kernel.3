Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95A060A2608
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 00:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wF6YT1JL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kfqR6qkx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtjVuPQ7kn36ZSPJwBclqThMAgXwOY5mVnGvm7BncAQ=; b=wF6YT1JLy/AlqKH4D+LnSOg0cT
	YTzxHaIXdRklTK9HRuy11JLgXD7IGZLAckQEX1yJB6BT5AYRyI7uejzaCQcbVNZJ4sW2iC1e4AhiE
	X1iE/qIorQSio+v/NSYzN4znNnLvP5ea6R9TYmKnBjbWcl5LNAbaZuxPuUo0wi7Cb9xYObiFHSifa
	1G+MUS7fmgpHru0bvInYvrQXt6ftS6uJwRnSQnNXF4CCy3IE/lXJpFkUYFPAjCwG7m27nWISDud4e
	4vJa6tN4/05yl9QHjX/3LvlIQbVuxTouLOaYfNGBNqURY939pPQ0eBsqY4ohkwbg/zmECR6CXAJzp
	+zARTHVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJghH-0000000D5tC-2g8Z;
	Thu, 22 Oct 2026 00:30:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJghF-0000000D5st-3raP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 00:30:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 165C160A86;
	Thu, 22 Oct 2026 00:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2071F000C5;
	Thu, 22 Oct 2026 00:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792629016;
	bh=QtjVuPQ7kn36ZSPJwBclqThMAgXwOY5mVnGvm7BncAQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kfqR6qkxczncMYElE4BFVnPnI+W2MBigg4WNj/sN7Xf7KYaCbop0JoygzdEpJvI2Z
	 1PjaOLIo/djkdiBvtyX/4p3/Q4MZVQmNZGYJ1cOrIAVmK513u+AKPE7AE44R8uizI8
	 u8shg3eMO1XMFOBbVNlxTEjSiIuvnaV/pf+Zdc2KTujryjArKRaEwrlkxCJuDAVwB2
	 JVa8YyxubTfYBYxqmgF0BOYNeF/1Wz+wP8QjiYeBEyu0xDFATbjIE+HFY6IrcRywln
	 TZn0/VhP4rXq5e74Un6QY2dbPgRfYVrX5l98FqioJWsiPXx9+TDTHRdQ2mkBH8wQAn
	 inPTpvGtxsnmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B427E380A963;
	Thu, 22 Oct 2026 00:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: lan969x: fix DSM calendar for empty taxis
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179262901535.1378903.9048135017181445808.git-patchwork-notify@kernel.org>
Date: Thu, 22 Oct 2026 00:30:15 +0000
References: <20261020-lan969x-dsm-empty-taxi-v1-1-14790f1e7430@microchip.com>
In-Reply-To: <20261020-lan969x-dsm-empty-taxi-v1-1-14790f1e7430@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 Steen.Hegelund@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 20 Oct 2026 10:58:35 +0200 you wrote:
> lan969x_dsm_calendar_calc() computes the DSM calendar schedule of one
> taxi. sparx5_config_dsm_calendar() calls it for each taxi, reusing the
> same sparx5_calendar_data.
> 
> Before this patch, the schedule is only cleared after the n_devs == 0
> early return. For a taxi with no active ports, the function writes
> SPX5_DSM_CAL_EMPTY only to schedule[0] and leaves the remaining slots
> at whatever they held before. For the first taxi that is zero from
> kzalloc(), so sparx5_dsm_cal_len() returns a bogus length and
> sparx5_dsm_calendar_check() fails, which fails the probe:
> 
> [...]

Here is the summary with links:
  - [net] net: lan969x: fix DSM calendar for empty taxis
    https://git.kernel.org/netdev/net/c/a031ec9ff5a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



