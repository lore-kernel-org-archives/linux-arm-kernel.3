Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB54C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 13:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHbAXfae0IY9596f9/1TBypJEdS03DWoNPAgF4GBxsg=; b=ZfV29VPeNuMYZnFjwSvcEYzHtQ
	9U+0bxLh/X/anvwvhhY6az67AyZ7NQ2R23qk5zdrlgN0RF+ERKnPyRFk+wVASWqP5SyXk9BlHJK6a
	ltsin+gQwRL6VPK9cKGSuQ90OIDcGX3Ed9n1hrqygndfmkFvwKjNBgmYcZ0io1aIUPCpWqdFHzb2N
	xP023pW3KZu+Z5E969ozO3jmMzYH/hIs3t04IuZeHbiN/kUjTqieKavGMOuDVSgre7RCq/PB3EYJX
	lgnBVOpZb3T7l0jLCSR3rDCO+F2E16hBOrHT4FQLs8qp4DguQOoaBvr4H3qynbI1Gkc+Qg8Tn9Kq2
	/6JAm1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OQK-0000000CCsN-1VoU;
	Tue, 01 Sep 2026 13:21:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OQI-0000000CCrE-24tw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 13:21:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFAD360A54;
	Tue,  1 Sep 2026 13:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C641F000E9;
	Tue,  1 Sep 2026 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788268869;
	bh=MHbAXfae0IY9596f9/1TBypJEdS03DWoNPAgF4GBxsg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ir1xqYjupi2IvXdgBSrk33drSkkqvDGpbeS5MM4FDrIvEKRDr9BSllIKonCkGrF1N
	 reFfT/njNraeFzeXIpbe5Pj5vTbMgWZmyUb2iwo3jjJ0ZuhutRGTbxk9kLhA3zJDgC
	 t6mrKymMb4vk8ZBl803Yi7eqdiZ9nKEG39HrI2k47FjbROnbnbtkKIINHY7rNV1y4r
	 7tlYF8Gk3W+JzGrwIR/HFJV7F6YYc6BGSXF2xvNTYX32ExZHk35iq+0A0YTezxKLZ5
	 mQd8wHXVMPcJW0oXYvRHobWAJwL0BUpG7DyjM55IXylB7bE6QfNc9w4OpuxRGtwBwU
	 4HcDndBnkORQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569453924FEF;
	Tue,  1 Sep 2026 13:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: Remove ARP offload code
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178826881193.1174044.12160983478989451764.git-patchwork-notify@kernel.org>
Date: Tue, 01 Sep 2026 13:20:11 +0000
References: <20260831071351.354255-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260831071351.354255-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 31 Aug 2026 09:13:50 +0200 you wrote:
> dwmac can do ARP offloading, where the HW replies to incoming ARP
> requests. This requires multiple steps to work well :
>  - Program the local IP address in a dedicated register
>  - Enable ARP offloading
> 
> This is halfway implemented in stmmac, as it's only ever used by
> selftests, and these selftests are failing on at least 2 platforms :
> stm32mp1, and jh7110.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: Remove ARP offload code
    https://git.kernel.org/netdev/net-next/c/85ca3292d7a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



