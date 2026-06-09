Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DF4CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 23:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLrtaZs1mOL3XxietgRzehFxlHUJlKCFPUU1hcZM/u8=; b=GL6lC4seanNmPaVRUsjUCpaAGP
	HdAa+gc9S3wu663GQrx0gFD7oo2clZ9AJIfSYYDbRHSoxha0CWdghERIwPn1E+KyGWjPZPPBQ5mtg
	7+nmMvaVVwhFhFhOGgmhOMG0B5XFOfsOoeN4SexY/zMGtTBQcEdIT98Y/p3ZnHd/YlyKz+3OqXoo2
	42PJWKyLyGeMo/iymbxokftdtLMsrdZt86O4yDSWr9N1dTDXtsD9oLH8GKxKqAkqV01UU0ini87Q+
	82TmT81MnVrylBiSHV+o0ZTAazjkArHJ0eViRkedUfc9WpjA45I7CMAHZ4+VGivqFDPNb5x9ba6v8
	p7RUVbaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5Va-00000006URU-0HsE;
	Tue, 09 Jun 2026 23:05:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5VY-00000006URK-2Akm;
	Tue, 09 Jun 2026 23:05:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F34F43E65;
	Tue,  9 Jun 2026 23:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294081F00893;
	Tue,  9 Jun 2026 23:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046319;
	bh=MLrtaZs1mOL3XxietgRzehFxlHUJlKCFPUU1hcZM/u8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ajazoufMS0kk7gY5c3Fsgmfh2zgVcJKmcpDc0OHM6QJy1qvN9eJIFZR0ycHqKvRQS
	 JjYGYwRoAcU70GnZAKSzj37v7qFbVaf5QIiZw89LIh98SOOfpwVOsVt396ZOc0bA3g
	 7osGZ7AEutzfi76pkduK6/5mhpMO3RALDwZ/HQ7eeFfRxyzBOGRm9AgQq+t7Y1Kd9J
	 ZBrsGqFLm6OkxXrNePnE6k9VI15GvPx/6NZPhQ7q/naaOv0u+JVUwU4alouMM+Mcjt
	 Iz6ceJhkuQSjz2I/OIrQs1gnz+Hvx7NPZ7l+VJtmFxexRpnO8bypk61FJiKqt6z7l3
	 kj8N301NO5H8g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, Ninad Naik <ninadnaik07@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org
In-Reply-To: <20260604162624.644241-1-ninadnaik07@gmail.com>
References: <20260604162624.644241-1-ninadnaik07@gmail.com>
Subject: Re: [PATCH v2] regulator: dt-bindings: mt6311: Convert to DT
 schema
Message-Id: <178104161171.34323.12038798713855640788.b4-ty@b4>
Date: Tue, 09 Jun 2026 22:46:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BrNsfwI8fdZ3xvK+HTgEtwMoxMr8f36ajoVHWQye5Tg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKJwqUOYi3seoGrTA+jwJWSGqHVeo1WnR0pVhL
 jrxQb5wLaCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiicKgAKCRAk1otyXVSH
 0IwXB/98uB2JoqhV8bdIngHR6+f5GXKRaPoPI565mm+ZOiuLfawxkjmVW007xnPhQKQLSOcoSR6
 6d2HELc7oykR7jzsTHG3FyVx6tNa0TZmdvqN3Qo8li2LYm29tbn+/HQC5PHc4YwYT3T4HIs4Aoh
 uw+oKYKk3NO9XbTLzafhqgz/Jt5XYH5gqGXBZ/A/CEbIQZMXDH8Q44CPZbkCk07hsbMjVlSu51d
 3loJm6OTvSX5jsxniF8WSG3DoxoLejK2e2q/16236Wc/bMqPbifRlvKF69Ls2Xttn/NYEQySVr7
 znO5/FXwKrKKwB8lxB5qWUDgTnAt0UNJl9ErJWZolYjmOrUw
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

On Thu, 04 Jun 2026 21:56:24 +0530, Ninad Naik wrote:
> regulator: dt-bindings: mt6311: Convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/1] regulator: dt-bindings: mt6311: Convert to DT schema
      https://git.kernel.org/broonie/regulator/c/fd964ee0ac9e

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


