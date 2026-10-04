Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C73BCA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 21:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dznMhbarLMivAgJOVrxX3y7MErwS1c7oJy/giVli5uY=; b=WrrqrCl6uOLLBVlp1cdSgPOEvD
	dpB7ZRZVbR/CpppVIcRXK1PdQSnKWnM8B0StTSnq4iNiTl5jfc1e2ZGzXr6LAM+tBrUEGRIsBDjUU
	rMvh9wE4Y2SFo8r3kgDjYk1knBsRn20AVy7k1IdHSaY1B1iyYs1s3MR/OxHveZxrYa0N2pLleQtSa
	oJLXMwiThAhakTeBwFPh9xwHXjufRq0dpkeTivOC/vPKMmEOpyU0ergeANupEKua+yHt3GmyDWEPR
	WluzXo093h8/pKyAniedSdHAObU3HErrFUhP08jCBD4wKihAe7YAIOVdGAyOMhB3WUQg3+3mBbkZ8
	P1h+p0Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTaO-0000000FL38-1Ouf;
	Sun, 04 Oct 2026 21:17:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTaL-0000000FL1Y-3arO;
	Sun, 04 Oct 2026 21:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dznMhbarLMivAgJOVrxX3y7MErwS1c7oJy/giVli5uY=; b=ibdYPqeu4UvBJixwGgOV0bR56B
	grF38h8+aRBuap2gvI/pB76vkbjwVNjbDmxCRRqLZlPfmdwR1IaLVY0uK652c3xaI56PWRHY/6QRJ
	wJlx4VscCBidege7nnpeWLEa/cAeLY3nF8cE2qYbRvk4kPcqg56pGjLoSMNEUY50lsSfvO7FrhmCb
	mcllAv+OytFnvBGN/M6VC9DMPo7Z/XZGVbUclj7SslfP3Si/mGie2+hoN0r66yBFuRU5UcUWZtIsL
	h/fAXw2jo5FJ4cTs2Hh8AUvrRJqaMteazBEV75SQbMVcNoSKCrRLUNEOxy5ZlIrPb9mFPvKCui8Uf
	h9gcOeyA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Use GPIO function for PCIe reset on Orange Pi 5 Pro
Date: Sun,  4 Oct 2026 23:17:21 +0200
Message-ID: <179114864094.3283966.7199370518358824006.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002025746.3284691-1-dennis@ausil.us>
References: <20261002025746.3284691-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_141729_894349_9658129C 
X-CRM114-Status: GOOD (  13.55  )
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


On Thu, 01 Oct 2026 21:57:46 -0500, Dennis Gilmore wrote:
> The PERST# pins of pcie2x1l1 and pcie2x1l2 are used as reset-gpios,
> but the default pinctrl state muxes them to the controllers' dedicated
> PERST# function instead of GPIO.
> 
> Linux happens to work because the pin is switched to GPIO function
> when it is requested as a GPIO, but the devicetree should describe the
> pin function the board actually uses. Bootloaders such as U-Boot apply
> the pinctrl state as described and do not change the function when the
> GPIO is requested, and probing pcie2x1l2 then hangs.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Use GPIO function for PCIe reset on Orange Pi 5 Pro
      commit: e95e4fcdc4541e999888f297174e8f6f5f5f899a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

