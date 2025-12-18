Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0992D6D232
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mW2aD4UBObqi03Dld0xUMtjHcv+gt9U8kqqcPQHt1w=; b=bkWSmZuTBc0WPSQ1/6jtmFrKfg
	rkF2WzOhVqeiH6cF9U7nOW3FA20Qk+v3l/b2K9+u9NO1qJv2rk8SMVAKJYhgs5CSthVUfLoK4YQiZ
	/IlJMQGNsUK44pU++oYgPv1TNGk6yrkJPaQE/t4W69JzkxwwgCYCCuK1iCs9jSdF7KOcaGiy6csjW
	i9HAE+jqpr4BlEBBAY1mE3CFr4dfUl6l5xi6G82ug1jbiSKDvMlOErnDDx5HwYo52QlwhG3NkfjPx
	CjsRK1zGd8uzw+v+i8pHepaPv0cwXGkXf8kKkVwVBB/XIz7Ja92cOSjlBPQi9Aicojs0k9lwj2Yc8
	k1SD+EVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGG0-00000008jOQ-38bC;
	Thu, 18 Dec 2025 15:49:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGFz-00000008jNV-3E1k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CEE6E60126;
	Thu, 18 Dec 2025 15:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC832C4CEFB;
	Thu, 18 Dec 2025 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766072974;
	bh=8mW2aD4UBObqi03Dld0xUMtjHcv+gt9U8kqqcPQHt1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVcrjQTd9ExLAGGG7a8y3JonfT97FxOYBFxnUqUXTXl8nKgbLaMSDV0xBLO663Npa
	 swspwOFxkrB/beoY0/YStd9ld/SpYr151oKTRnzNpUikKr16TjIVrVN7P/RfbiCJM/
	 xw/RNm7W9MMelCilslf1d5GiUUn0yQnh6oSnzFrc=
Date: Thu, 18 Dec 2025 16:49:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
Message-ID: <2025121810-tactless-pegboard-feb5@gregkh>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
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

On Thu, Dec 18, 2025 at 04:44:07PM +0100, Alexander Stein wrote:
> * TQMa8QM on MBa8x

I do not understand this changelog text at all, sorry.

Please be more verbose.

thanks,

greg k-h

