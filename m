Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949421125869
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 18:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zAyR/YSz9YNuaIuSvRHwULvneZtQFhujvpKyvjGtag=; b=mRAMexdW0pm/tuNkerXfM1MrSg
	djUvg1QDuWlgBiaiYlIh1N5il275J3456bl7lERfywomIeq7EoutLSjSFjKiNiNBiSAnPwTtOwF2u
	OzJPcBrMNmwbLIbkYhOTl7AYLeuR+V082j1MW0ENFwXnRhRr9oHXdDatVV5rIAjTfCGRX6YZiI/wm
	SUbKdur598JO6Mv8xje0YGdTC6u2yv3F+EhSOKQ2rRpkd5N6M2IrkH/aDglzQMgd3FytT+OhKjrgb
	/cP9KL8gIRAnnIm82aBftr24Mr9gM2FCjqbbaOh2KG+t1v5QG4eqGkINgTRSikiVNufFbvF7nmGFV
	lSQJvwOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OkL-0000000CFcy-3roS;
	Wed, 11 Mar 2026 18:57:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OkI-0000000CFcK-2ojh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 18:57:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78B6440BB3;
	Wed, 11 Mar 2026 18:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B661C4CEF7;
	Wed, 11 Mar 2026 18:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773255445;
	bh=EllHdPAyyZV7VwzLSIJTJ8+9ynxlnCPpH9WOd28KvPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cTD5Je3vCdG2C1YtPvwToGcDh4rU+61MliHgWGu9bN/vhxX6FtoMA8LmXe9bkbcI7
	 ofr++LFvkaIGYluj/UsggEwBJ8Kq2R7WDxlR9uZwz/arUHU3ER1tvO9uojzN7ZFsVU
	 CBFJgsxbClNMJV1v2ZcBLVH+M0O62GGKY7FHK+02vQkyQ+a05Ss1GkJP+keZNwsv76
	 pelhNoHWzGo09xZTOsLRR/+xEJs7x13SmAR5vtyPNoWBzsSamzl5Rr86gIjGkmTTFp
	 zsVehJlCOlzmAivTBT/TFFRxR0FcwdIzT5Qcb5GVyjDjLjA4lAKgRFtm8+iSLgQeJz
	 JLttTqdOcliwA==
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
Message-Id: <177325544317.227890.7006024907910628189.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 18:57:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_115726_757846_5C6823CC 
X-CRM114-Status: GOOD (  11.64  )
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

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI for newer SoCs
      commit: 743956bb9990214ff1dac66ef59e27221dc3c2d8

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


