Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA70C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 22:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GP9SU95f64biuKUJLcRleLcU5FnHZvRyJwOtK3VNnU=; b=xnljJda4I8+A/wo3j5rvW9igyX
	C6U76QR8kBtq4RMRcXkLyO2N5lnlWSRs0UkyAAQUQom+assqh1qHfx6jN3mZUrOZ9Iylbl21HqF9e
	QJ00o6wx/Tm/fIAPJs9XOa9Q3YqhAXYgY4nxFAgosDhgy42jK0o3cI/B7gyH7uGKsSL9/WHHATjV2
	HwZCLGlyE3PmiDgYsAClxk7hqWj3dwKBhX2rKGmSpzo967G7ylxxHv/z8qtodagbZDjgng4G5XzYD
	9JJjDlE9gsx/L0yntsp9BRYkmrQgAGxshFZbW4n6tEpOq08lhNN2aOx+NGJhgIAu5wDFG6ErLHeV4
	jrEWY1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5gk-00000009g7F-0zof;
	Wed, 02 Jul 2025 22:12:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5eO-00000009fwp-2zyL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 22:09:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 158415C6349;
	Wed,  2 Jul 2025 22:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3696C4CEE7;
	Wed,  2 Jul 2025 22:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751494195;
	bh=+NxvQYU7wQxyO/16lPutXJsg77AvAE6AeyUKVPB18LA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B4zU45qDeFcwe7TOPtdq6DocquCb3GJzUc0begB9daO6iH4XdJcVLu8FX4ROViPBg
	 1cAjVjfl37Om+Xp1Zz+gmUnhq5CAqjX8MjCSXz6J4X0p5qt6l9ZOUwQSm5AERnNjH9
	 8f3coe5qsf8fnmDvjj+OKxMWv803KAMOrhVySVs+JWUxneznvYPPZLvJfPr/p50xsJ
	 ugN6ntbIVzfaR3JISru3pmWQ1Ev63G0Kkv2twXP3/iCXOdK7/JlR1zMDebvfkD5WZR
	 5we+bJMeNjaLHkG428lhCTHGwYDzFni/ZDvbu+XQOxqwYa/DB6mWa/7HRxJyzF0yUk
	 gH5VdrZqZeJ+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C56383B273;
	Wed,  2 Jul 2025 22:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7] dt-bindings: net: Convert socfpga-dwmac bindings to
 yaml
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175149422000.880958.14366434982913389673.git-patchwork-notify@kernel.org>
Date: Wed, 02 Jul 2025 22:10:20 +0000
References: <20250630213748.71919-1-matthew.gerlach@altera.com>
In-Reply-To: <20250630213748.71919-1-matthew.gerlach@altera.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: dinguyen@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mun.yew.tham@altera.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_150956_795183_8A5E89E2 
X-CRM114-Status: UNSURE (   8.85  )
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

On Mon, 30 Jun 2025 14:37:48 -0700 you wrote:
> Convert the bindings for socfpga-dwmac to yaml. Since the original
> text contained descriptions for two separate nodes, two separate
> yaml files were created.
> 
> Signed-off-by: Mun Yew Tham <mun.yew.tham@altera.com>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> [...]

Here is the summary with links:
  - [v7] dt-bindings: net: Convert socfpga-dwmac bindings to yaml
    https://git.kernel.org/netdev/net-next/c/6d359cf464f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



