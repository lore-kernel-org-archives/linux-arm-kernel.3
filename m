Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E949D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l8TNVXIL;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BPsoGUR2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2TdFwSLld4QzeN4xCtR7SPOBFqA4szj65Dl45dXunEo=; b=l8TNVXILnCahLc8Ur81lTumrrr
	p/Z5jiyezDMtXn/5KJ27iW2iGRPfaf/kajatnpTg7dqbEbfl22/cKblwbwrknveH4RAhPoyGzWQJp
	v5p5To1hH7D7C10S5bUleuuwdEkpjv4lZ99RAoIN9DX70rE+anyMu1cZZAPBBlvQ25H7z/QIEj5fh
	r+CXl3VSpbskL7Qn0gzOkMc0OSeArxcQGi+A0H3+SZJmVkc2CddN8S5Cx/1GWpGswrYm0L4S691y1
	Mzf88PecBBVNdPthAGlMKRAYRtkcRC21Up0nbNeCHD5I9560IR7JL4NTW9qffiNMNMnYRHk5d5Gxn
	RfK2VmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkvo-0000000BZUR-1h08;
	Fri, 30 Oct 2026 11:38:00 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkvk-0000000BZTr-3KAO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:37:58 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c247f6687dcso96865466b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793360273; x=1793965073; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2TdFwSLld4QzeN4xCtR7SPOBFqA4szj65Dl45dXunEo=;
        b=BPsoGUR2tKOd9oblwfPInljQ2py7kEH0Z776xMkt76dHKGO7PQDq0Cytmb25S9hd7c
         pgUG4JSQZ9hhxo7encWcjUTAhUFTHaLOJTzxP/1tB/Os+KV8MqqjH0QK7UPEedU519EN
         6tiMy6svF4AgK750T5YOmGW8hy6jtx+2cbaYqq5dwNV/MHfyYuHMmpDhIAS2AWYy27bP
         A3O9yFlQZadBYdCHjmaH7GSQ7MckCKPMFl/xS9nZUPnQIl4kuZGLui9QZ3iJbk9I7Wgq
         05c1MVjZ+9IGYkojJtU6N92Xag7Xke+QnVGlqmpjmwIiSVqr740wNq9cT7QzQA8EoVA+
         v9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360273; x=1793965073;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TdFwSLld4QzeN4xCtR7SPOBFqA4szj65Dl45dXunEo=;
        b=AOPYqTb9HwQM4XD96yQN/kHht/v9u+DbiZLYwAzdavm1oBw0OgvvR9zHui4FuMYQOz
         eNty4XYrim/eV/ipQSstNDgy1cLMFRHQwYTWVFbZjksxzL5S7jPSZMZv7weK8zueM7qK
         JZrdaA1eoeHP7SGMqqnGEGfcOkIDCptnkRfV/huz3ttzepkTeNqG0EL9j0n+tn3I5iXi
         yC+CEW0Ccqrtme0teBVUUsbU/Z8gzUi6DVo+WMxMh13tAknOqi+umDYOAuT0TdXjDk4d
         3k2TDEWLJN7FvRdsZ4rHHsZXuAZr0nXR6OL2B5nUOsDxPLtp3uLGALgPVP8V91mLh33T
         pWeQ==
X-Forwarded-Encrypted: i=1; AKwUvByEIB5UFH/jAJEhRH04oNEAEruPlZ6HXd8w3o6n7EHYQwa9Bqwft0zxdaUAqDJMjWJxCGw60dv51/4sL1t6sHSF@lists.infradead.org
X-Gm-Message-State: AFq9FYKcE5Eszb2Y7zuGQNgYyjS+07nRZ/yaaY4bye9dVJFNvurjBrj6
	2ambDqIwmsbKy01wSXTzf3hfHh6+PqjzV7FAlgTeKBCyYXVvMFJpGIB3B7ZHhJXETZy70rtvfHW
	A1qRIEs8=
