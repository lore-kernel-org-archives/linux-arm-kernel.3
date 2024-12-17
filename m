Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE8CE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5q2NWIbYlI5VVH3Ab7FcOrPyLHAOAPL2wZ4+ATz0W4=; b=UFH711Eb4Oiej86OVn1msryuKR
	f8JgYw/pJDAjuEi/B8XuqWJwYv+53B4Uc3vAXU6gHHmrkumi8PnvltdOQyCjpPas2JGD5rJkKqomZ
	L3G3tynDIQcJQdcRtMQmfitLi0mTDatJByk5UJq5M3/Mw2WD1Fi8eUvmg0ha/kGSE15OduvjYNjQq
	K1A61fBzXOuA1yOj/8qc/fQfgKXmD1NzktONAshflLA35C2fn0vYoFQvJuvnq5A4SpOMg/k6XyCwf
	xmZYc5gxkqgHsavTppGAypYnB5ShdTP9BdjIFNLVZxF/GEwkWphNad9CYV4ImlA2rs8qlweCY4cGL
	kCNoGlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNS6W-0000000Cago-0ZYD;
	Tue, 17 Dec 2024 07:34:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNS5Q-0000000CaY5-42b9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 07:33:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3997F5C60FF;
	Tue, 17 Dec 2024 07:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A174C4CED3;
	Tue, 17 Dec 2024 07:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734420824;
	bh=M1pOmN/fmrnkiHXjXK1Xx0Kcg/VyvJPOlUCfuO+9V5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJXTn39jURAGQhGGv+xp7kNADMVxFerXYrXU8b7qLyIsuiywVaOrILfic8uMEnAGW
	 vmJjbQHH5yOlMT9jjx964286SF0GY2D77UZGu+bbFxMkN57mFvby2saIGNgLwLTppj
	 APayiuq4DVJrzr9Y5GFJM+sCHbWSPX4y5w4+yD3ypK6jnUCoSCCkrLhHmDzAhgink/
	 yg6DrxmS/R9K5Jhfu3INIeuI4fHWUEghNO9SwZvwbU3HjozLT6qoO1kOReCu7UfG3J
	 AZDfy+yUei/TU0MnRtGANQp2TOzoz8A6BT6woKokEtchkmFiSxkC7sBA2aMuTxNxuq
	 OH9aaBVq6el+w==
Date: Tue, 17 Dec 2024 08:33:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and
 PLL_MIPI
Message-ID: <qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
References: <20241215053639.738890-1-anarsoul@gmail.com>
 <20241215053639.738890-2-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241215053639.738890-2-anarsoul@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_233345_045045_B695F3D4 
X-CRM114-Status: GOOD (  10.55  )
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

On Sat, Dec 14, 2024 at 09:34:57PM -0800, Vasily Khoruzhick wrote:
> These will be used to explicitly select TCON0 clock parent in dts
> 
> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 +

You cannot combine these changes.

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

Best regards,
Krzysztof


