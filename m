Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C52D3B7CB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 01:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XPjmHdAnFormyJz6b0YgVud3YiDBBWv7ODyyldXAPM=; b=Slm0RMAEfAJpSEastQO9ktoJNI
	6o+zXSX6SGTHeBKTImfNC58m8EuB1eeLJfyQCi8CoPS14Pf1D5FV0g2Ax8Bk8VUf5S5ttCqYR9P21
	EBbv94X4FvLF6n2wVcFlcPkTfgGbPH3uTRcuPPc44Xg8B1DnjehOAuPXBTaGELDEL+alDHf/huirK
	38DUpCHfSLYKpQC0UrKYI3aAAbgugCW/rn0Td7V5cQqqOoEIY2x9BAMBw3hWGI97WxETcnzThUxEx
	jNyaBhHPQOlB2DKADAl4leRmzAtf0qXST63XTPw9+Ayncr4tIzuJG1tZZ9x/2Q2gi/FZSdNd5gGt6
	A09txRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFNTd-00000006rBN-29YZ;
	Mon, 25 Nov 2024 01:01:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFNSf-00000006qyQ-0Khx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 01:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 799EF5C5807;
	Mon, 25 Nov 2024 00:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FF4C4CECC;
	Mon, 25 Nov 2024 01:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732496418;
	bh=W9sLSofs57IMCbEq/BUTGm70UcwPOIqZIetSSFDBvrE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fHR7FUtwBAZDNueO/8+4s59fL1xWj04a/8Hxm8cS6D/R5vCNP8bnQxt4mmTEEcpzk
	 J79tgT2zCjY6yCRE7eLabYdvIjzW2JRuCRh6v02j6NpCr1eVyoYF3c68MOOInu7uMG
	 vaEfdLxhzMr0YOuQc+eDTEjCNXvKP5rENrkhh+e4TOeOBZ8s9ZCpDg6todP4XaYAIz
	 akzRRZl/T4ZPxkGWfuAY7w/c/fTLnS3pIh6hMY9WMCOT/XNWPj9DOvMkpqPwZemfYf
	 wDaCaxqUDUyI8c/ONwzXp7mWCa74PAnlLS5Hi5f8lafuqJlC0qgyuQWY3rJlkF+VSt
	 tEZzcCU2ZnXlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7330A3809A00;
	Mon, 25 Nov 2024 01:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] net: microchip: vcap: Add typegroup table terminators
 in kunit tests
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173249643125.3410476.13194296250572819255.git-patchwork-notify@kernel.org>
Date: Mon, 25 Nov 2024 01:00:31 +0000
References: <20241119213202.2884639-1-linux@roeck-us.net>
In-Reply-To: <20241119213202.2884639-1-linux@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 steen.hegelund@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_170021_163198_8983DB84 
X-CRM114-Status: UNSURE (   7.11  )
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

On Tue, 19 Nov 2024 13:32:02 -0800 you wrote:
> VCAP API unit tests fail randomly with errors such as
> 
>    # vcap_api_iterator_init_test: EXPECTATION FAILED at drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:387
>    Expected 134 + 7 == iter.offset, but
>        134 + 7 == 141 (0x8d)
>        iter.offset == 17214 (0x433e)
>    # vcap_api_iterator_init_test: EXPECTATION FAILED at drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:388
>    Expected 5 == iter.reg_idx, but
>        iter.reg_idx == 702 (0x2be)
>    # vcap_api_iterator_init_test: EXPECTATION FAILED at drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:389
>    Expected 11 == iter.reg_bitpos, but
>        iter.reg_bitpos == 15 (0xf)
>    # vcap_api_iterator_init_test: pass:0 fail:1 skip:0 total:1
> 
> [...]

Here is the summary with links:
  - [RESEND] net: microchip: vcap: Add typegroup table terminators in kunit tests
    https://git.kernel.org/netdev/net/c/f164b296638d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



