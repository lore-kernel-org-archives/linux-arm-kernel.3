Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6593DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRNaGdAzO65KDiiRZApRLTAEg00VP2mKB0qAOtVoKqA=; b=DCrr2+K4nLg+5SvstDa45NqVO7
	r3tq0eZWvqkosrhSHMfQ10VPMBLrPXIKLx7hP1yiQeixip30xDkzi9OTSFrpKd8ZUBtwSCYws4m9R
	VLb49qYi+h5JpMFguxp+P3EmEnrq0oQDTNFBBBD0w69GMaHaDo1RzkgYfeKnyfC/ZxosbzIwfeOeq
	Wjq6/HSZZiR4lZtW6aOBveec0dNWcadqIrXxdW8j1qAOfdn5HsHQeYRAs/maxOiy451WRonHeP9tt
	xT8fzGXHdkynfNSv6uyW0P850DeVOsfADAr6wkzb8FIFzRR+HpzubMQUpCZJzdDnigzrWsOjjtX6d
	onA60dZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whszK-00000003BC5-49U1;
	Thu, 09 Jul 2026 17:56:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whszJ-00000003BBq-1qa5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:56:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 340B5413D1;
	Thu,  9 Jul 2026 17:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D671F000E9;
	Thu,  9 Jul 2026 17:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619801;
	bh=kRNaGdAzO65KDiiRZApRLTAEg00VP2mKB0qAOtVoKqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=axNtc6LOOBmyBlnBWUE9U9vekFWNnBt9PdSaYchoHJcik99QPBwU8bS3ByRopgCSs
	 53Etzm5KZeWG3QAMuBruIEdNHSVtoN8hYLuggDGdNcUa2Q0Bqw261XG67Hu9d0VSwO
	 LvanHDh/ZyUDeHHLW9Mv7WIQCplnf2daiknOyWstgJewxlUgPJHT6aEVl9bwF57J3H
	 cXpDGivmGMbS4jT3PXDA5KDCHBhfXBXiZu77UVkkw3yWWua15kj2nCVoIfJOwM/9JP
	 XAamfoj1NaqAdqVq8w/lDNzHnWg7Vv5sOkMnau93YFBZ7VLlJwCdN0dj0cLNxaHCqC
	 vTvOpuek9KZaw==
Date: Thu, 9 Jul 2026 18:56:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 01/11] dt-bindings: input: samsung,s3c6410-keypad:
 introduce compact binding
Message-ID: <20260709-unmoving-tarmac-7b2a4c919fc9@spud>
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
 <20260708-samsung-kp-v2-1-3c6ed4c9b3b6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+hEnRWUEffYSYq9t"
Content-Disposition: inline
In-Reply-To: <20260708-samsung-kp-v2-1-3c6ed4c9b3b6@gmail.com>
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

--+hEnRWUEffYSYq9t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+hEnRWUEffYSYq9t
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/g0wAKCRB4tDGHoIJi
0jsHAQCJcgPlMZuvdGNMPI7lSKXrzapHabhemAMKR+FtfbcAZQD/RZzL++UNHLy0
dU/d8/UC/L4AAP2H3So4Ft+2ivIaFgA=
=eiJ3
-----END PGP SIGNATURE-----

--+hEnRWUEffYSYq9t--

