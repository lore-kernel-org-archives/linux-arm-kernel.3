Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8AAFEC109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1L6GdHBhjCyNdKfSB0Yl1Zt920SXA7U5t7SP0lOW4k=; b=pmzW42oSjs8/Csa0Ob9gc7TwBQ
	p/8AvH2CI9KTn5ozouPSeo3U5FaFlBl5CeA/4HB/vJuAmFkclQPeAj7VEtErf13U5+hSoabllTv3q
	HXmbAWUx8uBtahtOHXcDo95J9S3SGJ/ys9M8vBA1LxCXqFP8pSh+7Ksjm8AAqoNhzjnQhGuIpx2L4
	rmtfnpQ31w9es4VD17FrThWhgD38vzrEOrLVnJBxz+JcaHNVMAe0JN9Jbia8xJRdF3UejSF9l/rE9
	WkLKBCEVuSt/p8QTaPBUHbbmTlsYg7QPXy83o1Xk8zP9i21dFt8yGoZJhczPUGS4KwJd7LXuos100
	QtHtBSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57fk-00000002AEb-0kWB;
	Tue, 24 Mar 2026 19:44:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57fi-00000002AEG-4A4r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 19:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0A2D60103;
	Tue, 24 Mar 2026 19:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26723C2BCB1;
	Tue, 24 Mar 2026 19:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381453;
	bh=plo2BsN6TPry+7IqvpvQqRQxEQf/o9qNSVJWv21qtAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=arziCHdE1NM/Gy9crGNG7EEgv2FMpcFZIO4abbT+YWJj+HU1tqEHcrSTx+WSmC1UC
	 VJJrPh72PUwadrlL6ZagpMVKh6avIAXhgSuLazTlf0zw6eT5XXca547HsEvCwO5yLs
	 GxJBu9BnDp2lOll/Dtb8tcwb+EVb8lowGO4L76ldkInJTGRpE4CZ/SLo12UBQTrpWh
	 oRIVWBWT6udtulx2JvyAiSqfQDdLsT8sF38BjT186AX5r95aoNH52vZcgzAggQ5wNY
	 SyBjuPebkNnlsJYgjRSmCtqDSxDoSfIpqDpORNrtrc61A/txyIzcQCCgj5TDpspwUc
	 IqmHP6TQdWjag==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: lgirdwood@gmail.com, krzk+dt@kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
References: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: stm32: Fix incorrect compatible
 string in stm32h7-sai match
Message-Id: <177435712084.80116.5302380668283249517.b4-ty@b4>
Date: Tue, 24 Mar 2026 12:58:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=broonie@kernel.org;
 h=from:subject:message-id; bh=plo2BsN6TPry+7IqvpvQqRQxEQf/o9qNSVJWv21qtAA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwumKdqUnr28hTL5soqDMs+G6Rv0vwemjk3MdZ
 6pYqlb7Wu6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacLpigAKCRAk1otyXVSH
 0IvqB/9D5tShr/o1I2myc+UJ63dP7OyphYGaE1zN3aptMeKDcvAVsBE/xXuVYn4kb7jZyn7i/YK
 6z4wA3la+lr/ye1loftr0T85d0CGjZJFjz3vRGcLmNk4N5LMeyOm0F74kGn++skaK46qOJustqK
 utK4ZQU+Jk/qhH463CQA58v188a8ZYJueoJ9/7Ui5orpLejlZR8jGNxIJt0lCVTrw7YHT0pN9On
 eu9+3kIHPT9nL4gJtvWjOmuAw049QYDVYz/BH5LpWZZ0BaMjm3sTAQxFFqmwPPQnnR0UfF0qw3B
 64aRhp0qVp5vWYYfA6jmr9IX19juUTvnWpM29cRLdQybJR08
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

On Sat, 21 Mar 2026 02:20:11 +0100, Jihed Chaibi wrote:
> ASoC: dt-bindings: stm32: Fix incorrect compatible string in stm32h7-sai match

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: dt-bindings: stm32: Fix incorrect compatible string in stm32h7-sai match
      https://git.kernel.org/broonie/sound/c/91049ec2e183

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


