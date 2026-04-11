Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AC8F3ED44
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgsSydsp5oPLb1P/RjIJwmuiGaqUjUz2j8uHNwmAQes=; b=4wTrMY/UnJR5X0dvSHUnDjJ5W3
	JZIHVwcTQKyRy2xIYeGUOSN1RP5W5Mu1koe7Ue7MKcJHA6jTSIfKd79PilEl53DK1P0WYLAqCYt0E
	vo1LLQaRCBap0CPK/HdAfEqJka2biKdyrjxfhOCwhCTV74wS1i9NbhkowgBPbNex2sjRyq9CcET9T
	sS08SW7meZ6pMFJ6aSQw40HAa8MFsrUE/3MM7b8KU15E8SQVtbsgX4HTWCUykElBrD1jcPE8jgCOF
	dpniNczJySIDQhvudrlPDQ9DNdGTpRi5Y4mL3FgvdpVrvZrwskCtjz9ru55VYp4ee3mUspErg2VtS
	SO3oPK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBVli-0000000DMa8-1ojj;
	Sat, 11 Apr 2026 10:40:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBVlg-0000000DMa0-3zlx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 10:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D63A260142;
	Sat, 11 Apr 2026 10:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D47C4CEF7;
	Sat, 11 Apr 2026 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775904046;
	bh=61nevb5U7KmJ6GlJeZz+DxBkLNyhcBVs6JVbc3G0hRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgWv0wKFO9krr6M6Xkfs3b5boJvhz+IUUDY0knPmrLlxJEZBCNqIuOkKZ6lrlwW3i
	 1voGar9s5isgNb59sAJNBA0QLDA7P5P7aCIuRXGkrWxLETW+rhU43ymy1obXU+E4Hu
	 vQ07EBaeeNjo7j4d8wLCqPYNLj3o1HC7jiquV46Ek/wnhCQGp83SIcc15t+JASGQaU
	 AhnMsrN3qenIbfjRucmJxp2NKncOBNWR0rTZF0sRRfRgl95VPp+680nHHFqwslAmIa
	 8HzIV0MPc0a/6MuwY1cmPHOL18xYgHV7X7+KLeG9cpIiToYISm6sbgtMq83EEgEOYF
	 Me/AkfacOtr6w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6F6A01AC58BA; Sat, 11 Apr 2026 11:40:42 +0100 (BST)
Date: Sat, 11 Apr 2026 11:40:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: imx-rpmsg: Fix ignore-suspend-widgets only applied
 to codec DAPM
Message-ID: <adolKj26DFqZ-XTi@sirena.co.uk>
References: <20260411072439.1125664-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wxo/GoZ8NwX6CkGC"
Content-Disposition: inline
In-Reply-To: <20260411072439.1125664-1-chancel.liu@nxp.com>
X-Cookie: You will be divorced within a year.
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


--Wxo/GoZ8NwX6CkGC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 11, 2026 at 04:24:39PM +0900, Chancel Liu wrote:
> Currently the property "ignore-suspend-widgets" are applied only to the
> codec's DAPM context. However, some widgets listed in the property
> (e.g. "Headphone Jack") belong to card or CPU DAI DAPM context.

> Extend the handling so that widgets which are marked ignoring suspend
> are looked up across all widgets in the card.

> --- a/sound/soc/fsl/imx-rpmsg.c
> +++ b/sound/soc/fsl/imx-rpmsg.c

> +		num_widgets = of_property_count_strings(data->card.dev->of_node,
> +							"ignore-suspend-widgets");

Don't we get an error code back if the property doesn't exist at all?

> +		for_each_card_widgets(card, w) {
> +			for (i = 0; i < num_widgets; i++) {
> +				of_property_read_string_index(data->card.dev->of_node,
> +							      "ignore-suspend-widgets",
> +							      i, &widgets);
> +				if (!strcmp(w->name, widgets)) {
> +					ret = snd_soc_dapm_ignore_suspend(w->dapm, widgets);
> +					if (ret) {
> +						dev_err(dev, "failed to find ignore suspend widgets\n");
> +						return ret;
> +					}
> +				}
> +			}
> +		}

This seems like the wrong level to implement this search, it should be
in the core.  I'm also not seeing any prefix handling, the widget name
might've been prefixed at runtime.

--Wxo/GoZ8NwX6CkGC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnaJPoACgkQJNaLcl1U
h9C79Af9Eww5MqUM4l2uWRZsMS1+DeTVXwJPdg7NgJgCOgzNWNI6hP6w9WE8X1BG
Ulvj0GOSZy7HDwLahBChs8AydyTxc1qaR7qNljsVj0Bb7zJmVIkHa8nuqtGxsDux
nvwnyybQFXambSXYfK4rbsUrF1XZ03NYnV5QroMIa3GsfyFsdK2otKJv5SNmgT82
pG2VFlhxxd/uocwyG5CqWxj0bTija2Qf0mlmbJMb971kafdmhRUWLFuC8FKxKnTr
POxLHJO4V3G5SbdvtZDMYqLLAn3psbWCPIkMXMy5krUPef/qh+wCVAwMapMnpWsV
WOjblDfXWqT7+DwxsSH8yOpoGJ+d9w==
=Y0Br
-----END PGP SIGNATURE-----

--Wxo/GoZ8NwX6CkGC--

