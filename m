Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D234ACA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhHOq1OTw3SsBQaFttUcBpiTA8zpQkRkowu1bheecks=; b=EaUcSkd09VdeGzXAczv+tOgOno
	rv43CLCzW4H4wzzxkhmCMuN4jEw1jHApnyRuBdtPdAIIhziBlVnsledrII1Qlv+0vXL+B5g9fMw0O
	w8jd63CVGODY7T8OPibqyHsHHT/JTSW/KgkrXfOH814T1dDxop1jdQyddT1MVqn4nzROhc1Fhibjw
	JVnjdcw/R7eEOfyJY9s0ySwJR2USdkbP/dli9bBFpcApA2SvXO/PJvTGen2LN6DGJ0rYe8H1d8KCe
	4zTytmHHMOEyYxxwgHB+WCFA3UKoRKgXkSBnA823Y2MPv4aLkKlQ1rCvveW8g20voYS6sVOBnmKCz
	O3d9vilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4xO-0000000Gz4p-3g8T;
	Thu, 21 Aug 2025 13:03:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1m3-0000000GQal-17O9;
	Thu, 21 Aug 2025 09:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6F7644559;
	Thu, 21 Aug 2025 09:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77C9C116C6;
	Thu, 21 Aug 2025 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755769197;
	bh=9xUmbVQEMPreNhlqJGOMpcviTh+j9TmH8hQ5UrB4JO8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ho9fAYlX/7B/r2TSrrOUz80WAC5u1O8aEA8bL/7l4JpH8LlRGe9p7BN/yr+aJ5di1
	 Xf8LUJHB+RRLP/5wGN35XXWpIXagc58kp8bLkp+mMAgcwcjqOYtGRpvQOu/AOfMcHR
	 DyCBHx94ysFAxNmzRCpu7MJU3DqFuQDKkbynvInS1Sx+sSRZQTwGl7JaT5lEcmkUkQ
	 a/JFm/CqPKfFkN6mhqcRcdNWHo8sDrOwpqljBE5JBG8H9/om7D/CzSx3otGfxovqMX
	 GZJNoOdpJ45MHWN8lN5nv5KAXhmTWPSZowh08N7Ja0JYpx2K30cJWgVOVWTNbErii5
	 AT1A7l0RJYTUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB142383BF5B;
	Thu, 21 Aug 2025 09:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: ppe: Do not invalid PPE entries in case
 of SW hash collision
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175576920651.962267.9015249362878728671.git-patchwork-notify@kernel.org>
Date: Thu, 21 Aug 2025 09:40:06 +0000
References: <20250818-airoha-en7581-hash-collision-fix-v1-1-d190c4b53d1c@kernel.org>
In-Reply-To: <20250818-airoha-en7581-hash-collision-fix-v1-1-d190c4b53d1c@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michal.kubiak@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_023959_425375_4E417125 
X-CRM114-Status: GOOD (  13.03  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 18 Aug 2025 11:58:25 +0200 you wrote:
> SW hash computed by airoha_ppe_foe_get_entry_hash routine (used for
> foe_flow hlist) can theoretically produce collisions between two
> different HW PPE entries.
> In airoha_ppe_foe_insert_entry() if the collision occurs we will mark
> the second PPE entry in the list as stale (setting the hw hash to 0xffff).
> Stale entries are no more updated in airoha_ppe_foe_flow_entry_update
> routine and so they are removed by Netfilter.
> Fix the problem not marking the second entry as stale in
> airoha_ppe_foe_insert_entry routine if we have already inserted the
> brand new entry in the PPE table and let Netfilter remove real stale
> entries according to their timestamp.
> Please note this is just a theoretical issue spotted reviewing the code
> and not faced running the system.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: ppe: Do not invalid PPE entries in case of SW hash collision
    https://git.kernel.org/netdev/net/c/9f6b606b6b37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



