Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFFBC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 05:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2eZLHoFTLtYnqAPbAqSK2Rpc5EQeElhxYx0vz8zAvQ=; b=ogiAos/OqXivXQacuzcKyEsp7S
	Um9LNsRi7ZvDDfTSkWRTUE9yY1WsyVTASKZBu5GozeWXM/j8wt5hdO14VcWPbqxSmbBZUJPiPlra9
	+7aZUW1EpAx6mNu0/Sm/OyUiJ9KUimX35xUbByPbDx6goiMWqOeQIZlTwQWfVLwuvOamipDrkk1g9
	SNs7vzHdJSG4D29hUiYIQmeEeWogNANlIuUtyELrDu9Fr+AoB5fonB3qV8yviHK5PeX9VRGKhV1xq
	4UmONEAkip5eccqZrsEnR7pdtkU9YH7OXnfewIY1USQ4+qfe0Ks45vRdk63Prxk89kk5j9FinG215
	rw+NRZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwuvK-0000000ApUg-0r4i;
	Thu, 20 Aug 2026 05:02:42 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwuvG-0000000ApTr-1eyW;
	Thu, 20 Aug 2026 05:02:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 46E154E412E2;
	Thu, 20 Aug 2026 05:02:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D5445FF59;
	Thu, 20 Aug 2026 05:02:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB63311C75D87;
	Thu, 20 Aug 2026 07:02:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787202147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I2eZLHoFTLtYnqAPbAqSK2Rpc5EQeElhxYx0vz8zAvQ=;
	b=d+qe4FcP1K7JQejOsetBB+a4w9v32yPTsVG3+rfnPI+JwdnSHy+3Lh2q7zrru87RoH3/0l
	jv8gE28PvnVnK04uypiXw1Ilr2+GI+hx1KSDR13AFKBhVBc3VGlNI5CGWSedKOtpOsb54j
	qqbUuSVob2hC18z9jLlLjNei5SRX+K+XOSwuHBKudeKI5nljkafUugazoZMg7mxD6HX0x5
	N/X0dLT5et5k2UphW6SIm5dLf63UYkVCq3MiokZFUDnagNTzg1DwwFJx/m22VTC+s3jV5b
	oH2iYEwn3LbCYOM5yy3HvqnjN/NVntP5yjR+M1m20bddieKDztRJ0301W7e0jQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 07:02:18 +0200
Message-Id: <DKTIA7WYL54O.163XHIM9WV1X4@bootlin.com>
Cc: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-hwmon@vger.kernel.org>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>, "Tero Kristo"
 <kristo@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>,
 "Nobuhiro Iwamatsu" <nobuhiro.iwamatsu.x90@mail.toshiba>, "Nuno Sa"
 <nuno.sa@analog.com>, "Guenter Roeck" <linux@roeck-us.net>, "Michael
 Hennerich" <Michael.Hennerich@analog.com>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Jonathan Cameron" <jic23@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, "Andy Shevchenko" <andy@kernel.org>,
 "Sunny Luo" <sunny.luo@amlogic.com>, "Xianwei Zhao"
 <xianwei.zhao@amlogic.com>, "Mark Brown" <broonie@kernel.org>, "Kees Cook"
 <kees@kernel.org>, "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [PATCH treewide 1/5] clk: ti: Make sure clk_init_data is fully
 initialized
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1787165329.git.geert+renesas@glider.be>
 <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
In-Reply-To: <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_220238_591956_D12F2E73 
X-CRM114-Status: GOOD (  10.47  )
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

On Wed Aug 19, 2026 at 9:05 PM CEST, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> _register_mux() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
>
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
>
> Fixes: 667f420c09f1417c ("clk: ti: mux: resolve parent clocks by DT index=
, not by name")
> Closes: https://lore.kernel.org/CAMuHMdU3yVqoyHC4eNF2NuYo8wy+6ODLoYat4R71=
X99Mxc_=3Dkw@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Thanks again for the fix.

