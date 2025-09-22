Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A509BCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7dW07Hh/kuW0Ug6mYchCmYe8nJm/s0YjQtY1nJtniU=; b=bw3GCm3CfH+KsSeEhmnaWdcd0R
	PkooHP0mS0yuDyaLdP9QtPRW0RT4BeCVL6ckKAorV3Wz2mRbVAglkHuoks+ChL9UIP4GxISeu+RBA
	sULAIRoMv7sCravjc063FOE0XkxR/R+KMB+8u0iMB3XxSbTpkMWLMsKTsdLnV6Y2kCbeuaFyutI6F
	Hv44VZ43I5GV4oQ6gTb1JWO+fshbThrT7t1e7WWUEY8pKhob1DTpFVX0JUMoOhGFTeKDzPpNHwnT8
	Sn7+ZDQ2FYe9AqGq9KENCeZCIzzq7csx3c4NZgiH98IhH3y9uQBgLEDsGTuxjQRcQFlWhyvvKCv0H
	XF9vl4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j4Y-0000000Aw70-02VB;
	Mon, 22 Sep 2025 16:07:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j4X-0000000Aw6F-04bE;
	Mon, 22 Sep 2025 16:07:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 654B3601AA;
	Mon, 22 Sep 2025 16:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5CFC113D0;
	Mon, 22 Sep 2025 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758557244;
	bh=uDYH/PiATibzkVKp3bhSIMRzoQaIsWXinC2i/JYS0CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxJqc/rTNGmUln4TmANPiRWizuTM9+LwmP+nBkAHtaMG9q4XhHFKH+RVd1dE9MDct
	 +26poE8+Fc9uHJLbZ/CzZlK43kQ+Q/lItU8TsESkGKm5ClamVPnZEFOPpdoi90S/ZF
	 5Sr9XcYW8MkmGjGIGOKPhRdbwutWm+juG4v0Gj700WWnOultL8XHabWnkB7GKiykbW
	 YXzQ+zU6Qj64EOIx/1ORaXi8HP6xsTAhOX2H//WSlAvgtyHsegJv6n33F2AZQ4Yv3g
	 OeAGy2dsleLfDDj5md8I8slt/NyC5ej35RcCbYIWw804vnCk0Vz8b2LOQCI2ePY1ze
	 B6ajt6A/nQqNA==
Date: Mon, 22 Sep 2025 11:07:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: mediatek: Document MT6878
 pin controller bindings
Message-ID: <175855724108.148988.1499605659192465226.robh@kernel.org>
References: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
 <20250915-mt6878-pinctrl-support-v3-1-593cc007d4cf@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-mt6878-pinctrl-support-v3-1-593cc007d4cf@mentallysanemainliners.org>
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


On Mon, 15 Sep 2025 14:46:23 +0200, Igor Belwon wrote:
> Add device-tree bindings for the pin controller and the EINT controller
> found in the MediaTek MT6878 SoC.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  | 211 +++++++++++++++++++++
>  1 file changed, 211 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


