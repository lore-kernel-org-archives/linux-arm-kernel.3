Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC84C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 02:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEpCNTpbQ67qH/ZUirGVx/dXQL025PflkfHYH5o9vy8=; b=XGYpmx/ueXZ8lcaHELIGtugigQ
	BGfXRFcrSqTjouef4BODOt91kEedSagdwlMEdqe+3jl0KRhHw864qGrE6Csv4fHG6jfBrR8byREG6
	ReH8vBwWoBN11j+oUjDtlHfphvtdhDu3EgmeF4z25FtreOfuHf72RP/yM5xrveyHsEB7PxYeVbYm+
	OqwKYgA6q5KzFNGNiPgsNRS3uuAPO5+cUGMD6HjjL1GG6/EV2dxNwh5q8A3YmhTMJgPVpWPHyARVx
	IXUOVQRwtpU7lmmfC3OQTNMo+cBhApMS0N4Rm1723D5CMoN2AjsffWnAewtcChbtUUoZ2DOXyItGA
	MEHRGjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqN1x-0000000Cs5v-27eN;
	Fri, 07 Mar 2025 02:01:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqN0K-0000000CrwE-06fB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 02:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 729BDA453B6;
	Fri,  7 Mar 2025 01:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A711CC4CEE0;
	Fri,  7 Mar 2025 01:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741312798;
	bh=ulj+vhipmfz34qioaiFLWEsQ+Aq8r+/RSLJ+tVnvt0o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N5Pqh2+p2XL+6S6QKqbBBqoLPRvmmAuyO2i2szgqMImDiNdWeONioiCzTmsjTGmbC
	 p29GZY9lV/Sg8SCvBoMQ0jMdDb9OR9hHUCb33rY+7J/T8xw9g7CLNfBw/5GOty0e+S
	 FHCvX3YqkXdI2Otl2KWLtwn/RrNNwlhN3fHNOCPP8dIPZYAM+mHxn9caHI2vXVooyv
	 GkpZbZgtmEEJR0OPd76Td8BaX5/Lg6EBGih4lYPhqoRJdsYK6DToQNcaPEA9RUghYH
	 NZaSzn/mLkpjIsh2OuHdfbRAP4z8R19sFhPnUjmDxH+zMJKeCW3Tv6VUIWB12PvPZx
	 VBDA0x//a+Y6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34917380CFF6;
	Fri,  7 Mar 2025 02:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/2] Add perout configuration support in IEP
 driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174131283199.1853786.11033321360799820644.git-patchwork-notify@kernel.org>
Date: Fri, 07 Mar 2025 02:00:31 +0000
References: <20250304105753.1552159-1-m-malladi@ti.com>
In-Reply-To: <20250304105753.1552159-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: javier.carrasco.cruz@gmail.com, diogo.ivo@siemens.com, horms@kernel.org,
 richardcochran@gmail.com, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org, danishanwar@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_180000_156709_9EE1B42B 
X-CRM114-Status: GOOD (  10.16  )
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

On Tue, 4 Mar 2025 16:27:51 +0530 you wrote:
> IEP driver supported both perout and pps signal generation
> but perout feature is faulty with half-cooked support
> due to some missing configuration. Hence perout feature is
> removed as a bug fix. This patch series adds back this feature
> which configures perout signal based on the arguments passed
> by the perout request.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] net: ti: icss-iep: Add pwidth configuration for perout signal
    https://git.kernel.org/netdev/net-next/c/e5b456a14215
  - [net-next,v4,2/2] net: ti: icss-iep: Add phase offset configuration for perout signal
    https://git.kernel.org/netdev/net-next/c/220cb1be647a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