X-Gm-Gg: AYBFou2pnoZFS5V2JgIkSTDHCNc/2qpltjPhRY7Qt+aHnbXWp3NMzjKsL/e2GvRrEZL
	NNswTktnezOR9pFR80kC4sfSBHgd7HGboRu7DPp2+a2LdkuL/pU1dFNnjOY8Qav67wIA/mpmDBb
	i9peXxCbFmlBcYLvqUbPrxLgSUo/0wnbO9xQpvVESgG0aCeDKUuda10schZfQ8kKBXjzsIDDCHX
	Lj0+Z8g5Qo/yI1KuQS4h31s/XsWQ+HaPwVCHKiOYqC+nhG4OG25rXbA5EvA90z7h3Jzayeaw+7R
	IFC7kwlHFmpIHqWz8V2VnOaP1FBOqAefWRufgD48o+7a0/u+HWhZpQksMMD5lF44Ps+VVJrzyCQ
	jFHxaTTgrDTRcV9ryqbil1AF47KYMTGmTBdDrJ93Ih/owZZeyzcrtyKhZnLI5ZD3x7Lu2e0B8/X
	RdSd4xdqaIEB2n5NclApi7mMxfAAU6gdbMQVexZ0l1Ru3zC2baTTgM5ak4pU1Yx3TStyyyHpLx9
	2NM4DPgPBKwtQMwvpu853hO8UaIKR2IixUqx/FDzBqep3oIMsao1+NthrEn1gHfHKCB2rOmaUVX
	RS/7o9qaTwCo7OGsg4CBNsvQ2wOeb2OYaynilTj0cLYQ1qbXta0Bmg00/Akt2LBuuXC+GSIUGdg
	WybYHJZXu3qm8TDOIhW3Y/wNoryNHbJKJMCVPAqDPNDxNUQZbfVttcbg=
X-Received: by 2002:a17:907:80b:b0:c2d:be57:f73a with SMTP id a640c23a62f3a-c4ca7a072dcmr182967966b.13.1793360272617;
        Fri, 30 Oct 2026 04:37:52 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cb092c042sm27677566b.82.2026.10.30.04.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 04:37:52 -0700 (PDT)
Message-ID: <f7213045-4605-4655-9c88-ab3cafa0a80f@suse.com>
Date: Fri, 30 Oct 2026 12:37:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: paravirt: Mark steal_acc as __initdata
To: Thorsten Blum <blum@kernel.org>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: virtualization@lists.linux.dev, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261030111053.114812-3-blum@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20261030111053.114812-3-blum@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2BwsZTx69HSxgfco3oc0Wvi3"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_043756_882002_D84B777A 
X-CRM114-Status: GOOD (  10.73  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2BwsZTx69HSxgfco3oc0Wvi3
Content-Type: multipart/mixed; boundary="------------Nzr0UlVtZSKudWhbVnfiI9EU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Thorsten Blum <blum@kernel.org>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: virtualization@lists.linux.dev, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <f7213045-4605-4655-9c88-ab3cafa0a80f@suse.com>
Subject: Re: [PATCH] arm64: paravirt: Mark steal_acc as __initdata
References: <20261030111053.114812-3-blum@kernel.org>
In-Reply-To: <20261030111053.114812-3-blum@kernel.org>

--------------Nzr0UlVtZSKudWhbVnfiI9EU
Content-Type: multipart/mixed; boundary="------------02U2QW2VwF8f3BV2DKooFBr0"

--------------02U2QW2VwF8f3BV2DKooFBr0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMTAuMjYgMTI6MTAsIFRob3JzdGVuIEJsdW0gd3JvdGU6DQo+IHN0ZWFsX2FjYyBp
cyBvbmx5IHdyaXR0ZW4gYnkgcGFyc2Vfbm9fc3RlYWxhY2MoKSBhbmQgcmVhZCBieQ0KPiBw
dl90aW1lX2luaXQoKSwgYm90aCBvZiB3aGljaCBhcmUgX19pbml0IGZ1bmN0aW9ucy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFRob3JzdGVuIEJsdW0gPGJsdW1Aa2VybmVsLm9yZz4NCg0K
UmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVy
Z2VuDQo=
--------------02U2QW2VwF8f3BV2DKooFBr0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------02U2QW2VwF8f3BV2DKooFBr0--

--------------Nzr0UlVtZSKudWhbVnfiI9EU--

--------------2BwsZTx69HSxgfco3oc0Wvi3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrkgY8FAwAAAAAACgkQsN6d1ii/Ey8d
7gf/d0xlUYSFeFD5bOSurFsAT+L8A5rU1G79UcwL9ZErAMBMWOU/nYlpNzn6eqRIVUp9+l2gLi4f
xndbnOzCWlPF6xEEn835vmRb30jKyilOIgMzJIZ2LXe7DYRiUMvysU5GTI0mOJZ7nkQKZDvmuSCO
5QFcO8eMArtB/Bi3v3bpW6CqzxRoql7UAWKarMBJdLQrSz/okf5dIqy2uQMp/90mrzqR4ZdicmVn
9TSAAjdkWqf3GRB6Y84SaGUjgoJhL6R3xZnWAAKYk7XKHtWCe7AMLo6RU8H5zpbFwPrjHy2E5T5d
59GkECXL9V6MZPiEhIxD5LgVnE1CwHaKRdcje1XAtQ==
=WJpP
-----END PGP SIGNATURE-----

--------------2BwsZTx69HSxgfco3oc0Wvi3--

