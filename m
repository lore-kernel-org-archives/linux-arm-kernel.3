Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E768CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsoi2vg2LB1YdOz216qy3fyKHo1xGtnZSa2C1EmzQQo=; b=tAKm1kiZdYVOb1aXSv4D+LDaXd
	wDvbo8XZ5IoXn2+MQIaoV+t9JgWpSRSpSaOhqp8v6irrlDiG9Y6+4xoPVcF7JK1lS1msjZznuCnuk
	OlviHrUk2ECf2wh9RqTJxVXU2KMiUJ04jivL1ZPFxvKyiJ+UkkyAuW+11XbLdtP6rFAEckOk0tMKq
	cojaQ+G0Y0swCejvlmVx94VQkR9cy4GONa+/j8xh4aj4ZFpivTHseVaW6yh9nM15l0rEFvNX6wfSp
	YYBlf0ZjB/gEYswSFW0qZUrESK/yJUdWHUvn08dDlCIYoR6qfQMtIjZedTrlzdbM464JhWc1P1r0K
	nDwFuUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLAt-0000000BIxI-3saC;
	Mon, 12 Oct 2026 18:55:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLAt-0000000BIx3-0OZu;
	Mon, 12 Oct 2026 18:55:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC9DA40C02;
	Mon, 12 Oct 2026 18:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E7C1F008A1;
	Mon, 12 Oct 2026 18:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831302;
	bh=lsoi2vg2LB1YdOz216qy3fyKHo1xGtnZSa2C1EmzQQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N3ZZ6lS7EyvdRhDCSwPisPwBsfZDf2U/cgYy+PvafbsVnw+LlKjg0ZUagkVZwZD8x
	 tI9jNpHjsNM78BddwlUemK9w35pF5YQa2i7hTRy1ifBOgubuR0aGVvZ1TosSpnTXyK
	 39GAMsCQZnmBA1siaIrn9LTc+9nk+Pg/I4xieWN1PL0AGWNp0MI613afthXKXiTuq7
	 5B7Pjyy00/y0beE/3uIzUxHZdTYn7nf9L+OxxVg9emSgGzUZkYiKdH02aNYixp5gw0
	 bceU4cUVi6vW6jm4PWx1y67uj83qgIw4/x4dRSYlk6OevQ2E352Cz/buYJHTwBfNIv
	 fFH3BbjZ+LYNQ==
Date: Mon, 12 Oct 2026 19:54:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Miotsuki Mizuno <founder@crepuse.com>
Cc: "heiko@sntech.de" <heiko@sntech.de>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"jesszhan0024@gmail.com" <jesszhan0024@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"noralf@tronnes.org" <noralf@tronnes.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-mipi-dbi-spi: Add
 UNIHIKER M10 display
Message-ID: <20261012-brunch-mocker-348f76eb943b@spud>
References: <20261012121718.53481-1-founder@crepuse.com>
 <20261012121718.53481-2-founder@crepuse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l0Q0H+qNTOU6/PQ9"
Content-Disposition: inline
In-Reply-To: <20261012121718.53481-2-founder@crepuse.com>
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

--l0Q0H+qNTOU6/PQ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--l0Q0H+qNTOU6/PQ9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0tAQAKCRB4tDGHoIJi
0kRKAPwKrVSpWbI+CrbQHAuW1z8jJHJOJ2kY7Fd65yZXVaWM/gD+MGhjR/tpHAvV
hoMubh6PI1wdQ4Mso389MlLQbINTdAc=
=CDyY
-----END PGP SIGNATURE-----

--l0Q0H+qNTOU6/PQ9--

