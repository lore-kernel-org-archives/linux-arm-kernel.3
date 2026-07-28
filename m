Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D21BC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nFE7ElBXlbOdVWwIBeNyvfZnpknUDTM2BKLJqBrg7I=; b=dHNjQ+nNBFdwFIqWGQKbJO07dy
	wML2hIdr6RLcXS6zkiJml87z4f+90sVN6pLTZtatcdo5PJX9yF2i12slU+e6M4Jz7GBvQblJP9GnJ
	lSLNovjjloqazKAJap79uIpki7rgWERypaKDDXCoLYLsS+XeFvTfhK7RL9f8ZgpJr7JeYaFhP0uyB
	9IJCtfBCHdxwli9l0UlTy/2QK7JomWBvLroW1k0p8J+wVzyP1c3wN7N2wbo8oZ0Cl/hVad2FztGaN
	kJkxHOI5orrDKZF52Ib1eFsJkZizGvyPa51A5LQb59zQUVpsI0xy+OnFEbFRt8aD//dg6SLxzUK3y
	PnSAxACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woizI-00000005Wte-3EXO;
	Tue, 28 Jul 2026 14:40:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woizH-00000005WtI-3U1L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:40:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DCEF0600FC;
	Tue, 28 Jul 2026 14:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043191F000E9;
	Tue, 28 Jul 2026 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249654;
	bh=8nFE7ElBXlbOdVWwIBeNyvfZnpknUDTM2BKLJqBrg7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=a44jh5qGUNbtPBrRqLZO+VWxAP2oSzSeTOPvkV8txbI1j6DcctbYvcI6/G7cNycfj
	 O7y7tw9nPqzcoX+oqg6jGJb7Vw2iV9pDheiICAtH1f/sWTtet/7p181F+iDHe8a71D
	 er2yAswnU3X3VoVMHJdgS/6xC0XvS4S8edIV6l/bWOR2oEQVM1HqE5qTBhszJlMgDC
	 eIzK+oC0bZNR1WdTa99wxbZlitYWsIqetl/tcjE348gx3kKtjD4b4oVf34ctOPyxLI
	 pvnrRuhwphGSUHVwYEga/kjDT+YmS29+qtbk3NEE7w63rTeQTZg0XR9nT7cL9R9vo2
	 KxUs1y6JzH7tQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Justin Suess <utilityemal77@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
Subject: Re: [PATCH v4 0/4] media: rc: sunxi-cir: support the
 A523/H728/T527 IR receiver
Message-Id: <178524965176.668575.6519599473909041005.b4-ty@kernel.org>
Date: Tue, 28 Jul 2026 22:40:51 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Mon, 27 Jul 2026 22:49:12 -0400, Justin Suess wrote:
> This series adds support for the CIR receiver on the Allwinner
> A523/T527/H728 family (sun55i).
> 
> Apologies for the hasty v3 respin.
> 
> Tested again on my X96Q Pro+ (H728) TV box with the Google TV remote that
> came in the box (using NEC keymap). Was able to press buttons and
> get readings from lirc / ir-keytable again.
> 
> [...]

Applied to sunxi/dt-for-7.3 in sunxi, thanks!

[1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
      https://git.kernel.org/sunxi/linux/c/96cd41eac1f5
[2/4] arm64: dts: allwinner: a523: add IR receiver nodes
      https://git.kernel.org/sunxi/linux/c/2b24f5386528
[3/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
      https://git.kernel.org/sunxi/linux/c/a3bd47e62cb2
[4/4] arm64: dts: allwinner: a523: enable IR on the Avaota A1
      https://git.kernel.org/sunxi/linux/c/75dc83d420aa

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


