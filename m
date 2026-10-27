Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58DF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 01:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tiGzcfcR;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VbCwu4xP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vBhaO6Es9PKt4idPNg62EPh8XgJdwaGm+jmpwXvFRC8=; b=tiGzcfcRUennI+jE9N2etBkHfT
	FRInAtsm36IatPljoCFcweOWxVlJvHesV2cbPkQLv0OL/igdLVbptv9qUe0AQWNRtoH8BaUbsZkOO
	n7Inumdrmpcsg4xnBFFwxFQqQ6bECopqdQGlqRvRQHYdynut/QAT2VY3bG8TvvpVT4BMUNJVkLH8i
	kUun0B2f9E/wjDQhpI85N/7aBn4cuDbhZHJPlZ3Y8WsMIN9B/Z06ZArODkRUiumLwKsyDlyUx8uk2
	6coYoJeWJn/5oHKCivtos8FO8ethZEUefwJpk1Ay03xuFpLjjv6sCtBm0NEdujZoH8Zd8WaPePSH8
	QpYEpjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVen-00000003Zhj-1Q6z;
	Tue, 27 Oct 2026 01:07:17 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVek-00000003ZhI-1tk2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 01:07:15 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1438d9363fbso466763c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 18:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793063233; x=1793668033; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vBhaO6Es9PKt4idPNg62EPh8XgJdwaGm+jmpwXvFRC8=;
        b=VbCwu4xPiJC0jK752ooyWrVjpoLF38wWs1mkqfTlqb8EEg9SCGOvhCqZexPdO9NSTH
         8K4Sr4VieQw+8Z1E1oDvbyvb/MZdx9LDD5J/htSijN9jT1OggsGvrSfWMqMQWNDGHVtx
         f0TEIdn+YziDms6GHZAODM6UM9qqqFfwzu9xgXLEIotakYVT0ST4BaLUMVQy9RBNclvn
         1tvoTvaVBKqBm9BwB8kZbpAALTbhNfhQAD0OTZjg7V+LRxRbjRQXwiDsEXO3cTDHkPXZ
         HKBM8oASPvotT0ZEC0ODIXdoYetlNoL8G8+8dKwriQsSJbyqXSr9FigjxZa3YxzqotLz
         7JkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793063233; x=1793668033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBhaO6Es9PKt4idPNg62EPh8XgJdwaGm+jmpwXvFRC8=;
        b=p0vc8+60sLU9vtknFhiqMg828GoBxb1pxkUYnnYZIbbr+XrR1z4gVb9YZgjPRABau4
         XwOdwWsOmJ2S8Rv+k2JywAe25sAJQ6QzAjuYI76WaljEhFoyuJ3fCwatbYsQcuvP9g8W
         UvDMReG3BlGLtRG9KLYzKj/y3tBgPwkfbSt9EbaLSfPn0ep6O1M53+9GXyrqWh7n2pUw
         +z2xo5ac3mbp7f9f74e3lb5zWJ0hZJRnD0OwvlxnclcCPRWnMIiAgimm/VC1i6IrZabg
         PQJ6mS9zoN7VgTJ/vquw74bbpLs1KO7VFzrd+mzQzOfTBjtq7RAArI42Ryqi03v5qrJP
         CB1w==
X-Forwarded-Encrypted: i=1; AKwUvBwHan5D/g5HMkl/LFnWldhVMmdyMeOhDHWnaSyhbavEW3wzXOFAIAubtt8HBCTBqk9f47goGGBZTNOHYPwf1n9B@lists.infradead.org
X-Gm-Message-State: AFq9FYI8BkcyJ2Ys4AotGMbPkt7Fp5eCzltp568ooEsPNDmRvrj1OS/p
	+hF1KSnPo8UBxwK4rhRZAGVBqRFkCdy+xcpWo4D0gOWGOqJ5gmQuntvj
