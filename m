Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1D1CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 05:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uR8xbGosrZDiZ3bGOF/uomoehMbPSntRHGsC0W465dY=; b=xSjA8Q8L1ldccfS6buLjlcHZlx
	lVtHSXh3084posf8qTbaYHgCnE6nYK2Ysfmg5IRODf8yDfSAnbfoRolLZS1xh0O2QQbL5DIUFOCCL
	C9AQ9EdNipMx9C3Nn3jUDMgyWeniQHuXYPHW0QqO25PfxA9XyKTP9fS5IpJfLN4FVpGKOP6v3cIsz
	cVUxQ7AT6DbBnbl5AxPHKsDCubwK3Jp++yJnqel0TDk0cZDS2cngtq24G+4K2lTDEEF7OrIWVHmEi
	Stsw2UFSBWblfJiHQVyEWMWl2eqfFVtrNRqdcE80boBvCb8+RDfGuMm3DfuOVQlI2wCjucfLIoF0V
	6qrbGq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTCgr-00000008TWu-3J1J;
	Sat, 30 May 2026 05:56:57 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTCgo-00000008TWY-3Svo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 05:56:56 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-304ec41197bso1374076eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 22:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780120613; x=1780725413; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uR8xbGosrZDiZ3bGOF/uomoehMbPSntRHGsC0W465dY=;
        b=HsHduQWqN9dB5kAP+TniiN4IRQPxka10V81Z+jNESZX+w/td3ms8/9t+qUEwAw5mw9
         QeFJ2LrPG2X4qzklJXEi2kVflBDt4eTtmLGT2SKSfhRXXSafHvYfYxpk5ls6TrfkTdTS
         bece0M/rSswvsnoa3+qdztFxzjP8H4Dr9Q0Ye78UvteLNPhUGddn/7yu/PW1Kuh8XvQR
         vAM+GrmP1LgVKSu4cm8pvZJOeP7SpgweFjXpOVCU+Q03vTQRkudD5xJNLnd7SY+V+9AH
         +tNtVCUlrQNuI9jHbigv8u4r33y/u09Xq4O4hcVXJLjspJ4fRXG0VuhF+7+VW1PvKt6z
         xoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780120613; x=1780725413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uR8xbGosrZDiZ3bGOF/uomoehMbPSntRHGsC0W465dY=;
        b=c1wQpqxlFR4knsaRS/QuC4rt0wUuHH+fX9dZykyrIFg1RZgrUfM1Y1bfQbnqHWtJPw
         oLLaqB1UtzvXRU+RCLirTcaEfUGtmgBBNPRNo1RqitOEKnmbqMmQlj6L4Wrnv2W+C6xC
         9h4qf6e7/AnZa+asNi075mOJOyItaVLSB8eutlawO2JjBUInfS8T+PaG3ObCbQZukgft
         4jU51W0bSw9MjJTAZUjy0W0NHVe+12rgKzzmYxRE5HjEqi197k2jX1g8G4cF0Id0URnt
         Zq9Dy7QUcX+4a7FPGqOtWonwi/BQaaWiRBDImO6bIASxULE59LLj94dLBTwsYB/JdmRl
         4L/w==
X-Forwarded-Encrypted: i=1; AFNElJ8MShNn2+Jroou83P0SYYxlt04aLpeJ8L6iL5f4tBxPFDKd3RqpJXrPsaNfkMMC+cfVtzHQmI0QH+a8RxZOQvku@lists.infradead.org
X-Gm-Message-State: AOJu0YyZelt5MFaWmG2Mq3ewqPuQpKlRDYoixuVOGMnetG36c3fKgCRH
	om5oZNKT3o6G4BarNrCin0nxtxsrIVJX80FkZpRbUWSPo22r+gK6Xa3b
X-Gm-Gg: Acq92OHMeUx3e9m1f3Vr2gJtp8w+A5T4DXf/T46KNcawGStmCeYi++wTAPwA7cIEuya
	07R4lHN6BREn/7uZGr19WbDJ8EjFx9gUiYhF6Szv3m7l3rC4901HoK+3jJe8R08wp6ghwGB6yJd
	ZS2qPLMi3aUx582ffaf3AIBG5WY7IrBj0xJ8mJgcvyXZG5nulKnGFmLhIwkjar97hF44ZIdVNf1
	+zHUxnqJK8dgOwUYCKYpdUR1iH8tKcGK/2b4GpX/iF3QVnpC8FkttUpcqelBWxSkoysfUxonold
	WOsF4ji9Sgc0tjEEAMEh4kkgeuhFzGCuUl3W+CMHei8kyriM5Z+22xzuCQQ47jvEjPbUczkBqmz
	84LKVUFzXk07UVhjCa4da3jpwwojQHRKKzWjSYkSYMPL5Vx/74UjXrZYp9+pYcUex/js4le1qVv
	TXkrRfdewgAnmhL/QU5nAwjaDME75589hEGPFjZNerGPQiYC1vMjjJuC2wV+5gaLmYImQu0wnu2
	po=
