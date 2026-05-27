Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A38CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 07:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDN3dQE0pZCHm/EWjUiAZII+WWQDvvks2kEWRXa7SX8=; b=q+zJwgm61h8HN94WxnkInlMDHN
	i+lXjIdeJfScmCXbNpIoQ3weRW3Emq++W4Cj5ZRLVPVIo+MBo33g4c3M5pW2+BdLKKqAqqYo55+JA
	O5aZjy4TmxMMdv0e4KW6i8Hjkr0RrT6XUDOYezCVGcNBA4lF2nq5sMkJqUKP5xfHE0+7a5MGpFLzn
	MEGwS7MUAW+eLHSirQ7SOljHucHRXPwPkXu+ETzrPTmZsVFE3P6rFKbWVlublfbcDXckalaVgTi0Q
	BPA8W+XAbSFY6NyN22pRbCrv0v6vv5gI7CIvDziz+jpVeFvmyDpJnASbjmU2AP8ot/cqw6Fp+LSiN
	U8P2DWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS96r-00000003V3K-0vA4;
	Wed, 27 May 2026 07:55:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS96q-00000003V2n-1WAc;
	Wed, 27 May 2026 07:55:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 9A0F3600AB;
	Wed, 27 May 2026 07:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BF5EA1F000E9;
	Wed, 27 May 2026 07:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779868523;
	bh=zDN3dQE0pZCHm/EWjUiAZII+WWQDvvks2kEWRXa7SX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UNUWQFCmi5dD4PUWIDlyhsoLTrAw7u+EKnCD83Dl+FeOFH21yTR9qoQlpzrn0/Asg
	 6wl8Q6DA44YlPXZSP+ETUeUeheClz+nXVCCl7KjTpq56EwcM7loZnLuI38m2pxQXMj
	 YrRey8SH8BzJndKiuWTn4biBT6Pjl76uuNSDFZ96ohRRa1CeYvbe7I8r2wqcpKVhmu
	 JvffroaCsnKqINBkmXgbdooRNXVnDveZE0T/b7W4RaWPZSgfG0NVd2Zq92xgKHkywN
	 8sUmQ3MDSorxiyemIS30cwyTZNsG1umaNJ77bc+GBttpjmZntE0XacWoYYx1ebJ9iu
	 FJWRKHV/WOIxA==
Date: Wed, 27 May 2026 09:55:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, linux-pwm@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v3 0/3] Add RP1 PWM controller support
Message-ID: <ahajNRmYNa5SNQnS@monoceros>
References: <cover.1776932336.git.andrea.porta@suse.com>
 <af2bsEdAhYY9c4rb@apocalypse>
 <394b5e02-1aa6-4efe-a5f7-4468d1f82172@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="euzjwg2lalycyeq4"
Content-Disposition: inline
In-Reply-To: <394b5e02-1aa6-4efe-a5f7-4468d1f82172@broadcom.com>
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


--euzjwg2lalycyeq4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 0/3] Add RP1 PWM controller support
MIME-Version: 1.0

Hello,

On Wed, May 20, 2026 at 04:31:42PM -0700, Florian Fainelli wrote:
> I would prefer to take the DTS changes through the Broadcom ARM SoC tree to
> minimize conflicts on my end, are you going to take the PWM patches for 7.2?

I didn't find the time yet to look in detail, but skimming
https://sashiko.dev/#/patchset/cover.1776932336.git.andrea.porta%40suse.com
suggests that there is still something to do for Andrea.

Best regards
Uwe

--euzjwg2lalycyeq4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoWo2QACgkQj4D7WH0S
/k72hwf/eJOLdTqx9awA8YMjMpmRLgfAPn2nkdaDbwV6esNNZT0ofvsM+CvjBPXh
pJjAAuufZwcSsQjEEd6kB41yTDhIBsR8ZLves3J7ocg1SwKGdmVucyKw9mnCR2ce
AWsrfAD0AZLrdlxEG1L5N0d95SUPLlFMSJcr9kyol3NsL4i3oerEsMhJC1mkhq8Y
NZRB86OK1cnc70jWKEUjGvfuHP+G9rn0gOuax2znEwcVxq4Hytm/HCsHoheP119q
Cq9GRHBRvmt5fl4BsgFxTcpTSOce1quz54tJh2ln0cGEorxO02RfVXipYGXel5xv
WMPklMj+QVkPq6qK3uqLvmcVkRkZAQ==
=4Fzh
-----END PGP SIGNATURE-----

--euzjwg2lalycyeq4--

