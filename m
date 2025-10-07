Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE66CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Y/zdYIkMdIZSjqi1MDbEnzlo0MXBm0/u/viL/uwMQc=; b=LRkHmcxpzV7DZYqLsEYAkEiDGO
	Sl6z7JgntuPURlE36Wn3nAEw9RKwKIj1GzvS/TB7gmg9LFBKP1KqgSL/BSp67062bnxnilBv9MHNW
	zzmPHM/d/Ee7IDA9gieXTCMuzdje4WJj0MbyOJZ+9ar7d4RQsobsLsX1vBMc6dr9qRYYFASq8XS4N
	V3T4vaouNkj2YccQiovdMYMdJYs2+oYMe/zPae4ogxEBS6rJ9ylJOtiJq/u/Pb9CtV4bKLjBB+BAv
	8cOwP/M0t5qTNq3UDyfw4Ei/JDc2I1dNG58IcBFDkGxQsdVawEoVU594frKVMdCnrZeJSzzT6Syfj
	bsCyLe/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64UV-00000001l6U-3v2q;
	Tue, 07 Oct 2025 10:00:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64UU-00000001l6N-2lRQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 10:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13577612C7;
	Tue,  7 Oct 2025 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9ACCC4CEF1;
	Tue,  7 Oct 2025 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759831217;
	bh=26b/KkPYJCt6d8MrfpnwaQ7x221GWUL75dA2hP3alhE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IMO+ErHEr9iZwPsXmadTwtt/i9torSmuWIEjGHKQhdOHtaPrHhgOqaT0qcQQ4jlVL
	 RLtHucK7Q2ee+rgfs44Y73I2V+oNlX7g/t09LpQq4DJ2M5jszZIBXoYLZ5ZJauXI+1
	 q7RYVHPYm/Xh7LQMkkGGjQfyUuGdZXy5nnMMSpJo5/V/8urMqVXR9KpJyBAX+Rkd7q
	 /M/vO0+Te5IdIds6R/ifn4yRFez2VfN6BG/ZH8E8RH2WM9cmdX59IqEKathBX1Yudf
	 UtMBn9+Pg++wjfWWXarrY2U4XKsuioSph5r1SlgBe3sNxFXMtOWqqRRvJsj/tIRrBn
	 sAu4so41KIOxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33EE339EFA5B;
	Tue,  7 Oct 2025 10:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: sparx5/lan969x: fix flooding configuration on
 bridge join/leave
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175983120701.1833525.11091874014123062686.git-patchwork-notify@kernel.org>
Date: Tue, 07 Oct 2025 10:00:07 +0000
References: <20251003-fix-flood-fwd-v1-1-48eb478b2904@microchip.com>
In-Reply-To: <20251003-fix-flood-fwd-v1-1-48eb478b2904@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, UNGLinuxDriver@microchip.com,
 steen.hegelund@microchip.com, jacob.e.keller@intel.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On Fri, 3 Oct 2025 14:35:59 +0200 you wrote:
> The sparx5 driver programs UC/MC/BC flooding in sparx5_update_fwd() by
> unconditionally applying bridge_fwd_mask to all flood PGIDs. Any bridge
> topology change that triggers sparx5_update_fwd() (for example enslaving
> another port) therefore reinstalls flooding in hardware for already
> bridged ports, regardless of their per-port flood flags.
> 
> This results in clobbering of the flood masks, and desynchronization
> between software and hardware: the bridge still reports “flood off” for
> the port, but hardware has flooding enabled due to unconditional PGID
> reprogramming.
> 
> [...]

Here is the summary with links:
  - [net] net: sparx5/lan969x: fix flooding configuration on bridge join/leave
    https://git.kernel.org/netdev/net/c/c9d1b0b54258

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



