Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C499D3B7CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pw6byHJuK/WA3pAUi4gj22x3Siw4nUh6QIEq2P4Iyno=; b=SqJQJZ5GG7PZyFIbPdmjsiYWyh
	UbzooZF9KUkGXly/x8zs/yPwhIKzDZ1JtG16elSGbiJ8qGj04QCMOmuTqkhwrxUQ1bSLF4eds4Akq
	bnuhfhYCWS+kbiiuRJ/MpdpajDlSDfIJ+1BV2y0vKq7rPi9LWcm46lS66eLH6UIGCZkMSv2p/zV4T
	EHtxjy6UHmGRfdJ0NAkBTJjR5hZXBrQZXBbXCJyRV+jM6wrtJ1ExkrDDkeIeeNClFIpN/I55iyaka
	p3L/GI85ClOqsHGGioA5gWrowyCTW/IY3ZkiPzWfgqOTJ4D1soiG8sJDfvY+3b7JMZG5iO0BeKi+A
	Xv24Yqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrlB-0000000A7Es-22Bg;
	Tue, 26 Nov 2024 09:21:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrk6-0000000A6Po-3Df9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 09:20:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BEBB5C5CE3;
	Tue, 26 Nov 2024 09:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAE4C4CED0;
	Tue, 26 Nov 2024 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732612821;
	bh=Ctg6MXostCZ1aJoI4FFc/g312bq9jtegH+oNd3mbPbM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hMoVL8rgbDSJZsho/GqGrLQfqMe65YqL/OcfkOgVu/5jtxIXo8eRmaxd5wQMHI7Nw
	 NOpZRQVuhvE4/31lTFsVwpoOXbRIjh8MmLZlhrpC8eIOoSvx1X0a5myta69XiHNnyh
	 WbGIGB6h6kr7sxp3NIu2OXa4/KGahf4K56dR1iU5okxS2CJ+uTHGVlypIj7r5/mfuD
	 3zpFVLmxKFDzPZB1ZIgdNYca9r8eZ0h9j2Hlf75mjRDYzvGWLEgkZg8EL+YJibtO9G
	 w6Drte+7iDFIi6DA5fcAK/wscZBGCqtrcTo55HOA0ug0sHRJ8vpIzIYNYlFzcCoNWR
	 veNEsxTuP20/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEB873809A00;
	Tue, 26 Nov 2024 09:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 1/1] net: stmmac: set initial EEE policy configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173261283425.319179.1006458233398022415.git-patchwork-notify@kernel.org>
Date: Tue, 26 Nov 2024 09:20:34 +0000
References: <20241120083818.1079456-1-yong.liang.choong@linux.intel.com>
In-Reply-To: <20241120083818.1079456-1-yong.liang.choong@linux.intel.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: andrew+netdev@lunn.ch, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012022_849344_2CB6701A 
X-CRM114-Status: UNSURE (   7.37  )
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 20 Nov 2024 16:38:18 +0800 you wrote:
> Set the initial eee_cfg values to have 'ethtool --show-eee ' display
> the initial EEE configuration.
> 
> Fixes: 49168d1980e2 ("net: phy: Add phy_support_eee() indicating MAC support EEE")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: set initial EEE policy configuration
    https://git.kernel.org/netdev/net/c/59c5e1411a0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



