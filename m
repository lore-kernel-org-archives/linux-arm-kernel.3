Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9A8CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXHsvjCQrWr3rqwFY5ZXhorh2fke7yZbuXuZictrkbY=; b=N9z7pYk5pyQUX7IAqPsSj/YGs7
	5HhcN0zbK5kysc7gDfG/s9eIIi+XDhfmEmR2kw3VI/V9H9P3yqP2jPOjCvGZikYlB7JAPAf4A+CYB
	YUzocm627jb4iMcsnic5cuPg84GDtrqsWARJHeJi4e4mvL3YIW85FkWf4CHKcxHrozPIHiBnZ3Cg3
	o1DT7OtyrVHEpYLa0zFbtnDvzfN3gLgydZRyaTLYt2ntFNg7vyGue2pCZNbn5bb4jI4cAdcg+iSHa
	mxOyoOBLsvzoRiEsDlHbruWWkq6qBmkN8+2RF1dmp1oEP+iXVkHzsa8xhnXAWrgFalxAQg2J5VJyf
	CZcmZsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHLv-000000012TW-2Yng;
	Tue, 19 May 2026 10:07:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHLs-000000012SU-2ulN;
	Tue, 19 May 2026 10:07:06 +0000
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF889296;
	Tue, 19 May 2026 12:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779185209;
	bh=L5Slw9bkugmP424w3w1mHtahMW7LPmAk115Dd26N87s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8vcf2PVYU0o28ZfJUaiUQPQ+mVn2Cn1EspcxVFTzDddWl6CN+fN0gpWseLQPC5TQ
	 sCqJhQIuNV1sa7GDbwNEmgM4Wwx5rCV//PWl0C+E433U06Vr0XTEDX9qmEfzVVlbXB
	 KWY++GWhR7x6HLG2D4hMnGiLYsx6fzfLedJQl4vs=
Date: Tue, 19 May 2026 12:07:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
Subject: Re: [PATCH v2 2/2] regulator: Use named initializers for arrays of
 i2c_device_data
Message-ID: <20260519100700.GC45952@killaraus.ideasonboard.com>
References: <cover.1779184320.git.u.kleine-koenig@baylibre.com>
 <9a8bfc7286221873ef02eeba0727eeaeb9e504e8.1779184320.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a8bfc7286221873ef02eeba0727eeaeb9e504e8.1779184320.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_030704_874699_7F0F7BBD 
X-CRM114-Status: GOOD (  21.38  )
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

On Tue, May 19, 2026 at 11:57:51AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
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
>  drivers/regulator/pf530x-regulator.c   |  6 ++---
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
>  41 files changed, 118 insertions(+), 118 deletions(-)

[snip]

> diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
> index 942f37082cb1..779df653338a 100644
> --- a/drivers/regulator/lp872x.c
> +++ b/drivers/regulator/lp872x.c
> @@ -796,24 +796,24 @@ static const struct regmap_config lp872x_regmap_config = {
>  #define LP872X_VALID_OPMODE	(REGULATOR_MODE_FAST | REGULATOR_MODE_NORMAL)
>  
>  static struct of_regulator_match lp8720_matches[] = {

This is unrelated to the commit message that only mentions
i2c_device_id.

With this chunk dropped,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -	{ .name = "ldo1", .driver_data = (void *)LP8720_ID_LDO1, },
> -	{ .name = "ldo2", .driver_data = (void *)LP8720_ID_LDO2, },
> -	{ .name = "ldo3", .driver_data = (void *)LP8720_ID_LDO3, },
> -	{ .name = "ldo4", .driver_data = (void *)LP8720_ID_LDO4, },
> -	{ .name = "ldo5", .driver_data = (void *)LP8720_ID_LDO5, },
> -	{ .name = "buck", .driver_data = (void *)LP8720_ID_BUCK, },
> +	{ .name = "ldo1", .driver_data = (void *)LP8720_ID_LDO1 },
> +	{ .name = "ldo2", .driver_data = (void *)LP8720_ID_LDO2 },
> +	{ .name = "ldo3", .driver_data = (void *)LP8720_ID_LDO3 },
> +	{ .name = "ldo4", .driver_data = (void *)LP8720_ID_LDO4 },
> +	{ .name = "ldo5", .driver_data = (void *)LP8720_ID_LDO5 },
> +	{ .name = "buck", .driver_data = (void *)LP8720_ID_BUCK },
>  };
>  
>  static struct of_regulator_match lp8725_matches[] = {
> -	{ .name = "ldo1", .driver_data = (void *)LP8725_ID_LDO1, },
> -	{ .name = "ldo2", .driver_data = (void *)LP8725_ID_LDO2, },
> -	{ .name = "ldo3", .driver_data = (void *)LP8725_ID_LDO3, },
> -	{ .name = "ldo4", .driver_data = (void *)LP8725_ID_LDO4, },
> -	{ .name = "ldo5", .driver_data = (void *)LP8725_ID_LDO5, },
> -	{ .name = "lilo1", .driver_data = (void *)LP8725_ID_LILO1, },
> -	{ .name = "lilo2", .driver_data = (void *)LP8725_ID_LILO2, },
> -	{ .name = "buck1", .driver_data = (void *)LP8725_ID_BUCK1, },
> -	{ .name = "buck2", .driver_data = (void *)LP8725_ID_BUCK2, },
> +	{ .name = "ldo1", .driver_data = (void *)LP8725_ID_LDO1 },
> +	{ .name = "ldo2", .driver_data = (void *)LP8725_ID_LDO2 },
> +	{ .name = "ldo3", .driver_data = (void *)LP8725_ID_LDO3 },
> +	{ .name = "ldo4", .driver_data = (void *)LP8725_ID_LDO4 },
> +	{ .name = "ldo5", .driver_data = (void *)LP8725_ID_LDO5 },
> +	{ .name = "lilo1", .driver_data = (void *)LP8725_ID_LILO1 },
> +	{ .name = "lilo2", .driver_data = (void *)LP8725_ID_LILO2 },
> +	{ .name = "buck1", .driver_data = (void *)LP8725_ID_BUCK1 },
> +	{ .name = "buck2", .driver_data = (void *)LP8725_ID_BUCK2 },
>  };
>  
>  static struct lp872x_platform_data
> @@ -935,8 +935,8 @@ static const struct of_device_id lp872x_dt_ids[] __maybe_unused = {
>  MODULE_DEVICE_TABLE(of, lp872x_dt_ids);
>  
>  static const struct i2c_device_id lp872x_ids[] = {
> -	{"lp8720", LP8720},
> -	{"lp8725", LP8725},
> +	{ .name = "lp8720", .driver_data = LP8720 },
> +	{ .name = "lp8725", .driver_data = LP8725 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, lp872x_ids);

[snip]

-- 
Regards,

Laurent Pinchart

