Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0B3CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doeRFScbRUG9CLP4Lng9UJzoZYMdj/HSBzur5kGWllQ=; b=V/JrKv3YzCMXekiazeJMcSFsXp
	6O0C9h9TIZitRAN3SrER7C9zyBZkq79jfyXs/mqQlRtpF+PG1L9mRWip3A9N+Sh1sIFk9ZeWNFYIp
	LyZ984PFn2Dhi+rFmPbV9qe/REp1C37ceF2DkH/09gCiv6I0/VN/ygwbq3hDVDmOoL+KwVcEP4H0p
	gzKnAXaFquO8ax+VSsL0H6oI8WmdRVLtAxQrWnzgBgcSUJ33oI9/wR2/u5K0Etq7ZUAtSZt10idag
	XP+eYpblor+AWCJIYRM6hhX4BYRpxkRcsRh8JU9C1u6bH3bR/nmYC5mmfzc5jnbb1fAtogTdY9vT/
	aEt5Boug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEYn-00000000vRP-03Q3;
	Thu, 21 Aug 2025 23:19:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9cx-000000008UO-0FzN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 18:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C14BA5845C;
	Thu, 21 Aug 2025 18:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C69C4CEEB;
	Thu, 21 Aug 2025 18:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755799385;
	bh=+hDXx6EahSKYVsdXiGT3+Ns+DUu9UsAG4PZJGUJkP0g=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=t98mUctKHD1oOF0o5AWMTF9AQJoF4WI4IREfvuF3AQiB0ayUU6J4Pn9hDdCWX8boD
	 GEouHkX4VCwM4OyHFomAj33UceHHnhgDt6WN0Tkl/BNyT0XDr98HrcHAHoWTGijh6W
	 Qk1uyow4jPKJzIQWCNn66b6mqjwEqi8vfW0gtnIXIHSJkDZugdZLIm/Y+gk/UjBeWR
	 mWLyQDngm600t4DXZtxIR9/WZTpg1TLbiMNBuCFif/VlfwSa/mvchEmljX0GQti8xC
	 UUFoYi3carqbNFgZHOCN99yn+QlYlo4pJZkqGZeEqBKXTrcaM918c0Lsc9HqdacnE9
	 rbeTHN4vnbwFA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250821083100.46340-2-krzysztof.kozlowski@linaro.org>
References: <20250821083100.46340-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Minor whitespace cleanup in example
Message-Id: <175579938289.113971.15653749852299099860.b4-ty@kernel.org>
Date: Thu, 21 Aug 2025 19:03:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_110307_172551_637C7E4C 
X-CRM114-Status: GOOD (  10.61  )
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

On Thu, 21 Aug 2025 10:31:01 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Minor whitespace cleanup in example
      commit: d78e48ebe04e9566f8ecbf51471e80da3adbceeb

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


