Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D2EC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 20:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lax5BCNfLQENbO+GNfcacmLPcdrsOa86+RGjlYhexco=; b=3pDZaMV4Hxfc+6R7lGgL5Bu3lC
	AI6iuv1no+fiyWENaVTDM3Qb7rXE/3FKFZiZZaoc0vvwxFzuNpe28CGNh/y3UBb06p07aDz3r4YF1
	TDAnxO91JKvfmW+k8KtKOpStwOxXsIDPHJagcTLdcX0prs5NbzPTFKuwS6C2dw/ZefPuI+NJI/SO3
	Z0UhdPkfvkMYWrTH+rAZS0i6G7JbGX3NQbMWTzdv0UZS5ETFXyzCFFSVVfGLVLFRSU7Az5Nljxmi3
	rjxMNedUn6iJYA6rygkRX4aAp02oxIyYXv6Nuoj7r5mRAi21MbLxvhnRtEY5Vuw8z7FwktoK1hvGu
	jlzloDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcsAh-00000005nVJ-2ItJ;
	Tue, 28 Jan 2025 20:26:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcs9M-00000005nPY-0ivR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 20:25:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2016DA412A7;
	Tue, 28 Jan 2025 20:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD4BC4CED3;
	Tue, 28 Jan 2025 20:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738095930;
	bh=vsE8IFVrzUvktukSA+TorUfPU/BVdbA/l2O5s9pg3UQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WfeGp7x7LRpK0MQbXzwGZNO+zX9Z2ydtAlj60oBAqLR6E6fHVLnmXpMKevOBWJ9cq
	 UnPvWNvMo/e+cu/PWf9rYx+UhMQFWknRd43z0stLEqYt9sxT1idroeB9f2wJp25dai
	 CHOWfedXslPW+L70bOJDBV5r9afQNlDBvFwXuMFAJyKzfOH7YzAUPAP271XJiDC8gb
	 4RTPupnAsqpxoerFDjlPA1B+WULohj4NS0NB7AdCHt2MJBV97AsP6DgcluJEEQg6qw
	 b5rO++8Y/bzk9BqbpgJEIF2TF/r8+CV6y65dJKvlw0cmLItjYAN3oXb+QvsVxw471A
	 KS47V0T+5GAkA==
Message-ID: <ff801714249c492abc3781da55675a38.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com> <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
Subject: Re: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>, Michael Turquette <mturquette@baylibre.com>, Peng Fan (OSS) <peng.fan@oss.nxp.com>, Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>
Date: Tue, 28 Jan 2025 12:25:28 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_122532_340482_AD765085 
X-CRM114-Status: GOOD (  20.44  )
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

Quoting Peng Fan (OSS) (2025-01-24 06:25:17)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b736e3c275=
1eeb38dc4577b1f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk, unsigned lon=
g rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> =20
> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> +                           unsigned int spreadpercent, unsigned int meth=
od,
> +                           bool enable)
> +{
> +       struct clk_spread_spectrum clk_ss;
> +       struct clk_core *core;
> +       int ret =3D 0;

The assignment looks unnecessary.

> +
> +       if (!clk || !clk->core)

How do you not have clk->core?

> +               return 0;
> +
> +       clk_ss.modfreq =3D modfreq;
> +       clk_ss.spreadpercent =3D spreadpercent;
> +       clk_ss.method =3D method;
> +       clk_ss.enable =3D enable;
> +
> +       clk_prepare_lock();
> +
> +       core =3D clk->core;

Why do we need to get the core under the lock?

> +
> +       if (core->prepare_count) {

Why does prepare count matter?

> +               ret =3D -EBUSY;
> +               goto fail;

We just left without releasing the lock.

> +       }
> +
> +       ret =3D clk_pm_runtime_get(core);
> +       if (ret)
> +               goto fail;

We just left without releasing the lock.

> +
> +       if (core->ops->set_spread_spectrum)
> +               ret =3D core->ops->set_spread_spectrum(core->hw, &clk_ss);
> +
> +       clk_pm_runtime_put(core);
> +       clk_prepare_unlock();
> +fail:
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(clk_set_spread_spectrum);
> +
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index b607482ca77e987b9344c38f25ebb5c8d35c1d39..49a7f7eb8b03233e11cd3b927=
68896c4e45c4e7c 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -858,6 +858,21 @@ int clk_set_rate(struct clk *clk, unsigned long rate=
);
>   */
>  int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
> =20
> +/**
> + * clk_set_spread_spectrum - set the spread spectrum for a clock
> + * @clk: clock source
> + * @modfreq: modulation freq
> + * @spreadpercent: modulation percentage
> + * @method: down spread, up spread, center spread or else

Did we get cut off?

> + * @enable: enable or disable

Isn't 'disable' equal to spread_percent of zero?

> + *
> + * Configure the spread spectrum parameters for a clock.
> + *
> + * Returns success (0) or negative errno.
> + */
> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,

Does this need to be a consumer API at all? Usually SSC is figured out
when making a board and you have to pass some certification testing
because some harmonics are interfering. Is the DT property sufficient
for now and then we can do it when the driver probes in the framework?

> +                           unsigned int spreadpercent, unsigned int meth=
od,

I'd assume 'method' would be some sort of enum?

> +                           bool enable);
>  /**
>   * clk_has_parent - check if a clock is a possible parent for another
>   * @clk: clock source

