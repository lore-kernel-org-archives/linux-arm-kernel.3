Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156E3C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 22:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQuzPDxVAMB8C5h0Ly5cOX/M2Hz5l8Zsn5cIgw9nJS0=; b=hctKgAbzqM4Xy4reyqO4+Ki07T
	t4Byqi5MtKo1VGMxwtZUPzvTxy174EqRbgjqvhsz0ENJUZRkSdbYhLUOXyaoJa7AfPlQtjzGnioBK
	oTsKFw+rpWbB032PPNX0WB3yI3uerxg/DvHeN9SOKV7sqyZaC+LHUszKouP1JZYamPFUKG9YNoczw
	ZJ8XlMKuw6oral7BZ30p2z1IOyzbND1zaUVgmVLlWV9hkCPG2ddS7QZXUNvRV+vZZQozPNPXQuRPB
	AN2g+HBaCIfZNiBUg3DyheVFy7cUnWwyXQx3yVrVwh1m1dFBm97bNsDmrtRNFd4hoojTCn3kMRLrU
	1h6NXzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjl9-00000006nyZ-1O25;
	Tue, 01 Jul 2025 22:47:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjGY-00000006lUm-3MTp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 22:15:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19DE8A52C54;
	Tue,  1 Jul 2025 22:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1633AC4CEEE;
	Tue,  1 Jul 2025 22:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408149;
	bh=iOpsCmM3i8hcc7OLeyBEa+jHDCW59AkA6x9tZbiAt8M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=seT1dNqR/7PMoij3HFmGGEQKos1aaO23CoQRISQ33RsrgWD+2cZKJL0uqmdjHcRCy
	 iX6M4ToLx7QfCLXmKVRcyErYw5qJY8W47yUuOpnisYPXG/V3H6PxRGFC+0CABvjNlV
	 HauyL3osB8xSqwQdkm0z8WDm4E0YTuwz0EwdgeehG0DzjM8tiNTNLA8HAg8lia0yAN
	 o3+erFF0cdbwCgJ/AyZZaDJcIYTpwg7qjI4C8yMMR7QvpFXEtP4BCBENkurtfEmDeb
	 rre1PVilqChDuNpnYRkLifBzKkqtlHqlREImet2ivmKZcHI72vfXUit+wTj5fQeJ33
	 gB2tqfcLD5ICA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
References: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
Subject: Re: [PATCH] spi: stm32: delete stray tabs in
 stm32h7_spi_data_idleness()
Message-Id: <175140814783.710092.4550416995647009913.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 23:15:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_151550_911621_323097DD 
X-CRM114-Status: GOOD (  10.30  )
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

On Mon, 30 Jun 2025 14:35:25 -0500, Dan Carpenter wrote:
> These lines were indented one tab more than they should be.  Delete
> the stray tabs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: delete stray tabs in stm32h7_spi_data_idleness()
      commit: 244bc18e5f1875401a4af87d2eae3f9376d9d720

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


