Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACA6F531CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 00:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmztJAtQp3lXbAeVxOzFDfMVFRe01xG94u2MjU6gIww=; b=yUl08+PyZXPZoBG9S4AbYzDe2Q
	bueZTCJkh8DtnYN0zspumWQIXxP5xxlGISheUlMMKOCe1TP/nIW04yMt3W1PSqeYrHhGV4hbrFiI5
	y6trQSZNGcNO8hvtLqoiVJtmbTLFvrGAyWK42aruSwWHPqwGQalcUP2PpeqXV+AAD1QTzaYu9LfRd
	cXw4RyxHvkdZEj/qJFVJIA+zueHo5sPY6FK3h+lfiPS5Nxs+8rL6SCfNHTqiNVoLMuTep5Fv8dtaM
	tO64UdkR0DoBGkcarAXQ73firN1v8Cufim/PQUhF2JPP5W0/5c/CFtbK2jQsCA5ZbHW7+ZUx+xVkh
	EPSbRiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRCs-0000000GV15-3Wrq;
	Tue, 14 Apr 2026 00:00:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRCp-0000000GV0X-3xHV;
	Tue, 14 Apr 2026 00:00:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74050444C2;
	Tue, 14 Apr 2026 00:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7C2C2BCAF;
	Tue, 14 Apr 2026 00:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776124838;
	bh=uUXgRgZxekROlhnbfJX/9FLXh2pbw88Xdl9zxwLhSsY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DLa77CepKtp8eyhPqkxd1dmQZdPm/oF9MOyJ5N1D0f8deK+YUf+SJJkxsXWQikyDs
	 YWzcQfUQ1KxRT9qarQ0Z5sOt+XelZx0O6hLDg1PqQST4TNBfhzstT8Q2M7Zyui1UTa
	 T9pgL7VYAiBH+/Ei5kY48aDNid2R5GjJTaPDXHrRQYEiEQFY21uc87WHZFqaLx/NLc
	 miWNTNp1Dmw/TPuY+DOdr/Bk9UVl05GVTLX4hNjLvgIYBSY7ylFcwGgLJSrFOGapAN
	 B9GsSUMDCyrbl+0Wv4THFUEri5HZdj6c9/tr+cSAbNrvj+n+Iy1Duqvk5BNziOprYs
	 fnKgayXDOqydA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CEC83809A0B;
	Tue, 14 Apr 2026 00:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: airoha: Preliminary series to support
 multiple net_devices connected to the same GDM port
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177612480929.606407.7600477899196250547.git-patchwork-notify@kernel.org>
Date: Tue, 14 Apr 2026 00:00:09 +0000
References: <20260412-airoha-multi-serdes-preliminary-patch-v1-0-08d5b670ca8f@kernel.org>
In-Reply-To: <20260412-airoha-multi-serdes-preliminary-patch-v1-0-08d5b670ca8f@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 xuegang.lu@airoha.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_170040_007082_B3307055 
X-CRM114-Status: UNSURE (   9.28  )
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

On Sun, 12 Apr 2026 19:13:11 +0200 you wrote:
> EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
> Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw arbiter that
> manages the traffic in a TDM manner.
> This series introduces some preliminary changes necessary to introduce
> support for multiple net_devices connected to the same Frame Engine (FE)
> GDM port (GDM3 or GDM4).
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: airoha: Rely on net_device pointer in airoha_dev_setup_tc_block signature
    https://git.kernel.org/netdev/net-next/c/360d745a5319
  - [net-next,2/3] net: airoha: Rely on net_device pointer in HTB callbacks
    https://git.kernel.org/netdev/net-next/c/8baf4bf72ef9
  - [net-next,3/3] net: airoha: Rely on net_device pointer in ETS callbacks
    https://git.kernel.org/netdev/net-next/c/ae32f80018f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



