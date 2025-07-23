Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A062C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfi+7jzS+QroB9ovq5xCDmfLCYDKNlqIdXI2M9FMRkQ=; b=PFt+rxiWRccUS/os1bSmOLGRZE
	6p0kSfAVBbYwTqxamzojPVFB4D4SeU1vZdvmQEJj7OhEX3lUfeZFrjm2BuID1TYpHWKrmSyPLMgio
	wZRdZnFs1sIiT5OuCyZGuNe4z5j9YoWPM7/yDf3q6mlHsVNsBrtCGI44egKUpz3UYj18d0MtNOO5L
	YnQYPP8z+NBQNfxlYgj+CTNZE6jUQtidsdGQawKJARW/mSO/DXQ/OHEUmvDRg2507nicchiT9vIgK
	fAUUIp3WOgzyp7G2/6Agj6YXlgiG2CtpB/GgNIX6QHDfCVCT+BcCxWQgoW6DG1dZhUOt+C1cytwWC
	n8f+2+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVwv-00000004XCd-2cAk;
	Wed, 23 Jul 2025 09:39:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVLc-00000004Rv8-2Du1;
	Wed, 23 Jul 2025 09:01:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-456108bf94bso45465795e9.0;
        Wed, 23 Jul 2025 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753261271; x=1753866071; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfi+7jzS+QroB9ovq5xCDmfLCYDKNlqIdXI2M9FMRkQ=;
        b=AolbBUsb40mX2cJsj5VgF1DNHt5BvNaL64qWToY94ikZdJri4sduccw4h6QbwqhJHL
         oZMV8p8U/AW5KbDKq2VOxWSCoaN8V7qgO1ikj38jT7Vhpqpjum1ra0Z98qq4m/aaE8d7
         M0o0lX0hlxYJ+9oPUAJMU7te9orihBLCpsmyZXFLlBm5fl4ulIvAlS8MCZ5T20teLWOR
         pCVD24tc5XBO3ztzXtoJyg9TNpdM+ScKlsKmgKcT0D3h1HSDJKGSbVepDyUkhARrUF8W
         VhE22sC8SayjGdk+JC2kCCD7SgH4IWi8kEHJ5syJqZldwA0qGwLq3N4zu5Pd955i2r7L
         mX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753261271; x=1753866071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfi+7jzS+QroB9ovq5xCDmfLCYDKNlqIdXI2M9FMRkQ=;
        b=lYItXBArugPolO8ypiHgN1LQIFusqgpXKp9Sbay8sceH8XYGbntpw1xHX+4XsfiYJs
         sFH/qI95lnDasc55S/VsOMJGjrC6GOBnvgsQNevhFmFBNXuzrifutZohhqftuLSqJlWK
         76s7qqG8d2wJefJKDqHDQkPi4e4rOCvDas28iLgXS2vE52hnuwi2KoTkTA6tpvTTfnkB
         RtAA+6hTtlcLbvVZuqC/Tht8UeuMe+ZpNmNmJQU/taWk3X6+R+YsJjb9j06fr4DfO680
         huCzPkDWPvP7BPyOe7d0wWkb1pzQq/XJXs/JqbUCzONFUEfqIuDWHZ/NKycd9nSAPdcK
         j0xQ==
X-Forwarded-Encrypted: i=1; AJvYcCURtO3cAks9apBTQwMFgm78PQZMXchqRIpkbRpC7CNdmPrm0I8b9ci7AYHfE14TPclT1YJqYSe8FQwzVkOBS5Ok@lists.infradead.org, AJvYcCWxWDWlRTjYZR4r4izLeVSaLRZgd/Wd6knO5eT/Uk5+butJcIGKpxx+hdYlygIsQ+iHIT81xOiJ9kGNZPY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZdDFjx6CK8BqmefK9qlpXj8fX36c6TAjyEjxN5A2wwNXrXxIK
	pm+x0yB9e+wfAAcKM2fqxR8cf+1rOcmI1lQn9FF3K/IdnnKeQkLy3Rr0
X-Gm-Gg: ASbGnctZZ8fHjdmQmZfxSS5BthUBsRf65poGAQym9sREX+xk+WvU2/UhiV+Av4es6X8
	u2aRy5RAnlLC1erhbv5q26f1xAoaNV1o41X/7JJBHchLCSi45Vql1RW7s3gUtU1oQ8gcffC07e1
	yVleecv0DcoF7cYsi+XUtSQ39HY7HDLPdqC+g/o/QloMmQzCrT5NRKWhTFdnPT/v7j6j6QxZcCp
	09qYrv8QaPzGm/lCmV7pNZonNvCUsGs2VG5UOgdApJ9D6lsZ8C26QlqYHkmOQ1HEtE1+oxunoGX
	8rf/ZAapCBnK4khuUgi1yJooh4cSiMvhhb/LIxhLlk6BD2YZ/AJffc9g0u7uH1xhJ9UEBTIvLQQ
	uZi8FLOcO5e1kFGfz8S2YLUMUclFltrBUNyX8f5wtW2Cx1CZbZ0JMisVrCwrl5s+ePtDoafPzbS
	0KIKbu7vnh
