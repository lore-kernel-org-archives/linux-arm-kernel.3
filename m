Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5288CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5NDrwDJym3Uv1DPz8XoMSgHuAayDtigJhu10Nj2YoQ=; b=rlq/QOUtv76XAXoDOFt85KXvrh
	1iB2DD4T8veYRCaf0+/EctN8RYIxbGleK+kfwoVZj2StJ8P6OJowYJ4M6ewVj652KVofPTk6Zdx+t
	/UxaNc5An1tmisLafSaxGdmP0UcRMCfpHlSF8/uIWFAxqAW0MAmyg267nvlcXw5wHf+Qv147zCCsz
	UtPsvo6/xVX4nGVXbtHsaMKqt3A5/AtwuqvLnArmQ5iM+WB1LJusmZ177jxhiJKgf9p8VYqiwB8rR
	ER5nON0XF9gF3yhbCjiwa7N0/npyr9LV6ydZYypJ8NR0ZbJuHgxrdHkgVcJo3Jp/p4C3f6ko8HXbe
	pzdmQNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMeK-00000008wFD-0Mpz;
	Sat, 30 May 2026 16:35:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMeE-00000008wEN-1upx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 16:34:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9298460120;
	Sat, 30 May 2026 16:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B451F00899;
	Sat, 30 May 2026 16:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780158892;
	bh=+5NDrwDJym3Uv1DPz8XoMSgHuAayDtigJhu10Nj2YoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a+qUNwhhJLQeEPLHkh36LAfgqIc49SCQXi34MOmqiaFQr42q2LWQPiUmM2uH1E/YX
	 c9oinyC5BT/G4cAT1k+Zl5G4ii0WNdRvwAoJ5ibrtRogY6eWIYk7tJkEvHDYtN/lAN
	 FNc8QE/T3lKbK4VrPsFc2FhQhdGkwNqYvcCZmkOCg272zhNfn55IS+nwlqzhM1aNty
	 tf9OGPg1VkuP+waan39rtxM8Drj6Hu3DCMEcVDX4cGp6elk9rUn3+eKFSKGZEzbN5J
	 ALx5Jy51Tfmxv6/G0iyLBC3rsMOLaH/OiibnHOlZ6XFpWmk9sEmTeC5JaoImpLWvMB
	 iXyNl642pA5/A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as a co-maintainer of Samsung Exynos SoCs
Date: Sat, 30 May 2026 18:34:40 +0200
Message-ID: <178015858043.36212.8088079079471293822.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527-samsung-soc-maintainer-v1-1-40829c3fb133@linaro.org>
References: <20260527-samsung-soc-maintainer-v1-1-40829c3fb133@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=krzk@kernel.org; h=from:subject:message-id; bh=tpIjyac01EcbfvGyKcSJyK4EU8AdvfjQL44NA7Y2MaU=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqGxGgWvj9lctOMdAqLOjcQqFFDJo+c2BPE6BTn 3lfBoQDdSGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahsRoAAKCRDBN2bmhouD 1ystEACWVTUMdDRU8Gbz57D5a/6aZlJHyyb/NZBpagrn8k5jUNzgB14+PTrqMMrZvyid2BAarv6 //NcRYph4FAjqGlbHwg/2Z/39SAeu0/pAWptNs5kMim0BMgKiaGCrRJA/2dWqrCPwBFBCQpoVWb UMvW0LeW8qlINSEASdDKih7GqTtEso7AaK/FE5+PEFwE/zzY0tKcRGZTW/vGAbq+Was7B3f+Eag 8YUaxNvjYfMC8OXuQMD7KrPz86HUuRABHX72Jz1ktFMayx8ZEi4+fvZ3I4QvdewRe7j2YxoYtLX Me6+1V93QtNN5zVvpuB2TNXblxxrwweAj0D2BXBnXxt+LCP5hKgWsgPgP/hu3Q0CKRsq0YTmDuf mQaXCg7UcRni/nAIoc97XW+hfMl5IHyBsUdbO7t1rVdBF8QSB1ZNG545qOe9wvJfRNK7CZbIbgv boesBzoivUu1xTWHp2qFmdMP1MrtsJern5zT0ZrK4s1R7J21xXP4eWjuyi2QabGJYzomQrnSOCg K0R5111jQG9dFG/mRIBNfaDMkr8pQx9Lzbmu/hvaaFi3dAVHQwrhdwGAgAzRy4JFVDmLxrMO5KE 7FMiMlciA+8VB+cY1p6PqpAU5eUseI8uazhkssUsH1s4V5Dknby9x0FVgybrX5TT7dWbzOqTfac mZ+n7ib+J8j2E
 ig==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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


On Wed, 27 May 2026 21:24:29 +0100, Peter Griffin wrote:
> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on many of these drivers and have an interest in helping maintain
> this code.

I have multiple subsystems to care of and limited time. Also, with joining to
SoC team I figured out it is good to plan my succession. Or backup.

Peter shown both time and interest in keeping Samsung Exynos code working, thus
considering above, I proposed Peter to become a co-maintainer here (same for
pinctrl, which went via different tree).

I will still be the one handling patches for this and (probably) next cycle,
but in a further timeframe the roles could reverse with me only providing acks
or reviews. If this works then depending on other duties and amount of work, I
might be slowly transitioning to leave Samsung SoC maintainership.

Applied, thanks!

[1/1] MAINTAINERS: Add myself as a co-maintainer of Samsung Exynos SoCs
      https://git.kernel.org/krzk/linux/c/20550601bf4c23effa013a5f37e5250618869e87

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

