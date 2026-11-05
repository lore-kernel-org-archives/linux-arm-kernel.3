Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FA4606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qxf/kSa3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hr3V0onR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FM0GXu6K3ywCewrFLfc/Mlz2IYTQV7GkWoeDvvAVApY=; b=Qxf/kSa3ZtlnxK
	/gsj/l/O2E9dCeVoMR7Ce4hB0OpCxNgvHuW5kI18Jogx0h7el3kiwh4f5Wc2K+zX29XCkwC6pWexu
	CxM7cl3mVoksoRxEEg+DLbd9kMt6Iv6DY8YhdG4Egk0GWalytwI3ihBXx1M8TTgCsgcEj/5X/0e6t
	8to+rAg/9z2Ez+UyTmw/N33GhSImnJIcehXcoKOmYY+fNYv5av0rqjbJveHFNS/ie5FqQW7SWyU+z
	Td0C2yqs77lkN6al2IciOVLP3v2+wbh0LWehAurPpThDtnd81bl1YIcTZzA+kvYps+uyL9ppULmva
	UMBRfr7+5fGYE1yMOncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyfA-00000009Jla-1oCF;
	Thu, 05 Nov 2026 14:42:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyf8-00000009JlA-2eme
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:41:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2518D43212;
	Thu,  5 Nov 2026 14:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D741F00919;
	Thu,  5 Nov 2026 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793889718;
	bh=FM0GXu6K3ywCewrFLfc/Mlz2IYTQV7GkWoeDvvAVApY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hr3V0onRTktBtJzR21B6OPO3ER33IJufrxsPFAG8sRVMqmOCiXBqVEwwJV4mYFmrb
	 csJXkI1xRPkFDlI2k732vjzz4WUQUSVwSBjQTfioNJS36BTkmymF0Vyjt1NsvqBTU4
	 bppwtb37sSiq6LRK8pboFm7Ldr1cehSi2hGHkAUfPagiM3FWq8/fAj5Sig1tRMdAd3
	 EfwDk46IBN/Ac7QzSb3WCoGhQZCdqLT/JXnM2cy9weebFW+tdUk2cTiAXOWrPJh7hZ
	 G2AcL0I29/fuLkhmCzd2Zxlk/vRQClpRLmDXtZ9lpbVL7U7VRSntf5QYPhkDpdrChK
	 4Pd10GbX06qPw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E139A2795E7B;
	Thu, 05 Nov 2026 14:41:55 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
References: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
Subject: Re: [PATCH] ASoC: fsl: imx-sgtl5000: release codec clock right
 after reading its rate
Message-Id: <179388475372.2912885.15403731696986720392.b4-ty@b4>
Date: Thu, 05 Nov 2026 13:19:13 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eKulEu67eFyz/ko+paAxBSfq+R8JXOGf+PgSzd22/sk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeTN1cv2BWZszG7LU3G+0+vzsn9DyYTd6Z8WAFr/fht
 7dnZ5182FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJqJ5h+Ge7aWFf+pdNaldP
 inCx5FZ0cSc+Y9ixznK3pNQFyStudSmMDAfOrlilOztjJduNMz9CwmaencU7+dNqoSSDW7bRlSV
 ccxkB
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 04 Nov 2026 11:48:35 +0100, Valerio Setti wrote:
> ASoC: fsl: imx-sgtl5000: release codec clock right after reading its rate

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: fsl: imx-sgtl5000: release codec clock right after reading its rate
      https://git.kernel.org/broonie/sound/c/4ab9e4ccfaf7

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


