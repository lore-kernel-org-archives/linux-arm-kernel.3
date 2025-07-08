Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E628C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82QyNWyksEV2y6mZrx+0PdJS/f9NQV9bGqCJptIAzkA=; b=AxaDlGUdyz41W6DJcpfHr0pNOI
	SeCq4Qtcds8GgP7Xk8z5XUuCuwQkE70PQsK4WcvDhOZ9IkDjY0t9JjJGHLRM5jb9rgtdgCyT4T0kk
	jQkdP1iUaGJ/EpbokekL6ODNlhVTDpqjkIyujWDa1RnBajHctFNKp85lYmB8JlB16Odxej5QqCGXt
	5ywss6G7EdjdfNkYqBaYgfaOtDGCf79q8Bf4FZ4jA1rw5OPWTCuc4SDBw8iheVAjlPLseSbOtn5SK
	xV1Pd+44bBHAgW9RPOq26HuvLeAP0cPctd74JHem9bBqT+oX85l5fTjJdBhRivLdqrFW58YlkDYC5
	uoF2lRwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCoV-00000006DPi-1urp;
	Tue, 08 Jul 2025 18:13:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBvJ-000000065QX-146C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59A3161441;
	Tue,  8 Jul 2025 17:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2C6C4CEED;
	Tue,  8 Jul 2025 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751994964;
	bh=oPxuCNoSxUQ+b8uXTmL/LOlmEoU1tSZIe+IvYpZDa8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HltkWTojIJI9h36Gf8tmykgdvHzadVkH/W2wil4AP7Tg6oLn0kxNchvTP8ynmfm10
	 yFFbxmO8M0CeUhkZgpGmRfceEHFh0cfFieOD70WMc5fLtdINn+yzjjRhevqeS7t7mA
	 r+Lep6bpA2SlfBCTmQRUK+xJNEJ/1+Lw4Ot662uD725X59CLU4guzi/IIqfIH4LFab
	 lWSLQ/f/2UshcN/NX8LDA3L/gNpkw4d3qQvWXExG+CfgPbfRnv03IL8GSAZEkCD0rx
	 QNgfzhhfJCEXWJO3Fe4ngxSAjPSrgfdSBfsXOkf9aT1FQ3nS4D9gWOi2FwZXJqJt11
	 +eTZGPfg2RFUg==
Date: Tue, 8 Jul 2025 12:16:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Yong Deng <yong.deng@magewell.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 1/9] dt-bindings: media: sun6i-a31-csi: Add optional
 interconnect properties
Message-ID: <175199495940.648604.8324168473122471061.robh@kernel.org>
References: <20250704154628.3468793-1-paulk@sys-base.io>
 <20250704154628.3468793-2-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704154628.3468793-2-paulk@sys-base.io>
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


On Fri, 04 Jul 2025 17:46:18 +0200, Paul Kocialkowski wrote:
> An interconnect can be attached to the sun6i-a31-csi device, which is
> useful to attach the dma memory offset. Add related properties.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


