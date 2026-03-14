Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4904FF30298
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 01:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmXxAFi0crnObXyqIQmPk8tTLi2ougzk3quiRaEabEo=; b=LCzgnLIFlW/LUMAAa5mRiLSrnJ
	IW+aBBpUVIfQNVItqeiGONffE1+9BDUstrrxu3Dxcs7xVX2inEeTNn3xhwG7ZQ4uw0slM5Z4Daj17
	w/1wPpPbF2B9uC9/86cCknJpKunhhEKhBakVwefzvohgB47YkR94FwYII5nLry+jmmQ0IYc4YStg6
	ulVro3nzGCWEyiZo9lY9sJPJlTAct7TtvTl1nr+PTpRamDJgBgQuGQP2lcqYnaEp/BFFUihWDAhtW
	r9gj2ofomZFAS3Sslvb+vgEHwc4hwrmgKnvf6el4ZhjxuKVxuaRSfxcM3jc6KwIcZrQc3lQGiqX0J
	buaAblxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wuA-000000036IO-3mSR;
	Mon, 16 Mar 2026 01:38:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wts-0000000368H-3OJL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 01:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA3E4418A4;
	Mon, 16 Mar 2026 01:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CF8C19425;
	Mon, 16 Mar 2026 01:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625062;
	bh=TGQIw/q/zFMyHgT9wXEpWPAd2N2W6JnYL+lx6HkddLk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FRzD8sxtWGzZf04kzC7Xi/txIeltFmL7gxMkHHZhlxDQcObQTW7bT1CEcFWxmAxZY
	 1o+6rc64q4fh6e6ahab9n03frJz8mZ3rvcOkdgKvlZYrbMWLahfiylHFyDDYfQNmaO
	 OQ9vqB6MXJeubc69yr4l+rSQGAg4hihvqsoyxyiVprNtfXfV4pU3lePKCQwWPQFmv2
	 1e9LPCKyw61UXetoeVulORj/r6wrJuvRWa/1JczJAsB2KWV8GreUb7qpk3Fy6DfYba
	 qzIT8KP9I2iNo2HLLyIWy3VzHVHs/u9FiwvljbmhzWkQVhQqJVWBlobXjNieLrR9UV
	 zNCmusXetr/cA==
From: Mark Brown <broonie@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260302153559.3199783-1-wens@kernel.org>
References: <20260302153559.3199783-1-wens@kernel.org>
Subject: Re: (subset) [PATCH v2 0/3] arm64: allwinner: sun55i-t527:
 avaota-a1: Add SPI NAND
Message-Id: <177352554724.149922.11236010638417672034.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 21:59:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TGQIw/q/zFMyHgT9wXEpWPAd2N2W6JnYL+lx6HkddLk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt17jchZo0gt311TnfM91Px7xeMUnDDWgGnHg5
 aPZt2gS/jyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabde4wAKCRAk1otyXVSH
 0NkBB/96GMZnNoZeWsfT+kcGAZx6S+Ao310k+PbeK/xJt271Tz0NrWNlPvQZCLXxs4SQNIZFO5M
 Dr4zSEidJE/ORmsiypIqH6qztsrTp9KGh0DMZt1wZgeIrWETeDJenvDAP2BxhnRhER7hcEkbEjO
 dPj1MGZqdoZBCb4pEn/bQ2itm7AAsbKhMPTIT+fMfNoP+awzQn1AvEBL1w6eSPkRJtGe/PzF2vs
 4apTXsrYWgR1Muwe2Aqo6FqdXLCUZVZRLtV3QqIrNVoVqlc1EqFdBZKwysXbk0Krry4Kgs2iFih
 zwZ7tpICsIacOmo1RYoCA1etZDpvw+NSmN3HLmdihBnINnoB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_183744_940695_4B12A027 
X-CRM114-Status: GOOD (  12.01  )
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

On Mon, 02 Mar 2026 23:35:55 +0800, Chen-Yu Tsai wrote:
> arm64: allwinner: sun55i-t527: avaota-a1: Add SPI NAND
> 
> Hi,
> 
> This is v2 of my Avaota A1 SPI NAND enablement series.
> 
> Changes since v1:
> - DT bindings (Krzysztof)
>   - Moved "allOf:" block after "required:" block
>   - Dropped "type:" from child node in conditional block
> - Collected tags
> - Link to v1:
>   https://lore.kernel.org/linux-sunxi/20260227175157.2339758-1-wens@kernel.org/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[1/3] spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI for newer SoCs
      https://git.kernel.org/broonie/misc/c/743956bb9990

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


