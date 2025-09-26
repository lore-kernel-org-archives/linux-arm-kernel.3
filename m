Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C854CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 21:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LvHOq0MM6cF+ztpWX/MaD1HR3prBt8FPAOdjvnzsOU=; b=LUI0BjOWJcNUAbuWhGUrga+PjW
	UK14OEF5/uvSEzNCdnUhRalBkMaixi0C/JOCHfJ4Gb7fgTI8zXVzXB8QBD3DsK8D73kIDAR+3Gxj6
	4cl7pTYmVetE8K2ZPHl+2vxP9Vly8huVAw985PZw8G18Gao/Q+TxragLY+cKmFvvKcNXPG9dfPBJX
	/4+2DPQCR8S/gdlw695zTHxXeAR7wiHGAEoFEK8Ogq8JMSsoqNZR1w+AMISP3lJgbizDxmu1cjTVF
	eETbc1yfaXk3fvbayGrumlblrSFfH9no0L4glQpHzkpQtB2o9habiiOK49uOmoACiEgo7qXP96OZu
	pNQ9+l5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2G1B-00000004g35-2dl3;
	Fri, 26 Sep 2025 21:30:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2G1A-00000004g2L-1nRV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 21:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C535A61F90;
	Fri, 26 Sep 2025 21:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CC2C4CEF4;
	Fri, 26 Sep 2025 21:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758922215;
	bh=vJRvNHlUyxJM2/QCBFGJK3xtYb9Txki3VIvUAgKBbuQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Kb1kZsGmnvwufEzmJkk6u/CRYBW8dFJBgDp24E9B8fatIlQl9fK03C3m35121z+3G
	 Mjrtj7poay6kow5siv/7CALzYQht4zXz4cz/dNAL3bA0g9+ypU0UJVaqo33jJ4UqAL
	 iXMxokZvp9LYi11HK8qbsBUtzzmkxgCP156CGst1uffyI9f6E+iRd9ORja1199EAe4
	 8PNn/miI9zKcZ/pKhkX0tAjeKK83H9TeQW1URmWWG6eHJCHEzJY0uaVaehFkasZxrE
	 yTfQCLZpYZaulbs4gD9iFGHcyBoALSKEQkXP8iMQqACKFRde5AyUGNsVUmSjBMCbC9
	 0ys6vcTvB8peA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADFA39D0C3F;
	Fri, 26 Sep 2025 21:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] dt-bindings: net: sparx5: correct LAN969x register
 space
 windows
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175892221049.64518.18391583917554709725.git-patchwork-notify@kernel.org>
Date: Fri, 26 Sep 2025 21:30:10 +0000
References: <20250925132109.583984-1-robert.marko@sartura.hr>
In-Reply-To: <20250925132109.583984-1-robert.marko@sartura.hr>
To: Robert Marko <robert.marko@sartura.hr>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, lars.povlsen@microchip.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 luka.perkov@sartura.hr, benjamin.ryzman@canonical.com
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

On Thu, 25 Sep 2025 15:19:49 +0200 you wrote:
> LAN969x needs only 2 register space windows as GCB is already covered by
> the "devices" register space window, so expect only 2 "reg" and "reg-names"
> properties.
> 
> Fixes: 41c6439fdc2b ("dt-bindings: net: add compatible strings for lan969x targets")
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> 
> [...]

Here is the summary with links:
  - [net] dt-bindings: net: sparx5: correct LAN969x register space windows
    https://git.kernel.org/netdev/net-next/c/267bca002c50

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



