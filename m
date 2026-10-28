Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC89606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 00:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KUMBdiNw;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYStTLdw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qhSAMF/qpF7+6+/4sHnK7so2W7JtrOJTr6nBO3ha23U=; b=KUMBdiNw7RoCtA
	p+zqDIWdtxqbfznSIjGRG9mqAo0g0V0++KpsplicEUaWv7JXQhTXlcekzLBZDeecKo2FRp7iwwKGT
	4sP4EE+I+z9AIGgtH+WOD3G8leljhYMCLE02HNRGSebFVl3ARq2XPidWdfxYju3wTpfz6aOvR1j0I
	ZCC/2qh6Vt9zxX8pJFB/mGbb0sVVGjPuOpG12cnIkHGLmqLWkfKHStZOUJQQVjvT4KXwWYGDN1sYy
	x+74H0x5fJa9xvHmS1Vx79K9xgjcgUIN2Fl11tKkvcirXMGUn80Xsoz81GU8psffJ0BciMexbwo4s
	R302H7CWMGpqBRcR0aXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMDjh-000000085Di-0SJx;
	Thu, 29 Oct 2026 00:11:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMDje-000000085Dc-25DB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 00:11:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 906DD40753;
	Thu, 29 Oct 2026 00:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426321F01829;
	Thu, 29 Oct 2026 00:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793232673;
	bh=qhSAMF/qpF7+6+/4sHnK7so2W7JtrOJTr6nBO3ha23U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SYStTLdwp5Xg6LSXYYNwXsSu1oXHnUcr/WC0dEQJyM/jBx0bTD7CCLtXNdUhY8xil
	 JNRy2yIffWTpbX8thmiqVu9Nx3xR7J7g0KAoWODneHXlbNySSPgGLPK8tH4SUIOyGq
	 /7rQDhNB0BLmDQTkqHnQaUsG5qJjHoUVxgcHQVOq8qaPP59Nsk+SEAOm9kxa30WFBu
	 xs5S9T0z9hX6ddSEORd8yeh1SzErtGOditnvT0bpubgxkqTnDDg8/A4otAXexW0na/
	 6SatS0ZGLuPCMJLf8RhE3R2kEenZHKQcV9aLXSHBvr08m+4UZciZlxv4dLcu5SZy2U
	 1VpD6M8wi9aVg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id B10272062A71;
	Thu, 29 Oct 2026 00:11:08 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Michal Simek <michal.simek@amd.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261023102818.523331-1-phucduc.bui@gmail.com>
References: <20261023102818.523331-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: Fix read-modify-write of
 AUD_CTRL in hw_params
Message-Id: <179319131822.1308637.2787068567958851723.b4-ty@b4>
Date: Wed, 28 Oct 2026 12:41:58 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lgLc1rmq/XQgGeTsPBn6Mt5NgmB84IXpIhRo1kdmDTs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIe9YtNumnBnHTm2+uJy/O0lFQPn2uzfl7ImG6w+t7Po
 JxuNoZpHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhIxRJGhiXXVH/v9Dt0s7Dp
 0zrGx8IV99b/+/On5v1l60QN9Tdcl64w/DMVe396G+8tk5cNyYGs27rf8vbfmBD+LuioyLL8nEs
 LVzICAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 17:28:18 +0700, phucduc.bui@gmail.com wrote:
> ASoC: xilinx: formatter_pcm: Fix read-modify-write of AUD_CTRL in hw_params

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: xilinx: formatter_pcm: Fix read-modify-write of AUD_CTRL in hw_params
      https://git.kernel.org/broonie/sound/c/3b54e7392737

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


