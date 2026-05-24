Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041A7CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 21:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2bgs3hxq/b6hYch8osYnasgSoV5kG2hhrESAk4/vdE=; b=48tqu9v2XaHLRFJxMpPjt0LeEo
	YnddoNs6H2v0Jiq/G/Yh8rG/8fpAV1VWWfb1EKTUvCHqQESwof3H66HCPBcf/JVcQmLLBOg0Tvj+A
	YvEy/dyWFuxUiAakk7eCa5bfLl7SDK9pSkaOQF3GlQ+l+Und/OYpNYLg4kRdBGDOqz+6wHOG9VNNO
	JBFfRtrbp9lm6kDo1PzPIpx2zS95Fkr82em1XBVG4ksdPZXPJHJfwYt45n6ssuciok4Btohk1mvbj
	7jRqBFlSQ52x530ciwDqPjynqOmw0P7g+Tsnvv/LAF/YerGD6RNc9/ydTqueA/v6/Z9PmIFInZmMN
	EnB/Nw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRGSJ-0000000FgRr-0Qw6;
	Sun, 24 May 2026 21:33:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRGSG-0000000FgQy-1dV0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 21:33:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9110D442FE;
	Sun, 24 May 2026 21:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BF51F000E9;
	Sun, 24 May 2026 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779658431;
	bh=U2bgs3hxq/b6hYch8osYnasgSoV5kG2hhrESAk4/vdE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=XwP2+gD5BnemlPnX9mfPqISPgLuz7K/mdva6FOhU10kHMPA7wU+BjcLE6qQ6jUro/
	 vDbZZzK4MFzWmZUQYPGDXZY558lp/RLoEvLVDvUdGhLph5yod5Vtb5wi7LmXYIZQJJ
	 Iyn0kffNxLwXBCezu26RN0q5OpR8qvwO/ROjyIZGap6h3j3L1pUECK0x3DxBoa0u3U
	 JHoFFMp+WQYlf/63ct6pAy45hXVPWF9ZGz/JVOxkB64PXxxsLTyyWQKrkmVWll0yfG
	 hTjVFYMfxdHzZmioqFcPIan6qaUUjqrkFSVV3rZ0i69iEgVxiDFGjF0O5kJG/fVS5T
	 1xwt/y0klJuuA==
Date: Mon, 25 May 2026 05:33:45 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, samuel@sholland.org,
	mripard@kernel.org, maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33
 layer reg space
Message-ID: <ahNuuaVlDl0KvOSj@home.wens.tw>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <20260509190015.79086-8-jernej.skrabec@siol.net>
 <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_143352_454879_0CB6D3EB 
X-CRM114-Status: GOOD (  22.55  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

(resent from new email)

On Thu, May 14, 2026 at 2:04 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > As it turns out, current H616 DE33 binding was written based on
> > incomplete understanding of DE33 design. Namely, planes are shared
> > resource and not tied to specific mixer, which was the case for previous
> > generations of Display Engine (DE3 and earlier).
> >
> > This means that current DE33 binding doesn't properly reflect HW and
> > using it would mean that second mixer (used for second display output)
> > can't be supported.
> >
> > Remove layer register space, which will be represented with additional
> > node, and replace it with phandle, which will point to that new, shared
> > node. That way, all mixers can share same layers.
> >
> > There is no user of this binding yet, so changes can be made safely,
> > without breaking any backward compatibility.
>
> There is user. git grep gives me:
> drivers/gpu/drm/sun4i/sun8i_mixer.c
>
> which means this is a released ABI. As I understood, the old code was

We held off on merging the DT changes so that we could rework this.
I can't find the actual request though. It was probably over IRC.

> working fine but just did not support all use cases. Why this cannot be
> kept backwards compatible?

AFAIK the "planes" block is shared between two display mixers. As the
commit message explains, this prevents using the second mixer, since
only one of them can claim and map the register space. And on the H700
(which is the same die as the H616 discussed here but with more exposed
interfaces), there could actually be a use case for the second mixer.

Hope that explains things.


ChenYu