X-Received: by 2002:a05:7300:80c9:b0:2e0:1f09:d924 with SMTP id 5a478bee46e88-304fa526036mr1388786eec.5.1780120613171;
        Fri, 29 May 2026 22:56:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:307d:2a52:8823:4a01])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm3397737eec.18.2026.05.29.22.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 22:56:52 -0700 (PDT)
Date: Fri, 29 May 2026 22:56:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Anshul Dalal <anshulusr@gmail.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	Linus Walleij <linusw@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>, 
	Job Noorman <job@noorman.info>, Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Kees Cook <kees@kernel.org>, bui duc phuc <phucduc.bui@gmail.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Yauhen Kharuzhy <jekhor@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Minseong Kim <ii4gsp@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Oleh Kuzhylnyi <kuzhylol@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Josua Mayer <josua@solid-run.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Jeff LaBundy <jeff@labundy.com>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, David Heidelberg <david@ixit.cz>, 
	Petr Hodina <petr.hodina@protonmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Xichao Zhao <zhao.xichao@vivo.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
Message-ID: <ahp7WuHiPYa7Q_pX@google.com>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_225654_876453_A36B1E0E 
X-CRM114-Status: GOOD (  31.92  )
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

Hi Uwe,

On Fri, May 15, 2026 at 06:48:47PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> the mentioned change to i2c_device_id is the following:
> 
> 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> 	index 23ff24080dfd..aebd3a5e90af 100644
> 	--- a/include/linux/mod_devicetable.h
> 	+++ b/include/linux/mod_devicetable.h
> 	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
> 	
> 	 struct i2c_device_id {
> 	 	char name[I2C_NAME_SIZE];
> 	-	kernel_ulong_t driver_data;     /* Data private to the driver */
> 	+	union {
> 	+		/* Data private to the driver */
> 	+		kernel_ulong_t driver_data;
> 	+		const void *driver_data_ptr;
> 	+	};
> 	 };
> 	
> 	 /* pci_epf */
> 
> and this requires that .driver_data is assigned via a named initializer
> for static data. This requirement isn't a bad one because named
> initializers are also much better readable than list initializers.
> 
> The union added to struct i2c_device_id enables further cleanups like:
> 
> 	diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> 	index 66ada7ffbc80..94aa4dc002c5 100644
> 	--- a/drivers/input/touchscreen/ili210x.c
> 	+++ b/drivers/input/touchscreen/ili210x.c
> 	@@ -969,7 +969,7 @@ static int ili210x_i2c_probe(struct i2c_client *client)
> 	 
> 		chip = device_get_match_data(dev);
> 		if (!chip && id)
> 	-		chip = (const struct ili2xxx_chip *)id->driver_data;
> 	+		chip = id->driver_data_ptr;
> 		if (!chip)
> 			return dev_err_probe(&client->dev, -ENODEV, "unknown device model\n");
> 	 
> 	@@ -1049,10 +1049,10 @@ static int ili210x_i2c_probe(struct i2c_client *client)
> 	 }
> 	 
> 	 static const struct i2c_device_id ili210x_i2c_id[] = {
> 	-	{ .name = "ili210x", .driver_data = (long)&ili210x_chip },
> 	-	{ .name = "ili2117", .driver_data = (long)&ili211x_chip },
> 	-	{ .name = "ili2120", .driver_data = (long)&ili212x_chip },
> 	-	{ .name = "ili251x", .driver_data = (long)&ili251x_chip },
> 	+	{ .name = "ili210x", .driver_data_ptr = &ili210x_chip },
> 	+	{ .name = "ili2117", .driver_data_ptr = &ili211x_chip },
> 	+	{ .name = "ili2120", .driver_data_ptr = &ili212x_chip },
> 	+	{ .name = "ili251x", .driver_data_ptr = &ili251x_chip },
> 		{ }
> 	 };
> 	 MODULE_DEVICE_TABLE(i2c, ili210x_i2c_id);
> 
> that are an improvement for readability (again!) and it keeps some
> properties of the pointers (here: being const) without having to pay
> attention for that.
> 
> My additional motivation for this effort is CHERI[1]. This is a hardware
> extension that uses 128 bit pointers but unsigned long is still 64 bit.
> So with CHERI you cannot store pointers in unsigned long variables.

I like the ability to properly set up pointers for driver data, however
I do not think we should use named initializers for name field. As long
as we are not planning on moving its position I like the brevity of just
saying

	{ "ili210x", .driver_data_ptr = &ili210x_chip },

Can we keep the old style for the name field?

Thanks.

-- 
Dmitry

