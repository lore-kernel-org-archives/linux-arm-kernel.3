Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A34CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/3ocmMdZEl3pTKP3oYSQ9rwYEMqGq7YM2SuMQVsdqQ=; b=U/cXranFE9BErDhqAZAIFBlghj
	blZcOBzvUYgtPXlAFnuDvZDG0iVeiOgWvaV2xdSXC4nChuvQOWNqw8POVMzh1pv1rssLjcF6Sp9mB
	g9WSgkM/jQTtpWOucTxNDD+EWgHbiyAiGpHHtR2YYOPaRgCwG+ylFhq9buVBp8eUahTd1T84qdWm5
	OkruhpuUcpcODXmmg5q4RvcTI9bAFNJtsQ39U1ey1QKMy8Lp/G4Y/Xh/xT2RVSvpHwgrV58EZbrSW
	UiGq4NkiKKfgUgd+YZZ1EXfOZyzdqfPPVXYU1k76Nqj8fLkQsPF2fpY3Pg2glZ3FB7Y9wlvzEJRNW
	0Hb/Dp7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNreS-00000008KAC-3wya;
	Fri, 15 May 2026 12:28:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNreQ-00000008K8p-1ymD;
	Fri, 15 May 2026 12:28:24 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 857C263C;
	Fri, 15 May 2026 14:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778848087;
	bh=wF9KsXHL0yOzCMIY2qWBmD0LDGdSmbmn1odoHyUkzdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JBKXKuKkQ8vRjy/q0DRBweXo/xMEXs0kXJp+vtYf+GuWgtFBcekZtZJqjDfrx7IiD
	 nFS0AgoEdmRfCkEOR+zKMNPTLyAriLI18DfoUuIf4xx5jxylsFgucKUHUdHGt4qi7+
	 y5EuQAILWJq/EI2joiW8UqE0E0oVJcCekn1nJCpk=
Date: Fri, 15 May 2026 15:28:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Woodrow Douglass <wdouglass@carnegierobotics.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Icenowy Zheng <icenowy@aosc.io>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1] regulator: Use named initializers for arrays of
 i2c_device_data
Message-ID: <20260515122816.GB52035@killaraus.ideasonboard.com>
References: <20260515103150.164887-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515103150.164887-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_052822_656715_756B17C8 
X-CRM114-Status: GOOD (  33.69  )
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

Thank you for the patch.

