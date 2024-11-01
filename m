Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79056E67498
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 02:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/iE2NzGokqY5fcXFFGNn15rcpyTO8l1veRl0rG6C18=; b=ha0j6QQ/lrgcqLtVqAcoChRyQh
	NXTP0wjgokJvzMlcajI6xOlKEdi/V1R9LSPiaVkRpiJNMRTI+HDYH/m1JZqI/28xCrQ8rj1EAG4Pv
	VLn3j4ff677R3eBrHK2MNFQA9gYMd2UXrcGzk6aio8EAyChngLcfTybxxScloY5wht35emYIbF99U
	EoVv686wMmJRauA/MrcS6zulAFCl9nFacVXASCuMrXD3p33ow2zeGulFS3BaTXR6UtPKqyaZULqEi
	9hpvGd/x6zJf45AOv4t5IRZgfDFcSn+zb77zF5kHwqLftRUoEARoPVoEbZtVSDhUK/hlrE/iwDf+F
	8ZZ5yjxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6hc4-00000005Zhw-2I7g;
	Fri, 01 Nov 2024 02:42:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6haN-00000005ZIg-19gJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 02:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40CCEA4162B;
	Fri,  1 Nov 2024 02:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD96C4CED0;
	Fri,  1 Nov 2024 02:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730428824;
	bh=hPom6XFQ8qBzLHhYj0bj1tSoFVlQuFqEEm6gsee2TWw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=skCmTBHqRx/7k+TGgQq248pTzZQ3YBKKgqkhZB4Av8EbKG1UI2B+noqChRS3zXMPt
	 /IS5/2UfAavsUHrZqbF6tVuPjnGMEG7DwT2AqxV+YfAuwXnMNUOEK6bvWFUM2YScnF
	 Lp2jJtwi8HYtXA3H9gYE3Kh6+00ibxxOBXcn5K1PrWDktkul1eorLNec59jQ/aQLxr
	 JR2CN+h2ELS/XAb5QGHH6xi8cHZ4P6sdWEgF5b53AAa1hVINQlKKK27e7BUYO/xtr9
	 BkD2RBUJrnT+mQGQozjAOZatRkWrzVO0QITevRJUsfKWrTExxt5KI5466hduvvdqiV
	 OPDdaxALC1AsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE77380AC02;
	Fri,  1 Nov 2024 02:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: dpaa_eth: print FD status in CPU endianness in
 dpaa_eth_fd tracepoint
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173042883250.2159382.982406472849657183.git-patchwork-notify@kernel.org>
Date: Fri, 01 Nov 2024 02:40:32 +0000
References: <20241029163105.44135-1-vladimir.oltean@nxp.com>
In-Reply-To: <20241029163105.44135-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, radu-andrei.bulie@nxp.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, leitao@debian.org,
 madalin.bucur@nxp.com, ioana.ciornei@nxp.com, christophe.leroy@csgroup.eu,
 sean.anderson@linux.dev, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_194027_397268_1607A451 
X-CRM114-Status: UNSURE (   7.64  )
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

On Tue, 29 Oct 2024 18:31:05 +0200 you wrote:
> Sparse warns:
> 
> note: in included file (through ../include/trace/trace_events.h,
> ../include/trace/define_trace.h,
> ../drivers/net/ethernet/freescale/dpaa/dpaa_eth_trace.h):
> warning: incorrect type in assignment (different base types)
>    expected unsigned int [usertype] fd_status
>    got restricted __be32 const [usertype] status
> 
> [...]

Here is the summary with links:
  - [net] net: dpaa_eth: print FD status in CPU endianness in dpaa_eth_fd tracepoint
    https://git.kernel.org/netdev/net/c/0144c06c5890

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



