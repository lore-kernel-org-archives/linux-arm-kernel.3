Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FBFCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 23:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvSSqdabBs0jxwWTEOy0r4WILCtl9qbCKKrcLt2u3BQ=; b=mfaM5ffaT+ih/asRWTuwXECD6w
	pyOKWoMC2IDBx3W0owivVF4p/0q7jkd7OnpiS+x46WvTnJyb7ZQR08AYEciYStXyc1f5pbsLPHCED
	SyeTDVXrUzNmuQZlfzpuaQjZP2CFRz7k45PMUgfdNVdt+sFIoYnJZkPqY8vpvea9RhjtYMVQDJ3hV
	+unHXP/qUpbeQdNVQLBM8xGDq8MD1vyZ5+rFWCPyQlAGVWN3jl7S5osn3mfFbpoazcaWNjPL/0ro6
	cmPOwOT3tibdLe2/lAI8ib/EKhFGcgmTUBryXFfOVG61DrLTnwcsD47BBrY5m+51OV/Jgh9wNJkQZ
	5CV6J0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqgOZ-0000000A7Ge-0Nim;
	Mon, 25 Aug 2025 23:14:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqgKA-0000000A6eR-3Wic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 23:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EAD925C65A6;
	Mon, 25 Aug 2025 23:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFE2C4CEED;
	Mon, 25 Aug 2025 23:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756163401;
	bh=tzXq4twNoex0WercRwFPA3AFqoDMKErjDAjo9XOfCh8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vCWYb5a+m6HPjw3SQWqnkit4NoKO+144n2Pg2Ivdjq6oaT7evYlrvyqbvFH7oANw+
	 mNtITivMaHMpsytWrbuj9kfHof3hmztgH/z/Et0yucNn8AupPA9R4pbzjF1caj3+zu
	 xRS05/gKXcvJOTocIvOOjeMet+TaVojV9ZVnT+LFj+bZgCPec1dXG2rnwuuFuitw/h
	 GoG9a3fFunrAK83gUk0qv0suVamCXpOH3acdP5LLYbkH7NH0N4cv+t45UlowNJ1UZQ
	 6itPRII68w7/GlwBSREbahq8DRtSO+f0er2QltU2SytFmGfMuNbNcHSeycQgKHYdsh
	 3447uLnrSYtpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFD0383BF70;
	Mon, 25 Aug 2025 23:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: net: litex,liteeth: Correct example
 indentation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175616340924.3590689.9893533056849831270.git-patchwork-notify@kernel.org>
Date: Mon, 25 Aug 2025 23:10:09 +0000
References: <20250821083038.46274-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250821083038.46274-3-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kgugala@antmicro.com, mholenko@antmicro.com,
 gsomlo@gmail.com, joel@jms.id.au, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 lars.povlsen@microchip.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_161002_922485_ED5A7071 
X-CRM114-Status: GOOD (  11.04  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 21 Aug 2025 10:30:39 +0200 you wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces, so
> correct a mixture of different styles to keep consistent 4-spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/litex,liteeth.yaml         | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Here is the summary with links:
  - [1/2] dt-bindings: net: litex,liteeth: Correct example indentation
    https://git.kernel.org/netdev/net-next/c/bc2741b032f8
  - [2/2] dt-bindings: net: Drop vim style annotation
    https://git.kernel.org/netdev/net-next/c/7f052126ff38

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



