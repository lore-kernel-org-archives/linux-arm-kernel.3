Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA1DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwauHYi+Cg6NfETQ+1TOR8v3Au6FJAQXQlI6/orL2RY=; b=VI2wRK0J01q3iQmhs0XrRO2qRl
	dWivWpfM19jb9Fm+ZX5UVxMIYFfvYk4ufoP9lj9/LMCjcIlT9vt8QOWxQXQRM9Xg76rt2c2OcLMWo
	lA5qQYZqlb2JCm6pfGOfgoCfP/fL+j28c9uZj3jym+WakQ4c7tornt1V1hBSn8S/+5gJ7nu5djMFc
	cJLSsENmTfWmBiNb/icWweQ9UFZXRzVyTCuv07VeeRz3oMEH6k/fbE5X0Bi6hePHPAH6BNRqII5oq
	LACtm6AUlC7ZHu+tP4+eXN3HCS0z0m7sLRyBlAMIl7p+H/QYwBW7RhkugN0zA5d+TELWgwyRA2ZoF
	y++rwPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUnX-00000005PQ6-1rWp;
	Thu, 14 May 2026 12:04:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUnW-00000005PPz-2Rik
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:04:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D9BA60121;
	Thu, 14 May 2026 12:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313F8C2BCB3;
	Thu, 14 May 2026 12:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760253;
	bh=3Ophp1rxRSOQOJoDZj+hxZG0S99E1oAe3Jsf1A4VFLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rlEa66C483gqkdV75Q58miOOP3AEeMxaN8khSI05Hi8O854PezJ3slt0Qx1lOql1s
	 De/Fp3derf8ytHNA6LNqQ8K9NtSan9ij8uu1s+0k0Rc3wYzf5jVdVMS6JcreSTn/8O
	 pLML4huCT3hNRtguQjx6HnGrnGbvWR8+QHAsGdJiQUDw1Dv8663DX40ML+rngtj2mx
	 G9ciTPPXiKoz4nraWCTXQZqTZdap8IJb8WPYqRtu8unwi1IKoUbz0kHtsZABQjGXYQ
	 MVvFm2enwuXzjE2+sxa+js5cjFFMPRixgColVzsmqjtMeYPwH2fSgTij0l2VGuxMK6
	 X6PtaVNlqvjug==
Date: Thu, 14 May 2026 14:04:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33
 layer reg space
Message-ID: <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <20260509190015.79086-8-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260509190015.79086-8-jernej.skrabec@siol.net>
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

On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> As it turns out, current H616 DE33 binding was written based on
> incomplete understanding of DE33 design. Namely, planes are shared
> resource and not tied to specific mixer, which was the case for previous
> generations of Display Engine (DE3 and earlier).
> 
> This means that current DE33 binding doesn't properly reflect HW and
> using it would mean that second mixer (used for second display output)
> can't be supported.
> 
> Remove layer register space, which will be represented with additional
> node, and replace it with phandle, which will point to that new, shared
> node. That way, all mixers can share same layers.
> 
> There is no user of this binding yet, so changes can be made safely,
> without breaking any backward compatibility.

There is user. git grep gives me:
drivers/gpu/drm/sun4i/sun8i_mixer.c

which means this is a released ABI. As I understood, the old code was
working fine but just did not support all use cases. Why this cannot be
kept backwards compatible?

Best regards,
Krzysztof


