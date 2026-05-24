Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC39ECD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 20:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0Kn4NGTEBvYvSppdtEhlAPBMULs4K0n5D5V+p+MP10=; b=f1ITWO2Q0ugsVtYmTq7lp12fLH
	RKv8CACbSNjMgqCeozXv8S96T5JhE9d8f8UVzG8V9WaXh5v3haYg0Vdzog9sOFD7hjDwxTrC48bDM
	mr/mGSNeqBbynxreW05SKoL6Q4WyTBxPc87ejKNcokRDj542MVE73ryYTyp1sa9jKJhHhrl7ZMnWW
	J+/RUVMTJe8fzKg9eyREPX4R1Vi4ouWMdBOxFt4o8gyWPJ8kJvdK2llm/acCAes/Tgd5XgRZ6VthV
	SMef0weflw/2XHIa/sLp/U1HLmejS+r8s04ZJLGX6jHrY6/7u/7NiZ+xI49gC80jK/WMWxaL0jhwx
	h3LU/pLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wREcU-0000000FVn8-1onS;
	Sun, 24 May 2026 19:36:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wREcT-0000000FVmx-0GFy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 19:36:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30405601F4;
	Sun, 24 May 2026 19:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E931F000E9;
	Sun, 24 May 2026 19:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779651375;
	bh=r0Kn4NGTEBvYvSppdtEhlAPBMULs4K0n5D5V+p+MP10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e3kATJU5wCp1elAKPsF+pwI0r3IZPzNvgIXNIWYUQhOReywzbnaOAZm3PYjIQdBUO
	 nE0WX/tkZ8B/qFkILHvUKtC18Z43nLt8RgW+nAvRXmux1/ZHca7h3cOQeGCJ3qqgJr
	 JIZbVO7YdqsrRlhpgn4pGXk+BXerbTPWej0LjnRXg8yIk6pn0WcPdOi+WKfwq1pF1Q
	 1PMB4TCxtxF/w26OAP8Eu6afoMxz/t2VTpnmBo98BJGf5CoOiLnvxDelQNP1Mx7ZiS
	 lmTwfnlviaFrfdO1qGmkfiO7c8aSLQoitMLJ5DEM1uxz2LLrB590/CIIRuK4nsAoGi
	 dCOAzxhYtlwNg==
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>
Cc: Yong Deng <yong.deng@magewell.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20260518153339.619947-1-paulk@sys-base.io>
References: <20260518153339.619947-1-paulk@sys-base.io>
Subject: Re: (subset) [PATCH v9 0/9] Allwinner A31/A83T MIPI CSI-2 and A31
 ISP / Platform Support
Message-Id: <177965137265.112804.8792823661852323201.b4-ty@kernel.org>
Date: Mon, 25 May 2026 03:36:12 +0800
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

On Mon, 18 May 2026 17:33:29 +0200, Paul Kocialkowski wrote:
> This series adds platform support for the V3s/V3/S3 MIPI CSI-2 and ISP units
> as well the as A83T MIPI CSI-2 unit in the respective device-trees.
> Overlays for the BananaPi M3 cameras are also provided as actual users of the
> camera pipeline on A83T.
> 
> The corresponding drivers and dt bindings were merged a long time ago but this
> series was never actually picked up. It seems more than ready to be merged!
> 
> [...]

Applied to sunxi/shared-clk-dt-ids-for-7.2 in sunxi, thanks!

[3/9] clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header
      https://git.kernel.org/sunxi/linux/c/356a74a9325d

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


