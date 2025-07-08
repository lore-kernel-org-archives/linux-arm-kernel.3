Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB92C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yg9kKA9ShSCBeqdMp8KFUUO+9R7nQ/wypFNpILDJmT8=; b=bzmeKG/dqCkI0vXOsqVCSAcUdu
	PVVw6o2+emzMYpmDQ2ic2g8SPYNhG/JlS4zwovQOuBJzWfdxHHpatoFtmiBp5l8reVc/BoZ7PAvMO
	fCdUGTPEY+qjkLi+UQV4n+Z39cdDDbSmq1S3DlvUdphEGUz653NhB5IF9CNYd8ojc4zxR0cUO3N9d
	/nSnXw1EnlpMsxXAppWL0BNyuvs4yUl/WxTjWeD5hxfG32XOieAFJUb3SQnC8DuDKVhwbBAYfQoHX
	s/GfoYpBEUbusJgSGSD180EJX0PeABSQNm3TBLBRLfXq6hAiwLN4bTcwH6Bg5UtKSpS8V330NRgpE
	kmbLUpQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZB1F-00000005wqe-13o3;
	Tue, 08 Jul 2025 16:18:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAQD-00000005qLQ-1EM5;
	Tue, 08 Jul 2025 15:39:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 365EB468BF;
	Tue,  8 Jul 2025 15:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D58C113CF;
	Tue,  8 Jul 2025 15:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751989192;
	bh=2dVWBRbn7gB2Ip/RlIdkUkZz/Rfmr06mo3cGo1b4rww=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Pc3DNh+l1RpFaZlYhTszhX8cCsz1wthZhDWmuPo+ecfsby6b5ViLgOPTP49pfSLf2
	 yaxaHFu5zySYk2NBkcq5YVmZLB0xieNPYwks7MxbJSoSO6ychhjvtRvpMprL+pksox
	 B0U9UwFTOMF1IUoxapjFos8GW/xqW6rM/kteQf81UhoqbBspO1kLy2OL5MKHcV5F7P
	 z5drLw7+5TpbO84YD3kmTAftUFVeTNUyHs+uQ1v6eDgf9HcqFSIBC9HKESOBK1kuHO
	 WxK2iTvVdCDIykMvq8nG36uT0Eq37LD4JCb2KV3Qo/p6+vTDxnMkSjEmP34mTEOOup
	 eD9pD934dD3JA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF23380DBEE;
	Tue,  8 Jul 2025 15:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: Use of_reserved_mem_region_to_resource{_byname}()
 for
 "memory-region"
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175198921449.4109948.4233904328306529560.git-patchwork-notify@kernel.org>
Date: Tue, 08 Jul 2025 15:40:14 +0000
References: <20250703183459.2074381-1-robh@kernel.org>
In-Reply-To: <20250703183459.2074381-1-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nbd@nbd.name,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, elder@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_083953_393296_A2293D48 
X-CRM114-Status: GOOD (  11.75  )
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

On Thu,  3 Jul 2025 13:34:57 -0500 you wrote:
> Use the newly added of_reserved_mem_region_to_resource{_byname}()
> functions to handle "memory-region" properties.
> 
> The error handling is a bit different for mtk_wed_mcu_load_firmware().
> A failed match of the "memory-region-names" would skip the entry, but
> then other errors in the lookup and retrieval of the address would not
> skip the entry. However, that distinction is not really important.
> Either the region is available and usable or it is not. So now, errors
> from of_reserved_mem_region_to_resource() are ignored so the region is
> simply skipped.
> 
> [...]

Here is the summary with links:
  - net: Use of_reserved_mem_region_to_resource{_byname}() for "memory-region"
    https://git.kernel.org/netdev/net-next/c/e27dba1951ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