X-Gm-Gg: AYBFou0IpJha0GJe8cT+ZkeIQ57qXd+BKEd942eTERK6fgmmoZrmxkaEcq86HQpGeHn
	NLZVMopGRv7KZiSTRP8b0g5c0bVRCLMdfBdVJfw0/KBraJ647Dbq85AFtnngFj4+eSs0Tt052W7
	BsRqAOkSk4mjXmtkEFhB1wj1TKQEZYQEwmVIiGp8os+iJOidgnGMC507I5sQrnkoUANlqw7avpZ
	fbmammyS/i23gBl7JdMzgfXdVkG8oppN6LBT5CqFjDLq25gw2tYnnDOqVD/ZbAeqpIbZvDAsY3a
	hvaxSjJDmr3FFX8myD4ZGJx7tmYMpmCAN2HpjoM9brGsw2z852bSr6XQxaxzxuYUL+GP90VV5ad
	RP1138u3i47An5riJhRMYVAOMYTVUzTgYMJ5AsiydgKDW7Muq7GNhxXwMBCuipidbUfAQJoFvJD
	VJnmuD2UwydLTz3RKxZu/p47iioSRrPN2ZhI4SrnhTEZioBzk+CLNtEjSdinE2ro4kNfQoaPB/s
	/nNloXfYBjOedAxe8OXoZvFNZ1NSq4hYaFCT3uF+a/30qo4Vv6tY4wfXoFDzGIF73wH4CEuklJL
	9pDklExISfzSOGmfRIicL90=
X-Received: by 2002:a05:7023:c013:b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1a3c485419amr1593552c88.12.1793063232714;
        Mon, 26 Oct 2026 18:07:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2dc1:2e1d:6b4d:5a9a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm27239759c88.3.2026.10.26.18.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:07:12 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:07:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] ARM: s3c: crag6410: Convert to software nodes and
 properties
Message-ID: <at_45tVmsWaYAv7W@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <a6df6043-9f0d-4b03-8efc-d3e47a82f096@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6df6043-9f0d-4b03-8efc-d3e47a82f096@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_180714_498676_19D40221 
X-CRM114-Status: GOOD (  25.59  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 02:51:16PM +0100, Arnd Bergmann wrote:
> On Sun, Oct 25, 2026, at 06:03, Dmitry Torokhov wrote:
> > Hi,
> >
> > This series converts the Cragganmore 6410 board to generic software nodes
> > and device properties, allowing the removal of legacy GPIO lookup tables.
> >
> > We add software node propagation support to the wm831x MFD core to route
> > DVS GPIOs to the PMIC regulator, and convert the peripherals on the
> > Cragganmore board (PMIC DVS GPIO, basic-mmio-gpio, LEDs, WM1250, and SPI0)
> > from legacy GPIO lookup tables to software nodes and properties. This
> > eliminates the legacy GPIO lookup tables on the board and fixes incorrect
> > GPIO chip names from previous conversions.
> >
> > Hopefully Krzysztof can finish merging the series through the soc tree
> > once Lee acks the MFD part.
> 
> Hi Dmitry,
> 
> This all looks good to me,
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> I'm a bit unsure about how this fits into your wider plan, i.e. why it
> is helpful to replace the lookup tables with device properties in
> this file:
> Are you working towards eliminating all gpio lookup tables from
> the ~50 files currently defining them, or is there an immediate
> benefit to doing this one in particular even without the others?

Yes, I would like to eventually remove the lookup tables and rely only
on software nodes. How quickly I can do that is a big question, but
I'll try ;)

> 
> Do you plan to also eliminate the uses of the legacy gpio
> interfaces in mach-s3c, e.g. the hardcoded numbers
> in {pca953x,wm831x}_platform_data, crag6410_lcd_power_set(),
> crag6410_machine_init(), or the pin config in
> s3c64xx_i2s_cfg_gpio()?

Let me take a look.

Thanks.

-- 
Dmitry

