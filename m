Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28394D2D0E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVBD+wnt6O22UZEQigSBy5+SctfUwGuWuUsHak5BamQ=; b=OuIqE/0wazQmt1jvMSFwnjev93
	doXWkOIU66WFxWgqycpaiILZMgf9xmlwkeSHUrkqwtnxvCVXdoSeGTqR7hQAXHNcLsNgF4BdXMBGP
	M1mUSzK1WLEw66vNkzIqylSBH88hycLr2mRP2jQYST7YkXCHTZnmI9RdzeWo1A1xmKEO1kOMSFdGu
	5ykACQ7EZRAPllqOm5IXb32l1p0LGfiXcgLA71uxn/qG0o0tf1H1M/SpsQSwXAHChNYOOzt2YgrKL
	GvgsflDl+AUTZH65NFX7NhaR8VOIdScPMGIDVl2wg3RlUfOxK4m3/3BbzPrGpQ6fdPYcwYbSxZ4hO
	GnaucGBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfczK-000000072lO-3BEi;
	Tue, 13 Jan 2026 11:55:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfczI-000000072l0-35LD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:55:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A111544386;
	Tue, 13 Jan 2026 11:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59C2C116C6;
	Tue, 13 Jan 2026 11:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768305303;
	bh=vILcIKTOivMzFtpPuiDtPrEY00gIpzY5boW/TOGn4kM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FHLSDnDMMMlpFgZy6NpiCaQrw0VOXVGJRB/wEgdmTvWFmGjqUEGUv+KHCkIDoxuLE
	 lidC8qZtEOKGJffnZd/nUV8VoDfr0GvZCkVHSrLtKJkgHMIL/FpH1/tckSzbwDKgtd
	 4OWPFVrSxZx8ThahMCpnWhRsIKpCmn+308+MbY98uyVBof0Dkt4HRMqKarKkDWswnr
	 wrQV93gxIEbL8k1UsJF1hHJ/AWNuSSQH0J9YfB9XYfnTGQut3C/jI7GvmlEgCEhMpc
	 2rOMHlbsXf3U0Cbfnb0q5SF427xZT5bRgCUHkxO7gYEl5HjMn4EFI+O8iU2gNA+P6v
	 s/isw68EDmHVA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20251228071041.2246718-1-rdunlap@infradead.org>
References: <20251228071041.2246718-1-rdunlap@infradead.org>
Subject: Re: [PATCH] ASoC: pxa: drop unused Kconfig symbol
Message-Id: <176830530141.30686.5406683094869244016.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 11:55:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_035504_941492_3FCE76D7 
X-CRM114-Status: GOOD (  10.29  )
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

On Sat, 27 Dec 2025 23:10:41 -0800, Randy Dunlap wrote:
> Drop a bogus dangling Kconfig symbol for select SND_SOC_AC97_BUS_NEW.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pxa: drop unused Kconfig symbol
      commit: 7af9e30a0c8bb05b7254fdca857c1a1126b652eb

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


