Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C83CFD4F2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6yP85VXPpYGKT/3SxrFjBMoi8VZvOZwpruWQZh4WE8=; b=rmaBZzpR/ZMG2hJQa9SfEczLOe
	JslAmv/zXugvFPlf/CDXnkld4MpwJW6BW8z2PbBbaUr002RXFT2Vptxjb18qX1AGRw17N5WbI1GRp
	VbmhaiUGgasy3MDCYJJdDFIJgSYkbnN0MKG2onGE3fwwBLK5EphWmvPN88fhQw8ZyjVbTKa9fUZV2
	miHADrftoksa3yfFkcR/rOLIah/lRSqgSHPV5/P5I5jKxVGXv4LMDMB/k4vKqqBbVqQr5AnwWEnNu
	1/zC1R5PLJV1Rjxz2EP3EH8KrAT/L0iGCFpjlpG4pIdMhgHIld39GOl+40VdFWPF5Jb5ciPA1BhT2
	d2shBYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02x7-0000000ABbq-0XlW;
	Tue, 10 Mar 2026 19:41:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02x4-0000000ABac-2zqz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 19:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB76160054;
	Tue, 10 Mar 2026 19:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CBCC19423;
	Tue, 10 Mar 2026 19:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773171669;
	bh=uRuTui0xDsqEK6tmEHWYymsoNQxWbfPW1yTO/F4Fpfw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P9pyI3B0o0kr1YSj6A7xUWAiervv+2glz9ZVyWFtQZvl42Zs5tdmmBEkGSR9Rs1au
	 K7U4og2f6wLlckHdZc1bo/WmaUr/pgwIo84EJQgiYDe2+/blYLrx+7i3SliM30WK5D
	 KPH4E1fQ2LGWEJ5f8CBzx2X5HG5oQlslz4ldboj7FF+kuvHOcaRS/CF3tb54DDxz/e
	 zgl1kCoJ7hd2X2SkzSJlhExQDGYaROgJR1JDk2s+LoD2i41SWoq+W/EwngPC/cIezk
	 auWwrio2KAqSCqJC9jXpXX98hfSTNpwmy7sSwLIUS7JNJgRMtlfFgTZ8psU1VarOHo
	 SpGgE+PI2FYVg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260302153559.3199783-1-wens@kernel.org>
References: <20260302153559.3199783-1-wens@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: allwinner: sun55i-t527: avaota-a1: Add
 SPI NAND
Message-Id: <177317166704.379398.1719490251066452420.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 03:41:07 +0800
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

On Mon, 02 Mar 2026 23:35:55 +0800, Chen-Yu Tsai wrote:
> This is v2 of my Avaota A1 SPI NAND enablement series.
> 
> Changes since v1:
> - DT bindings (Krzysztof)
>   - Moved "allOf:" block after "required:" block
>   - Dropped "type:" from child node in conditional block
> - Collected tags
> - Link to v1:
>   https://lore.kernel.org/linux-sunxi/20260227175157.2339758-1-wens@kernel.org/
> 
> [...]

Applied to sunxi/dt-for-7.1 in local tree, thanks!

[1/3] spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI for newer SoCs
      commit: e2f93f45d38f7b6dacb44203cfc7bb5d7e287b8e
[2/3] arm64: dts: allwinner: sun55i-a523: Add pinmux for spi0 on PJ pins
      commit: 1a5ff6a0a8c2a0dc9f2d55039997c1cd928eb53c
[3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Add SPI NAND
      commit: 1b07332bf2ee816130e139a8966d312bf1aa32f9

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


