Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0CEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rb764XAXEjldyhvAtxhf+aAU5QVFppFpVJuJ0SQAJTw=; b=32d07kYFcgqxfJaG0a50WQ6yE8
	TqfN1oFBg16Oj031P2wM/sGOMrzEx0Tk2VxBDAtRay9WnQlrpC/LgaOY3jYqWA2b0zUzJkAIqa600
	10wtPVP5wGASaaV0Bpv0e7k5CmSnxQ8BaoDKPsIcSFiOo4/3ZfIPDC8DHaBclYGglG0f1wOoDTgT0
	rpunpFe7HEn1yswGDe7zU8l4oghNloQJ8LJ3c4dlDH9wW2hmap0kMRBPD41ZvPD+zItxWxnmAdlL3
	FpV8pzPmoF410m+n10JyqK2sBhP8v2rkPWoTClxwUfJJiY0mNB1QeGI7BPFWqXglvrvs9RBP7ZG6o
	tYb30dyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0t-00000000LQ8-3PzH;
	Tue, 25 Feb 2025 16:42:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwOL-000000000KR-0Nq8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:58:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 635665C6F0F;
	Tue, 25 Feb 2025 14:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7C7C4CEDD;
	Tue, 25 Feb 2025 14:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740495516;
	bh=m6/bHr5qMtmuvpNdzrWxI7InaCfmMZcD30o8W4FzGWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IoEg6Dy9AUoWIhTSYy1iSWttqt8ldHXGQX0FBTfEgMQ3//HObKeQ/fFnhsJG9ll7r
	 7VCTC7sItDIKwFndnc/2W0Ykc8K5wIxepfMQPlDDvG9xcvC2rWOF6DlJGQuDJOEC4A
	 f6xziyFODt3M6uuFJi24GrJbXXUSwSYyF8OhDZeC6aWcBKnCL7Ys3bUaTSSNkRQ5Qb
	 krBMf47TiHxWk/5024VmIHmezFrdBuqpGWOxLgJaTFvlant0mHl5CJlYBgJHuU+DVm
	 BkW8/yv4+w9l0lZSLtxU69f7/wQVto0a7S8BzHR0I9iLx0lnAiptSpLgJF3f+Ir+wA
	 iLodTmwa9zngQ==
Date: Tue, 25 Feb 2025 08:58:33 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 4/6] arm64: dts: imx93: Add LCDIF & LDB nodes
Message-ID: <20250225145833.GB2361434-robh@kernel.org>
References: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
 <20250224142831.485159-5-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224142831.485159-5-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_065837_183741_35E69BB8 
X-CRM114-Status: GOOD (  14.36  )
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

On Mon, Feb 24, 2025 at 03:28:25PM +0100, Alexander Stein wrote:
> LCDIF port 1 is directly attached to the LVDS Display Bridge (LDB).
> Both need the same clock source (VIDEO_PLL1).
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 77 ++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index 56766fdb0b1e5..2628e1e628ec2 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -1273,6 +1273,9 @@ s4muap: mailbox@47520000 {
>  		media_blk_ctrl: system-controller@4ac10000 {
>  			compatible = "fsl,imx93-media-blk-ctrl", "syscon";
>  			reg = <0x4ac10000 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;

Like the example, this is wrong.

ranges = <0x0 0x4ac10000 0x10000>;

Rob

