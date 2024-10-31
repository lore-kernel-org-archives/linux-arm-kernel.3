Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D910E68945
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 01:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThDhN3GWQt3kHmiWetcbg9JZurPPNaqVLtlQ73P8Z84=; b=Q58dO4dKhu171xyuImvhb75K3g
	zW6vuV7CPV3YO5UICy8y3/2IAnegOHFYGbiWl2naChDbz7Q1xzSCF5VKva9FKwPK95eK74v1m1cR+
	pHavzs3tOiguxjrrqHP9ortV0f0zC4IDg/NqouM5DzdWu2fh7LGVbnxUnNtsPuVgvBx3oQKZSMT0K
	xDuBwGBur12phksoCrksk935GE598wKrzZW0ZB9gbZTxLKkh7NAwC9lB7MNNMh9nIWf5FMa1IEcGL
	CeV5KjkQiDQwT8t+fBI8LmKqVceufjaHtSr3BKucoF48i4RkZWdkz7vdbOWDr6yLwWiSbCvnF3MDq
	F+T9GCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6K2v-00000002FhP-3xat;
	Thu, 31 Oct 2024 01:32:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6K1G-00000002FMd-2RwU;
	Thu, 31 Oct 2024 01:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CBA19A42FD8;
	Thu, 31 Oct 2024 01:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30ACCC4CECE;
	Thu, 31 Oct 2024 01:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730338237;
	bh=zKCjpv8+1lbNnJfxI1td7Yfa4dTY/6Q23nx1o7epz/w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dvVTFpoz2zeLzmalvJ644eVaHYRGvH/sVELhXMmvVgUqNmmDAyHnxKILkRqBaN7v3
	 +/yGJDLwy38/atBA/uHD4/LEajFKgB92saiBPg5M+SSMe2AjeRufYn2UAPsSCDjE1M
	 ecgMsY8jTRHfgiXb9XIq2BUJDQPYYKwTvBHJV3ryRnZPksmssUKNkeL+guLwCzJmZ+
	 7yzrJNd/EsH/gE9z45wrkrUbUOHjkZ8lzkQqWRyPYMtGMfzo+myhyrDdlmXAoMXSfK
	 7zCvED+cZ609Akz2Skquby6YGQKk2rSVCNdCLxL4/PPkEx2iei+qq9dLWhb7Ez9lJy
	 ntmvSQr33OoAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E85380AC22;
	Thu, 31 Oct 2024 01:30:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_wed: fix path of MT7988 WO firmware
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173033824500.1516656.10424545238538168762.git-patchwork-notify@kernel.org>
Date: Thu, 31 Oct 2024 01:30:45 +0000
References: <Zxz0GWTR5X5LdWPe@pidgin.makrotopia.org>
In-Reply-To: <Zxz0GWTR5X5LdWPe@pidgin.makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 sujuan.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
 lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, sean.wang@mediatek.com,
 nbd@nbd.name, john@phrozen.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_183038_703631_A29E5F55 
X-CRM114-Status: UNSURE (   9.71  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 26 Oct 2024 14:52:25 +0100 you wrote:
> linux-firmware commit 808cba84 ("mtk_wed: add firmware for mt7988
> Wireless Ethernet Dispatcher") added mt7988_wo_{0,1}.bin in the
> 'mediatek/mt7988' directory while driver current expects the files in
> the 'mediatek' directory.
> 
> Change path in the driver header now that the firmware has been added.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_wed: fix path of MT7988 WO firmware
    https://git.kernel.org/netdev/net/c/637f41476384

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



