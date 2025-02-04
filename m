Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E25CC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDXuNWb1cZgpZgA//x+9RLI3ecNwmCUheZNTuOMYWiM=; b=JFBO0+NyfopmNq
	8nvPNam1IXKjrMB8f6ZTYV6NfU6wMHrbkHfZcp7ppIUJalyOgRZXIbBO+RIw+nsjm2vUeGWVVbiPU
	GuGYwfn8Xe0DMrrzVI8+FuXQj9/knQp5iHYFqvT1OqZjrRuFe4mYkcdH4YdH6XS1vb3PxHgLgU/Ez
	lu3cZXAGt1SbftBFof9kmIhyY4tCblm5s+20y2te/oTRj9TCaImXi5LcAZeEs1eVZHrDPwqOj6Zaf
	9hE6x38LGKdJLuS0vQdZ3d9J3+MyJWe0bebOU5F04VXAgycoe9IQMkq6hvF7wvZBXMJ837QpUn210
	0fuVSJBSxwYhFCkrVYUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOY4-00000001Lxq-0aBT;
	Tue, 04 Feb 2025 19:25:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOIE-00000001K1r-2eBE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:09:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5F54A41428;
	Tue,  4 Feb 2025 19:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B69BC4CEDF;
	Tue,  4 Feb 2025 19:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738696145;
	bh=vyhzsUhbRShvmlxemX/ptJCNlQzbChV8Cy/qY5fzQF4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hd3ZTPAO9YQB+tg/Wvq9rTN226/g8CF/W33+Y8nWQxjZoqK/Z4YgrFDO4oNy0eVQJ
	 sgGpP4xL2KYq+MzRqmvs9d/vdXigkuQ1Q/VzeHxPoat1GYMsYQ1JQsGlfkRNYo5ct/
	 EKJHb0rvdt9FpKd/x6JXIHg7mc3LwwOJWz54jJ+plDFcraJavQhQm1VzNkIWfWchY8
	 KOWJDKt1jNMWarcntMj9mRmCXo+q4YNh8NkkcMtlvdLWsDF/ONXQnBXnKkb42sOh7g
	 Hf0lBGmiefQJa/WxqaI9oltd7utdPJSvOLsBgrcrexwlknKkp+yCyfGnVV5RBrI5UH
	 Rtf399hn86Ejg==
From: Mark Brown <broonie@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Varshini Rajendran <varshini.rajendran@microchip.com>, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
In-Reply-To: <20250203151249.79876-2-csokas.bence@prolan.hu>
References: <20250203151249.79876-2-csokas.bence@prolan.hu>
Subject: Re: [PATCH for-6.14] spi: atmel-quadspi: Fix warning in
 doc-comment
Message-Id: <173869614334.92129.12671529319133640728.b4-ty@kernel.org>
Date: Tue, 04 Feb 2025 19:09:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_110906_736543_65A171E7 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel test robot <lkp@intel.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 03 Feb 2025 16:12:49 +0100, Bence Csókás wrote:
> The doc-comment for `struct atmel_qspi_pcal` had a typo in one of the
> struct members' name, causing a warning with the `W=1` option.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: atmel-quadspi: Fix warning in doc-comment
      commit: 4fd2707e3e71bfd5d4df4f4c9656a009f09dfc7e

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


