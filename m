Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296F4606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uCJoq7An;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k+xcR2N7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EvBKZYbsyPjC/KbvTWeWl/x1jiG+4Pze5t2xnn/ZrCU=; b=uCJoq7AnsOCge383Ps4xScQA8D
	+Yzf/fR5k9X0k0EPRwwpDOlWXhUvoixydWk0XTQ7SVX6HjdCWgFjuDBUD3a3Piu51UvoByHQPnOci
	AZ3KZkoIZnTqP92RdDmOm/uUY5IyVzIq7m+OcdsVnAA7efm5BwIJxaScy7Fcl/QG1YyRxI4PLsUOk
	DNZcGrFnIKcm06m0mRIwNSgbON9fUJRneqeCEFhAteuBlBsAy5/PqEo8+7yazsPXMqk9pZ23/UMvg
	7wLAGPtt4zghHGLAUObAsrFERBBfeO00HjHXZaLfpxEZYFRI36HDn6C/iZOfu0iFWsG8h/9ZFVs6s
	PVbDfY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIe6-00000003L2g-3p6r;
	Tue, 03 Nov 2026 17:50:06 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIe4-00000003L2H-27ej
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:50:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso30140025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 09:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793728201; x=1794333001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EvBKZYbsyPjC/KbvTWeWl/x1jiG+4Pze5t2xnn/ZrCU=;
        b=k+xcR2N7bwIn93bzErfUmL8k3tSC6icFLzbQy5MgeyukWnS5JLWXG9BKSyXrUcafyA
         htJYWI3uDoe2kZmKOIhle6vnGKS07SdsCNc2FiXh6AauA0bSUIxB7c28nZH86kVKHtfb
         XaegBpANAgVYjihp4+nfaTdUZ5WgsTX9Jo5RyBDbshllJNn6eHq4moIQoIbVAG9R9px0
         XFjLIwWVdy7QVKIs06mzAVkxpFPK/9APkkQHYO6pvnNRlCaypeJt/UXl1Cdng1QU8Mmu
         E9ZDRE17aoUWnQ3KUoBU38YpWnvMNM42IiQXqaesOr9VM0C2wsaPJoP9b73/K/pESKvv
         y80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728201; x=1794333001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvBKZYbsyPjC/KbvTWeWl/x1jiG+4Pze5t2xnn/ZrCU=;
        b=m8o5iDFfbEirTv12V0Xaia7XwxvoGP8u6Lwry/2hDxT+VYej8IAdXqqmP5ZSaYWpeS
         /dd46JI7BEuQ0ICdvNgr0MHxw3vfZVP9YQ1bn8on+cTJrjC9ADGQyNYfkDF91xkUUHeP
         RFd54KPpLyx9CCaNDmbWsdesMngu1cxzya3UJ4w+lGThHQqX6sl9rzkdOlQk7teu8JoI
         0ts1G9I00EMmb/EItA2KffX/xveas+XxwAtoCZ0lFlRZVP+XUPOrWNTbpkHwMTZe2Kq9
         UyNo3J4XNyzecaTCIG+6hMFVtNeW/TuVhxsCI2Y3nmjXQbuBSObkE1tWSh3lOVeVYZm9
         Zk3w==
X-Forwarded-Encrypted: i=1; AKwUvBxJ777dPhltXJFHm53MEHmgc60TMPtdPpGGs9KaR3IFFJcqcO3ulCUR2urh8WWCF6H1fppbeN+JMrNMbFlvSRQU@lists.infradead.org
X-Gm-Message-State: APuU4Z+t0F297AwwXwSZ7djtSlVUIURd9L/2xk9UqfDe11AxAFlGbEs5
	ZzDla94ZlO0/PfGgqC+2F1+lrql4RbJpVJrbW70IH9XnXlKLxane1yaM5IftMG0/Opc=
