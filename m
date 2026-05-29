Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8790CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvGXi3GnoQLfXUwepfNKreQtoZ065df4GYADd0i3vGY=; b=BhCpk2pfwDPoQn9iXcwtW53sQp
	J4nqEnkBwM+OM0iArwGpeIaRv1gFWiFf62TS3IwWb6lWgK2VSeOC37o/a1PQHD3R1sr81NQAj1LUX
	3+iI8ximf6gTz8y8O7r7sbTWzQOmJayiaTmk0KLbZm+ex8O0Lf7UWnyR2SAMdD0PQOkq5ltdssVTv
	BdRVPZXqUa9DOfxcM2QjUFUYuDmPsQfQ0cZZImaiy93R/xPifvQGNG+thtyzgNqQpYYy3BahPigAG
	cV6QCUZzUPJuZhiVlBbLliDSVmuuwGJxROFSFnrmxkg8v0DeYOSS/G+GlJMxHVfaP/Uj96r6mAufx
	XTylcsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvPA-00000007HOr-2x0b;
	Fri, 29 May 2026 11:29:32 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvP7-00000007HNa-1LEd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Cc: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1780054167;
 bh=mvGXi3GnoQLfXUwepfNKreQtoZ065df4GYADd0i3vGY=;
 b=blWlMXan1MSo6CS28ZZ+xUN8xIdK+GE9+fuYFCX3ApfRwJELBB4DbfAqa3iUQFLLjA/gy/pJS
 GDqFaExGyV9w8dMKmH0XKGtpaJ1m5B5FrNiClOX7jxD2g8N0Q0MrOgfiyF0ECdtizQ4gxrRbUSo
 r+01AoXy47AkwtIzuIth1mQKyoYwQ3RiZxMdstfEP2ln8dUrPlixGuhAGgi/yMqCvtmvqy6fLOL
 MGHGfpJI6paNEDk9koJTyBBA+d/I1fZon2X+TGMXzrpoUIKCziB2hV8NRhpROgPlDh0Ty5JVDHN
 Xqn5Uuwz9pvl4hSi5gjA1KrMwjXaR3UZOQn0w8D9Tu+w==
X-Forward-Email-ID: 6a1978895c58ed9868160fa3
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.15
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Fri, 29 May 2026 07:29:08 -0400
Message-Id: <DIV4J6UGUQGG.28KL8EGBZWJSJ@ubuntu.com>
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Sebastian Reichel" <sre@kernel.org>
Cc: "Yixun Lan" <dlan@kernel.org>, "Andreas Kemnade" <andreas@kemnade.info>,
 "Matti Vaittinen" <mazziesaccount@gmail.com>, "Sven Peter"
 <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal Gompa"
 <neal@gompa.dev>, "Amit Sunil Dhamne" <amitsd@google.com>, "Samuel Kayode"
 <samkay014@gmail.com>, <linux-pm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
 <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_042929_462415_8013AEB9 
X-CRM114-Status: GOOD (  16.29  )
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

On Fri May 29, 2026 at 6:18 AM EDT, Uwe Kleine-K=C3=B6nig (The Capable Hub)=
 wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
>  drivers/power/reset/spacemit-p1-reboot.c | 4 ++--
>  drivers/power/reset/tps65086-restart.c   | 2 +-
>  drivers/power/supply/bd71828-power.c     | 8 ++++----
>  drivers/power/supply/macsmc-power.c      | 2 +-
>  drivers/power/supply/max77759_charger.c  | 2 +-
>  drivers/power/supply/max8998_charger.c   | 2 +-
>  drivers/power/supply/pf1550-charger.c    | 2 +-
>  drivers/power/supply/rt5033_charger.c    | 2 +-
>  8 files changed, 12 insertions(+), 12 deletions(-)

[snip]

> diff --git a/drivers/power/supply/macsmc-power.c b/drivers/power/supply/m=
acsmc-power.c
> index 33ca07460f3a..ced07f71e0a8 100644
> --- a/drivers/power/supply/macsmc-power.c
> +++ b/drivers/power/supply/macsmc-power.c
> @@ -834,7 +834,7 @@ static void macsmc_power_remove(struct platform_devic=
e *pdev)
>  }
> =20
>  static const struct platform_device_id macsmc_power_id[] =3D {
> -	{ "macsmc-power" },
> +	{ .name =3D "macsmc-power" },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, macsmc_power_id);

For macsmc-power,

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

(I'm not sure if one can "Review-by" a specific section of a singular
patch, but also the other changes in the patch look fine to me, so
consider it reviewed as well.)

