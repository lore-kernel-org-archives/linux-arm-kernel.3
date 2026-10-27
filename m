Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11736606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=shSEM7W1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aGirNWWG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wFjjwyONnPzQ4w3z8NzIQoH7nGV4JXACu28LTxdUNb0=; b=shSEM7W1/TbGag
	HubHVNRcXku1LCPU7HN0ezG6XbqOR9KSTgVBnrzgUUyWqzRWpnbX03lclG/6F9a6itxDUwFrj+AIV
	qnQHgVIZHZ6/E7iUSDG0M6dkONS9SlogiLDI7MwvUy+mPIBksx0f2LW86XlsKOuiuaRfWQ+ZBQydj
	CHgsAON/mFEJGmkKYjyAwHgftD1JEDs69tGMM4ooN7bBUsE/u/NsEJ2yeYYrrrQGVTQc1GdabBvOm
	EX+LP57kKh1wKu4eQ1arR+Ph6TkGmwaAY+pKryTXQ8cnf6Y0YliGQ//LFeG44+75qI5THglbKyUxW
	qEtcgK091G8wnOiSUkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe89-00000004Gf4-14xB;
	Tue, 27 Oct 2026 10:10:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe88-00000004Gel-0Qma;
	Tue, 27 Oct 2026 10:10:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71BAC437B8;
	Tue, 27 Oct 2026 10:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5103D1F01825;
	Tue, 27 Oct 2026 10:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793095807;
	bh=wFjjwyONnPzQ4w3z8NzIQoH7nGV4JXACu28LTxdUNb0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aGirNWWGEpxMK4wS0z1nuJBln4c+Cu1HEf9MES8VEHCRe+rktGQLU1DHpVNdeseKc
	 AcIVmxpuXngANbTcmbm+1z7hKHMY0erV0zyG71PSUwHKRx9kkMX7Teh4wbph/pQXLu
	 23Njsw64iqdrWYmMwqC5/cLLXgrHaqGrdRYYk5WCgfjFwiyzgcJ4SSNQlwGm8onzcv
	 3fIfgk8kKq2ZRA0XUVbdrKFizfCFwXB5Rq1Ra5vTWak83EVCdFsM+Q36y5RO2M2RDZ
	 jSD8obv0rrUCFatzM83/bbGGUzyfRhCUX0Q+ESFzj0gQjxn5izc3O3MhK3r+JmAZbW
	 CjY8tMjnkUAGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 444A73AA8FFB;
	Tue, 27 Oct 2026 10:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: dsa: mt7530: trap frames to conduit in MFC on
 EN7581 and AN7583
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179309580589.3705173.241549361006084981.git-patchwork-notify@kernel.org>
Date: Tue, 27 Oct 2026 10:10:05 +0000
References: <20261022205649.2351696-1-gongtao0607@gmail.com>
In-Reply-To: <20261022205649.2351696-1-gongtao0607@gmail.com>
To: Tao Gong <gongtao0607@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lorenzo@kernel.org,
 arinc.unal@arinc9.com, florian.fainelli@broadcom.com, ansuelsmth@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 22 Oct 2026 20:56:48 +0000 you wrote:
> On EN7581, STP BPDUs received on switch user ports never reach the CPU.
> 
> Like MT7531 and MT7988, EN7581 and AN7583 only set the CPU port bitmap
> in MT7531_CFC and are skipped by mt753x_conduit_state_change(). On
> EN7581 this is not enough: trapped BPDUs reach the CPU only when
> MT7530_CPU_EN and MT7530_CPU_PORT are also set in MT753X_MFC. Add
> EN7581 and AN7583 to mt753x_conduit_state_change().
> 
> [...]

Here is the summary with links:
  - [net,v3] net: dsa: mt7530: trap frames to conduit in MFC on EN7581 and AN7583
    https://git.kernel.org/netdev/net/c/a58b221496dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



