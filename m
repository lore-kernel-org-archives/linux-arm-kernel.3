Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C4DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wb6rcGnysdOjkFCR0OaNCjFIgpAYP0AzENVy2fFqyCo=; b=aMlAIzcZJNrjZmk0Z3qfAZuqy0
	RM/QrKiKlMa6bhDH4YnSUhqNpDZ37hx/8mSu7lxNqxGzlThkII4lQmzuhABe/+GccP2IMlM9jiOsL
	IPEGrFrPJ/G7d/LQ2jrjv8E38cm54C3X7TiG6fSh10JYvsXHQTsVVSKesuW9hR/Qi146O1Ao0a4q3
	NRWMpX2NmLKiG/bf2JdESro5n2oSlvtb/ANW1uUlp2w9e4zNV7H6cXDerhGuvIHDHn3TdAck6zR2J
	/TuBuZ6CyVfy0FdHoq+5ABl1K4ofMjVOzhzzviGPz/z9GNqs3oGmyjvCxwqkE6120Z2N3gC1SpA1+
	9iJsugVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqHq-00000008Sfq-38iK;
	Wed, 05 Mar 2025 15:03:54 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpp7D-00000008FFX-1RGo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:48:52 +0000
Date: Wed, 5 Mar 2025 08:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741182528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wb6rcGnysdOjkFCR0OaNCjFIgpAYP0AzENVy2fFqyCo=;
	b=MQmaoyaKEFYFydhvZcXatALOg9G6+iaxRo27Zubxen26s7vvqy9imItga79vuEh+y5w00V
	tWEGEMppaREoQugpDnYbR5rrnCLUkDGmLLXekj3bTCnlWwTKfATTL2VFzCOFk1cLKVJjl3
	p2kUCg7Ss/0BrMFApcKJ8HkyKZP2dO+qOJRJEzR8ulRPNUYrkZLwVTtdiLl0Noe+JTodZZ
	HGfHLMvlMb8Rt7OjveDAPN+L1D2ryDxl6T2V446BWwiJG5HV0n3U6QjnH0+BW1VCDk4hzb
	oVWXF1wOH8083b0o/tpp1i4RASMkr5/vjDO8iMglqx5P3dgHv/QerJ8pJkwLfA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Maxime Ripard <mripard@kernel.org>, fnkl.kernel@gmail.com,
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
	Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
Message-ID: <Z8hWN4DpNyTHQf7I@blossom>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org>
 <Z8XcH7xoDC7TA7ZC@blossom>
 <dn7zskhxgdgr25nvbnsjyn5brc3yoc446dxz3vqgbiwoccvlcr@5l6f4byj53fo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dn7zskhxgdgr25nvbnsjyn5brc3yoc446dxz3vqgbiwoccvlcr@5l6f4byj53fo>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_054851_528928_2BEAFD25 
X-CRM114-Status: GOOD (  11.88  )
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

> > > All patches are reviewed, can we funnel patches 1, 2 & 5 via drm-misc-next now ?
> > 
> > I'm planning to do so today, just need to get dim setup first :)
> 
> Nice! As a heads up, it would be really-really nice if you can send any
> kind of 'applied' message. If you are using 'dim b4-shazam', then
> 'b4 ty -a' might do that for you. Otherwise just a simple 'hey, applied'
> email is useful enough.

Oh cool, it didn't occur to me that `b4 ty` would compose with `dim
b4-shazam`. Sent a very belated message and will try to make a habit of
it going forward.

Thanks for the tip!

Cheers,
Alyssa

