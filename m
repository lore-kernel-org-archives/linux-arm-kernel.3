Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C17D60A2607
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rR5GIgB8;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pp0Y4E9n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KCQH9pBfu/03JDVFZw+VQK2tSFgTeFnNL5J25b5rmB8=; b=rR5GIgB8VgKCFGqamDE668toEB
	JR/1PzitqJkdS7bgcFa+LFdfKVhoWtSyBQ4o9HT51ZGPHlELl+rwCrMZvZg78Lsg1PUyi5flvDxuO
	65RActrvHgzC7RwmkiUT4f9MCgbjTZpM7IaVTV8rxS+VMp/KkKmCGnBGEtxqOFrPaLBgYTe60iadh
	XeYen1+AoLqzpWz2XIE2zAqEvqtFkG3L+bfW0+1kaPeEK1E1Q8+eQpF5QvheqQoSmUy37Atkh4oTx
	4CCLwoQaIP16Y8mUggCA7cTdKtm6mUGcUEdhTTJbFgxIJQvIQnRhFQEjDJADmOE2cBLDhG7SOQbBH
	RdYOwARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEvN-00000002dum-1lle;
	Tue, 03 Nov 2026 13:51:41 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEvJ-00000002dtD-0kJV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:51:40 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-91befe703c4so40269536d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793713896; x=1794318696; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KCQH9pBfu/03JDVFZw+VQK2tSFgTeFnNL5J25b5rmB8=;
        b=Pp0Y4E9nOvz4NhQkHVKpkT40acqFfVV+58xeuXDHU+FydJLXLKDFx6j26RG2PHgD17
         t/ac1iI7Wv1J0Mle+J+LBnKLxVWBhoBQU9JY9dIWV1O7iNtFf0+Zt/OKhuP4arNkKoQD
         FG/xx8K9waZdRoB6MyltmWZw2LTR5w4uLrfSkbYFZ4bUqgAc6NQGd4HYtYWS9SYA+y9P
         I1onRA5Xho5r6LtQDn6ObpD+pddOgPDHVBJyJ5eZqD4WBWtkgQfc2g7narhvpqbT39xJ
         rbfbfGiLsrVuKJKYtnFfU7mFEbeZ0l6yawNzhACoHPr8A1tBBZ4ghEHGpJRO3skAue9M
         9jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713896; x=1794318696;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCQH9pBfu/03JDVFZw+VQK2tSFgTeFnNL5J25b5rmB8=;
        b=bkfFi5jcjqE1xgWwqDZpQm39kPdj0WZo8318qKLdPaf4qP4pKpdl+coybvECsHjBWD
         KFuLi259jGN6zz4w+lvkHnUcWKCXOiyHIA4njDWO4NGtyJR4cWKN09qJXR2C8iOzUXGE
         sTO1MxQI5QFK31Fbv+Ug56thOFNgY3/QgoZnyI0nSU7UKRqjoyLQfKJtiLUWZZiRpvIK
         l4EHP910bea9OxOaPSIrPF2xHoVwBezM+2RGpwNCuTI4V4f7qb2ZpyR000/+LIkfc3/y
         cH9f7WzRQY7A6YDuZNkG347cDfvOe5SsnHdhbtgisehc9i+942JviZ8lwqE0HoRU1JkL
         qJFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOvw53XGDBLKxhVx5THcNB2DmK3Ev76BdZbTEiVDnwYWE3axH99bGZuvDHndiRW3AKEvgz61CTz7CKocAOUfH+@lists.infradead.org
X-Gm-Message-State: APuU4Z8WA28FVXHT68XLSGODjOmFxLUe0z/FknXz0B508YiaadD8Yoxk
	cg5VSTAIKv6fCQwAwSeWVHAYCk/BXXCLCud4hEvHVCzpb2p3kXGycCq0N4y400tTzzA=
X-Gm-Gg: AYBFou3V1Wu17syRSwVDWg4Av8gScsmTtDga8841TPqcEOOwVW7Vce7Gb0jmXIMgypf
	L2EZtottO4D+c8VLvB1ePw//nAXXNcpoVZWJ7W2l7xXpLXAwGE681+ujtYn9n1b3+zKDdmx8Nsx
	uQj2zz7+06uoKPB/KSPv831AMUzcfed8Gad5n6FnHZZneSGzqS3DinLYHb4NhkLdPlM2F9726P3
	3/HYOi9XxXGN+Wck8KojchMtvREvxBOiNr+ssl2gVDVSTot4wqHQHulyZeHijo7IDeICEnYqLW9
	nxLtQFVTH1ELny5aoasQUVKsquxYLusbUGqEUexQRkgtGnpjm5BSJJss/MoI/sRqeA1xF6sKOUw
	oZKW1lccsEMt8gfC63EopfQZW2edaKUPTi/dZZZ0EOFgquhdsRj0IrZHCxGcaJQW5N2rHd0rlJd
	WLn4Tonqp79pGs8h7p6+oPypFROg2TSy31mfjtZY7qf+1S4VIkODlOl77V84TIdJW+cjHk8f+ev
	UUybIeHPVGrP1TV0l4kckozmf6PNn8O6WVa+G11pOyU2J5LErrZkEZtmwPQEfQReGK2FO/u3Pr2
	rI/WwUZ9aNK1iBNhM5oA0+QY12hSGxXOU+pe1EyHTvXlTtC13tyGxNo=
