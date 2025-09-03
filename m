Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99096CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ML+hKQUXoV3XdTQejYj2/Hn0lGJZliYZdC6cGyPre0=; b=fh6JRKyqSEO47Opl1M/BnLgWG8
	f+0UVKNeNmNHR4NHYeU83LsyxeA4LFCCHPgmnipZx4fRD0jEWeD4SoRZPuXA2ShWZ3214K+Ka725M
	uxfyg68ajv26erbtzXWbxQ5HwgKi0JMVsUnWMk4yZHep1zQjC7D3I0o1AYDS3F3o2MQS9Vf29mdA1
	Utaz9HWql3C3/RiAGiclxRucsaes5d4Kelp1mMHVjvu1KCOIL884aGtySdvFCSxczF0unZKQbaONy
	aMyietYmOlb9yqfw3o58SqmJHqNb3Mx9eunq+rqAGx2bp8JIB6fuR2dW8Ns1zpGSrR9Zu0SUPLL6X
	iBD2pzVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzRD-00000008Fcr-2Jxo;
	Thu, 04 Sep 2025 02:10:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utw97-00000007oVQ-2Qui
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 22:40:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FD0C44C2B;
	Wed,  3 Sep 2025 22:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CC8C4CEF4;
	Wed,  3 Sep 2025 22:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756939204;
	bh=vb66h9+AzAw2lQhvhLgXxbLZecvq8uS2NeBKhLSK7Gk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N6RhNx8jpRROyDZe+XUWTkfm1JtwHinLea//T8JIUgoujDUDTvV/fzLjeq3NijALK
	 PtjnUz3Ij0I3iRQtKM1m9RNvrnmDApzwbQx3DBMhiX7JOOeUA2urDZkNIxMZ0oPUFO
	 dyITwlOW6DDwDGzF7Y1Kb2xdl1XGQETChSx8ShkWKCZUtOx3IfQYRmjL7smjHE5SSN
	 BGMSgo8qzH9Ebb66sbypzr/QVW4mg4EFBIWBxo7IuTjs+6wjgLR/pK1Xc5pJIcZ0e3
	 gHJccWVPVB72HhNsUbLlqomja6f6Hu/0MWKeb8Qlvpz+7YaPAi7hm1hcRgDfZmvdg/
	 3hHfOr3aaAJpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE77D383C259;
	Wed,  3 Sep 2025 22:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain
 interrupts
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175693920948.1224224.17708323821757004154.git-patchwork-notify@kernel.org>
Date: Wed, 03 Sep 2025 22:40:09 +0000
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: matthew.gerlach@altera.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, romain.gantois@bootlin.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_154005_641624_0DA55440 
X-CRM114-Status: UNSURE (   9.22  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  2 Sep 2025 17:40:52 +0200 you wrote:
> STMMAC on SoCFPGA uses exactly one interrupt in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain interrupts
    https://git.kernel.org/netdev/net-next/c/f672fcd8e6c4
  - [v2,2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain interrupts
    https://git.kernel.org/netdev/net-next/c/69cd99350740

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



