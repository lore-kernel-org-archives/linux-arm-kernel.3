Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223C7CA0EE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOmjsXmqCWA4di6y5u68t1EfDl23WiN72KUfy9a1XZg=; b=t5etwBrvgNJif8IwmQ61ppcyh9
	iQqdTGvQETsSQlfOmgwJOVGoBmx7HMFSAQZZJkfKSBlJ+s2baku0DT2leh1fqBkfHPxh3KeiizhTi
	UtpOD9EXXoUZ2OPrk8J16vrlApx+iFbfbAXRJcFFV+EuAQdMP3Evk7cn9L10GwyV1H8DZzZ7jtApU
	BznfgdNZhRjoaMkvQMrOaz68oaccuC5WNVTdR120NM5Q9jJip7ZH99FiahPNxVom9gk3xeK5VATZB
	C3kp2SE+BoOcuMSHdbTMVFql8UTDhFSemuRL0KlsFqcHSgPXfmaGufEqE9pokxtRcHaJ8rOsSZbJU
	M1/K4jXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulspz-0000000BZJ3-12Vm;
	Tue, 12 Aug 2025 17:31:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmoh-0000000AYpq-1rpF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 11:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F95A4612E;
	Tue, 12 Aug 2025 11:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2FDC4CEF0;
	Tue, 12 Aug 2025 11:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754996719;
	bh=0BwRILpusAVrivTLcsAixdNdRY4nvTJgi3xEFY4YsN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PWSKHm9maPZ82AuMYOrCQxHej/6dypc7ijXS9T0jfJ7mV9Ii54WMJrtrYOjOksuVA
	 X4QUGxJMgUrqHN3kw2FSiTDb/mh8v2wPpKJK+etKn6Mj296uUUQm4ZJw1/QUtv/vZO
	 BgQDfr5WgcaFsPh/NajPl62ZKwYH7YBNu3MDpILaW6DabjIrPWv0JVCd5aiBPgHcWQ
	 R00UEF8FIFTq8Xksz44XIfAhxuIDYZ2+TYc65zyroiBhvEqrP4Wt3pctmfgYqESXlL
	 BdONDglSkxV6WWf7ICTwrn3bW9ydDnZ7odVOmgQRiUuRUUNJGKTbcnkaVBiHmjwkE1
	 s9YeWIuV7Y8vg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250807214358.4172451-1-robh@kernel.org>
References: <20250807214358.4172451-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Drop imx-audio-sgtl5000.txt
Message-Id: <175499671651.16031.1365399416603486475.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:05:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_040519_506951_680286B1 
X-CRM114-Status: GOOD (  11.17  )
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

On Thu, 07 Aug 2025 16:43:57 -0500, Rob Herring (Arm) wrote:
> The "fsl,imx-audio-sgtl5000" binding is already covered by
> fsl-asoc-card.yaml, so remove the old text binding.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Drop imx-audio-sgtl5000.txt
      commit: 605d902bb6b6f5b12a5baeaca0dc359ced7685cb

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


