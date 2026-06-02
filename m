Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D740FCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjwMGrTESknD5peX+eFGJBM0//MZxOS4/vrUF8k4h4A=; b=bCfE1jPpaDNmr60WEdQO3RyFlp
	ODwoIGQAy07tO2yjSq4FS5ua15P2QPulMWGQkMXCPKEe0hbmLAADFZVhrmtOOsnsK3OKmC7QWiV06
	jggJGVACysNOjhGkVxJwH8PHU25vvf10yMwl3L/Dms2uXinY9JDGg01mxmynik9OEzNJaotn37D63
	TI3nQornodw0vw6yKI0tbe3ejjZaT7gnA+Y4XF9MHKWOd/m6AvffRI4NQLwFlYYG1dGE9g19lcGbX
	M5Dgg/QIaMt4+YFhdmvAInuBrFEyC1R2bgbT4ftk/a1goaCV4IhmWwNzCeY7BnKxGcLHQbyJxBdLh
	OA/ovJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVkd-0000000DkIV-3w03;
	Tue, 02 Jun 2026 20:30:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVkc-0000000DkI2-2Xvt;
	Tue, 02 Jun 2026 20:30:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FAED60145;
	Tue,  2 Jun 2026 20:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D4A1F00893;
	Tue,  2 Jun 2026 20:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780432213;
	bh=gjwMGrTESknD5peX+eFGJBM0//MZxOS4/vrUF8k4h4A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TPz3prVeOVPs6tmHop7zUrzU2L7EkX1/zBZUQPFQIzu3j1/B+Vt0vZh7knErzYWYY
	 AWSCvweUNkAe8As9Hy/CMzQOjIKgY7+g7d1NhqjaJSN7DYFOfSjXEOyssLEf0saPHl
	 lJojBMJE/Hfd0+JEFwwyiE8zYTIspelQhFYuVcoTc+qFlKpc5ynQHVE4JtYuwcG1Vo
	 Y9raz6xnyT3vo3QlCgIaH+oIOlTh3tyJ77U/5VcZDKBXpOJdBaFSm0g+mK4GbQmOQl
	 BoCgZhi7/HomqVfUoC7THg/LkS08QvPK1UzHX+LuGgIzx0ulUU4bvGhRWa2PlpLog/
	 DyRGp1RK/lIiA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569AD3811A72;
	Tue,  2 Jun 2026 20:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/6] net: airoha: Preliminary patches to support
 multiple net_devices connected to the same GDM port
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178043221514.1036678.2722673754198790557.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jun 2026 20:30:15 +0000
References: <20260527-airoha-eth-multi-serdes-preliminary-v1-0-ec6ed73ef7fc@kernel.org>
In-Reply-To: <20260527-airoha-eth-multi-serdes-preliminary-v1-0-ec6ed73ef7fc@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, xuegang.lu@airoha.com
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

On Wed, 27 May 2026 12:21:14 +0200 you wrote:
> EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
> Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw arbiter that
> manages the traffic in a TDM manner. As a result multiple net_devices can
> connect to the same GDM{3,4} port and there is a theoretical "1:n"
> relation between GDM ports and net_devices.
> 
>            ┌─────────────────────────────────┐
>            │                                 │    ┌──────┐
>            │                         P1 GDM1 ├────►MT7530│
>            │                                 │    └──────┘
>            │                                 │      ETH0 (DSA conduit)
>            │                                 │
>            │              PSE/FE             │
>            │                                 │
>            │                                 │
>            │                                 │    ┌─────┐
>            │                         P0 CDM1 ├────►QDMA0│
>            │  P4                     P9 GDM4 │    └─────┘
>            └──┬─────────────────────────┬────┘
>               │                         │
>            ┌──▼──┐                 ┌────▼────┐
>            │ PPE │                 │   ARB   │
>            └─────┘                 └─┬─────┬─┘
>                                      │     │
>                                   ┌──▼──┐┌─▼───┐
>                                   │ ETH ││ USB │
>                                   └─────┘└─────┘
>                                    ETH1   ETH2
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: airoha: Introduce airoha_gdm_dev struct
    https://git.kernel.org/netdev/net-next/c/ec6c391bcca7
  - [net-next,2/6] net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct
    https://git.kernel.org/netdev/net-next/c/528c5153a557
  - [net-next,3/6] net: airoha: Rely on airoha_gdm_dev pointer in airoha_is_lan_gdm_port()
    https://git.kernel.org/netdev/net-next/c/eca4f59b5367
  - [net-next,4/6] net: airoha: Move qos_sq_bmap in airoha_gdm_dev struct
    https://git.kernel.org/netdev/net-next/c/069626af6dfa
  - [net-next,5/6] net: airoha: Move {cpu,fwd}_tx_packets in airoha_gdm_dev struct
    https://git.kernel.org/netdev/net-next/c/962c17dd2878
  - [net-next,6/6] net: airoha: Rename airoha_set_gdm2_loopback in airoha_enable_gdm2_loopback
    https://git.kernel.org/netdev/net-next/c/842a7ee50d68

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



