Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1970FC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RY/1wmCxCIFM0LLRBnTLXmBpxbfVg0FeVcj6W7X9LH0=; b=cRMFcaPvb+FM+Pichag2W+fTx3
	oJVFoad8w2lkOD2dCeqew26KKLcDLTqPgF5HnADesVl4usZEJ1GSotNz/MSrPxD5d60EnzUJktUV5
	mUO+fzVH/R0gWNJ3HN4lTqgOEwH2FJJJ+AAXqj0/5ffPvW5+KrP5JV+pUnIuBeoyLVsAzSor9sB+F
	s13AlfvZXKlJDDgktG4KJI2Al/Kq9IlZ+Ybs3k4IHMRhWreW9pVrG1ifZUOiQFL7MvFChOHRe8FL2
	BWCPJR9UsoDm3PHnh7q6FAOn+1ygEMO99nL2Xvuk1VzxHwJKtpFQw1poacZS31P0auXXsSUf+E5DG
	JfNAlsAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPIP-0000000BnCe-0t9M;
	Mon, 10 Aug 2026 12:40:01 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPIM-0000000BnBb-3DnN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 12:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=RY/1wmCxCIFM0LLRBnTLXmBpxbfVg0FeVcj6W7X9LH0=; t=1786365598; x=1787575198; 
	b=oKON9zdEELo0idVgL9T+qEj5guhnnNKOUD1VrTGnZRgv1qie2NJEDe1VOCV+SeR1Ni6yPfMVYwy
	igabfFpWN4ep8s2FGt+ew8+jj9LTGjnJsrmByvp1/6ctZctGVcUcdMXiQHJObPxouSGVwGOnFtaui
	0MqoyNouxYig6v58ze+5RmcGD1xOMrRKoMICYbRpJKuIwUhK2QEjhEmZvnXJ5sMocAEADmE+n6zRq
	Gn9rhD0wEOZk/My7lqJXvSuAGq0eecsj0N6X1gyKrEYd3fyXkYzQ0M/W71o482xJm5dMLbNX3ylGR
	PY+3R8PpAuA19E+VrDXaW0SezIirfGqWgUwA==;
Date: Mon, 10 Aug 2026 14:39:14 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Daniel Thompson <danielt@kernel.org>, Grond <grond66@riseup.net>, Stefan
 Leichter <sle85276@gmx.de>, Grazvydas Ignotas <notasas@gmail.com>, Tony
 Lindgren <tony@atomide.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Sen Wang <sen@ti.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, Srinivas
 Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Niranjan H Y <niranjan.hy@ti.com>,
 letux-kernel@openphoenux.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 kernel@pyra-handheld.com, mfd@lists.linux.dev
Subject: Re: [PATCH 15/16] backlight: remove pandora_bl
Message-ID: <20260810143914.64d29a5c@kemnade.info>
In-Reply-To: <DA9588C6-0238-4713-B1A1-CB2123F02028@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
	<f897f695c0e1e128d7ebb41be8dfdce4d634f552.1783749722.git.hns@goldelico.com>
	<anmpiADsvzW39DNx@aspen.lan>
	<DA9588C6-0238-4713-B1A1-CB2123F02028@goldelico.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_053958_850234_0150E084 
X-CRM114-Status: GOOD (  21.42  )
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

On Mon, 10 Aug 2026 12:45:16 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> Hi Daniel,
> 
> > Am 10.08.2026 um 12:35 schrieb Daniel Thompson <danielt@kernel.org>:
> > 
> > On Sat, Jul 11, 2026 at 08:02:02AM +0200, H. Nikolaus Schaller wrote:  
> >> Retire the platform specific pandora backlight driver since
> >> it can now be replaced by twl_pm and device tree.
> >> 
> >> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>  
> > 
> > Yay!
> > 
> > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>  
> 
> Well, there were some good comments by Sahiko to the prerequisites of this patch,
> because it has one speciality the PWM BL driver does not handle (avoid
> interpretation of PWM signals as W1 protocol).
> 
> I haven't found time to work on this, so we can't remove this yet.
> 
> In the end it may either remain a pandora_bl driver (converted to DT)
> or become a patch for something else.
> 
But then it is a TPS61161 on top of PWM, not a pandora driver.
And then there might be just a quirk for that chip in the pwm_bl using
triggered by a compatible. I guess the quirk is this:


if (priv->old_state == PANDORABL_WAS_OFF) {
-		/*
-		 * set PWM duty cycle to max. TPS61161 seems to use this
-		 * to calibrate it's PWM sensitivity when it starts.
-		 */
-		twl_i2c_write_u8(TWL_MODULE_PWM, MAX_VALUE, TWL_PWM0_OFF);
-
-		/* first enable clock, then PWM0 out */
-		twl_i2c_read_u8(TWL4030_MODULE_INTBR, &r, TWL_INTBR_GPBR1);
-		r &= ~PWM0_ENABLE;
-		r |= PWM0_CLK_ENABLE;
-		twl_i2c_write_u8(TWL4030_MODULE_INTBR, r, TWL_INTBR_GPBR1);
-		r |= PWM0_ENABLE;
-		twl_i2c_write_u8(TWL4030_MODULE_INTBR, r, TWL_INTBR_GPBR1);
-
-		/*
-		 * TI made it very easy to enable digital control, so easy that
-		 * it often triggers unintentionally and disabes PWM control,
-		 * so wait until 1 wire mode detection window ends.
-		 */
-		usleep_range(2000, 10000);
-	}

Regards,
Andreas

