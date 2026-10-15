Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8578CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2KcvOIUBC/TdV+Jd24lA75BGETvwbl3FL2EbAgIgK8=; b=qDRbxqRPOHEfsO/LhE2VTtYW49
	HkjJd8/QRBBV0H8foGnSmnT6L3vkF9midLfjlbT5NQiIYwJLMu83VlIgRGIS3YE1mm+Cq8VGFor1g
	ZBYIfgYmSDeuPNqof9dT2uEaFHzXF8bbB7pekGHIyz35798menDEmDDeE4645WQWKYm5HUganiwfx
	8a/Ls1Kk+dYMKzbv95q+ra2zfDeQZ9O/eXuLerS7wAcBTCCxiFtvKQivpk/wJEuQ4PNjrwqGciFLD
	sWljyWM9+wBHglkBsaHDUrj/logGrnhic3CJMgk22GFhDxMZI67+PG8KXtUGuulC4ZlxLiZ+k8dAh
	S8KkJt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlR-00000001I2d-2w50;
	Thu, 15 Oct 2026 20:09:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlP-00000001Hzg-0UkU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C54B60A5F;
	Thu, 15 Oct 2026 20:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CC71F000C5;
	Thu, 15 Oct 2026 20:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792094958;
	bh=p2KcvOIUBC/TdV+Jd24lA75BGETvwbl3FL2EbAgIgK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N30Z8VsCTnzf6hxH6BG1u8McAooOMWav/Xpd0C9OPvtD0rMnvNkMNP1E1MZMcsgBF
	 2UqQyRZK2RXYXw7V807NlGyS0P6f9PMismFiBGmjuhnCZz5g+6uYXxYSb9KGyiLTaq
	 0/zh7Md8I7974u3vx/TLGo+jXPU2IZFLxOL9Qa+rKz8z8A8R3F82rBhcwVRK+l14qG
	 XSnqzUt+v0t+acpvhJx9d9WtI6Kd4oF8p3h/qwwX6EeHqGloL3TtCerzyxelvYm0WS
	 WnG+6aEwQQw+21PBdvYl/LEpdCT7PjZFYm8vUzlLP4/9l94SS1w9XVMLOHaK+bTni8
	 yALb+CdLUBYFQ==
Date: Thu, 15 Oct 2026 15:09:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v4 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner
 B288
Message-ID: <179209495610.2841757.13508054994600042568.robh@kernel.org>
References: <20261012100816.331033-1-pmazzini@gmail.com>
 <20261012100816.331033-4-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012100816.331033-4-pmazzini@gmail.com>
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


On Mon, 12 Oct 2026 11:08:08 +0100, Pablo Mazzini wrote:
> The B288 driver takes its mux values from the DT, so allwinner,pinmux
> becomes an allowed property here, required for this compatible only.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


