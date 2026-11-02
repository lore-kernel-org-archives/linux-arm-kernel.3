Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A294606D80D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0cLZywWL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SzUQxUeC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wo1gkUw2MFaF8a5iqM0r8NH3vtS0k2uzINNVZCVyXw4=; b=0cLZywWLi4NiW5
	VqQSH63Sg1EH9Ixap/sSdg3hb5NvRX2KL9FW8UWaIsLZPDoxAHfP+Hm8MgOXdrCRqQx59Nxr691Dp
	Zw8vK5f469FFXQOxOBxKS+wtw/APqjsKc1zubW8U3PdvGy4QNtWPaPLTOFYioDoBoZOGeidkZ0JrT
	JCBsvKSj0cSBXuTYzM9/N29ZigSttPX3uQ28Eho9w6dfmBeJg9WFc6i7WUYfQ0r3dHpvuC8jQ2yCQ
	wKGeLcNbWQ++Oryl7j+yFAuoQu/+z7nFDsLunYK5DB0EZbVy/QM0lR1SPyMx1fVNVXtfogFJavl0K
	aOi/n5Tnw9W9K1hCDVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHvB-00000003G7e-3gcj;
	Tue, 03 Nov 2026 17:03:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHv9-00000003G6n-0GF2;
	Tue, 03 Nov 2026 17:03:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8572B4106B;
	Tue,  3 Nov 2026 17:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9051F0093A;
	Tue,  3 Nov 2026 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793725418;
	bh=wo1gkUw2MFaF8a5iqM0r8NH3vtS0k2uzINNVZCVyXw4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SzUQxUeC6N7QCcqsoJP5KOy9N3VAqHBC7WFVqdRAfAcpv7VYqaf3X3z8p5CE5PrHI
	 JeGCVG0DssB4aPpJSL/PixxZjcF8D+tYNRBG8zA2wPEhDpiEORvWjsIbHHIAcaKypi
	 Yml17rA4lL4EMisUaX6rixQLmrNYm9nlFzXFGPyzUn8nXpyMSqCgx5olCXd3Q/myqH
	 Cs8hnXrn94ucSMaMUML+PIDk//oy4gfiffCgzrsDsZEoCxdCBXlEfDK2fStHgQkG2A
	 yp9xQsgNsaC/o9eN5hFucS4YvQKHT9f68u5fF+b2zGerudnICTW2OQ+HGNguOsqbu2
	 Am/rW21V5+2PQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 83024255727D;
	Tue, 03 Nov 2026 17:03:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, cassiogabrielcontato@gmail.com, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
 Darren Ye <darren.ye@mediatek.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261020052747.568770-1-phucduc.bui@gmail.com>
References: <20261020052747.568770-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8196: Ensure the DAI is marked as
 started on success
Message-Id: <179366039724.2186205.4496100188192576076.b4-ty@b4>
Date: Mon, 02 Nov 2026 22:59:57 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bnFFXu7ZamnjWNSZ7qWKob4tK5jbMYG3jzS96z+40+E=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeCb84vvXq7KpNum0bXz9njZM6plviXHJinV188W6/v
 EnqrIxPO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjAR670M/6z4ttRci5/sXrdN
 KGG67RX3erMPys/ufjp8x9frrm5+RQHD/yCRrI8XpNiNKn/Z2++rOnm28EGylkjLuXd2ia8n92o
 6cgMA
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

On Tue, 20 Oct 2026 12:27:47 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt8196: Ensure the DAI is marked as started on success

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: mediatek: mt8196: Ensure the DAI is marked as started on success
      https://git.kernel.org/broonie/sound/c/e672cfa10dbc

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


