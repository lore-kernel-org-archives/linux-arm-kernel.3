Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE511606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wDyIik/D;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpVxVr/C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yJ6jwCSMdHazaeDevwzr1iFTTCXWiF1dUr52R0r7mYk=; b=wDyIik/D3yWMoN
	1TjtmuO6MDgz7emdnZhD6lOYIwd1SXYX9bJty9BF65oXctKxEBats7Uk9SkJkzGXvsj36CGrVkuC+
	SENulySeV7RL1HrDtjX6wOuH7CgXEi8bgdy5C7MAny+i3YKu8imH/JAKOJQB7++xRMaD8F1IXjIbA
	B08STsEM0l+v5P7ywsxyjboac1dZxOwsYwJBLU1DJULH4LEMmOV/8Igj7bSEqOIObgEi8KLFEOsUh
	lhdNqMxEbm/jp+UYXeJfbgkTl2imQjGfu3DsjvnA6MjolEm20TMDC80JlZmhC5hvTbRlfndHh/xQy
	qsLjCiScrqBTflfjwElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvVp-00000008cdW-3gZt;
	Thu, 05 Nov 2026 11:20:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvVo-00000008cdC-44BJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:20:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 68B10439C6;
	Thu,  5 Nov 2026 11:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485A41F00A17;
	Thu,  5 Nov 2026 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877608;
	bh=yJ6jwCSMdHazaeDevwzr1iFTTCXWiF1dUr52R0r7mYk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SpVxVr/Cw/EdfQvRxRLWHRgtTYDRNsFlejkW1DKj9y6mFbs0d6wtmiQUVzbDH+S8x
	 C1fsuU3kV1LU8WFI/BuA7PoAOUBXWrOB+3kWdJPJ6jBEP1zubRVuEXSzziHNn1RaBj
	 eyRxgqo49S0yEDFpjHP7lxeLZ79dthD7bwSKyVIrYmePCzcrPwbHTGLyZ+GZE4VBfI
	 VFWolX4MfMcMurvJRZmpxgIjIxHPFExEKtPXTe1Md7QODFLbuFBvoTx07kuwCHF8c1
	 zmHewHhaNDBIoHkdL4v6IZWDZ/K3FymWEbict/3t2V/8i934ODuGbyViXl6OxURwyQ
	 u8ZCg/aJT+KUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 400FE391AFCF;
	Thu,  5 Nov 2026 11:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: set XDP metadata length on the page_pool
 RX path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179387760679.3608225.7162106017208201958.git-patchwork-notify@kernel.org>
Date: Thu, 05 Nov 2026 11:20:06 +0000
References: <20261102-stmmac_meatada_pp_path-v1-1-d93cc4f9a864@oss.qualcomm.com>
In-Reply-To: <20261102-stmmac_meatada_pp_path-v1-1-d93cc4f9a864@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, yoong.siang.song@intel.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
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
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 02 Nov 2026 12:46:04 +0100 you wrote:
> stmmac_rx() initializes the XDP buffer with the metadata area valid, so
> an XDP program can reserve metadata with bpf_xdp_adjust_meta() and write
> it in [xdp->data_meta, xdp->data), for example to export the RX hardware
> timestamp obtained from the metadata kfunc. When such a frame is passed
> to the stack, the skb is built in place around the same page with
> napi_build_skb(), but skb_metadata_set() is never called.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: set XDP metadata length on the page_pool RX path
    https://git.kernel.org/netdev/net/c/6d9b7c85af57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



