Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCD0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8snBFycLLNi9qU1IeT3KB6bAs3SJcvGC3OYCjgzvXfM=; b=xXvRuZZU1+MA/do1SxONDh27Td
	b9PmNqohhTtwdlwW9wpKqUTslRIqt45SnA3BcE9/32dGF5s7CeTzlRrC78z+ydBYZkgdWnu6nu411
	kZJZ61lvVLIJ2ZhUZvUiXnYtvFVJDEWIVj2M3r3Zo0Q5fFJTMLUg3P170iUC0ocJMs9t+N/+1ha1X
	0B8TaoSG+ZFppxKZoNhCoWn6ryg+s2P7v346+E9kiyrz4QMOjrYyQom0MdZra6Aam1MFEPSh/kMoR
	n1JlwSZwG3cY9Y+I08JBDpGbEV1wEsfWY02zTPOkNNVtA9+DLKXzud01KqTIZIZXlHENq8xMiR9I1
	O/YZ9llQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgiA4-0000000CRmw-3VeH;
	Mon, 06 Jul 2026 12:10:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgiA3-0000000CRml-42Oe;
	Mon, 06 Jul 2026 12:10:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66F4C438A6;
	Mon,  6 Jul 2026 12:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8E81F000E9;
	Mon,  6 Jul 2026 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783339855;
	bh=8snBFycLLNi9qU1IeT3KB6bAs3SJcvGC3OYCjgzvXfM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nXnWlBh76NylCYK6AVFUt0/27OcxlxECYEJ1uynKMGp7CzpsLG7/N07jTSSZKh/br
	 PvQ2nwgHUBxbZGflZFFPmn4tr9X8Y5oHAs+T8g9OW1YfqgIweBo9biELqxyY8PzYu5
	 YFDBn6QDiEtoYZ6q4OvnvWeYEOYHditP+yRCI4xDG2KUxmCLAbM67FwZIsvDMhUVqR
	 hGmiA9QJq8FpM7v+Do05xaVvGXcux7kDy5sK1IR+MBSAbGHlkzB2v62bBrpvpeFUDR
	 in5yqdOTaGB48I7d9eo/4w08gmbDmTXXVqGjCdJRceuEn74F1BZwyLNYF97V+CetCQ
	 CMbt4LYS0Vsiw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260630013024.1500623-1-rosenp@gmail.com>
References: <20260630013024.1500623-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt2701: add COMPILE_TEST
Message-Id: <178333982019.57168.4166829438358170291.b4-ty@b4>
Date: Mon, 06 Jul 2026 13:10:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OoYt5/FLa8cfw+ebFTGdV7Ok9pvk/dN1eTsnx9v3r3I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqS5tM0nUKpujawiRpuMWmCY41b6wwmFjzwPU7y
 nlAUlwf1h6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakubTAAKCRAk1otyXVSH
 0IWJB/0btqNM6vlHAJ/MYKW3PR2aATMobzbzCatcnsuflfVS9G7UGsBNQY3M1ms+TrttiVLPjK9
 bwb8DUZmQK7+7lFnwtgwXddD8zkCxGCl47c3Xv9UuiglNxWIoiilMMRU7KKFWqp6nnwzHuS60MO
 YzFbHRuLpFKqzEMkvESjQfd6CkMWLVQ5Z5VHqjyfoYK3pL3zaMV8PBhKiPo2haxuCYNme3YlXpw
 YexPj3M4+lzy3oI2yyOejpf3h8u/aUCunUe0hJIHI43wt5S4AvtwC8YMsNF0QURsyMbAF3LLfV7
 U2WfsZKJiat4a/Sf3GPEPZxaVqrVRQk9EmdVNrGiqJ4ROLVv
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Mon, 29 Jun 2026 18:30:24 -0700, Rosen Penev wrote:
> ASoC: mediatek: mt2701: add COMPILE_TEST

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: mediatek: mt2701: add COMPILE_TEST
      https://git.kernel.org/broonie/sound/c/ae2e2f1ff1e8

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


