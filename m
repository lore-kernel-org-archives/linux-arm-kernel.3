Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4229CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWa1Co9va2eFkiNLFSp72TtFcrxgiaf8a8ivWnL6Nq8=; b=fS2tKNjc0W06EzN7qRR3aCKnQr
	9on6hhYDohKDFQWZunUUVUNAYRtJ94L/ILFF19+/u128H8G5DquyhZCx/i5JbxhWuHbkEx23wCCxI
	AwOMOg0txse+P4mABPipbTcQVowru4UGe7xzutnIX8moG8m19S/bH0xRVHwud+TCFqJEjzd+7XEmt
	Gix5pbdRMD7GGpQptqyjFaNkw5yIhuNMpizsAq0QU9jXYk+6tMIUVUoamvU7GZPIScVVbCpPGcDCa
	8n7r1ZBzrUCeBV9O80IAp6/h2ilWp+b2YAPcfKhFJRbiGhunMnZcfsZ9SLD/ev+gyqYUJtgH5x0lN
	H6CLBMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOclo-00000004GXZ-2iT1;
	Mon, 09 Jun 2025 13:42:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcjc-00000004G6D-28Yg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 13:40:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2118614BF;
	Mon,  9 Jun 2025 13:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94C7C4CEEB;
	Mon,  9 Jun 2025 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476419;
	bh=0TzGiYjBWdHj28TJ9b9/bP0pDAFT/RI/G0zZcNo2UZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cBWHnyetInB5iDpyq8xXZCqzb7Sx+8zILwQciYvw/O7l53nhhmbcAGC82GsS6ZDPh
	 tY08MqzOH9WPf3eN/DW0osymBz2itA3Wc3FIFQkH0pe0Jr2I3LAsw5reRHfpiGyAGk
	 NkG6ZwMmegmTPR78luHKA9408k4pr1MprOtxDtNTVy9rWmmvsKQBiZvj4/HwtJsng8
	 +p1KG1G4RxdDBBidK7ll6oKQTn6apDX6ymDrtFvqLbd5R39BjCI/KCzxJO6Vo2LBZ7
	 69vABdM0VnBa4DvHvH7TH9MX3+7QAhKPMrzWheVB1tdpwvk5ZeM+HxYlFZRX+/iu94
	 +SyDWK9xhNfNw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20250528165755.692264-1-Frank.Li@nxp.com>
References: <20250528165755.692264-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: covert
 mxs-audio-sgtl5000.txt to yaml format
Message-Id: <174947641655.126747.14644137581591164597.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
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

On Wed, 28 May 2025 12:57:54 -0400, Frank Li wrote:
> Convert mxs-audio-sgtl5000.txt to yaml format.
> 
> Additional changes:
> - Add compatible string:
>     bluegiga,apx4devkit-sgtl5000
>     denx,m28evk-sgtl5000
>     fsl,imx28-mbmx28lc-sgtl500
> - Remove audio-routing from required list.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: covert mxs-audio-sgtl5000.txt to yaml format
      commit: db1a7a6f28b84c5ccd84a800cd4827b5599c95b9

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


