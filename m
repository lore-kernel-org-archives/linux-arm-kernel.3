Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D67C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7t7622j61PwyLos4AVfz+FCkfA0MSfFWJfV7ULuNNbw=; b=fddIGC/uS4BX4Vo6im1rMzjc3B
	DcziBmsddV5mbOcUj2NUqXm7EWtuULA/llQLPYJuKpegOMbunyQslZagk3cpeCQ+KaV83rs6dxVKZ
	2HEietxMW7b5IjDKRWVaNXWcFT7Ecs+6dAcKTkDLK5pctREH11aS1Q7G6kYpuy6v4eeqTlH9IhgDj
	XqCw7U6UoSn+vssWonOEvBxeo4bhhMRd7TNk6CV53oneKQednndSXFwd6Jrq4Zsp+Q+LI+r7h7I6m
	QbtkrGTC/fWFFcdw41XF9sNeAqeBe09C3U2Iss7TyF9G5ABUyXtIVZGN1EBbcg4CDmvdB2+gQhRF4
	3pozdnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqbi-0000000Bo1C-1AVV;
	Thu, 10 Jul 2025 12:42:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpDe-0000000BbIS-337l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 11:13:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E42915C6B21;
	Thu, 10 Jul 2025 11:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6441BC4CEF1;
	Thu, 10 Jul 2025 11:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752146017;
	bh=OoLYBnhLJYfCo9HG3hV5sR6JogSd/wLdFOxOWe+t6to=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jOgqG+Wxe6iqpX5fI9eQTHyoDLsTAgpiAnmPHpxzCvTvth6ffZTdhBVy2o/RUUAVW
	 Giv+aKItOhB9RQtFpqe+52QsP08QdO+kbh6p0pO4O/B+yxtp9emLm9tBxHhe8HTwBT
	 j7EMBmRMrgT6GbIuJczv4hV9CfOdLSEibMvdsr08Ok/WNfp+n/2hAVJarhMUUBi4Sx
	 xoxfJunM61UhRuIZcKd+xKAs0DKhpC2RCNoqY9rkftyf6DYqNYBgG8pnfIVdQLtP1D
	 GDrCuPAZsIMRjaKXvbGDwMJ63ILOD9cGeQWYw9UuSss7kdXddH2g2GzssSSu06rTxz
	 mx0od2lKO0cEA==
From: Mark Brown <broonie@kernel.org>
To: michal.simek@amd.com, linux-spi@vger.kernel.org, 
 Darshan Rathod <darshanrathod475@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250710045058.1325-1-darshanrathod475@gmail.com>
References: <20250710045058.1325-1-darshanrathod475@gmail.com>
Subject: Re: [PATCH] spi: xilinx: Fix block comment style and minor
 cleanups
Message-Id: <175214601648.738213.2181786988530151709.b4-ty@kernel.org>
Date: Thu, 10 Jul 2025 12:13:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-07fe9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_041338_811705_28B62403 
X-CRM114-Status: GOOD (  10.04  )
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

On Thu, 10 Jul 2025 04:50:57 +0000, Darshan Rathod wrote:
> This patch fixes block comment style issues and minor code cleanups as reported by checkpatch.pl.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: xilinx: Fix block comment style and minor cleanups
      commit: 469d7ea8e99124e4def5d98f928ffb4a659aa1c8

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


