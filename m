Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A396B606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eP8QHW8O;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaIaYRqA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/Peu5b7Kyrbsgh+h02YANx8ZlL/9Kso/Lv68KQwUCJw=; b=eP8QHW8OilOIj0
	igk9tUvQj5NUW7YPU2NWk1uizW0BcA05O+KMu8SNz4cMW9e3DrsTO+a9bLJbgtqqbYtpO7YLqGpf4
	7B/ipzT9225iiRB7AfDBYPL27m7bKVglQwCsiwB+lMzJu4B/iNnpF468G6UtisFgkYg9M7azR+Rje
	rcqK72WErtj5puCYdlEnKCo7r5XQDZl399y18/BEdZpfKf2SQWPXoFKUYEn//pSZqmnF29qBlQWv4
	C5Rc8k2lzqxsmqow3mvWn+E5dWALpci/PnCC/wdLB7PQlaCV4HtAgWoS3xNy5CfT4bgVC+exa0lPH
	gL+JjmBDZqZzvT9QfLXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrM8-0000000GVwm-2qlN;
	Mon, 02 Nov 2026 12:41:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrM4-0000000GVw3-2gGZ;
	Mon, 02 Nov 2026 12:41:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0E5860619;
	Mon,  2 Nov 2026 12:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D05A1F00A1B;
	Mon,  2 Nov 2026 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623299;
	bh=/Peu5b7Kyrbsgh+h02YANx8ZlL/9Kso/Lv68KQwUCJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GaIaYRqADioKDBhpm9h8PAHqVKAeV2AQ3xiDVqExAHj64WTNWFjv5wIQYHBOtbUAz
	 adyfFjW9ZX3C/zS9xn9te6qn+l9VgGMfdr3uqsKUdqMrdYyzNLMX4Oqg/Kfn8RBTiV
	 cOqAtoqa9oAq7TpN7t7s3QQj3a451cXTfix+xRhXi8Z5otFzoEXPZfwQwinAVOtter
	 vCKkhRPtCh4AUWor7Ihp4K/U6DZFQmFTy9oI/Qo2OKJvXkj69IXdlNqJ6csoBmfMzr
	 2v5kvjG+jUZ/C931SmYrbR+jim7DFrYt8a6ce6/jwNKMKAwKq25De5bN1qBKIe75b4
	 Gv38G5J9YybGw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id A405A23103DC;
	Mon, 02 Nov 2026 12:41:37 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
References: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
Subject: Re: [PATCH 0/2] ASoC: meson: card: fix driver remove
Message-Id: <179357776085.1716893.7760028365760800728.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:02:40 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IW+3schf3f12w+Fw6YVgIZQH8wOkkSnqf4ANNKtqitI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetDKeM6/ybwzd5fO0sf+q+QRNTYE6+YtvLL0/f9U8o
 cwkOutyRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACayyIuR4auVd7Xk0yXMVyKm
 JgkW74wRZG+6f29L/lGPzfaLpUSf/mT47/FGtWJmmamErzX3i9Dayktbiv+fYpvH9fDb2VdtX46
 qcgEA
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 17:29:52 +0100, Jerome Brunet wrote:
> ASoC: meson: card: fix driver remove
> 
> meson_card_remove() reads the wrong drvdata and frees the card links
> before the card is unregistered, which crashes when the driver is
> unbound. Fix both.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: meson: card: leave the device drvdata to the ASoC card
      https://git.kernel.org/broonie/sound/c/b734d4c00f8a
[2/2] ASoC: meson: card: unregister the card before freeing its links
      https://git.kernel.org/broonie/sound/c/6f86aab14274

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


