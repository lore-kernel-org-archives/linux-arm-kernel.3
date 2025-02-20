Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D19DC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 22:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlSiq6qZRws8oppTWT40KNxYpSiPJe9m3KBVfaThT0U=; b=jbs6R2W9UkHqh1rUX1cZVru1/J
	4qua5Qq0o5gCuiaZAaY5kzmdGi7AJ+0bdq+0UvgwxszEPxVuBvUj93JcLu+ZtCpbhUhIOAqQr2jLb
	+rw4fHfWpdf69htDjD1ap54a+iJKFqDk0DcmlYzUq5mmf7CWAbp7Mw+zNstvOOSNdhucHjmQAO7W2
	jAklNOWBzqJRfK8Z1dQzrCJ7sF19hczcSgNulmO/o9xmg51Tp5obqoUxc8URNyL087fDCGrkNLFbG
	epmV8QuNGuiXzlR12mRt5ArA78R6iKbr/6qR07e2JsDlNriD3zBdMEvkDY/V+aVAw6M8LJrm4vOC8
	ue7sYD2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEwb-000000038Dl-3GbC;
	Thu, 20 Feb 2025 22:22:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEv5-000000037pO-2gUS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 22:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A3C35C3A56;
	Thu, 20 Feb 2025 22:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339D2C4CED1;
	Thu, 20 Feb 2025 22:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740090082;
	bh=PCbQ6HbDTInruM4BIyqBxIseWP7a49RQq0CiHZU/rko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sbYUjhw85Wag0mD8KuU8uT94WThO9oHRXcKEOQ708AyMUh6W4AaKe72F5DdoyaMSF
	 GSe0aLGwxdofOfPFLAiPUTFBohrxDegZw1vUx8kszEcXmbS8nKhn3tkqq7AuzIfV1V
	 L+r2rd4RLuqBypB4bIUGaAoshADPuMEVZ8w+QEe3DQDBpz8uhkUMQa8mhR2C3vvZGs
	 aQQvY4jfVwnK/c/jJ9bjN7Tp476dVhH2u3ZDQQq3/DK3k7XvV9Jw9diapwRcEOyXM5
	 M3GmAOxSZL47aFZZmkDSM0GmLwLC9XyokKXtNbTLy5MuuRB7m4PLitG28jEy9QuxiV
	 gptEZl+1uLYSw==
From: Mark Brown <broonie@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, linux-spi@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250214-spi-s3c64xx-fifo-depth-v1-1-e1b1915e3ee7@linaro.org>
References: <20250214-spi-s3c64xx-fifo-depth-v1-1-e1b1915e3ee7@linaro.org>
Subject: Re: [PATCH] spi: s3c64xx: extend description of compatible's
 fifo_depth
Message-Id: <174009008001.2293629.11288334722745710549.b4-ty@kernel.org>
Date: Thu, 20 Feb 2025 22:21:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_142123_723490_E3CD92B5 
X-CRM114-Status: GOOD (  12.18  )
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

On Fri, 14 Feb 2025 07:32:51 +0000, Tudor Ambarus wrote:
> The FIFO depth specified with the compatibles's data is used where all
> the instances of the IP define the same FIFO depth. It naturally has
> higher precedence than the FIFO depth specified via DT. Specifying FIFO
> depth in DT becomes superfluous in this case. Extend comment about
> compatible's FIFO depth.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: s3c64xx: extend description of compatible's fifo_depth
      commit: cb15abd47806b449e853caf43f41573c4c82fed3

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


