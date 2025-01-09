Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2683E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 13:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVJ096BsTMYFEg/dwfq/qQbqjkbBVuKDmgLIoPz8jTk=; b=rFzYVZeUpV0OzA
	tMshbFspjyEDJe50xxazrQTiRHhjmFFCkluzF5N9s3Cb/vrtvDX4VMim1A8BwfOiMkws/T6f/25H9
	mly3RfChfULPR9OYO/y8XzJrCxM9EVsxrlbWNaYx6CT04udk+mDVE5TZpyexpZsOwbD1CGYG3KORC
	oKLaVUK/11pgrdp5Sui+3PIHTeNa/Waq1FjvmNdoBhl7DJ6w+dGxJarcmtJgFPWwNrHXcbObqUchR
	8Vd4HzHFaPDgIQhbnnPOq+amIEVDPwuo0WEpd9zeJVCf5XmZ7HPVfvKg4JkPlePQBgbMY4DUSN3B8
	YX929UXsLntJSzljcHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsxr-0000000C7ck-1NPJ;
	Thu, 09 Jan 2025 13:52:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsmB-0000000C4bZ-1ZxT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 13:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87228A40C0C;
	Thu,  9 Jan 2025 13:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D28C4CED3;
	Thu,  9 Jan 2025 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736430041;
	bh=XDV4VXdhkew3tGRqYcWfVlginLmoZkPgCgaDE/rnU5w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u/qMnFYjyj970GmqfqYIQfOHNDPD0jm0bzoDwu5n/pSrfokluFy0HPnR2opaq28rW
	 rh5piGP1hR/m08QeCeTHMh3QGsw7GFbFVAOpK3r2gPkJn0gB/B7azDFMFORQ0f7LIe
	 OKdZElpTc2ZpRjQCyjx0kKJMV8OQmHXup0X1UpTKjBwvnDorKhGzflMQ8C3bHtAv7p
	 b6Bq3P0+YsubwfpU+Y/FMVFGS2mCUN2IAUE0sfhdFFXhm/BsHO5F5H30qLD8kDq/ug
	 s9KYyWjMTX55w47KMhw26SUH7CnMHswkd6z/qG+ZIhvCZjm7OIxXxbMzzOrEVhz1Xn
	 t5TqLl12fk5Xw==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Alexander Dahl <ada@thorsis.com>
In-Reply-To: <20250109094843.36014-1-ada@thorsis.com>
References: <20250109094843.36014-1-ada@thorsis.com>
Subject: Re: [PATCH] spi: atmel-quadspi: Update to current device naming
 terminology
Message-Id: <173643003976.53058.4013563877112652106.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 13:40:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_054043_480509_CA7BFDC4 
X-CRM114-Status: GOOD (  12.47  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Tudor Ambarus <tudor.ambarus@linaro.org>, linux-arm-kernel@lists.infradead.org, Varshini Rajendran <varshini.rajendran@microchip.com>, =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 09 Jan 2025 10:48:43 +0100, Alexander Dahl wrote:
> For v6.9 the spi subsystem changed the terminology to host and target
> devices, see commit 99769a52464d ("spi: Update the "master/slave"
> terminology in documentation") for reference.  Support for SAMA7G5 was
> forward ported recently from an old vendor branch before that
> terminology change, so naming for the new struct member is adapted to
> follow the current scheme.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: atmel-quadspi: Update to current device naming terminology
      commit: 5e56618e1593a9eb9d72dc9433ac7a02a6c48c8f

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


