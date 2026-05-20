Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D69CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0lWDGQPsgD8Yt+SND0PZatIJxC14109hDfaKdLRGZc=; b=mEm8tCwPLLlei0mbRCuA26VA8v
	XPy4PATrrnWmp9cwID8hPsiziqNrff/vG/ClH+nar6mynkdgcibsoV6IRuOR1ogswXttseDfxlRjJ
	Ia+yTS4CQ6QLU8TUEF7YNrvNA2eqI6uYOs5nrKVDSZteCWd8MBLvjrCg9mcu8kLZsxRvLJ12GQm70
	tvhsX2EzE/flHumqTRsHLqxFtXrU8lXSJw3+a/DGmuVQIfPyQWdUwcMOwwkJRxwMhpA3VaHI2yyEM
	p1SJ7FQsoMb3ugvSTru+wVDcn5Rtcq/+L++mlK1ZhstEMSaZ+Zgwfq9e4KtiO5ssdH4alfl+pUW4a
	oPTkKqPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfP0-00000004Tgm-0bC3;
	Wed, 20 May 2026 11:47:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfOz-00000004TgQ-2A3I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 11:47:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7546600CB;
	Wed, 20 May 2026 11:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C29D1F000E9;
	Wed, 20 May 2026 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779277672;
	bh=u0lWDGQPsgD8Yt+SND0PZatIJxC14109hDfaKdLRGZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bOFCMVGJXFHkVeFNfzqsvgVmMLrcUtaCiVj1Y7yJ1pOPV9H/G+h2qeXk6km5b7MpQ
	 v2n5pWvHXYW+qs78HBeFlxsLKMtZJs+42RdZcHqWzkc/0v3Pf8lO9qOl5rc49Gxl3I
	 ROZYhYEySzTKD4OERMpijGA8BoMH9dFv9cbZYRRQagM3LC9foWUzqYNDTiJBPRmRX+
	 ctetoItSkshyFzA3B21q2QfjUSeMpgY5yfinoqAxG3ELfqo5Y8ZTPQQwuGpIcvHPOm
	 apuh7k1/sh7QNvdzuV8NtzaPloSps9JQZPHRF/5Va0X/GL2Sjsmg7eDtGRlpCSq86q
	 PGuISNquSI0FQ==
Date: Wed, 20 May 2026 12:47:45 +0100
From: Lee Jones <lee@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Maud Spierings <maudspierings@gocontroll.com>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v8 1/4] dt-bindings: backlight: Add max25014
 support
Message-ID: <20260520114745.GX305027@google.com>
References: <20260407-max25014-v8-1-14eac7ed673a@gocontroll.com>
 <177755722019.2606736.10749503716773482329.b4-ty@b4>
 <agyxLnTYstqRwGva@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agyxLnTYstqRwGva@lizhi-Precision-Tower-5810>
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

On Tue, 19 May 2026, Frank Li wrote:

> On Thu, Apr 30, 2026 at 02:53:40PM +0100, Lee Jones wrote:
> > On Tue, 07 Apr 2026 16:41:42 +0200, Maud Spierings wrote:
> > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > with integrated boost controller.
> >
> > Applied, thanks!
> >
> > [1/4] dt-bindings: backlight: Add max25014 support
> >       commit: 5fcbbedec9dfce78044eee922bf2030e1bd03faa
> 
> Lee Jones:
> 
> 	I have not seen it in linux-next. Anything wrong?

I don't know why Backlight hasn't been added to Linux Next.

Rest assured, it's applied to the Backlight tree.

-- 
Lee Jones

