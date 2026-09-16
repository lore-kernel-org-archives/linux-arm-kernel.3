Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CB0C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlQs6cwRma2zslsYMUF4XSyTQNtsNaJ2JmQpkbRtfKo=; b=sgidTNs3HtGg4BPsMJ1feAplAg
	2r4olRP4vQel63FHhKPp1+jm3K/I2GlZHBC7ZeJKNe3pQkNF9QJtP558PkrdGb3gD4SM0AUrZ0jdC
	CvxT/uooOb7I2DzNuvrePRQALnssBxhHsP3MSoSejwIbFFmInbTxFD0kudkIYiZIIwWFWBDOPYbCq
	zSi3Edg+sUAzlhOdZAUtqf9x9S5mdg8L5Oqr2jsqxq0w5qwixhaWBd83dgtxm58tb2mOrOS3EHlQJ
	j+VpWH+R+HERn+rzHE7vfgPs8Ww0xx8Blp3VYn1YlFGLbXW+gJcgNw1h0WacfnSDRHxYaNL+nogcM
	CIqCSqpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IZL-0000000CPlz-46lL;
	Thu, 17 Sep 2026 20:18:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IZH-0000000CPlg-2I0v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:18:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA6C741FD3;
	Thu, 17 Sep 2026 20:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847861F000FF;
	Thu, 17 Sep 2026 20:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789676330;
	bh=NlQs6cwRma2zslsYMUF4XSyTQNtsNaJ2JmQpkbRtfKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YOvS/iAgLPvD6tvRZQ93q+JITHTRlWVUX9n+OUs6BhQFThl1Fj7XYlJ9BSgoNjzmd
	 98LYXI2uhYO8BUGhvpknd5WndzCgJ4Rix62wk15tggpF3VXObh2CvN/tO9QQOyR4Kd
	 Lo4gWxWMsTVTfMUC/wGFUXsZ2oFD+EL/313wr8RKxhihD+cAfLVTiRoo2ZTyUOrSrp
	 /gNwbKhN+eqh6G6/3DGkHL08u2REvRAhqqYBjNFIvuREKLVn0rFqojIakqtjkulGq+
	 r2byG7gYwbcvg4JeVUeqGvX32Qtu804xwnJX+Tbz7jIy9ORRPZ4os3QQ/JcMOhakOP
	 xcG+TsGM5g/hA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 =?utf-8?q?=C8=98tefan_Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260908170740.276800-1-stefanghetu9@gmail.com>
References: <20260908170740.276800-1-stefanghetu9@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic
 dump
Message-Id: <178959294173.414407.18136337790003534717.b4-ty@b4>
Date: Wed, 16 Sep 2026 22:09:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uJNK0I97h9gVrkosOpxiaYhBCy0As5A5kdpQzUMMyjY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrEslPB5dOiQY2fwqADJk4NjZiMoef7USZpJEf
 4wzGs9QpyiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqxLJQAKCRAk1otyXVSH
 0B3dB/9eBN31cG12Ll2AnoSUa10wV0kqpNtFR8cNav0jUnJUriUUTRv2dGKr410X8ycaGP0K2I5
 vtyjF6bfkmaeOkAfgnL8ksoztYBnKVT+t07G6L8JJmdvaLXLPUBdSOKB+YglB6b3p4/V8bDnDuB
 89RcGXEvBu1vMCSwxvIvlhqcEEpnggPLSKw+eDsRhlbK+Wztfya4oCf0aKLKNedtrFguUSeQWUP
 Hr3FPOX6UxCghVWt5mYeOVkL/3rQZKdAHdXqholouhkoaYVuuOTXYahWe8cAD40kZtDw/c+q2+S
 w2GsAc1gD1wue6A6szPwy4/pkVjMqSpqKNEvER5OaKreuLO1
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

On Tue, 08 Sep 2026 20:07:40 +0300, Ștefan Ghețu wrote:
> ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
      https://git.kernel.org/broonie/sound/c/48ed992bfbe5

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