X-Google-Smtp-Source: AGHT+IEknrstHg6cUD/SgoHhNho7BNCTRJA/GS5vJOJzPvYI6zayldv/5uJL7C58FRXa6VpYJz8Fmg==
X-Received: by 2002:a05:600c:8b08:b0:456:1b93:76b with SMTP id 5b1f17b1804b1-45868c79052mr16967605e9.4.1753261270574;
        Wed, 23 Jul 2025 02:01:10 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca25533sm15448303f8f.11.2025.07.23.02.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:01:09 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:01:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <awvdox3bgabbc42aamezlg33k4cje6y75qoxn7ruh3nhd4qv5n@u3spdahehad4>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh>
 <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
 <2025071919-patience-cattishly-cf7c@gregkh>
 <l54i36uk33je744w4f47tehdopk5dsjotvozfv5b2hehmxrwpq@eins7awyq4dy>
 <2025072218-decipher-spree-327d@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t3b24mrvydogtoje"
Content-Disposition: inline
In-Reply-To: <2025072218-decipher-spree-327d@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_020112_571627_B04FC3B0 
X-CRM114-Status: GOOD (  28.44  )
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


--t3b24mrvydogtoje
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Tue, Jul 22, 2025 at 04:08:09PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jul 22, 2025 at 03:56:40PM +0200, Thierry Reding wrote:
> > On Sat, Jul 19, 2025 at 08:52:41AM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Jul 18, 2025 at 03:49:37PM +0200, Thierry Reding wrote:
> > > > On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrote:
> > > > > On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> > [...]
> > > > 	struct syscore;
> > > >=20
> > > > 	struct syscore_ops {
> > > > 		int (*suspend)(struct syscore *syscore);
> > > > 		void (*resume)(struct syscore *syscore);
> > > > 		void (*shutdown)(struct syscore *syscore);
> > > > 	};
> > > >=20
> > > > 	struct syscore {
> > > > 		const struct syscore_ops *ops;
> > > > 		struct list_head node;
> > > > 	};
> > > >=20
> > > > Is that what you had in mind?
> > >=20
> > > I missed the list_head, so yes, this would be better, but don't pass
> > > back the syscore structure, how about just a void * instead, making t=
he
> > > whole container_of() stuff go away?
> >=20
> > Yeah, that's a possibility. I personally don't like passing the void *
> > around because it's easier to make mistakes that way. I also find it
> > unintuitive because it doesn't immediately show you what the functions
> > expect.
> >=20
> > My understanding is that the container_of() should get optimized away
> > most of the time, so there aren't any obvious downsides that I can see.
>=20
> container_of() is just pointer math, but a cast is even faster :)
>=20
> > But I don't feel very strongly, so if you have a strong preference for
> > void pointers, I can do that.
>=20
> That's what you really want to have here, it's a syscore data type
> thing, that the callback wants to reference.  Just like a irqrequest_t
> function passes back a void * that the handler "knows" how to deal with
> properly.

IRQ handlers are different, though, because you pass the void * data
when you register the interrupt. That void * then gets stored and passed
to the handler when the interrupt is processed.

We'd have to change it to something like this:

	struct syscore_ops {
		/* parameters now changed to driver-specific data */
		int (*suspend)(void *data);
		void (*resume)(void *data);
		void (*shutdown)(void *data);
	};

	struct syscore {
		const struct syscore_ops *ops;
		struct list_head node;
		/* NEW driver-specific data */
		void *data;
	};

It ends up increasing the syscore structure's size, about 33%, though
given that there aren't a lot of these that's probably negligible.

What I think is a bit more unnatural about it in this case is that we
embed the struct syscore into some driver-private data anyway so that
it becomes per instance, and then we have a circular reference:

	foo->syscore.ops =3D &foo_syscore_ops;
	foo->syscore.data =3D foo;

Which looks kind of weird. Alternatively I suppose we could completely
rework it and make register_syscore_ops() allocate struct syscore, and
hide the internals from drivers completely:

	err =3D register_syscore(&foo_syscore_ops, foo);

With that it may be problematic that register_syscore() can now fail.

Thierry

--t3b24mrvydogtoje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiApM8ACgkQ3SOs138+
s6G76RAAlyjbBOBTf8eNokhrwb69GbuFv4iEunTnd/Xy91IhOncqHjdYHN3rqTn9
GZWy+L9VFYLaEmLV5W1ChOD3rYHCxZ3gep+jdE5ThLQvJaK4IBB4oGZ0OGXLHmVy
TqNy+Tq/dQi2jM2o7MW1DUDM8EunrbLmjBWZZONJzH18GqJPn3LWazuC7tBBL6vu
bmowzEXxm+4NWx5Ow3IvFnLzDa05JLaBKtVREPuf/UdRHcjzrra1RyYLyaYUI9Gy
pWZHkgUA+1gAO2hutK8eyL98cZlnl8zrArmduJZsyZQhcNe1ltwPTzUq9wejYOr+
Vywgy/CxznLtvKd0e27hP/I7zCx64ktofCb6l0SwueraLWYTcpJLQ23T93g1bDwY
02o6cq0874YQdndJytU7t3cKETe5uXF0AGmepX/+GKvcQN6lBqo04OL+Ge6yRMyy
G9gv6P2nxqY+RWkDrFtqO6RwFB+lJSwc2J3RfxHC/2ygMy2Zr2AJ5oeeAKOtTZ/0
smpK40Y2FB6y4ohGq3UK3uPyBvOJi/jw6sMuRyv2Ou7tJIFE2EtSpA5+m5DcwUcR
gRcfO6O0V9Y6qWBx2Tt+i6Fzekj/0xBzlQdyvCom8xrhRZ9VGbZBfpIaXDs/Anp6
ovlk/rkbo8DsYQQxINnmSBx2uQcWSCYAU53leg5fnr4EoSGPCsg=
=l8CI
-----END PGP SIGNATURE-----

--t3b24mrvydogtoje--

