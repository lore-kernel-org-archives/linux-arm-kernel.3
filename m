Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C110606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jXqp8Bzp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=itI0bKYE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zV7Lgp51qEqo2WDFdMLU1p7YBKIQkpPhWHSCGlkZW/M=; b=jXqp8BzpfwwhlO
	A7D+DGSbfFxQ2R60NVRilrxqXKAKXg1dy0AIWMC6DbRmYuEGrhNJ/y5TmiBaSXljqEe/6Si6NvcQE
	jcT0XNYN7cPzlnAIgsZuLWdxpicKt3sDKLeXOeGOwxz18EvP0xZkW9qo92er6vaylvjeGnjecaJxA
	010cxUysIE7OFCVOg3JF5/w8ivWgcP9XkMN7LR+7TB/GYQIIjTh797U4vjdo5egLEhJMIICtYjyCc
	pQrNDkReMGFZr/dBqHr0AvmJ7oCID1LRphhQvPduu+JxKO4PQz2AbudddvqyR0AMH/+7TiwFV7xFD
	PhLn1QEJUwVWj7mJ3Pzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLlk-00000003fXf-0AVm;
	Tue, 03 Nov 2026 21:10:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLli-00000003fXQ-1haw;
	Tue, 03 Nov 2026 21:10:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D83441689;
	Tue,  3 Nov 2026 21:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5931F000C1;
	Tue,  3 Nov 2026 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793740210;
	bh=zV7Lgp51qEqo2WDFdMLU1p7YBKIQkpPhWHSCGlkZW/M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=itI0bKYE8HR4qZE209NCueObkiWZE/j4J+y6T0pvNyc73uwodbpww6WiVfbAUk7GF
	 HflHM4dhjSu3SM/bL1rPPjw29d4RYXvD17IbVh39sNBL3eijtjAEwR5erZGfCZFcCE
	 WQAjQTaEFJUmvuMsP9pzgxSdm3tdz0gj3fRRm/NeNv8tuBzZfwXWdz7lfbeBwHrlaR
	 C87SOPjCx4sCuAJ1zzgLp//rdurQnAhSzvRnOH0yhBk6Rd3ZI1bSiwMs/eNRIMz8JC
	 52McuFyLET7Q5QgR6zq6scw5bg1JnTMi8k/nrmVqrx8qyXlEIR3f7B+EhT5ZhL+vy9
	 MB2BikdEIwSQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 03132391B0A1;
	Tue,  3 Nov 2026 21:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ethernet: mediatek: preserve sibling PPE
 bindings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179374020858.1880228.9743953514014477016.git-patchwork-notify@kernel.org>
Date: Tue, 03 Nov 2026 21:10:08 +0000
References: <20261030010517.45639-1-alex@goodkind.io>
In-Reply-To: <20261030010517.45639-1-alex@goodkind.io>
To: Alexander Goodkind <alex@goodkind.io>
Cc: nbd@nbd.name, lorenzo@kernel.org, horms@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 tarick@bedeir.com
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 29 Oct 2026 18:05:17 -0700 you wrote:
> __mtk_ppe_check_skb() clears entry->hash for flows bound to other
> hardware slots in the same software hash bucket. mtk_flow_offload_stats()
> then skips their hardware counter updates. L2 cleanup also frees sibling
> subflows without invalidating their hardware rules.
> 
> Restrict both cleanup paths to entries assigned to the inspected slot.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ethernet: mediatek: preserve sibling PPE bindings
    https://git.kernel.org/netdev/net/c/34cc22a9ce6a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



