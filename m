Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE516CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKVEdOr2RzcA3rdMqyuatu+3TO4o4RuODlSYsnlMFys=; b=dlJuzzl7sGVM/wqrSqH1WgxJKz
	eEmhP+3GXeBcPQDiM9l2rqO+Hw1EYp+57Si0l3oofSsyJfvoJ7vkaSMq1tJyqCk6r3kwUp3B6Ngsj
	mSOVPKOFSe44PVTtyALNXNDLVttGy+Vs23k+oADRrzwN0j8E7Vkvr0JATgn7BKv2o/ESw5G2bOYD8
	oCGE7x/rJ8GbZ2QkhTiA4WHRsYz08F/rZO/6ndntIl3DVErg5MpO/qU4SwriFMj68MrCnRXLOYpJY
	pyFElPd3o6d69DkRIZb+3kLZVtUYOMKESUaetrTTpIU4MOvPH3DxjSq6dq9Tsky82TsbLqJtIvc+j
	gmJ6+PBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN0R-0000000AUyo-3kDa;
	Fri, 22 May 2026 10:21:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN0O-0000000AUxW-26bx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:21:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D138D601F3;
	Fri, 22 May 2026 10:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B561F000E9;
	Fri, 22 May 2026 10:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445283;
	bh=fKVEdOr2RzcA3rdMqyuatu+3TO4o4RuODlSYsnlMFys=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Of9edK5nBIMY0lUHir4lgmavX7OoGGXmzTVbsJgWQYq9atlY2kfvJ9nZ0Hezhfl0d
	 qRit2yxmN/VOmQ9g7FarBlVhLVb68/JDuPTUktILE6lel80+rthUWRw1jxTm7UtlJP
	 Qyk0xpfMf0/NAORIbqelImtm89qYxDXpW83ORhSTbt8Gu2mI2OxBWz0Bj1LeYm2O9A
	 gsDhn14l5bRuKbgJToRxngKlvNlu5GrqgQeOln1x33tVkJh0tnwcO3W6jd+S0IOzvp
	 yPJc7/kLGJ5xgD6xuLgZDbP1D2L513wwfQW9ioUKMbdz7uDc9bf1++90NMuRgySQIa
	 PmJvRQ08ZGE3Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Frank.Li@nxp.com, shengjiu.wang@gmail.com, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20260331012450.1298115-1-chancel.liu@nxp.com>
References: <20260331012450.1298115-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: imx-card: Complete the full list
 of supported DAI formats
Message-Id: <177940550339.58022.2317951355365638081.b4-ty@b4>
Date: Fri, 22 May 2026 00:18:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hQbgFnBSRPPGLtJDVSn8W1/x06HNaDFZgo7K4RTCvJY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC4gILdOGrZTLWv2gfMWgPbwRQgjUIjNKTW51
 0aTiuTo2fKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuIAAKCRAk1otyXVSH
 0PpLB/0YSaPGbRAdXB2fmsDzvAgb1YXEmRPNp0GMA3E+OKtbVXP/w/vZB3pTHbHqCr5IkdyNB7v
 qTnRjqFZs37mpGSxSuYV7RDpJ+TQsjeBvB5gApzbcR7wUvfrJAdC430fr+Uu5vIcSJg2PlcsW0/
 wDr8wx15L5FNcmgISfStNgsbZf0e/ARVF9mX1O4UQy5ew08FeETxnGn7TAIU3+s1WvJI3BxKEQY
 2i0AlRbqlnWcPhCdw68fU4n/CQ5v8Svd500VGMWQrDOVkIPHA6tLrOw2AdxsKkeynfGog0j6FoE
 OWKiOVZC02iWbRmlaOjeV3HtKddGtfLyVRJOBQqvutPugS4w
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

On Tue, 31 Mar 2026 10:24:50 +0900, Chancel Liu wrote:
> ASoC: dt-bindings: imx-card: Complete the full list of supported DAI formats

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: dt-bindings: imx-card: Complete the full list of supported DAI formats
      https://git.kernel.org/broonie/sound/c/caa7a3711862

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


