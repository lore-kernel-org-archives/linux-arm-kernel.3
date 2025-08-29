Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3898CCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 00:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMyPR1XrDb6VCuRIRVY0/eqdcy6hD8GDiIaWPnQwL0c=; b=R6QsdkLfUCiIo0glUxxglmGe+I
	AJ+2sKdLjsT9oiWNM6Y8QQAJSeVF6zRaTBjil9xEHFBsxxuGtx4uRIPzTNz4PtwbbT7zv1n1nGvbG
	SSUCuqeQRkEmoPZAaNJpHUk81e2HhfFl6BC0piS3nGS1DSYAYeyGJUck9TvIkMl6fkdUQxTEqq7TF
	+M5OOWj8uMloghimQdeHWwd3v/Zj5CD4CFwbyG3dtmv7686D8qKK+cckFCta6y30kucwM9qZRbH6A
	cIaKwq8tzK9jaFIjvnehsauIQrAky9lwtMHAOJmiO1vnoyAtVJbVr/nGGoVA1baBqaoDuB/a3NGIc
	tUNSQ1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmfU-00000003oSy-0dJs;
	Fri, 29 Aug 2025 00:08:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmXW-00000003lD4-1RB2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 00:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LMyPR1XrDb6VCuRIRVY0/eqdcy6hD8GDiIaWPnQwL0c=; b=PUTzDkHarJeWpEWP3zgjHJgvUk
	7Eh4Dm+g/h1kyM7qYbHRynBOJrqMPNEj04NdjAlNhT11/YQk16rp3/fVQ4LGR4xxuXODxblDSpdzz
	jrY8ZrOxP0Jbhu97/i/0PcMVWD0V5qJgGCooRZ4AfyWU7kJwab2pTAw8fu5g10///JXaLT0xRuP/u
	uJm6ihYVpxkuuMeWpBdgTZPS2WYYvjBTPAsle/tI8MUGL3LJ+EpjX4w0rP+Gqnlve02huNIhcV09d
	rsBFJ9+ceC1tZhFg3tKWdWMm58+AgVY/UXpIWRhAYpUfcwlrvwbYHJg5aVjS04aknUhSrHn4TsG2B
	/Rod9Qlg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmXS-00000002ylp-1UFM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 00:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D7B1451F5;
	Fri, 29 Aug 2025 00:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078CCC4CEEB;
	Fri, 29 Aug 2025 00:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756425613;
	bh=bETuWeDYSHxG5nww5B4o0pHKicBEs80t5TggZjI5wc0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=buPHN44NThUo0X1Bw3TUxD3TwQw23tPgjO2aYHD+cGOcZX6PqYaQ7DVjqjPphd7Hq
	 pt2SV3Z+42HCCe3iU7GyKx37D5bzK6PBHTLRrrrZU3l2quxFfSc1HsMZJbachSQfN7
	 HjBnhHvAw3sFzDY7PGiyjs1XvFlirbwzJxAsQPa82Tuaqf6a7RMFMT1Dqx8xg+5A6h
	 y67sBAJjvysryFYr0I8g6s1SCjqHtnjRcsF7mf7QwN+sotOk9jFM9OwP0kI9eDVeV6
	 X/uy3WHFICENpZCIT18v0iamnmEbNrC5JJLC7+o6f3PgvzrJxnAIDEsjBedM6TM4i0
	 CdmX4CITD0S4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FED383BF75;
	Fri, 29 Aug 2025 00:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: mdio: clean up c22/c45 accessor
 split
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175642561974.1653564.13238220645332323952.git-patchwork-notify@kernel.org>
Date: Fri, 29 Aug 2025 00:00:19 +0000
References: <E1urGBn-00000000DCH-3swS@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1urGBn-00000000DCH-3swS@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_010018_631598_F8DE525D 
X-CRM114-Status: UNSURE (   9.51  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 27 Aug 2025 14:27:47 +0100 you wrote:
> The C45 accessors were setting the GR (register number) field twice,
> once with the 16-bit register address truncated to five bits, and
> then overwritten with the C45 devad. This is harmless since the field
> was being cleared prior to being updated with the C45 devad, except
> for the extra work.
> 
> Remove the redundant code.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: mdio: clean up c22/c45 accessor split
    https://git.kernel.org/netdev/net-next/c/24eb86a8170f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



