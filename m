Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E3CD68BE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EafFzcbujl7k/DcP/xMwYvM7OJ0yz5hnvsntWSksg0=; b=0ipTV8oFcKXYbUgRlGEsLAm1Bv
	tSMiTxhfKsR8dHSDVrGsj1bce7jbEhia5+eBmqif3EsgFCsAsdPAkCjLYdIheg6XKBTrgB1/MAaJm
	HWiGil0scXNA/QQHqG77WAi3w3yPNBLth2MoeS5Fgf92uEdqfg+eZI75TlnCqO9Y8E5SQ4Usrm8df
	wNUQIY47y8OvcHZ1u2bS0ecw3G+wFUIhzcrXF+1T5GMjLM7lhe9mFoaJLfriR854Np5Phs8PmqQ4w
	CQyjCK6vHDVULU7HZ/OJC8+bsfnwNMxj0yCLvOg5maaOcimVsqMjV+zp8h6TnhBGSMPhRC8EdBvE6
	fD+S9O7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9Gj-000000082mL-0MjQ;
	Thu, 18 Dec 2025 08:21:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9GW-000000082ke-0Ijh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:21:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41B1541E52;
	Thu, 18 Dec 2025 08:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5581C4CEFB;
	Thu, 18 Dec 2025 08:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046099;
	bh=lwZky4Sy93K9y11fSHxmJSRldxUDXgP06dp7jqDCMlI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cFSSX/HSJ7LZ6qlKgCo2crWokvtu3I43Toqfg195RazIZYiSnNKRTALn5hHHmDl64
	 L+KgQbUDDi761XJ034i1NN+Q8JpzjSmZl/RJIZNTDcU/aH/Iwd+NpT3nZVh/GbCSnF
	 1G7q/N81N5+whcxTysGOM0CphtEi9GFLqD5DvFK+bFF8TszGFNrGIVD0TNsXs3h74V
	 Pg/gwwWhaLXK3NhiJSPGrm8CnosSoUyPeMLaiKbbhSfHqWygj730lm/iU/tciIUkGA
	 /xbYtni/ICrsDfuG+fvgpo6Ygbm5e7sqnk4jVOjCu6giKSonfjVwltKPR2YjjbETB/
	 b7IrGpzjtJYCQ==
From: Mark Brown <broonie@kernel.org>
To: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251217023721.1684244-1-nichen@iscas.ac.cn>
References: <20251217023721.1684244-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] spi: stm32-qspi: Remove unneeded semicolon
Message-Id: <176604609753.49312.11376425894198542181.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 08:21:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_002140_136740_A19C5322 
X-CRM114-Status: GOOD (  10.54  )
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

On Wed, 17 Dec 2025 10:37:21 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-qspi: Remove unneeded semicolon
      commit: 7f7b350e4a65446f5d52ea8ae99e12eac8a972db

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


