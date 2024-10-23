Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8724CCFA460
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pq+B5VNo/Pm3fIpX01GgY4/k4WzVlpQxnGCgyzWicQI=; b=b3tcfyPuao8T1sWtQUiqQA47dy
	g4RigcIczowX2Ou46Ib0nMbDNgA42b0JjJV0e2wCp5eWAEnAQ4mFhqNF867sOyWSDweqsdiu1Jd+1
	CTPIWz0/ls/7ma3rFhDJTlwuQ5KSbbqjaZPviLgpr4RthP6HCTIG+XB23QPbCKKPw4oI2tfMpBFO7
	vKpSwL311CRhYXL4Zk9mHlh4sqhogkxaW4RMI4RPHwIDgNTBtPwafnUqfa1pqoqXY+asJbHSX1uFd
	Cc2ViHPAOSpeFT0g8hZ4d/+ALKSU6JLLQERz4c0fxsomMSV/D8I4Db431/cpjP2ZmsNKtjCJ7Zqav
	tk5tF4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gw5-0000000FerH-3vmu;
	Wed, 23 Oct 2024 19:22:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fES-0000000FNxK-3gAc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 17:33:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FB875C5DA4;
	Wed, 23 Oct 2024 17:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B983C4CEC6;
	Wed, 23 Oct 2024 17:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729704795;
	bh=aGy3efOls/wqURuBJE1uQzRTyfi1S8NKrQ2z7vHGVM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ux2lk5ZozDdLWpl4Kd+qIYbwAsxnFCGlsccdGv6WN30NU38VrGdTasSZVxT+vbZwv
	 91GlM8JFRCLboEWdsQi5qgY53yENom7n3jkhCaIjNhVFJfDoV5Ldq7CsLL67zEaaqN
	 jd8GOocWwN67EHag7V4NmK0XP52yeFBS4+CmnHj5oL1HPBMksKXMDS/Cne2lh80RIN
	 upmoc+kA3CyGBlXkiUWsCfGKMWeCu1kskg4VpQXpWgbUxIhlpDcPpIEfK+Kdz6nzb4
	 XN3btZHxoEnDl225ydG1FUtuW2rGbS0rLkxo0XJN6Esks4rCYI+syk+nIfTQ3xzfXw
	 hyRxn5EEuEmHQ==
Date: Wed, 23 Oct 2024 18:33:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org, lukma@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/3] dt-bindings: misc: lwn,bk4-spi: Add binding
Message-ID: <94889e08-07b3-473c-9f52-bdeb5d1fd822@sirena.org.uk>
References: <20241023120015.1049008-1-festevam@gmail.com>
 <20241023-irritate-veal-0423be9e4c45@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MQWp88KTWMKl52II"
Content-Disposition: inline
In-Reply-To: <20241023-irritate-veal-0423be9e4c45@spud>
X-Cookie: A bachelor is an unaltared male.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_103317_024147_F7694268 
X-CRM114-Status: GOOD (  11.82  )
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


--MQWp88KTWMKl52II
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2024 at 05:37:29PM +0100, Conor Dooley wrote:
> On Wed, Oct 23, 2024 at 09:00:13AM -0300, Fabio Estevam wrote:

> > +  fsl,spi-cs-sck-delay: true

> > +  fsl,spi-sck-cs-delay: true

> Why does this have fsl properties? I figure they're taken from the dts,
> but spidev doesn't use them, right?

These are controlling signal timing and implemented by the SPI
controller rather than the device - they're the timing the device
requires.

--MQWp88KTWMKl52II
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcZM1IACgkQJNaLcl1U
h9Ba4wf+P6T6pEg4ojke9DbwV0LBF1GepvDpkM2yO4LgsY9E1L63FDv5Fic5I646
WkJvG0U+s8RnZlv36dsnkyHIkjBC5Ab8JyIjtSZER/PrBZTc4jIbRjUXrd4PVBZN
n0fEF9K8Xxi41vpfrbpjm1vKw7ng+RxuxreeSnxj8qwMs6WYm8CZvqtAR2/HrjEP
YZmX+eUzRkQRXYcOu6yB8MH6IoIkFYUPmOY7cMrVdvxOZLqXHVbYhVcItvgbmD+1
LJMZNrIJQY5U5yx4NqlF6Sx4RlotC3GhUcI9HQxsTe8TeHQpUtYygj5mKuIddXBJ
5dJm9GeXYrayl/iBYlzN9P9eAlR1hg==
=FlHQ
-----END PGP SIGNATURE-----

--MQWp88KTWMKl52II--

