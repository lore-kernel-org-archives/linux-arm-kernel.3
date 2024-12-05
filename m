Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DA3E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3LV1qEMEyprSVTfYKCNU4npKw4DXDwINf4ZJebB6TY=; b=ICLgj0E1BrKCgecna2crDtOeOc
	I1gdBUTF4AIEsd6FFRjpXC+Nr7KmbkOBVznKVUglxjcQZqYlGuelmTg52YhdVAFauYewy+r/3Ffw7
	wTBr0pagIUrWm0ouE47TNmCXf/z9LDCpwRo1OyPk881ytIezBmTPHjTagrIvN6GlRsTw2K+Q3oMt6
	E9n7ZAqO3JNQOm+5U0UtaFOUAU6QQoiaF8ILZzfkM7CUZ91wv5H5/11SZ/F1JluLj6EWMVsgkZnY3
	QOfuBBTPx8vyeSHcbAssjSzoibjM8nNOs4PAIeDzAno8yzdGguhAN0qlpTgysZlTnnWgTIF/ID/ld
	28PIj8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEN4-0000000GgCn-027y;
	Thu, 05 Dec 2024 16:06:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEM1-0000000Gfwr-2dMi;
	Thu, 05 Dec 2024 16:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 535825C61B0;
	Thu,  5 Dec 2024 16:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CE7C4CEDC;
	Thu,  5 Dec 2024 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733414724;
	bh=EFE2AZL6QW6AXMyxjHx2rd1oTU99m7QnJG1VGZzGKKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=df8V0ztkwUKYdcjL//LhZEfRE54JUuQr2rUvlNDiSEM9JqaQNsNbzMaxwUjx0VpAI
	 T2rr5J1htHk/GHAgb/mzA5AqWOdK8G9JrLb8hqHpuEa+E2ytLP2FFqbbwxk23I175h
	 etYsU/UY2xOfXWVd7cxLnbKLmsIElcHEgL/Wruf/XORf+Z3a6zsop5b01pgJ3s1y5i
	 8jEZs0JcGud02E/zZFa+du47l5AUKBq/uRHttEfjBam17S80XY30bPKZ3nWkDNvJdn
	 SMSsPEHeCQ0S8tsRwMe+igY2VNPSU7bcBUZibbaWZiwgpIUzENrDeFNQV43596wgsR
	 Qbm2bJE3+Rurg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 Aary Patil <aary.patil@mediatek.com>, 
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>, 
 parkeryang <Parker.Yang@mediatek.com>
In-Reply-To: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
References: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
Subject: Re: (subset) [PATCH 0/5] Enable audio output for Genio 700 EVK
 board
Message-Id: <173341472111.145991.1986411780939561969.b4-ty@kernel.org>
Date: Thu, 05 Dec 2024 16:05:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_080525_707014_5D85D9F0 
X-CRM114-Status: GOOD (  15.20  )
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

On Thu, 05 Dec 2024 09:13:53 -0300, Nícolas F. R. A. Prado wrote:
> This series enables audio output support for the Genio 700 EVK board.
> Patches 1-4 do the required binding and DT changes, and patch 5
> describes the audio DT nodes to get audio output working on the two
> audio jacks, Earphone and Speaker, present on the board.
> 
> The standalone fix in [1] is required in addition to this series in
> order to get the sound card probing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add compatible for mt8390 evk
      commit: 8e22ea5fb8498c52fcc20bbe2070c3aef1a3dff2
[4/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: Allow DL_SRC/UL_SRC dai-links
      commit: 5a56323a54b7febcfe82cc5eda840a176647b7cd

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


