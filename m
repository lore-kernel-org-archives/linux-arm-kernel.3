Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E245C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2F6OqijDAgxCZQOoV/vXM7bxYBnSV+cZVWcXVCaDLA=; b=XE0cdWmoE5r/kCL672m3mRPiy+
	j7XEM6yoFEoYrZ04BlDpI1lpPQToa5JF8bWEnziPuOEG3ZEqbmEtHkKLmyRoO9UcwSaOiRoe595Ye
	ghBlgiWTjqAuX2vAKgVxaCSbklG3RBBKHMFdlFBpe9FJNB56IdRRgDOdb6UOp6xIKRlSZ3vsA9VaR
	N4XG3lm3aAKrzMEtDEIVmKfB51zj/gMVOogc0JcA2HjnDNtSR9AReZQX4hf/QaZs+sOAkGlScPNHp
	q2OohFHMyIIVSMysxv5cWkUeSocgsSm2bWGDYYQRUtNYg/ot62puCCJGeLWd+CFXm3KLLvi4mnI9B
	TYGEwfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnub-00000006mL2-3DHa;
	Mon, 20 Jul 2026 13:20:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnuU-00000006mJr-0ohN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:19:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59FAC60A90;
	Mon, 20 Jul 2026 13:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FDE1F00A3A;
	Mon, 20 Jul 2026 13:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553593;
	bh=N2F6OqijDAgxCZQOoV/vXM7bxYBnSV+cZVWcXVCaDLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bV+Hvn5jybVNvlS0SyepPzaTzj5esjqTzrolQ3EcatlhWafe1wbioSKTVXx7bsNtu
	 MhvGTP6uT15ma/Y97PowY5XCqMOXtsp6qFEmXi/JJbheisePmza/mDLGXlWxKb2LWH
	 eamktbLBtTg7eU5rVvTj5QD7J2IoN+hPLBPtV5HNgSUiLTeEAnhaSgiTaEjlDMcYfm
	 s97zgEjVROE995oebb2RjIGaRDRIv/rAbA015isXHJcS0YLX5VpaZRxFA7Tp1CI6oB
	 ECJ6TJnuXLdJ9PhPL7FNK9ow90Fqn9La2/Ht2Rm0CgTwCntM3RViY1leRjn5JScfTs
	 ZvQRU1ISIFsDg==
From: Mark Brown <broonie@kernel.org>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: Vladimir Moravcevic <vmoravcevic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, kernel test robot <lkp@intel.com>, 
 Julia Lawall <julia.lawall@inria.fr>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260713060807.7-1-bbnpreetsingh@gmail.com>
References: <20260713060807.7-1-bbnpreetsingh@gmail.com>
Subject: Re: [PATCH 0/2] spi: axiado: cond_no_effect and kernel-doc fixes
Message-Id: <178450176843.325809.14256051361365115123.b4-ty@b4>
Date: Sun, 19 Jul 2026 23:56:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zSln4JFHKMvtPgqQEoN1cf0nMwRxxuI7uTOA1ueBSJY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXiB2eRbX7kAxhiTX1zUfiCjJlvejsf9RcyLPf
 RlQq3VqRT2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal4gdgAKCRAk1otyXVSH
 0NZQB/9aaQ1gP8vlvbR469Y9H2cpE/HxJp2Q7HIYt8y398NCDa5S9n/yt/u7xdECvrLFK3uWX+M
 VSrM5NVJ4YQe2wQjbic8WaGuXgrsc7BOs4X9WTBdCKoKeld7/Lm6YJVj0EnhKDr2IeI++fY/H9u
 3PpR98RWdNIdlUwX7PsFnn4n6fAB+VBoWEyLXwCyR3kOsLVfDVlYC6ozDluVQpIAkJ2EJGnbGYl
 tTpQTprtnZhFN2gCPWYvf3JGAi1eloPvUfFVc2yajudgDQMs/RNaE6l6EhfgjkrGbix9xRhEFVR
 BvqfGKdJQNsGdod6Wiu/IW+Q90e2s/8wEkW2Hu5hk58XNEED
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Mon, 13 Jul 2026 06:08:05 +0000, Babanpreet Singh wrote:
> spi: axiado: cond_no_effect and kernel-doc fixes
> 
> Two small cleanups for the Axiado SPI driver, both defects present
> since the driver was added in e75a6b00ad79 ("spi: axiado: Add driver
> for Axiado SPI DB controller").
> 
> Patch 1 addresses the coccinelle cond_no_effect warning reported by
> the kernel test robot on 2026-07-12 [1]: the RX-only/full-duplex
> else-if arm and the trailing else arm in ax_transfer_one() have
> identical bodies, so the second condition has no effect. The arms are
> merged; no functional change (on x86_64/gcc 14, only
> ax_transfer_one()'s object code changes, dropping the dead condition
> evaluation).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/2] spi: axiado: merge identical if/else branches in ax_transfer_one()
      https://git.kernel.org/broonie/spi/c/fc46551cfa3b
[2/2] spi: axiado: fix kernel-doc comments
      https://git.kernel.org/broonie/spi/c/7720f98d08fd

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


