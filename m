Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2842C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 01:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVrdWcKCNQQfkGFHZ3OfbSUc196eoXtrDgoSgn2l468=; b=CnZZDWjHfw7FUamw0izjCQHk7a
	avcwgKowD0gEbI2Pwd/HD6pGJhr8NfUUCMI/MdXPbl3f/d0aRVLLdO321roy9O77esDPM6dajhwot
	H3PYxkcjy8Ap8rMsnmsFaK4sKKoBWy6SW+FZUaBhuPCWffQLgurQA3PKSus75P+e0dhEyCFrtc7d4
	DTyiSBo2dVrj6yY7HHJaAu1l3N2WF09iWdOJWLHx+AO4uuULVSsf8iDffu7hIbcLNs51+tMU0gP64
	mlI71RTNLeh5753yxyHW6EyzWGe0M89tr2BJ+H6RsNlcHDwyutJFACkentUkAOq2AuyJlkFwYOo+G
	n2n/Yk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trRvp-00000001NL0-1lvm;
	Mon, 10 Mar 2025 01:27:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trRuB-00000001NAp-3ZIF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 01:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6F905C476C;
	Mon, 10 Mar 2025 01:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2FEC4CEED;
	Mon, 10 Mar 2025 01:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741569966;
	bh=niTPujelY/5yJ2aZGPQo/oOGRfZZBnNHnH4STmdWhzs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OKgWNPOgpP5Hvg55x3Eo8nfgm3rpxEtORf+cHGQuqJPyuod3JxrLOYXrgN3E5zmYq
	 3zN6Gszv2KmYUFBjI01gFPoeBunNxJILmMhXFto63eiyCH60BTSPK1umTO5AIRznl9
	 XCcXaruCqXjuWFPPEUE4W1772K90TAU0iMSVtbN2ZwdsbCzEMypvkFp6t/1/UAhjJC
	 eyKlJE4ofA6d6TKlENGKtbnV5KF00GtC+L9mtJPAfNlUftK1Xc6wK/gX083x6y8tFZ
	 CpIaKLcvVsvMsYoUALvDt8XkB37af1J1wdmStxJUIOPYhbAPEOh1F2814zWqrzUy9w
	 Hv0crZGSQZ7bw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250306053138.1914956-1-shengjiu.wang@nxp.com>
References: <20250306053138.1914956-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,imx-asrc: Document audio graph
 port
Message-Id: <174156996154.2353078.15110736493128457712.b4-ty@kernel.org>
Date: Mon, 10 Mar 2025 01:26:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_182607_966388_746A4CA5 
X-CRM114-Status: GOOD (  10.87  )
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

On Thu, 06 Mar 2025 13:31:38 +0800, Shengjiu Wang wrote:
> This device can be used in conjunction with audio-graph-card to provide
> an endpoint for binding with the other side of the audio link.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl,imx-asrc: Document audio graph port
      commit: db91ad81a2545eb82aa47d0306bc3e1adb05e336

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


