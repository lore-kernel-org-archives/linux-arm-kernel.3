Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E7AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLCKNaZkTvFdMYBszO5HwetTDpGyV874dp95e9MnOpA=; b=aLi65bbvpeC14Rvq5bP3AqROs5
	J5Z6YMKd3YmXJBVJI27pvYbkYvhpDvfXO7Rku4zj9Bp6XIfXX1RGNf2poSoXuKxOslv3z2UoUMET5
	z9qGCny81rQceYxljQvFKP9u5Dw3auWLcWB0dyaFFDDkT9v6kIc47QlphZSYJI8fTi52AaazqQzhh
	1vSdkdsioQwoXtphOzKySFlE1L+iHsIghaJbK746xZjp8TtOhQy2Yd1ZHc/953vz3/no3ERDVr/HC
	YXygqMGnFq7kTIeMv+vJLA92EAm0eRlFtQl8M1lyDOAKKAhK7FXiGVXeqSKJxNTOGBL5vCl8QEXQe
	s5sPbI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxtz-0000000EaqV-2Zzq;
	Wed, 15 Jul 2026 11:35:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxty-0000000Eapy-0ZpT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:35:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B4DC043B89;
	Wed, 15 Jul 2026 11:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441371F000E9;
	Wed, 15 Jul 2026 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115345;
	bh=bLCKNaZkTvFdMYBszO5HwetTDpGyV874dp95e9MnOpA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CjtgL6GzIAGmwaGGXzcQ+3M+ScIvY99QikOTsVP6jnN+tE75OcNKNyvzBUKojhnP3
	 OQYSTcUuWvBPKoS+jIUp3Iwn9EnCGU1xTkSlf0kbA5NdxY3CS/tDCE7jwvn/a9hQMO
	 vqHll/NT53qkJBS9Hj3FO6fFV5FFJdliclYFyrhmMVgzdF0nlwJuLkJMMtek5GrMlR
	 199s85Jv39tye6BL8ViDy/49nQUyCDx9I9pcHin1u+/c+AMiN4uJ9GwfzyDfMcebQn
	 fID2XS2R/bAc53yLuuUnMCBFT7+xlMWtU88qBrY4kTsz/kmmxHu2dfLhXs5H5vuH8u
	 qPSbOoFiYFNDw==
From: Mark Brown <broonie@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260714151950.316035-1-wens@kernel.org>
References: <20260714151950.316035-1-wens@kernel.org>
Subject: Re: [PATCH] ASoC: sun4i-codec: Sort sound related #include
 statements
Message-Id: <178406398767.7661.1702188321894054954.b4-ty@b4>
Date: Tue, 14 Jul 2026 22:19:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HO5zuBKp6sDeTeysZpQX81axcXdOTq3CppdZUkGVwvs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqV3CPBThu9or9pVz5WuIa0CmmrVlHQ0HJGWKoP
 FuXgzLhm2SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaldwjwAKCRAk1otyXVSH
 0DbvB/4r3kcVlDghUv3Zxd/gvUn5SrhcLAL3Dgxug4JblzSbaQ3Jy16FWNPYB5qdx0yGCN6NO1T
 HSvlzi2nSuRvrgC+Jc2qoSiNH6CKoLJM4liiXu6JL4okZozQQLRnHmAp962tPEWb/zlrq6BsIMc
 A4dwNhGdlX61tuOLE4hMa2k0UmHnuwCxpmGdeOHr2twyO2pFHIk3a42ON1Z8grd25Zs4A+I0Rgn
 e2MPCiPuCA80YLzPhcs1UHm0qJj6uW6HdkvSZty+zBwni5wJEKLf1f8WlRktSszx+8obCOFArBy
 3+gNH9NSOtu+/34aDXLRYDtSsJ9PMRXPflnkTZLhM8O/4AUm
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

On Tue, 14 Jul 2026 23:19:49 +0800, Chen-Yu Tsai wrote:
> ASoC: sun4i-codec: Sort sound related #include statements

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: sun4i-codec: Sort sound related #include statements
      https://git.kernel.org/broonie/sound/c/eceeb7a564f8

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