On Fri, May 15, 2026 at 12:31:50PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> While touching all these arrays, unify usage of whitespace and commas.
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
> 		char name[I2C_NAME_SIZE];
> 	-	kernel_ulong_t driver_data;	/* Data private to the driver */
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
> 	diff --git a/drivers/regulator/ad5398.c b/drivers/regulator/ad5398.c
> 	index 0123ca8157a8..dfb0b07500a7 100644
> 	--- a/drivers/regulator/ad5398.c
> 	+++ b/drivers/regulator/ad5398.c
> 	@@ -207,8 +207,8 @@ struct ad5398_current_data_format {
> 	 static const struct ad5398_current_data_format df_10_4_120 = {10, 4, 0, 120000};
> 	 
> 	 static const struct i2c_device_id ad5398_id[] = {
> 	-	{ .name = "ad5398", .driver_data = (kernel_ulong_t)&df_10_4_120 },
> 	-	{ .name = "ad5821", .driver_data = (kernel_ulong_t)&df_10_4_120 },
> 	+	{ .name = "ad5398", .driver_data_ptr = &df_10_4_120 },
> 	+	{ .name = "ad5821", .driver_data_ptr = &df_10_4_120 },
> 		{ }
> 	 };
> 	 MODULE_DEVICE_TABLE(i2c, ad5398_id);
> 	@@ -219,8 +219,7 @@ static int ad5398_probe(struct i2c_client *client)
> 		struct regulator_init_data *init_data = dev_get_platdata(&client->dev);
> 		struct regulator_config config = { };
> 		struct ad5398_chip_info *chip;
> 	-	const struct ad5398_current_data_format *df =
> 	-			(struct ad5398_current_data_format *)id->driver_data;
> 	+	const struct ad5398_current_data_format *df = id->driver_data;
> 	 
> 		chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> 		if (!chip)
> 
> that are an improvement for readability (again!) and it keeps some
> properties of the pointers (here: being const) without having to pay
> attention for that.
> 
> My additional motivation for this effort is CHERI[1]. This is a hardware
> extension that uses 128 bit pointers but unsigned long is still 64 bit.
> So with CHERI you cannot store pointers in unsigned long variables.
> 
> Best regards
> Uwe
> 
> [1] https://cheri-alliance.org/discover-cheri/
>     https://lwn.net/Articles/1037974/
> 
>  drivers/regulator/88pg86x.c            |  4 +--
>  drivers/regulator/ad5398.c             |  4 +--
>  drivers/regulator/da9121-regulator.c   | 20 +++++++--------
>  drivers/regulator/da9210-regulator.c   |  4 +--
>  drivers/regulator/da9211-regulator.c   | 18 +++++++-------
>  drivers/regulator/fan53880.c           |  4 +--
>  drivers/regulator/isl9305.c            |  4 +--
>  drivers/regulator/lp3971.c             |  2 +-
>  drivers/regulator/lp3972.c             |  2 +-
>  drivers/regulator/lp872x.c             | 34 +++++++++++++-------------
>  drivers/regulator/lp8755.c             |  4 +--
>  drivers/regulator/ltc3589.c            |  6 ++---
>  drivers/regulator/ltc3676.c            |  2 +-
>  drivers/regulator/max1586.c            |  2 +-
>  drivers/regulator/max20086-regulator.c |  8 +++---
>  drivers/regulator/max20411-regulator.c |  2 +-
>  drivers/regulator/max77503-regulator.c |  2 +-
>  drivers/regulator/max77675-regulator.c |  2 +-
>  drivers/regulator/max77826-regulator.c |  2 +-
>  drivers/regulator/max77838-regulator.c |  2 +-
>  drivers/regulator/max77857-regulator.c |  8 +++---
>  drivers/regulator/max8649.c            |  2 +-
>  drivers/regulator/max8893.c            |  2 +-
>  drivers/regulator/max8952.c            |  2 +-
>  drivers/regulator/mcp16502.c           |  2 +-
>  drivers/regulator/mp5416.c             |  6 ++---
>  drivers/regulator/mp8859.c             |  4 +--
>  drivers/regulator/mp886x.c             |  6 ++---
>  drivers/regulator/mpq7920.c            |  4 +--
>  drivers/regulator/mt6311-regulator.c   |  4 +--
>  drivers/regulator/pf530x-regulator.c   |  8 +++---
>  drivers/regulator/pf8x00-regulator.c   |  8 +++---
>  drivers/regulator/pv88060-regulator.c  |  4 +--
>  drivers/regulator/pv88080-regulator.c  |  8 +++---
>  drivers/regulator/pv88090-regulator.c  |  4 +--
>  drivers/regulator/slg51000-regulator.c |  4 +--
>  drivers/regulator/sy8106a-regulator.c  |  2 +-
>  drivers/regulator/sy8824x.c            |  8 +++---
>  drivers/regulator/sy8827n.c            |  4 +--
>  drivers/regulator/tps6286x-regulator.c | 10 ++++----
>  drivers/regulator/tps6287x-regulator.c | 10 ++++----
>  41 files changed, 119 insertions(+), 119 deletions(-)

[snip]

> diff --git a/drivers/regulator/pf530x-regulator.c b/drivers/regulator/pf530x-regulator.c
> index f789c4b6a499..e7b13d60106b 100644
> --- a/drivers/regulator/pf530x-regulator.c
> +++ b/drivers/regulator/pf530x-regulator.c
> @@ -353,10 +353,10 @@ static const struct of_device_id pf530x_dt_ids[] = {
>  MODULE_DEVICE_TABLE(of, pf530x_dt_ids);
>  
>  static const struct i2c_device_id pf530x_i2c_id[] = {
> -	{ "pf5300", 0 },
> -	{ "pf5301", 0 },
> -	{ "pf5302", 0 },
> -	{},
> +	{ .name = "pf5300", .driver_data = 0 },
> +	{ .name = "pf5301", .driver_data = 0 },
> +	{ .name = "pf5302", .driver_data = 0 },

I think you can drop driver_data here. It doesn't appear to be used by
the driver.

I like the result overall. With this small issue addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, pf530x_i2c_id);
>  

[snip]

-- 
Regards,

Laurent Pinchart

