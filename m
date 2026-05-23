Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1225FCD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 16:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51WmkaTpoQy7JTlSmGFOduVIA7YtA+KZBmfdwn/BfZs=; b=JPMhQPUHQyBIn6sGwLy3FTh2Q3
	lE6x+7F2bnFjecNz+14ZoLVbTZspdAzblwfAPjQxb3TSxrCn0xvS8ailJ0YZR+Le+nQlKXIqLAGzu
	Bg3tKq7ghSZuXGX9madiDZ1X6sFImW2hx5Sx62502ZtPd5TQlvCNrf69FMo/w2oiAslTONYRy7UMe
	Sb82VoQgS9cmSIfA58nsIgGq38wjRKCyuLW2YZwdRdPY8EsB+3GZiJ7hwAFKDOXL9+0EEWadtXc98
	r4VotmEQ6Pwo1aluN31xG/o6qlVboxZ8s4BYfO6gecvtVLQyccuHOMnQm87Zr+ff7CInJA5nKFp5X
	HDFgBc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQpfK-0000000DbjN-1oFc;
	Sat, 23 May 2026 16:57:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQpfH-0000000Dbik-1aAb;
	Sat, 23 May 2026 16:57:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id C89634453C;
	Sat, 23 May 2026 16:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E84C31F00A3E;
	Sat, 23 May 2026 16:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779555450;
	bh=51WmkaTpoQy7JTlSmGFOduVIA7YtA+KZBmfdwn/BfZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JzalX7S1OQFj5tROKOpmcYv//3t5uHJY0f0PEwfyfcr+sGJa3oLpl6D82PQWvMRYz
	 qs9EtzBslP7tPKKSvWVGe6c0LsCdxZ8ibiLTWPAnnNWpGi9znJb7C1kkEocHYB49Ux
	 0bC+HcIVQ/4dHCJ2KItUnB0KVKpF2RruPAQjkLF7TYWsJODyQtKjXqYE0zV4YGxuw8
	 j+DFSrUcBhju9rm6L6Lfy+ziu436v6uTuO5zvfgmuYOgDEGDqrm4xWqPwq4nzwi7LV
	 nQyxyof0/EQ53AlLVRctTwPjZDmhn7btwhS1afKSt+IJEpaQX8hHDPA7KgmRgcvy14
	 5Y0HtACXl1PKg==
Date: Sat, 23 May 2026 18:57:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Shiji Yang <yangshiji66@outlook.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] pwm: mediatek: fix mt7628 register offset and clock
 source
Message-ID: <ahHcHJNv49ASIshG@monoceros>
References: <OS7PR01MB1360282ADC135931ECCAD9AF6BC74A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
 <ac6OYRkiDt_OJVcp@monoceros>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7oykrngwmuffi3h4"
Content-Disposition: inline
In-Reply-To: <ac6OYRkiDt_OJVcp@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_095731_432254_4EFCB9D2 
X-CRM114-Status: GOOD (  14.40  )
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


--7oykrngwmuffi3h4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] pwm: mediatek: fix mt7628 register offset and clock
 source
MIME-Version: 1.0

hello,

On Thu, Apr 02, 2026 at 05:44:32PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Tue, Feb 24, 2026 at 04:51:00PM +0800, Shiji Yang wrote:
> > This patch series fixes support for mt7628.
>=20
> The series looks reasonable to me. It would be great to get some
> feedback from the Mediatek maintainers, though?!

I applied the two patches now without further feedback to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fixes

=2E Not sure yet if I send this branch to Linus before 7.1, but it will be
part of 7.2-rc1 for sure.

Best regards
Uwe

--7oykrngwmuffi3h4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoR3HQACgkQj4D7WH0S
/k68NAf+JYTK6hgKb3FaAZld7lR7pNXHtTQ4akG5pJ6JxE822aHEcUTeI56XneoG
cQDFIG2Hi1ToYH+GMeOXNYSNPNfMBQ4AlL1o40fdgb3ejbBWhYyNRw4sSUOQXRM7
ylidhcdkmUMfRNvHBz1wE0f9dQR4nr3FlD8HyegEKmGvim90J+8QEoWNsUh2XSwG
CFCm7ne9mEFZGoCZOqC8A0ndnhY+DHqfSL5+hoh6aGAIH/Bbu2OwtvdUiB1Q/1f4
xSGarP+7Nt5+Vbu8/nwvwPOKvOALq04d+hxYGaDr26FtThmHh+oBVd3yD8ZHBNLW
cE+RN/SiWGg3nJg1M49svWpJis2pyg==
=vHOi
-----END PGP SIGNATURE-----

--7oykrngwmuffi3h4--

