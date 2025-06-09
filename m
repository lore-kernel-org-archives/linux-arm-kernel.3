Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB9CC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snySpK6Vt67bxYB17nEFyoo0j8VvIl6WuVjilo31gjI=; b=RpjT3jDK1ef7yUBd1/ovsv13VF
	xEOvT7zOaZgkxvN4rr1c8NVYaGfoad6oiCvubAZr78AZdeOnSp8+3Ts1ITdUyutf9ZRIHmUvTCaCF
	gwHT79r4b5kFCEWL8gBkGsR3aBAFXPW87OFHsnfos2Oe68FejxwkuLZPW4vTU0+YVyBQf5Tfjo+d+
	B0M0p+70bJVpUJV6mkETihoGyI1Hu67gad8wk6bJ0Ew9n+0un6bhv2qgEOUGCphFwGrXwsBSl7nvQ
	8BExsHqoxnIh9aSG9svVcXgSNE/9lAm5uSrdTOloRhwbSMoQ5mUmGraKcEFUwtvjWlEf2QAAFnYGC
	DK1/eysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjf5-00000005EaG-0QF4;
	Mon, 09 Jun 2025 21:04:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjby-00000005E8e-3ArI;
	Mon, 09 Jun 2025 21:00:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D143440ED;
	Mon,  9 Jun 2025 21:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57120C4CEEB;
	Mon,  9 Jun 2025 21:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502854;
	bh=onXfm+HG8EeIacsf9JPvIQnWVREodwC8+l7WQ/tZOlY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=P9QA/gu0FG0+X+fmbsDzXIaBuw+zTT3NYhPaqqYLmhODf2akCMrf/6WCj1wEpc9wV
	 kNyCbtLCX2Bf+Y+wuFP6JBbsFXX9Teyf0f5p4Wmjq7MsCM1FY8fy4hfPTf/MGfz6tC
	 RbqA8B8y31xio/hBOi651/cho+rtnqwBhVjx/L8+DL18m3Dzt6Xq89RxqZ6zIvkRTg
	 SWWVhZ0igQ9q7wZmkYpEYrjVlqAWBaj+Nj0oGQQ3M9BN5Md4ErYGdn5RzRqP4dukvL
	 ur6XJlxRilSXTMBmKaq4UotpKP5x85iObLlXyGYsnZNVWzdkIsBkmYt/5cMNGHHVFR
	 c5Tk9MXWLBnPw==
From: Mark Brown <broonie@kernel.org>
To: nicolas.frattaroli@collabora.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, heiko@sntech.de, linux-rockchip@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <cover.1749201126.git.xiaopei01@kylinos.cn>
References: <cover.1749201126.git.xiaopei01@kylinos.cn>
Subject: Re: [PATCH v2 0/2] Cleanup in rockchip_sai.c
Message-Id: <174950285209.277844.16538402979333131018.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_140054_822444_99250586 
X-CRM114-Status: UNSURE (   9.61  )
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

On Fri, 06 Jun 2025 17:18:20 +0800, Pei Xiao wrote:
> 1.Simplify the condition logic in
> 2.Use helper function devm_clk_get_enabled()
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASOC: rockchip: fix capture stream handling in rockchip_sai_xfer_stop
      commit: 5dc302d00807b8916992dd25a7a22b78d07dcd03
[2/2] ASOC: rockchip: Use helper function devm_clk_get_enabled()
      commit: 03b778d1994827ea5cc971dbdfbb457bbb7bfa5d

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


