Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFE1CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 01:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kc/N3n+7loQMyba5P8cYwIqFKTl21WxVBIFggMR75dw=; b=RGHc8aEghPt6N1ruTFsSFtPG6w
	VXfFeQiZTZJ/Jd8Y/9yqsievT1ZMhSpqRwKeTFswsQsPeNa5tojxGrDP17LWaTaffJdQcjjzRucyw
	Dn05dDtnXx9z9XwZuq1ybN/w5wD8Sh4iTUX/pnHxJ20uFYYvoGA96NPOenFXzgCSueReEgxayqAus
	xqWzQjp/I+USftdyTCPRfrP9tBo0jYjtJjfJiC2FLu6MDdYhLK+rKLc1AenEEUffRfqiSTKeSoTBx
	8LASs3vpGjv3wstZvKHNP5MUM2BIIo0w1nB1pLpgTy+gfag/FlGffzKoJ4+ropEp+zGPSWFTgKN3R
	SBUVe3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKnpj-00000002SgV-0sOa;
	Thu, 07 May 2026 01:47:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKnph-00000002Sfo-0Xwo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 01:47:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE89643D86;
	Thu,  7 May 2026 01:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112AFC2BCB2;
	Thu,  7 May 2026 01:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778118439;
	bh=6oPqUQeDpsE8w0JZIJK2Mlj2sXrItkxuCsWEs0mWd1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rPeFV52baWiWpN63e2cLNZ10CQskn6kxlWKTb9NHF9qpTHzI6lzIKjsv7b5LTZUIo
	 INdkNV5tu+qymTPW885yXsyQMI6EeCHNo5ug4jgnvTBrTSSZGpu0OOJBpWCMhNP6XW
	 +ukh199ecuoMjmzx3MqmzFH34KM1R8ZkRZ8xFnqWQYe6ZSDlxrevvVl3eso7B0+tWa
	 o1NGRAbjo3ekqz9b/HkthbCsyst6ihuaTSazFgE3kZUGMIuH3P7aZxrZW1qqcAClGz
	 t0Tol5HYs4rLgUkYH+X3omXMqJgCfn79rbco9IKRw5TsbkRc+wWSc0m9KdfKAMGWXq
	 6fCBV4fLKKRsA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, linux-spi@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260506175144.449364-1-rdunlap@infradead.org>
References: <20260506175144.449364-1-rdunlap@infradead.org>
Subject: Re: [PATCH v3] spi: s3c64xx: fix all kernel-doc warnings
Message-Id: <177811673301.749715.1643862335362913694.b4-ty@b4>
Date: Thu, 07 May 2026 10:18:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6oPqUQeDpsE8w0JZIJK2Mlj2sXrItkxuCsWEs0mWd1c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp++8l1LUVHXJo2w9BV3WOQuAI2XVKIGYbdB3tO
 zbrcdh3DNaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafvvJQAKCRAk1otyXVSH
 0LTjB/9yTFNLkx8jEZ0VZ4qokDcNmeA5KRProQ3mNEjqpaks05CrEoBcza5CxtIkTqSAhnIfGTr
 nGP9cGdWtr/WtBBd5iIQYWg1sNhy08xtQgDYQX1GTlfbOK9stdmU86g/9EncYVQRLSj0co0I2AF
 cQyGZhGEJvWABz+tdRWXRN+82hRzYeZksJoazo+2W/2zV/cx9MLBcyKsLDO8qHHv3FhVd6pVM9y
 b4Xdviyl2SUy1Fvb0APUYLfemvBVkhiHAWns9IAnvVCI0Lo98z+szZABh6dAKxbT+WKodrZZdqd
 8N4hlB9JJ46j0v0bG6FY1faA6ky420vKZ2DvSq2E6YGGju+q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_184721_201216_BC1557AB 
X-CRM114-Status: UNSURE (   8.84  )
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

On Wed, 06 May 2026 10:51:44 -0700, Randy Dunlap wrote:
> spi: s3c64xx: fix all kernel-doc warnings

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: s3c64xx: fix all kernel-doc warnings
      https://git.kernel.org/broonie/spi/c/88f731e79629

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


