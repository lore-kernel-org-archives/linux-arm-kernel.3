Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A95C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biOCFFTAJIWMAgm8iNAq58lLJBRLhnVngWyqFqNnuXE=; b=f9+ysLx9ygdj+a3GjtTu7xbrX+
	wJtddI5w/cMfki7pocFmnxV41CbNTo3NoOSO1hhT7pSvinUSj96QB4+gwdkDDdvY97EilLEt4F4q+
	XFu1zzzXsSnYncGI+Vq4IOqNY3bqMbb9sX5eg/gCyBhCI/h00a+WqtFyFsGuLJft0JO/x/YODZ+Z9
	iH7Q4VuLBjyewAJfLGmkHf3TLLgUSZylSyG/CuYkKUIeA3ZsLXsgV67B9yyoF73uToMdAFI9o9nHW
	n+1Qh9brsjtKMhBpQniD3xnHcp2nVYg4B6xaMFkna/KIwtBbg45dh8ad16vpFzGFF/lMYGBxmsJvB
	Er6ymjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAQr-0000000AL7z-1VNN;
	Tue, 06 May 2025 05:01:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5WF-0000000983p-0NCd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:46:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 629E6629C3;
	Mon,  5 May 2025 23:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F057BC4CEED;
	Mon,  5 May 2025 23:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746488802;
	bh=Bg0D5bM4px6WDECfyD6pFnXIQggw12tfFDhXUC8EunE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bRzyQ6r8ZQwsZH6e2tj2AzCTpwX/nZ5bTdspUziancfKWdvHW0YgOKHVkiqdutEuJ
	 UZLhwbhWX8fYj1OzJygIe6AKlw7oxWGx4t74bIPqRdxfU24dz0ctZ3Ynp0bNoZXw/K
	 /72r8Hjhq6BNdbot89MLbuTO6jTk/D8TqlySCBqVzalJLtwsle2pQEPwhQLfN2jVKP
	 40c+aI2dDkI8sJlpGL3P4myyWAUvFlVFpyP0LNWQo8yo7Re6xuYvfg7g8jcE8m5dWl
	 uaYRsJgCfLE5Ksnemlr03WQe79VTIIApbGTPkEQKV7xs8+wCoysdghxVO5OjuyMuFn
	 ADqiaMFkLxMig==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250501-n-smatch-fixes-v2-0-d2ad9c1f2e67@linaro.org>
References: <20250501-n-smatch-fixes-v2-0-d2ad9c1f2e67@linaro.org>
Subject: Re: [PATCH v2 0/3] spi: Minor smatch fixes
Message-Id: <174648879734.4120313.21841413252828568.b4-ty@kernel.org>
Date: Tue, 06 May 2025 08:46:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
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

On Thu, 01 May 2025 17:01:58 +0200, Krzysztof Kozlowski wrote:
> Just few fixes.
> 
> Changes in v2:
> 1. IS_ERR_OR_NULL->IS_ERR in cs42l43
> 2. Drop patch which was already fixed in the meantime by other person
> 
> v1: https://lore.kernel.org/all/20250104205437.184782-1-krzysztof.kozlowski@linaro.org/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: atmel-quadspi: Fix printed error code during DMA setup
      commit: 075812e45e9ef1b882aa66b9d122d8b8739aae59
[2/3] spi: cs42l43: Make handling missing spk-id GPIOs explicit
      commit: f4ea37a485e97234af9550b63c52394d029037ee
[3/3] spi: cadence-quadspi: Assume device could match via platform
      commit: 222a87f6b94f6f177e896d6fcdc7881480344e34

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


