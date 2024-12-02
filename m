Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EB6D10DB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDMAqY8q8CJ4e8gHvndnLcHS2+mR4luuelivMOMfHbc=; b=fVcghuC85ua+PNkgltHrYai6/z
	yYGGwRCqU6yVtz08w7Xlzc/2aPX1wgiwV/Z1q7JzWYO1ucmGCUZlbb68d2qpHdMSs1BpPLyaFYoyx
	kHNDhLcj53hO1EqfRfmTpflMiI1hi3akqGc6u7cw+p3OtU8Kq8WYLER3jtbNeE2R4F2sWiq6GZWFn
	w+syCck0y5HQeNsM8HkHf7jQNBDwWoVuolAl9UCJkzVfokSFufVZjM/84kzWMFSz73ypArrPA6ZhC
	bl3YDMOhkzZzxLT/wjuZggaEkpJIGlClXQVUksma75CB/3R/z7rU4qaX4MrrMPLvglAIGDnsARCQO
	CHUv9rDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI14K-00000005K9A-1FJb;
	Mon, 02 Dec 2024 07:42:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0va-00000005Iii-17mW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:33:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B706E5C647F;
	Mon,  2 Dec 2024 07:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF0FC4CED2;
	Mon,  2 Dec 2024 07:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733124785;
	bh=7pfshbH0/yBTHMIOHD/y8iFOlZveGZPhEOADQVkMTh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKAehXu0uhSQ5k0I31ANKuyzTu2TmaZKf0ql48DjtPxj23R82PMU32TSLjH3qjgcN
	 MDHjH5vMN7VJwjcY7vY+b+XYalfMSyao1JtYDET8mKjr6MIA/S3HE/ay1J6j+MEWFb
	 S/CwSE9AyNZ7Lzz4wztLREMysf7bvPGKi3TgK9BQdw+SBCM7Utd+NMlk7VnCIWfq19
	 csZKbwQSAYwuXyr/gJbdrUI4NJaZDodhYtHJp2Jn9BbRbcrqr7IYFnBZdQVuirmHvA
	 QrMpElEL3+3yYr1/BHjwzcR51LMFhAVXJkl0tCcFTahnG7HaJdHRqtxqwRkkF6ha3M
	 EXYUpbX/AagNA==
Date: Mon, 2 Dec 2024 08:33:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 02/18] clk: imx8mp: rename video_pll1 to video_pll
Message-ID: <h5eswwlw3rpuc46ote3bhexetlf35i72btwlq2xsqt7p4rg2jx@eugvszlgpuvc>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
 <20241201174639.742000-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241201174639.742000-3-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_233306_345126_1E8C4D8D 
X-CRM114-Status: GOOD (  11.55  )
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

On Sun, Dec 01, 2024 at 06:46:02PM +0100, Dario Binacchi wrote:
> Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
> name used in the RM is video_pll. So, let's rename "video_pll1" to
> "video_pll" to be consistent with the RM and avoid misunderstandings.
> 
> The IMX8MP_VIDEO_PLL1* constants have not been removed to ensure
> backward compatibility of the patch.
> 
> No functional changes intended.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
>  - Added in v4
> 
> ---
> 
> (no changes since v1)


Same problems.

Best regards,
Krzysztof


