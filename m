Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E692FD68BE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntHFr10LyZrHNn/NIver2/rDJDQbVLlaVViHRp8ZKsU=; b=ZqDYccAsOuEfU0iDowoZ/WXj4X
	00igJcR8Sb5nM6kYSj2Ml/Vc6juUwgyOAYjkT6CkQU4Fna1Dc5rLzPD4njrOivYpR5QxFpYnHq3oY
	MGJBN+Xu4lTYPXu/jTquC8fdgVU0O3rhgt+dMa2yxuk0dVket+R53v6U94DSJbjcWdd54uVpDV54w
	MQxsT7eWd89ysyfXVlPVZDm5WEiftnw26mLycftllpzbvRbDMR3GKDD/QBLypa2WywbNbwxnTiqGm
	5lO4OCesKlGffn9+UHu4gzvr+0IL4HyJhWredsN+Lv349dPuUOzRopTKUUN7IrSa2zP6SQJQgJMq/
	M+jegC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9Gl-000000082nc-3knK;
	Thu, 18 Dec 2025 08:21:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9GX-000000082l1-3J4u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:21:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02BE244313;
	Thu, 18 Dec 2025 08:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E56CC113D0;
	Thu, 18 Dec 2025 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046100;
	bh=Hh/3/w5jCO1JSs8bn6HtL1yOfwiRbMzAmbaf4GEsClk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pLzkt0b05zdeneWZAOS+i5nfvIDmdV/9ApM+2e6gUIdeaPZ2lG6x2W5mmM8JMDIAU
	 CYGMR2n9oWe+MPyGf9An7YX3FGYT88M9Pdkt9ld2QAYnz6y/Rh5I7RCpTgPeQuYIpM
	 ug55lzQ2ftPWKd1IvFSfmgj5HT8zNIGH2a/bsx8orBkjaP4jFt4wah4MZYxSKMSM4d
	 zVraU49BDh0ke4hC7XGsan8v+5WAPZ3UZ1ZRnhgvsT2bC8OIVlHgGAIq/iLqR+Z9pD
	 1uKshmXYeR7uJgh0gDOadKwJNis2VTTd0jriBS82s76ldF9zRW1v2Y+F3beXOZVQQr
	 gUMk52RWeb5oA==
From: Mark Brown <broonie@kernel.org>
To: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251216043210.1521722-1-nichen@iscas.ac.cn>
References: <20251216043210.1521722-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] spi: stm32-ospi: Remove unneeded semicolon
Message-Id: <176604609931.49312.660104330580864155.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 08:21:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_002141_875558_F164F7B7 
X-CRM114-Status: GOOD (  10.56  )
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

On Tue, 16 Dec 2025 12:32:10 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Remove unneeded semicolon
      commit: d8ce99b0d384830b0eb6b907f5a428309c70af82

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


