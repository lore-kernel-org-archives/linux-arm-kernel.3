Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108ACE67A6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 06:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UvG7nUraMWXSNpbZhK8IBZM+wG0yS64UoslEqw21pY=; b=PPTS1KlB1dn8GRTrYMDEWSSEa9
	YZcJmhCL1u/FrQ+3Fn79WDCuko1FcYlONgGH8S+TB748ORIRc1afx4bjYyiC54kMJt7zd/yByDblC
	VtnVKnlUKRsMgZfF4ez6fxXcBF59yut9qjwrRBQipD88IS2sSQN7DDkyhc80tDzupPidh/a8MW7T+
	QYw+PF9B4jRHmIrWWMnLJFWrpcwZ9z6dxk6hYrY6I/Sa39DQfs2cGe+ibesU+vgDcr+9NINXfU8Zr
	mRORWaHTJ+d+E8AY9Ho4MWrv6cU7PD1kzI5uQi5vOOdpqJ64SiTnNzC6ZMjunasz1YO+BH3yATntl
	ZnwAaHzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJbs-0000000EdLI-29Iy;
	Tue, 03 Mar 2026 06:52:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJbp-0000000EdKy-45Cc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 06:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1607442E20;
	Tue,  3 Mar 2026 06:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64ED1C116C6;
	Tue,  3 Mar 2026 06:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772520717;
	bh=C5He0Shh3Nc4LenLLbkryUeH2KhCx1b+RL5r+ILGntE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s7/Ye/30R2BX84QSrXsrPSwHTwm/VH++iQcZdGJGGxVnIt2PNR3ZGtyyZPxhheXxX
	 WYdAJtiq/OqUaItEyUT2Mmj9OmRiJmD8Vy9HlYJoCU9FZVvAKYFDh7RULL71tBOdn5
	 mZMpW4yfmv3N+cH419L/vsyODjFxVFXgeedLZoqr4Nyt3zvN3XkDo1uxNSCsE225eZ
	 tgoLmp/vY/wlbumZ3ucP7QybJgZhXtNNuIp32XWXRr0ITtNv4JB5iwleVf33hnAnwI
	 saWE1uzRBcVeShX4U7Y/C2ZtzmyewovFJnQPSwiL8Jas/Vfq5mm7ikWxYr/AzNbHHe
	 ixkJzWCjAu2Sg==
Date: Tue, 3 Mar 2026 07:51:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, shawnguo@kernel.org, laurent.pinchart+renesas@ideasonboard.com, 
	antonin.godard@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH 05/14] dt-bindings: arm: fsl: add
 variscite,var-som-imx6ull
Message-ID: <20260303-hospitable-cordial-smilodon-af6300@quoll>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-6-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302190953.669325-6-hugo@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_225158_038210_CC0E8548 
X-CRM114-Status: UNSURE (   9.82  )
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

On Mon, Mar 02, 2026 at 02:03:41PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Add support for the imx6ull CPU variant of the Variscite concerto
> board evaluation kit with a VAR-SOM-6UL.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


