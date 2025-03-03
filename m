Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32C2C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xN0OgCy3b1q5LuDbAE8X1hj9Ed53fv0LtyLgIvHWLw=; b=blH9yKGbxB278yi8wvGhlWNuIB
	jNbwtx7Nej03E1oHlfTJ1d/rTRtWAXPSN7Fx1OwLYbsnbK/4aGR0XlrCJyoQoRGeQQgzbjGdKa8I9
	P4rFlXx48dLmQRtg3s5/jFCMvxdxsLNXMxuBuZtFw3IxFQim46KT/mW4zIkEhq13sk3uLyZXaaZQv
	7A/UtLUY5+8ErINmK3P7LquzhgidAGgzIJ20LU2obR/Tj0ScDx0OzImP2NRzsDyLY7mcESfTX6dV6
	WI51p3RHmmE1e1xtzqz+uL5gMHrbt3wGifLt8OVem88XrFL3by/sQJlFJ3exCT1FxJOh9he8zA5qR
	gQlKTKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8vE-00000001b08-03i8;
	Mon, 03 Mar 2025 16:45:40 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8sz-00000001aOe-3bB7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 16:43:23 +0000
Date: Mon, 3 Mar 2025 11:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741020197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0xN0OgCy3b1q5LuDbAE8X1hj9Ed53fv0LtyLgIvHWLw=;
	b=tcCzM1+oyyL625hQt8o31zf6qJpyDtm+6hpAXzLVKn+/ZxZTb9Q+WuR4NdZ0cXeFmwq6CB
	XNOdD4XSj7+1UviD4gsBYGkbLNrZExowUqMcwPB58T8FwPXfe5Y3+4lO8IWcJNcRIf8FSS
	Sl0gw+6ZKMZVxSPbxK1esQNoxAj3H4Eu/WGKT7nUKTuqziWx8nRw/roEeS1cgxNI8z2zJ7
	TsaoQhvUIucMFJRo3Ze4aB6/UiozFezKIOqpJrCMT+NhM6XullJbqA5Cv3v3+O2K/xvVjM
	EbJCFW77yP0ce+qQoHXbO/igKXviqatuHW1i9jZ6JrlqnaOyMJm1D3bFTyT3Fw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, fnkl.kernel@gmail.com,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
	Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
Message-ID: <Z8XcH7xoDC7TA7ZC@blossom>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_084322_321315_7FB03015 
X-CRM114-Status: GOOD (  12.43  )
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

> > Sasha Finkelstein (5):
> >        dt-bindings: display: Add Apple pre-DCP display controller
> >        drm: adp: Add Apple Display Pipe driver
> >        drm: panel: Add a panel driver for the Summit display
> >        arm64: dts: apple: Add touchbar screen nodes
> >        MAINTAINERS: Add entries for touchbar display driver
> > 
> >   .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
> >   .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
> >   .../bindings/display/panel/apple,summit.yaml       |  58 ++
> >   MAINTAINERS                                        |  16 +
> >   arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
> >   arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
> >   arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
> >   arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
> >   drivers/gpu/drm/Kconfig                            |   2 +
> >   drivers/gpu/drm/Makefile                           |   1 +
> >   drivers/gpu/drm/adp/Kconfig                        |  17 +
> >   drivers/gpu/drm/adp/Makefile                       |   5 +
> >   drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
> >   drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++++++++
> >   drivers/gpu/drm/panel/Kconfig                      |   9 +
> >   drivers/gpu/drm/panel/Makefile                     |   1 +
> >   drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
> >   17 files changed, 1489 insertions(+)
> > ---
> > base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
> > change-id: 20241124-adpdrm-25fce3dd8a71
> > 
> > 
> 
> All patches are reviewed, can we funnel patches 1, 2 & 5 via drm-misc-next now ?

I'm planning to do so today, just need to get dim setup first :)

