Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74F9E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2FXL6HIHZScB6Hk6JPyRkVBmRwnypj7PJ8UCVYpvXE=; b=0M81gvCqPhuTxC1lIiYFOiTNEy
	iAmK+Pu/oTnKSKflx8GCuUi2e3ljq2A1rC/BuPeTBY9LnMqnHtcIqZIXeHDZ1MF0dVkUw6+ZA7kd9
	wp7NFA0JeLfewbgJGKwrJyZTpZTMACxt9/KtnJCnGu03QPpwRSKaU2kSYma/wBbyPFifSWY5xxhuX
	aDwdnTYPBGdd4L3qkeQVJ4zt7u0tFDQ8WOdtyJOLzwAWUa6ArhZvfWI5K8IP1ufOev3easyh18bgg
	qrqlQS3lZVXTU++8y0Pw+qqxuOAgp2gT8EylPZ8/ikWRdLAjRaQa+0XY/DInohwfEfzydWi9ktufH
	/BTHydxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrXV-0000000BpvT-2NmO;
	Thu, 09 Jan 2025 12:21:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrWF-0000000Bpdb-3PRe;
	Thu, 09 Jan 2025 12:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6AE8BA41A34;
	Thu,  9 Jan 2025 12:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED65C4CED2;
	Thu,  9 Jan 2025 12:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736425210;
	bh=1y+/0y5Mn+3mmY+Rqdubf97qrdL5lDWfwQl+N0okVJU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bBTDpivSMWuijJnQh3u2XfH9P2b2E4ReENVkg276ScYNV8Ss+42DNVlNmjVmLQUr3
	 apQ2/amP9GMMjCFtqCT61NPIdITDXPY3uOrt3IiBSUrkpuAmcy0AvW1rEVOc+6oMLA
	 ML6onBd5rB0YzWtEyB5mMrqlq8WiKRlUfKdxN3y4+Ll6leBYD0RWQQi4rH3o/LhEJI
	 RjkHYtHLgkgOIxn7mk1Zv5WdZ9OkR/GN+tYej1kiYzelwtXhPIVn3q7RGwH5N3NfTl
	 5UJfKT0FaCYrZQ6CwtVlUj2LKCfvg1L7TLY0H/xKpSbZ3vOqp+CKpUsu6+e7STHpdg
	 6GZHN7Aa/zmTg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DFA3805DB2;
	Thu,  9 Jan 2025 12:20:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] dt-bindings: net: Correct indentation and style in
 DTS example
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173642523202.1303894.12707902460357622367.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 12:20:32 +0000
References: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, opendmb@gmail.com,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 rjui@broadcom.com, sbranden@broadcom.com, mkl@pengutronix.de,
 mailhol.vincent@wanadoo.fr, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, kvalo@kernel.org, o.rempel@pengutronix.de,
 dariobin@libero.it, christophe.roullier@foss.st.com,
 grygorii.strashko@ti.com, s-vadapalli@ti.com, rogerq@kernel.org,
 briannorris@chromium.org, Frank.Li@nxp.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_042011_989685_DDE27896 
X-CRM114-Status: UNSURE (   9.01  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  7 Jan 2025 13:56:13 +0100 you wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> [...]

Here is the summary with links:
  - [net-next] dt-bindings: net: Correct indentation and style in DTS example
    https://git.kernel.org/netdev/net-next/c/9d8c354a56e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