X-Received: by 2002:a05:6214:c67:b0:91c:914c:8a5 with SMTP id 6a1803df08f44-91ca4bae657mr223491536d6.36.1793713895531;
        Tue, 03 Nov 2026 05:51:35 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7376f703sm8113986d6.16.2026.11.03.05.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:34 -0800 (PST)
Message-ID: <3478043661b8d89ba5089f56383926785570b7b3.camel@ndufresne.ca>
Subject: Re: [PATCH 02/16] media: v4l2-device: Add struct v4l2_device.flags
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,  Daniel Scally
 <dan.scally@ideasonboard.com>, Tomasz Figa <tfiga@chromium.org>, Marek
 Szyprowski	 <m.szyprowski@samsung.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Dafna Hirschfeld <dafna@fastmail.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Heiko Stuebner	
 <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 03 Nov 2026 08:51:33 -0500
In-Reply-To: <25952c4c-36db-4361-9ab6-0ca1b1f960bf@oss.qualcomm.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
	 <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
	 <25952c4c-36db-4361-9ab6-0ca1b1f960bf@oss.qualcomm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-76jfQUMM/m0hKvtz6q36"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_055137_564980_3E6DC331 
X-CRM114-Status: GOOD (  28.93  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-76jfQUMM/m0hKvtz6q36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 novembre 2026 =C3=A0 10:09 +0200, Gjorgji Rosikopulos (Consulta=
nt) a
=C3=A9crit=C2=A0:
> Hi Daniel,
>=20
> On 11/3/2026 9:40 AM, Daniel Scally wrote:
> > Add a flags field to struct v4l2_device, along with a single flag
> > value that is designed to tell v4l2-async in which direction data
> > flows for this v4l2 device so that it knows how to set up device
> > links between subdevices connected using the async APIs.
> >=20
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> >  include/media/v4l2-device.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
> > index 25f69b1b8db03d077f7570471d5c6910fcafe110..9b17916d63641ba637cf8c3=
7aa925749bd4e2134 100644
> > --- a/include/media/v4l2-device.h
> > +++ b/include/media/v4l2-device.h
> > @@ -15,6 +15,9 @@
> > =20
> >  struct v4l2_ctrl_handler;
> > =20
> > +/* Set this flag if this V4L2 device is an "output" rather than an "in=
put". */
> > +#define V4L2_DEVICE_FL_IS_OUTPUT			BIT(0)
>=20
> Just for the clarification do we change the meaning of output->capture to=
 input->output?
> I know that output is confusing for everyone including me but somehow i g=
et used to it.
> However to clarify what this means will be helpful :-)

I agree this is confusing. To avoid all the legacy, we could use PRODUCER /
CONSUMER, or does anyone has a better idea?

Nicolas

>=20
> ~Gjorgji
>=20
> > +
> >  /**
> >   * struct v4l2_device - main struct to for V4L2 device drivers
> >   *
> > @@ -30,6 +33,9 @@ struct v4l2_ctrl_handler;
> >   * @ref: Keep track of the references to this struct.
> >   * @release: Release function that is called when the ref count
> >   *	goes to 0.
> > + * @flags: device flags. Can be:
> > + *   %V4L2_DEVICE_FL_IS_OUTPUT - Set this flag if this V4L2 device is =
an
> > + *   "output" rather than an "input"
> >   *
> >   * Each instance of a V4L2 device should create the v4l2_device struct=
,
> >   * either stand-alone or embedded in a larger struct.
> > @@ -54,6 +60,7 @@ struct v4l2_device {
> >  	struct v4l2_prio_state prio;
> >  	struct kref ref;
> >  	void (*release)(struct v4l2_device *v4l2_dev);
> > +	u32 flags;
> >  };
> > =20
> >  /**
> >=20
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

--=-76jfQUMM/m0hKvtz6q36
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaunm5QAKCRDZQZRRKWBy
9O0hAP0dfaZa5N9pPcTMgeBjbwcAE6/VonHJ3BzLUQ1GAOGwGAEA/GCL+sGEcnnV
KMm1Iw/XizTAFH2FDtOYSIYlMgS6OgE=
=/H6A
-----END PGP SIGNATURE-----

--=-76jfQUMM/m0hKvtz6q36--

