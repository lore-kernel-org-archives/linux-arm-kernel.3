Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BF6CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 19:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69MHVnGdOAe0SajgriMbKOljFABccXRQ0VGfA+upUvo=; b=QdCzqxPAMOtN/d12q/I1IVDkJz
	YXufso40hFLe7pwxhWfeQH1TCyu4ySbhL1W8MfOeqgtyeMjiLUg80iqCIUF6/JW5cGByYppqqwclD
	rHo2PTMzMY11lWhuUfk3lZZ4uLbkrADCIYGjeWypCi7UUOYobMJHwdzTdrLO7RekhJFAankXp50ab
	HO7FNnv4IyPrbU43FsN2P7VcIhTyeToqivAXVVS8eyeehPcAwBWJoM1ZUPCYa/0HIXQ4/SpVU9BPr
	ZWrQpapZVoBZ4cVZEQoZ/2ZTbYkLZ1fOCnMQsDbL3WaBL6huQzpRY5jlYVKCNaBZQf7G3LWZ0o/RV
	ULNtwWbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDo2W-0000000H2kA-3egA;
	Mon, 05 Oct 2026 19:07:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDo1h-0000000H2ev-13W0;
	Mon, 05 Oct 2026 19:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=69MHVnGdOAe0SajgriMbKOljFABccXRQ0VGfA+upUvo=; b=LuzOGfVvoW9Jpv8B/8hUo0ZXzQ
	S0jPXwmSOKae+3uANqfqfxTClfmCwMMRiksQSY236dpdqm1PCPW7HB18LRfmvyMqeitBpGPfQFRAL
	XJ62YU7IJi0YkbBXofkTgSyo1ANHD9k/XgZIKrdIzpGW8wNF59tfnrYNPJYleFodMDRUDcnXnuqOc
	+T5/C4XPwNgX3vLsacgau9p8XzncCNXXq1bLA56Coe20mnj3tBYYsJU0MTOHXzBIRL9I/KqKfycBz
	O3lRq4TLpy3HXnZ/p+DbWgf9Wtc8Hmv0932KeB0sqFttWqOUjQs9Lc7GRFOYVNZWR16U4FV2e8Jxb
	BFVHJYjA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amin Gattout <amin.gattout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v2 0/5] media: rockchip: add support for the RK3576 Video Capture unit
Date: Mon,  5 Oct 2026 21:06:53 +0200
Message-ID: <179122712929.3317128.1173871776565894592.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_120705_312322_813BD21C 
X-CRM114-Status: GOOD (  13.01  )
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


On Mon, 21 Sep 2026 17:29:56 +0200, Amin Gattout wrote:
> This series adds support for the Video Capture (VICAP) unit of the
> Rockchip RK3576 to the rkcif driver.
> 
> The RK3576 VICAP features a digital video port (DVP) and five MIPI
> CSI-2 capture interfaces. Compared to the RK3588 variant, the MIPI
> register blocks are laid out differently, the ID_CTRL0 bit layout has
> changed, the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1, and the
> capture size is configured in the new ID_SET_SIZE register. In
> addition, the pixel clock of each MIPI port enters the VICAP through a
> dedicated gate in the clock and reset unit, so the VICAP claims five
> interface clocks and five interface resets.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: rockchip: add vicap node to rk3576
      commit: c9f69938f459e80471759008ce7504a637e801f6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

