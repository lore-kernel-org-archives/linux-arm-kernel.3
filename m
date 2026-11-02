Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE060A2605
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=38lrZEVV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DzW3QY/E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yUE+ajKb2SvUu34rlf3PuV8op+JEWESp3G1IkxKNGVg=; b=38lrZEVVnJ4SSz
	E5R8pqGN/gLuaw8DxrZDHJU3DLhOQEAUdlhM6aETYEdNpfb7fhsRRSVvvziPZOpUi+MVNVgkzexjA
	BgNiUHvKY0BfuF+1mUpdJg0pHLPsV1L016kQwjD+scEmttuV0Flivy9JgtuBks1BXHLfb3iSmGuni
	/xjcrKhvlWSMkpw7IBc4i1a/nUWri30NteKj/yO5R5qnPBpaXEDFd78nXFP4r3ENq9Vnk+HQzB4ac
	WXxRNmbxwxAlYJbZAMTlDH7+4TV6B4+cg4pJNL/mH1eD8qIrVomAtZKWZlBntvlLq9MKiggjh6uXs
	9DBoAd8PsBzPXQeBV3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsRW-0000000Gg9S-2UNy;
	Mon, 02 Nov 2026 13:51:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsRU-0000000Gg8U-3Pju;
	Mon, 02 Nov 2026 13:51:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC584600D4;
	Mon,  2 Nov 2026 13:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881AB1F00A16;
	Mon,  2 Nov 2026 13:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627479;
	bh=yUE+ajKb2SvUu34rlf3PuV8op+JEWESp3G1IkxKNGVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DzW3QY/E1vTYb0tPj5dhj31TqNOVZLX3yHkAtyhaoWRl55SR9+VWdUGoQdoUArbeF
	 oOmbLYVMiJJo6w7s3YA+pUyBE40zbeCBYcoys4vrEcq26jihwgKWcukCnDX5HPjnNA
	 Yzi3dEK12FV1CjQ0gyfVenSlnygpmL8YXnOQKAiBhTxiyrXsIdvj3p2AHikiUP0BdN
	 ZdXvVHzumMQ/sh0VZ0wDrSIhkr6YzJBzicE2g38hnlymFLXLPmb3CkpSPRbcOpfleb
	 ZDHS22NwN/8NkdzNtDvStsihWKQP5CT/vadj266iVCYOJ1+qFkIYpYFeYJA6lt1c1r
	 VLNTonOzIvqtw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id C65672344C8A;
	Mon, 02 Nov 2026 13:51:17 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Micha=C5=82_Kope=C4=87?= <michal@nozomi.space>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261016161455.194400-1-michal@nozomi.space>
References: <20261016161455.194400-1-michal@nozomi.space>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: Suspend the AFE across system
 sleep
Message-Id: <179357913438.1716893.724348214369386121.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:25:34 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Q+rLYquHGS+G0a65fcTBl8j90yUlRSeS2WSUr1yi3T0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTA2NfyBbv/DNFum23rnHi4PeaBq8fxo3Ocb/9EReV
 S5mG6nbHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjI4UsM/yOMXE2554gJFJzg
 mviM+wTjEQvWU9OepKpNN2559n+FGBMjw9Ku+YvfHGQuyGINOC1kV90o4VcmHrrS17KQSVdk8WI
 /HgA=
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 18:14:55 +0200, Michał Kopeć wrote:
> ASoC: mediatek: mt8188: Suspend the AFE across system sleep

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: mediatek: mt8188: Suspend the AFE across system sleep
      https://git.kernel.org/broonie/sound/c/6c97476ea8d6

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


