Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933A2C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bIM8RLVlw1dsQqh4JWYGpOGe9rxbWiKMJW8cR+r280=; b=nPdXWryLMduKvuEIageSVWFOPd
	CMKpbEzGfy+uDsBMmNw1hYN2Ow33NPFlEyS1mZ7ZI8dkW6ya9R/BKL8Uy2GoA8rC6YQ3xJeKEz9N3
	bOZpu9/B7SJLorEytln1RUiY6iMmLBn9zsa0uryy6clvWL6kD+hN51Js7hiYF5oyOKk0FNyF2B9rz
	ZQ9UdGQWNFHQIz0XWNNVSZzSnO/0HDJ0w0TyGa9Bd6bbCvyiw619nUqd4egcRBzLEXe5xV84XZaRU
	jyisQUtQXlgrni1OS0XpZQfae7MIvqRcT4Vf7uLNElLiaPxWoggBATDIsoscll5ji9lfu7pTL0PaI
	S9MG2uPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Ov-00000006CKY-3fMQ;
	Thu, 06 Feb 2025 11:50:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfznI-000000065RA-2dzq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 11:11:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E17B6A4414D;
	Thu,  6 Feb 2025 11:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D25BC4CEDD;
	Thu,  6 Feb 2025 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738840299;
	bh=7bIM8RLVlw1dsQqh4JWYGpOGe9rxbWiKMJW8cR+r280=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3cTc4+QQj43tJW4qadIWqSq/CetrqU7GdrAVX2t7ybE+0R/GtnfcwkZpw7W4YguG
	 TxtzXIQ7Txs54DLPx4ZjxkINoe1cCJaHwA+RvPBhOvItCnJ0KOQ45m2w758kcYDEna
	 lOc/Ukn2WY43hyZi3BoepR9P4tSGizd1esvwdp4jtESyO135aZX06cnbw71axtPYjB
	 3cb8BjsXnChQHPpR7PJao7RnQRwAIrE+x5rIrNkluOfYUjScnWpELBOgxdRlyx/7j5
	 U45okLwC0etITzcED/4P0dQNvu3zlIUrN+FRCCV51qGr/1HpmA1EW4jZp1PuJTGTBW
	 uS4FnTGyFBskg==
Date: Thu, 6 Feb 2025 12:11:36 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display
 driver
Message-ID: <20250206-sepia-fox-of-tempering-fa5741@houat>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-5-4e4ec979bbf2@gmail.com>
 <20250206-caped-premium-squid-595ecd@houat>
 <CAMT+MTQBSuWCz0T13RkhyJLwV7tuk4_BmVH6vACFOYx=msc09Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fz2wwsy7w6gdmkf4"
Content-Disposition: inline
In-Reply-To: <CAMT+MTQBSuWCz0T13RkhyJLwV7tuk4_BmVH6vACFOYx=msc09Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_031140_734572_E3499C97 
X-CRM114-Status: GOOD (  14.26  )
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


--fz2wwsy7w6gdmkf4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display
 driver
MIME-Version: 1.0

On Thu, Feb 06, 2025 at 10:24:43AM +0100, Sasha Finkelstein wrote:
> On Thu, 6 Feb 2025 at 10:17, Maxime Ripard <mripard@kernel.org> wrote:
> > Sorry to figure it out that late, but how do you plan on maintaining it?
> > Where will the patches go through, and who will you send PR to?
>=20
> Downstream development is done via the https://github.com/AsahiLinux/linu=
x/
> repo, then send patches to ml. Not sure if i want to send PR personally,
> it will probably go via one of the drm trees or via asahi-soc.

If it needs to go through a DRM tree (and it really really should), you
need to make a separate entry, with the drm-misc tree listed as the git
tree.

Maxime

--fz2wwsy7w6gdmkf4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6SY4AAKCRAnX84Zoj2+
ds7VAYDsP4HNpT0nP3IPTy+FPKUVmdQUC8cmAWNb+RF0p2FXzJMNyW6izpv9Bj+k
NG0MmjsBgNSO10rMGrhydZ6BDFHoFMS62ZM0AzBd06pQjkKOgyuZucjnkiwszs11
H9hYooAdmQ==
=kyPi
-----END PGP SIGNATURE-----

--fz2wwsy7w6gdmkf4--

