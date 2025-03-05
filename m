Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9FFC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIx1VQixGZHJpDEIrcnLOu+mYSZBxUUbpmpOdkPkxX8=; b=ApKtkwMUndmwiLr/IMhdqFkRKK
	5ZsNh0FxDO6ukaC5OZfgHOJf6x05weXlphxnRaJIKJP6cmmxMl8Wxd6VRl+g1sKGt+99OJW5dWxOs
	rkwyDAzPfEz2a0ksBoyV2JAc7NXEwe+RP7yC1y0FUBgOKWSc66QOzJdE//ZmvVtKRpkYAY+hnVrso
	3AsX74HsUYlrzfjzAx+NDEJfJgpH5rEm/Ha/NlpuDi63KZzpcsuoKyjkbZ5tHKumWpv7MpSu62J1w
	AeOQ4uA34XHFXuGDLMilG99dimAxVitCUzIfGlP8F/YVKHOVyUHMW8ja7mg91XoL4rjxyLXe+w15R
	NSgjuuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpx4j-00000009SaU-0gP3;
	Wed, 05 Mar 2025 22:18:49 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwwL-00000009Rkj-0tMo;
	Wed, 05 Mar 2025 22:10:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AA2D44469;
	Wed,  5 Mar 2025 22:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741212604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AIx1VQixGZHJpDEIrcnLOu+mYSZBxUUbpmpOdkPkxX8=;
	b=BURAVwy3hip3jon9IM98b5vAbuZx8dmIVhljcBdpP9XPooBB9x17yAD7mn/0M2kAn1p8By
	woFRKzD245+DnNCjtQ7o6LF0PX0S+BASIoZ3EG9eHGaSS6+ZEBYcAQJ78thkXVkUtB3BzK
	1fd6X+OUiIUBCG3V5Ht/wQ7VyXWg3QLgNXNCUgj5cfxx673xa69fxR4P/SB0QwSK51Vnbk
	43t7fjIwRIkYEyQt3ZAkt9kg4DaTd2AJ5hZycFk8ZNUVahz0ml0z7nJE20eLLgLqkFMu9H
	PUen+OK6ikHnvbPugQHCGpZSoR9V6SsZM+DOwn8jbGVfSNi2odFfmCi09ey7bw==
Date: Wed, 5 Mar 2025 23:10:01 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	=?iso-8859-1?Q?T=F3th_J=E1nos?= <gomba007@gmail.com>,
	Dianlong Li <long17.cool@163.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org, llvm@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 00/16] a few rtc driver cleanups
Message-ID: <174121255394.1152777.11765502116426784970.b4-ty@bootlin.com>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdeitddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgffeiiefffeefvdegtdejvdfhvdehfedtuddtteeffedvleehieevkeeguedtudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeejjedrudehtddrvdegiedrvdduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejjedrudehtddrvdegiedrvdduhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtoheptgiftddtrdgthhhoihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpthhtoheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgto
 hhmrdgruhdprhgtphhtthhopehulhhlihdrkhhrohhllhesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_141009_715679_26247EF0 
X-CRM114-Status: UNSURE (   9.40  )
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

On Tue, 04 Mar 2025 17:05:28 +0000, André Draszik wrote:
> While looking at RTC, I noticed that various drivers are keeping
> pointers to data that they're not using themselves throughout their
> lifetime.
> 
> So I took the liberty to drop these pointers and this series is the
> result.
> 
> [...]

Applied, thanks!

[01/16] rtc: max77686: drop needless struct max77686_rtc_info::rtc member
        https://git.kernel.org/abelloni/c/6c9405fd2581
[02/16] rtc: s5m: drop needless struct s5m_rtc_info::i2c member
        https://git.kernel.org/abelloni/c/afe5f9f94d11
[03/16] rtc: aspeed: drop needless struct aspeed_rtc::rtc_dev member
        https://git.kernel.org/abelloni/c/d19111dff9c2
[04/16] rtc: ds2404: drop needless struct ds2404::rtc member
        https://git.kernel.org/abelloni/c/1b625aaf335a
[05/16] rtc: ep93xx: drop needless struct ep93xx_rtc::rtc member
        https://git.kernel.org/abelloni/c/5d0ad519f503
[06/16] rtc: ftrtc010: drop needless struct ftrtc010_rtc::rtc_dev member
        https://git.kernel.org/abelloni/c/a55d44807b63
[07/16] rtc: m48t86: drop needless struct m48t86_rtc_info::rtc member
        https://git.kernel.org/abelloni/c/013df5bdf8b4
[08/16] rtc: meson: drop needless struct meson_rtc::rtc member
        https://git.kernel.org/abelloni/c/a0470062748f
[09/16] rtc: meson-vrtc: drop needless struct meson_vrtc_data::rtc member
        https://git.kernel.org/abelloni/c/38c7aaeab8b8
[10/16] rtc: pl030: drop needless struct pl030_rtc::rtc member
        https://git.kernel.org/abelloni/c/3d5d0fe1cb82
[11/16] rtc: rx8581: drop needless struct rx8581
        https://git.kernel.org/abelloni/c/3b87c6872aed
[12/16] rtc: s35390a: drop needless struct s35390a::rtc member
        https://git.kernel.org/abelloni/c/cd2a7052482e
[13/16] rtc: sd2405al: drop needless struct sd2405al::rtc member
        https://git.kernel.org/abelloni/c/d94bc2bbf8d9
[14/16] rtc: sd3078: drop needless struct sd3078
        https://git.kernel.org/abelloni/c/6158c6b82444
[15/16] rtc: max77686: use dev_err_probe() where appropriate
        https://git.kernel.org/abelloni/c/e6403ae59ce1
[16/16] rtc: s5m: convert to dev_err_probe() where appropriate
        https://git.kernel.org/abelloni/c/0c57c2e72c5d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

