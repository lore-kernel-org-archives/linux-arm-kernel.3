Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3A2CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 01:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qh11Jjsdp8sffQh8oYy0vn5zBxKh5ZnhToF+bkGFucI=; b=mXkypJ4MlXH1HNoc2j1617dyg9
	nreH/dv9KL6r4xDwdadEWfyMX0KcuqJ4bc/jKd8mJI+7CLWyRx6pCqC89YR1jvztHKyxSuCstNRyR
	MQXWhSQDvte1Ao6Vb+5empKcW6RERv24RjmATCh98tkockemtVIm1n2fvbS3l71vhWc74uBAYloRV
	TBwlq6/xuxryokPaEWD2dCb/fUP/QpnGEsWZSULRdJFfOiiq4ZHGLsb3d3/kWEPkSAyu2ggEo1MNe
	T1HeLUUTJ2F23dcmsOoy94xrIbqKjI1TY4IkITQCyyRGYhLPoESB+UuV/bVH8ZjQQFD5ujR+Xes62
	AhYPKa9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7w-00000004uow-3gPn;
	Thu, 09 Oct 2025 01:07:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7r-00000004uco-0H1o;
	Thu, 09 Oct 2025 01:07:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8D1048A4E;
	Thu,  9 Oct 2025 01:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B32C4CEFE;
	Thu,  9 Oct 2025 01:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972042;
	bh=8SQsDQoloTxTr71LaWPc56p2Al3DqRO/PNTgELW/Rqg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h5N8+h+/J1jXv++dgDIauQcFpu8xcohWpSqElhPUngssaN+blZLXv83TBTDJTGByB
	 g7CPPClrkwY+JVC0iBk9rOOxYj84NzrZCifKBdPItESNFWSNwSB+DzF+LeX1k0dedr
	 9lDqOe/SLCPLi5DhGQTPGuinUmeoaB7eMapsntqh3zKpF714QDX2b0uxUfpkHChyjf
	 7aHz3/+xov5Bg/nYoRtH/OgSTlC1jrT1WlmHe2ynHJ9COHdLSsVfFxOdWH/OPVjFiS
	 9wb2j/cIzqDsaTa1xmPgJZsjXHngKE4k6EEI10fcmkB4BCYRAovIkJ7ycYxsEmssWQ
	 yNU3oH1T6Lu2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DDE3A41017;
	Thu,  9 Oct 2025 01:07:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 0/6] spi: Remove the use of dev_err_probe()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175997203075.3661959.13983624116098440178.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:07:10 +0000
References: <20250819092044.549464-1-zhao.xichao@vivo.com>
In-Reply-To: <20250819092044.549464-1-zhao.xichao@vivo.com>
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: linux-riscv@lists.infradead.org, Raju.Rangoju@amd.com, broonie@kernel.org,
 sunny.luo@amlogic.com, xianwei.zhao@amlogic.com, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, daniel@zonque.org,
 haojian.zhuang@gmail.com, robert.jarzmik@free.fr, andi.shyti@kernel.org,
 tudor.ambarus@linaro.org, krzk@kernel.org, alim.akhtar@samsung.com,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_180723_177099_0B7AD6BE 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

Hello:

This patch was applied to riscv/linux.git (for-next)
by Mark Brown <broonie@kernel.org>:

On Tue, 19 Aug 2025 17:20:37 +0800 you wrote:
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
> remove the useless call to dev_err_probe(), and just return the value instead.
> 
> Xichao Zhao (6):
>   spi: spi_amd: Remove the use of dev_err_probe()
>   spi: SPISG: Remove the use of dev_err_probe()
>   spi: Remove the use of dev_err_probe()
>   spi: mt65xx: Remove the use of dev_err_probe()
>   spi: pxa2xx: Remove the use of dev_err_probe()
>   spi: s3c64xx: Remove the use of dev_err_probe()
> 
> [...]

Here is the summary with links:
  - [v1,3/6] spi: Remove the use of dev_err_probe()
    https://git.kernel.org/riscv/c/2aade32d1ffc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



