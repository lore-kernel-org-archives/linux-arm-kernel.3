Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AC4D597B7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 23:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GM+Qq0NLS8qp404vTsp4172kiQG6SvHt3ggmFCSEXkA=; b=00WpxqwnvusRgImH2Xs7y6F9Aw
	kSSnOVPclpZm3VppNOPZF6Gmfa2nKQ+j/CXOn7g2Kh1WV7D2khTRKfgAPkb6+BVoiQqf17C9YbS7c
	mVF0IjKkHJKs0vrmhBc0bT/ttecW7gs+DMKRBEKvdjje1xYSnmvBayXz4v46qzFEtYuAFrz9Flumf
	J7bROF3PNVNEMJj09/fvuBpivFyKIclxBgtVQ+CpKtZjexgtTSeaQVE4+kF0Y48zJQFRQSqJ8z5hp
	7El8D6Z/0oYUDsRb3XYD4zn+1CzM1hDkbEjCD9Musyc3k5Dma9HVgvuMpdIciulivPO9UormPpCQl
	XgcYEMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB0Au-00000005GUx-3Tel;
	Tue, 12 Nov 2024 23:19:56 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB05S-00000005FkJ-0JkZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 23:14:19 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B6B3588DDA;
	Wed, 13 Nov 2024 00:14:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731453256;
	bh=GM+Qq0NLS8qp404vTsp4172kiQG6SvHt3ggmFCSEXkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QZMvF45l8rxPgQgwVrybJsI6dbNYgMVLtClcyFvNBdTrOeaA2fPIsWvvRaQukexlX
	 swQP+gOI8yTJqxtYyusJXo1YKHl1VBwuOs3sirl1CXbKrf6rZ12StuTyiIeFUi94xw
	 Owa4o7RGI+HmjN2wIUMrMFIskf2D3eGEQwR0Pe7EQiZSkTeIE+P0yxuyZ70Z2nEjCf
	 GN6sd3TTGsX7fCnYVR0if4mRRvCG0OpBdAzJg2x/z66OpOZeUifqJZxputmunzuevy
	 4iUPtEPhW7Ln1UX8a8q7zeKJYDvMZ49P3D/f+vuAhVPudAfa3KpLVSxZARfx31CQmO
	 cvFfb26zNvfew==
Message-ID: <79f21303-b0ba-45ed-a842-7e5364fd4efc@denx.de>
Date: Wed, 13 Nov 2024 00:14:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 "Lukas F . Hartmann" <lukas@mntmn.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20240531202648.277078-1-marex@denx.de>
 <20241112234206.558d5d5e@booty>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241112234206.558d5d5e@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_151418_290302_D65C5099 
X-CRM114-Status: GOOD (  10.67  )
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

On 11/12/24 11:42 PM, Luca Ceresoli wrote:
> Hello Marek, Abel,

Hi,

> +Cc: Miquèl
> 
> On Fri, 31 May 2024 22:26:26 +0200
> Marek Vasut <marex@denx.de> wrote:
> 
>> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
>> clocks are usually the only downstream clock from Video PLL on i.MX8MP.
>> Allow these clocks to reconfigure the Video PLL, as that results in
>> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
>> clock accuracy is low.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> I'm afraid I just found this patch broke my previously working setup
> with a panel connected on the LDB.
Do you need a fix similar to this one?

4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1 
frequency to 506.8 MHz")