X-Gm-Gg: AYBFou0WCLnVFyqr0Qek6F9NFBILjv6nNazuVk0E1P6k8eLyO7GCjx1PefaYkuV9Iis
	uJI+fBpEaSbNbUvkvkkaYfgEKhEr8lS7PehwjRUAb9i7BpJpQflFISjY95UdJOpxjG9gvzMkTcX
	/WVco0MJBKKUHyULfTmLoU1VmGTjvGieX4+AkLsSePmzlZVVNNoVoJ9/xf2CeOZpbeWPrpXpMqN
	4lfH4nR9Hl+myM3fFKV0+xV3ukBPPueVQFRsBuCOQ4uGYxh7zquowQoPSfz0gveL/roiwNaqGaf
	Z98CHQpFo0ZowgEHpA/K7TvwF8qg063U/wSIjClXwtuwiuOyMdqMa8SWMq3q2mc4wt+aJPo+nHf
	QlZ2rKqlIxuMmtFt9dU91fBW8Z7HVDCbtwAQGQu8nmg/FTWZHnYsaK/vEyETO1o+QEYxsdnK0hN
	JusKTO7itft7XVjbLABioEKvui+1rDfsxaI477SEezEZE3NxxVXIlnycLUSNejTr3Yu0swdFn3p
	rH9eKZMTqGLyPRFcmIMjKe+3UgKlVc2hoNhZXAbM8AbNiH3IY0XgHG1+nvCaWEhye/UG74PYUcL
	ivfoPrEHmkjxdvW5S8hNulct7KPCJtEZCEb5Bn9eWl3O0tiv7m83ZmFOJMbICum4dwi/vRzne17
	Zo/KKOFAhTokwtg==
X-Received: by 2002:a05:600c:674a:b0:4a1:fb23:68f0 with SMTP id 5b1f17b1804b1-4ac14ec788emr319488995e9.3.1793728201219;
        Tue, 03 Nov 2026 09:50:01 -0800 (PST)
Received: from localhost (p200300f65f19a9048e0e65dd41210f6d.dip0.t-ipconnect.de. [2003:f6:5f19:a904:8e0e:65dd:4121:f6d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e71b80333sm28497156f8f.32.2026.11.03.09.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:50:00 -0800 (PST)
Date: Tue, 3 Nov 2026 18:49:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <auod0uYPow76TEb8@monoceros>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
 <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
 <auoAZs66RA5OYjJo@p14s>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tqt42yzt45wmalce"
Content-Disposition: inline
In-Reply-To: <auoAZs66RA5OYjJo@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_095004_563151_649974D4 
X-CRM114-Status: GOOD (  21.83  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--tqt42yzt45wmalce
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
MIME-Version: 1.0

Hello Mathieu,

On Tue, Nov 03, 2026 at 09:40:22AM -0600, Mathieu Poirier wrote:
> On Tue, Oct 27, 2026 at 05:25:20PM +0100, Uwe Kleine-K=F6nig wrote:
> > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remot=
eproc/remoteproc_elf_loader.c
> > index da3cddbe7d4c..3c749a39e5da 100644
> > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > @@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, =
const struct firmware *fw)
> >  			break;
> >  		}
> > =20
> > -		/* grab the kernel address for this device address */
> > -		ptr =3D rproc_da_to_va(rproc, da, memsz, &is_iomem);
> > -		if (!ptr) {
> > -			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> > -				memsz);
> > -			ret =3D -EINVAL;
> > -			break;
> > -		}
> > +		if (rproc->ops->memcpy_tova) {
> > +			ret =3D rproc->ops->memcpy_tova(rproc, da, elf_data + offset, files=
z, memsz);
> > +			if (ret) {
> > +				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: =
%pe\n",
> > +					i, da, ERR_PTR(ret));
> > +				break;
> > +			}
>=20
> I really like your patch, but I'm wondering why you decided to move
> rproc_da_to_va() in ops->memcpy_tova().  Right now it is called in both p=
ath,
> i.e with and without ops->memcpy_tova().  Wouldn't it be better to
> unconditionally leave rproc_da_to_va() in rproc_elf_load_segments()?

The reason is that on ADI's SC846 the memory for the remote processor
isn't directly accessible by Linux. So there is no virtual address for
the given device address and thus the implementation of .memcpy_tova()
on that machine won't use rproc_da_to_va().=20

Best regards
Uwe

--tqt42yzt45wmalce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrqHsQACgkQj4D7WH0S
/k4sjAf/W9Wh/o2zfPqQyyyOgx0wwKDVNUCFZ3gnMmbmk4VZdCin6ZavZplg6T+x
coNDAgnxOftZnuWR1SpiFa6XCTmAE5ZxvNLbwzw6DF+G4Bq+z2ifELs9uZh/U0eo
HrJFd/MaHMCnZdw7Hr1emJPiegROrwq5psibMrjJItAbtrvyFUFKXQ+YKYY128Pi
8945jUEVVmAFRQ3nCV50qJW8+KPt36ZWnBRt8TjZHMMaHWuhLDuXsqUsCiYDkFnf
MeO9tFp+Aw2Nk78rkgmSg9kOauIt2+3ievOTOCN2haO43CYNx+In6f7GwLzSq2R2
Iffz8Diu7OmLg5+j4A7mG6jW7l/4RQ==
=MoF6
-----END PGP SIGNATURE-----

--tqt42yzt45wmalce--

