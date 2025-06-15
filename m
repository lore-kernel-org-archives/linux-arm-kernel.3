Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380D8C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfbP0E8KrqDNdlO5clO9fJs/YY7m0gR4umy7Bl/iFI0=; b=nkpCJNIHirLX3yLT6uBb/+NfO9
	krIWBcgvIr5arA0e5tCaaKq43CVHHegU7rvaAWv+mXeuENmE0trxljMhS2iY126xJZ1s+9PlDXmLx
	5k6r7OYlCusOHIob7cd0rAfGko0OqG85tmBWmnFfNNXGdmVcpnAVAIbOErHUI0G3EAvp/hYhsXGFt
	74JOJui+ARKYsHyI8016syaGhLDRNAlJtHEyOQGNwZIKkk1Dp12exbWhYYTthlTbwLeO+XuOflZWC
	HF/Z4SOLoHEm/pZWVQ2/+1K7JuUh+XUJSnc2p3QwjIIIPizEAxv+0gO1wieE7Crt49rnG5GhzyxGm
	mpSARjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQqjV-00000002gm0-37b9;
	Sun, 15 Jun 2025 17:01:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQqaz-00000002fsj-3IYD;
	Sun, 15 Jun 2025 16:52:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A34161127;
	Sun, 15 Jun 2025 16:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD29C4CEE3;
	Sun, 15 Jun 2025 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006356;
	bh=HAWTeDj+3sd9b+9FiKThyghoJ3PqZB2HO2NIzGCnFiU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mi/TV5hpcWPaInKAdCyoC6rBZuOyo5KIpoWfv86cyeQrl9w3wyPAtQLD03SLTtDpO
	 zXgEGAoEZ06GFXV9dnjiiIk8j6lcJT9cfKfJ8vhhzxavQX6dWVYtiG7CV2pglR417i
	 R1SPYnuaoino5n028Cctt+uOkxhtiZwnfX8tKft1G1BE1fzvW4DgMnkkKgcqyqQ2US
	 pd0yTw9X9VbsLCkpN1TpoC0Y00do0xiXmTfi6GvnlEm9KxTPPrJ81MtVM5ghWd6RFv
	 Xv1IHEZ1DYBuu2swiZQWYQtJoVLic/yU/IExJM+ulXdVbCV/r6I10n8ZZ7kGmWG7U4
	 5VukkOUAJmFvg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, christophe.jaillet@wanadoo.fr, sjakhade@cadence.com, 
 bwawrzyn@cisco.com, u.kleine-koenig@baylibre.com, 
 krzysztof.kozlowski@linaro.org, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srk@ti.com
In-Reply-To: <20250610130133.2102196-1-s-vadapalli@ti.com>
References: <20250610130133.2102196-1-s-vadapalli@ti.com>
Subject: Re: [PATCH] phy: cadence: Sierra: Add PCIe + USB PHY multilink
 configuration
Message-Id: <175000635358.1180927.3012221075684762895.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:33 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Tue, 10 Jun 2025 18:31:33 +0530, Siddharth Vadapalli wrote:
> Add register sequences for PCIe + USB multilink configuration for
> Sierra PHY.
> 
> 

Applied, thanks!

[1/1] phy: cadence: Sierra: Add PCIe + USB PHY multilink configuration
      commit: 6767df73f2d36e7d1cf0eb3c4d9469c7e9fe9824

Best regards,
-- 
~Vinod



