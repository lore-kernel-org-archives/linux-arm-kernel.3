Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9619C6072B18
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iQCiqmMn;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KSzB7rsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ah3ajt4QC1IW7eRN0niJ/5zSqKv/5nKHPQ3R7wAM5UA=; b=iQCiqmMnvPXRLa
	uDkCSIfVdu4I9FZa8Mp7AUGxfU5+bUt2wY11HN++kv6TFOykeH2Nm1MZh8UOolBOVYaA2kPwMhFM1
	xwtmyCAjLiqXWEbiMNOoejlbt1oXVZku+sfSmWyETjZFuh8i12TpJdLiCrPRPOGYY5CYhkpMW/x4t
	ufbFG+T8cvNcrPSS64jvCk4yqVVO+Jb5mOpIwvPqPy5zjSL9Bd2zYX5/cLGsgWyR+6RofZwUtjq+i
	ARbI9Ju1ZWirBO28yh7EdtSabzrmOjzdF5QMYqEl23g5RqvGxVfCjeL9ODSj70JLR6gxMJp8+0uIR
	9XZI4IDPYavAIFSrV6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdr6-0000000F1CB-1BRw;
	Sun, 01 Nov 2026 22:16:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqp-0000000F0V2-2fXU;
	Sun, 01 Nov 2026 22:16:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A52143E8B;
	Sun,  1 Nov 2026 22:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0EE1F000C1;
	Sun,  1 Nov 2026 22:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571391;
	bh=ah3ajt4QC1IW7eRN0niJ/5zSqKv/5nKHPQ3R7wAM5UA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KSzB7rsysmHj0NokeU4XZg63gm2lZZdwMuvJUYGPqc86oRcCXcdwCcdn/X44tOsd9
	 nwm5Oc5ZpOdo/oqSt+P5wM/TeNcChfgfTEEmFprm1o+LPKvCL8SdOtWAyaggCELfQh
	 2PRfWu5ZmJosolN7pss10luoDpaHAYqwNOcxfP0bGYxrAyE495LbgHmtMAA/yM6exP
	 GezoOqDSJKx+24L9G/GVFvGAOopbblKkz+hSBtiqSsSiqvA53B+2Ma1R4JNTcnhcl9
	 n+3XgL1z82DyaRo4usFexg9sXSFt5jSkISdkxZk3dWICHJkO3acHI1xpTP+LnHcgaI
	 4OWDC53y1uVRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0306E38003B8;
	Sun,  1 Nov 2026 22:16:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 02/14] irqchip: fix typos in comments
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357138979.2624073.9912661156420781171.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:29 +0000
References: <20260907065328.32009-1-hemanth.selam@gmail.com>
In-Reply-To: <20260907065328.32009-1-hemanth.selam@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-riscv@lists.infradead.org, tglx@kernel.org, radu@rendec.net,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 pjw@kernel.org, samuel.holland@sifive.com, linusw@kernel.org,
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Mon,  7 Sep 2026 12:23:28 +0530 you wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> 
> [...]

Here is the summary with links:
  - [02/14] irqchip: fix typos in comments
    https://git.kernel.org/riscv/c/726285316f8f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



