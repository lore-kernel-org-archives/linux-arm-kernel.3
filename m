Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333DECA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibx4Wuf/nDfg8JytDfccS5wn8x8YmTr1cZIy71hpWvY=; b=d8HL8tm4BwmitVGenUF3wkv2Qb
	+LevkqZsDdPTUlnLlAypgXrVqSCGiSV3QoEFBZivlW0754OJH0Y4jhbreh0Ci5sh3SSqIoxLMmrTh
	6gROynIt4ckKqfAI1c+v5EmDuabkrbOyL0loUTNNOl8aJvHF1N7TYBoG1wU1oe9USbV8A3tcrtopi
	djFJGGMFLl9kQHUNHZdXxGmGSzGxsi18odIG6iZM+riDsEq1YBAge8SMuBjH5cMbm8lP5+heuBmBD
	46oI1eiqXrYbsOZMeTATNM3XpS7KeVibDA9x0aa5MfehnC0opV38KAa1H3GRHlaLAniDYl3zuWps1
	oQ3WXRVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGaDX-0000000CeJL-2EUM;
	Tue, 13 Oct 2026 10:58:47 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGaDT-0000000CeG8-175b;
	Tue, 13 Oct 2026 10:58:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D89D5200582;
	Tue, 13 Oct 2026 12:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791889118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ibx4Wuf/nDfg8JytDfccS5wn8x8YmTr1cZIy71hpWvY=;
	b=Ft9dEqdSqJcAUHVzPIc2Eix4ACSvnxYrBByJWx/dmOdIVRCmu/EeYRQP2CINQ7tuAtTN+/
	Zys067Vs7HBtwPQyJNyvNv5Lh3hyUWpXmcILku2mXqsz46MNws2gfJI1O586Urlfo58qcU
	9VyHc37+7jpex2p0wrt3C/wQGOE0+MD7inDL+q46sOhf40AiTKpiR7EAsDBK0ZvAinfgJO
	9jmDQWCWriqusDxw0q/KDv7YeAYMFEvNGVYeaRpZtEXTe2CNP+BD4FSrTlmXR4ex56m0jM
	tkb9dNyrp9togtfNL9QlKlskYUkqlbO2ZC264rzgmFZIV/gTvoxAX1sc9PT9dA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791889118; a=rsa-sha256;
	cv=none;
	b=H6lGdFXLC8FRo8ALFR+JY+10yIo5YK/+Ss/C/5Ge0Z7lmrzl0BemHysBpEXjjul0JMaCc3
	Z/+L6EbsYtN9aakUCGvzNn7csRXqyyQmi9vsDWidakbgfQ2jPLFI5bJHKIHZ5fsouuL9Bi
	Uz44QfRUT9PsyLJ6E0FRuvhDFXdh84ESkpZ9ti7Ev2wwZ6r3+G8lE0SB386d8cKhoZFaJU
	0Zllheq8FeQVD8dMfKrZkkcJUs9fXBL+77v8pii+b7cRycZND4E/1/dPjhYDJutal28nic
	GidRYbn9ynscfXEylHWlXhTdl5MzjPBItgQcpb0Hzrw47nPHLFSWdf0mllwGQA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791889118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ibx4Wuf/nDfg8JytDfccS5wn8x8YmTr1cZIy71hpWvY=;
	b=COiVH5dzxNsq4sj3ao+H39OF5fYjChNz/VJalg6MCyepxFLn+CCrFd2APcgYSxdwDl158h
	3Ydjmn8PeKtThSxC1pOTzEp5JeWk4MA0fyMVE2xqX/DAduXGMv+Snd22wWXQKNTmxGMoij
	295cJh1BqBtYuiP7cE26uELPkPrxCkw0cNDqiCmg+9SN6eELvKvjTGZgXVrGkfI0HjsPSp
	OZD7EUe97EMR77WC6Hynn2RwG99GJBXSHN49JEGEAwwZCqC1MChtevdwuW4NGEvg1GzfhO
	j/xP3UStSs9sAwhWExXm+v8Q0FmXqXKjvRNA5/QoslsFv/2qZOTSHoap4bHiGw==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xGaDO-005g8E-2X;
	Tue, 13 Oct 2026 12:58:38 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6C2E45C2F46;
	Tue, 13 Oct 2026 10:58:38 +0000 (UTC)
Date: Tue, 13 Oct 2026 12:58:37 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Cunhao Lu <1579567540@qq.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	kernel@pengutronix.de, Heiko Stuebner <heiko@sntech.de>, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net] can: rockchip_canfd: stop bus-off restart before
 closing the device
Message-ID: <20261013-hissing-saiga-of-endeavor-ef5e03-mkl@pengutronix.de>
References: <tencent_5802EE88434010229EDF7A53084D994C6106@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="25w3tbmyskksrjyb"
Content-Disposition: inline
In-Reply-To: <tencent_5802EE88434010229EDF7A53084D994C6106@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_035843_459089_AF40FC1D 
X-CRM114-Status: GOOD (  15.91  )
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


--25w3tbmyskksrjyb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net] can: rockchip_canfd: stop bus-off restart before
 closing the device
MIME-Version: 1.0

On 13.10.2026 11:22:37, Cunhao Lu wrote:
> The close path cancels restart_work after freeing the IRQ and stopping
> hardware. A queued bus-off restart can therefore enable the controller
> and interrupts after teardown. It can also restart timestamp work before
> runtime suspend.
>
> Serialize restart with the close transition using a mutex. Mark the
> device closing and mask its interrupts before synchronizing the IRQ.
> Release the mutex before cancelling restart_work, so a queued restart
> can observe the closing state without deadlocking.
>
> Exclude the IRQ handler while reinitializing the hardware on restart.
> Do not disable the shared IRQ line while waiting for work to finish.
>
> Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD=
 controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

AFAICS this is a systematic problem and should IMHO not worked around in
one driver only.

netif_running() tests __LINK_STATE_START, which is removed in
__dev_close_many() prior to calling the driver's ndo_stop().

Can we make use of netif_running() prior to calling do_set_mode(dev,
CAN_MODE_START)? from can_restart()?

can_bus_off() should not schedule_delayed_work() if !netif_running().

We still have to call cancel_delayed_work_sync(&priv->can.restart_work)
=66rom each driver, though.

What do you think?

Marc

--
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--25w3tbmyskksrjyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCas4O2wAKCRDMOmT6rpmt
0q+pAPwIF8wpYL7J1/gk9g6RXhUr5SARSzzpYTyGVX3yt2JlIQEAxgkwnBhMJin5
BgazUeZQAgL09GXx7TEVzKpH1RZCUw0=
=mEzK
-----END PGP SIGNATURE-----

--25w3tbmyskksrjyb--

