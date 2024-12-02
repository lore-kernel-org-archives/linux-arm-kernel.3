Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442FAD10DB5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZjVug5ya7hH0mDNjWlcPVU/GfxeZCgwrE9NG175/s4=; b=A2iepEpE+d8gZcFHfkZ3ru2kCp
	lEiCRRYuopIS7Ys/Up4Tij4Pi4A0JmKUup2MCkXICEPTLbgQVxuCODfpY48qiaNQC4TuFGN8gNex6
	+yeUBU1DkUZOgTwce/wmhLZvIYJoxJj0UqXPIJjthXnXm5K3ZlssPS2AFUg3vQaKPvxMCsgSJo7+p
	Dpb02CcppMSDxsyDm/qsWNul5n7ilIpljw39i2YIpNtt//XxNA3CWgNA82mPIYq23Nk4U3E7Hbv+T
	j+X2kfae6mMAxuUiDosNGDBQ601Vx16SMY7DKOluMMunTFXeddZpJ8uCtMGXSwgWYQbkY0OhAU1DY
	vqQhquhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1Iw-00000005LnR-0Xnu;
	Mon, 02 Dec 2024 07:57:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1Hv-00000005LX4-2jYH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 883AAA40DD6;
	Mon,  2 Dec 2024 07:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D21C4CED2;
	Mon,  2 Dec 2024 07:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733126170;
	bh=kZjVug5ya7hH0mDNjWlcPVU/GfxeZCgwrE9NG175/s4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAQBLFbzade4+DSJ9YhBk0Yft2NNUlROVJ3w1OZynq1eVWROLvLc3ieheeSwrWfgJ
	 GSGu1f+rBsnsRISz5mla0Ok/GvoJs8TN/mpUspXtJv8HT9unMivZ8uvcL4IVKGmQQO
	 UlRAr2m06+t48T34AW6hhOjmhU4Amqt+9D0fdkFXCn/qKHB972QIsF+kYG1rf2rxW7
	 nYY6mAejKzs7N7WCKRCX689XRrRCqg4Kk+mMO1rqV6LH2jAJnI3MnY51/mTd9nICjM
	 0mXg1531ZuMTM9eJtHt3v7a1bxWhUCIZC3U8GR0LV2ArZEfoUn3SYw4vaQETo0BZq7
	 ZduM6j8UAACXA==
Date: Mon, 2 Dec 2024 08:56:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Michael Riesch <michael.riesch@wolfvision.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: sony,imx415: add required
 clock-names property
Message-ID: <bh3obpt6bcklejdvrk4r6ienraz5zmhrdyotijhvlwexussqgj@hicmx34vi27w>
References: <20241130141716.1007115-1-matthias.fend@emfend.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241130141716.1007115-1-matthias.fend@emfend.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_235611_751624_1C1FFFDA 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

On Sat, Nov 30, 2024 at 03:17:15PM +0100, Matthias Fend wrote:
> The imx415 driver expects a clock with the name "inck".
> Document this in the bindings.

No, fix the driver instead of bypassing review. It was decided to drop
it during review, so you cannot reintroduce it 2 years later claiming
that's now ABI. Of course original submission was buggy and never
tested, but that does not allow review bypass.

Best regards,
Krzysztof


