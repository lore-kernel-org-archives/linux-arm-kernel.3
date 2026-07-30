Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0396C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfpnUPF7TlTq7vSAp+ZqT2dgaYktImF1Phgue3yKrAI=; b=eXWV9eZ/+pmq5LWUsqKGIujYrh
	dBN39Qz1rRieV7xeWhwXGKv3NRJA6+l1Mgsk0gOB5s+Khh5/VtLKtjJtUlKHAI0Gwj+cl00ZCF06T
	E3bfKbY7ODIy7semVEfKpgmzK0eDcNWwWleTcyeI3nHqIJfFioZG55jI1bKFCy6+EKSwiqwM8XFC/
	YPYZQ0vUuncgiJeOZ8h2x3XzrPl1jwtLxCWKrN1iUcni7/0u/L+5M436wKrydhxYhX92auxCpaDnp
	QmBuf3HuV+v8saa2qRw48uT7Zcg0SZlRl7Cl93QryjZNp2HNgEcKZiWu8n2rULTMkOOlkMfsUu5lK
	eMW3caSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpToK-0000000B1cP-2TsG;
	Thu, 30 Jul 2026 16:40:44 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpToI-0000000B1bn-1PAs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:40:43 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-81ed2a06b9eso118707b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429639; x=1786034439; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YfpnUPF7TlTq7vSAp+ZqT2dgaYktImF1Phgue3yKrAI=;
        b=D+npjbhTHK5psMt3UFcxaOIVfYAUu/zw73EoWv9nurm8gskliaxay8EZIcuCwqbgAL
         Qn8f4Fafe8HGu+0KzbDeointLziBlSw6qcW7T7cflQ7HYWRLP5PnzPm3MdAFlBaa0bec
         9Eb7ICczdB2NReKgxorKzXVNIEt+Se9tjeO1jAlkqGHvimuliRERPGM7SrDf9TXnqRN7
         iZBHFUfavSuhVa15iv1dKiDRFgJSQbqloxr0TxNJZeO29qJw811uAPYZ8GGhsqrdhy1k
         FlUej/ragnHQcAsUPsTiGllFKGHvKxPJP7UDdom39GycrRzp0H9PRbu61zjnsZ2+wLfE
         KTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429639; x=1786034439;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfpnUPF7TlTq7vSAp+ZqT2dgaYktImF1Phgue3yKrAI=;
        b=bI1w7z/IG76a8wWcVBCjIlxLKcJ7+pJG7ErK0LpWyCbwAszkm//qHqSVfT44HYj+TK
         ULTUHzYK9kcyRAl4ZfRw3sjUIT0FgusCgdLD+TeAxLbwrkXuhTic2qlzBG6aEm0y4oQM
         Qwmg4COPpGStaV9p/cK1p1N36KWcoQpBVzJkoftDwtkOPua2bTUCG47Nhi2d+dgd4w4r
         yQyorVfsN7BlMWIpwMCMG45HDYmFdbh8Ik4T+LPwxs0yiiQ1/BIq/9Fy9eSy4lsxmTKH
         iOUGxisMREM1t61JiGwSfRFdWSuBm/e5qzFMfBz9c8iugpFahij4jxpdpmUeoOKlHy5b
         7tKw==
X-Forwarded-Encrypted: i=1; AHgh+Rpj69/LTn2+oRpzwLs4w91+lx8/M/80A3P2VTLLex8yzmkTQ2uKvVEkG33uZx1tzdI0Rry79KLzMJhMBBbA9kXf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0kV+wOwRTZyTRnFSUc4N1UFdFG0iVxi6JBr5SIduoSijZSALV
	jECzfg7u/SIwcsZf8kN6liSPdOYr8F2VJgdBthhms0qBn1wH2WAEuBzV
X-Gm-Gg: AR+sD12NZ1Ep7RPEur29AjIQ09PQkRBnZ9ks/LrxAHIFL95xQCOMr/gqV4+9218dasf
	AJR3OmCrVtd3NBD7OHMjLDuF/4VgCO0sO5EAOMkxG4nPmHWqcNiAq1j1l5UyKbJe1H2GIDLkORo
	3sL0IWSM7X2ogN9dSvjDIJUPgEbfJLLZgdtCHpjToS5hPHl4urWdQM1MfOgjRbuWondoi8b5NhK
	+UlwPsvWR/1KDUJTbptrlWqlB8D4GMyfE2wLQNMnWd5QA+AaZYYKrRFnMIx+NKIWSIPlOws9sH8
	DNOu+h3LWVDbB08AZpxK1ArGQDqXnoY/mP2cjWdgBPqjo2DaBNd/p1F18r+JXyLK+B6FS7oj4dl
	ZH2QdkGrZYsGm8xeu8PBevRZOSHGSVYdj7cjq9n5tzbouGSDymUVTAkrH68n1s7pmNfTgInH4/F
	9grB1EeU1QEYMve6gQWaNMqOvYlqx1lzHSXiIoD3zd7wMaZYbiOUumTiOGKy1OM+c=
X-Received: by 2002:a05:690c:6307:b0:80b:bc16:8a2a with SMTP id 00721157ae682-81fb8a61e5dmr22019597b3.36.1785429638853;
        Thu, 30 Jul 2026 09:40:38 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8a8dc3asm13141507b3.25.2026.07.30.09.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:40:37 -0700 (PDT)
Message-ID: <38162447-df7e-4fbc-b438-b48181d10186@gmail.com>
Date: Thu, 30 Jul 2026 12:40:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Remove driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Eric Biggers <ebiggers@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh> <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh> <20260724155144.GA2032@sol>
 <20260728152241.GA4281@quark>
 <15904301-fd03-45e5-b909-dfce52449726@kernel.org> <20260729145520.GA1702@sol>
 <50d9d0e4-28c9-42b6-8b71-e75682b4959c@oss.qualcomm.com>
 <20260729171850.GA4454@quark>
 <a5e953b8-89fb-4f65-a299-37352d9f6fa8@oss.qualcomm.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <a5e953b8-89fb-4f65-a299-37352d9f6fa8@oss.qualcomm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t0ihQmACXOEWelq02XhLBP1h"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_094042_403241_F88FD5CA 
X-CRM114-Status: GOOD (  19.25  )
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------t0ihQmACXOEWelq02XhLBP1h
Content-Type: multipart/mixed; boundary="------------2XlfptUy3V5rxBrmNjBlQbIv";
 protected-headers="v1"; hp="clear"
Message-ID: <38162447-df7e-4fbc-b438-b48181d10186@gmail.com>
Date: Thu, 30 Jul 2026 12:40:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Remove driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Eric Biggers <ebiggers@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh> <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh> <20260724155144.GA2032@sol>
 <20260728152241.GA4281@quark>
 <15904301-fd03-45e5-b909-dfce52449726@kernel.org> <20260729145520.GA1702@sol>
 <50d9d0e4-28c9-42b6-8b71-e75682b4959c@oss.qualcomm.com>
 <20260729171850.GA4454@quark>
 <a5e953b8-89fb-4f65-a299-37352d9f6fa8@oss.qualcomm.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <a5e953b8-89fb-4f65-a299-37352d9f6fa8@oss.qualcomm.com>

--------------2XlfptUy3V5rxBrmNjBlQbIv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7/30/26 07:15, Konrad Dybcio wrote:
> On 7/29/26 7:18 PM, Eric Biggers wrote:
>> On Wed, Jul 29, 2026 at 06:55:20PM +0200, Konrad Dybcio wrote:
>>>>> Unfortunately removing it drains way more battery, because the buse=
s
>>>>> never hit sync_state and are kept at their maximum frequencies:
>>>>>
>>>>> [   18.021823] qnoc-glymur interconnect-1: sync_state() pending due=
 to 1dfa000.crypto
>>>>> [   18.029605] qnoc-glymur 16e0000.interconnect: sync_state() pendi=
ng due to 1dfa000.crypto
>>>>>
>>>>> (it transiently also pins DRAM and friends to max-freq which absolu=
tely
>>>>> kills battery life)
>>>>
>>>> Isn't that easily fixable by marking the node as "disabled" in the
>>>> device tree, or even just deleting it entirely?
>>>
>>> Avoided? Yes. Fixed? No. The DT is valid but Linux can't deal with it=

>>> [since the driver is gone]
>>
>> If needed we can keep a stub driver that just disables power and doesn=
't
>> register anything with the crypto API.  I can send a patch that does
>> that.
>=20
> I believe we (are going to) need something like that in the kernel
> for similar cases, however I'd rather see this driver kept/reinstated
> for the reasons Bartosz is arguing

What about removing all of the code that actually does cryptography?
The problem isn't that the driver can't be fixed, but that:

1. It requires additional maintenance, and not just by the driver
   maintainer.

2. Even if the driver never needed maintenance, the QCE is so slow,
   and the driver overhead so great, that the features currently
   exposed by the driver should never be used.

As Eric pointed out, the future use-cases Bartosz mentions should be
implemented by a driver that isn't in drivers/crypto.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------2XlfptUy3V5rxBrmNjBlQbIv--

--------------t0ihQmACXOEWelq02XhLBP1h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmprfoAACgkQszaHOrMp
8lMBZQ/9H6ZnMZ4uJsLXk8rgQwcjpwkvE2geQEnARvBDB6Iqj12QyxW9XwqYXuCI
PfY3jgcYXQKXKQ+ym1t9Gzxp7cJSbofZaF9gEbem32oWVr6y/i77jmo+rXfnnfLb
bQzaRIx/6iVWvonQBG2zpNfcxN7FlWCWo2pb66X/S/NcSQIOtzDaOnU7K+uYGper
UVdhLsmoKl05OI1YOyQblE2dTyIAHGwEfpBOdxyIU1zxLZEnXSXsrJ9k4EUbH8WG
rSKbgOi2Z2ShTMb0KtopbDRvRvq3f4OltTP/esti0Zl42zrq9rQCTiHb9hU2KDFc
w8/KBdFUUj3J3vX7h56NiLtNEdONy5bECFf3WdlD90Q6ljA+wJTONcDM0Ltf9Lqb
RXXmVu17gzQGPKndNezR9Hry/h120dMAuh6MYSQdtbgSqMonOr64BinIABvJPq4B
2kyOatWo/Cl6J3ZRdAB57B0QGeOloazN/RtorcAY53ahQND16k3KXSWE47gd62lI
3VEF6pxF0Mn9MDCcgj6ZBgAnnzAUMSN2Vt9j+diV4hD+gKAsWVtjd6HEAyDpBonF
crI6EV9BI64v+xjL9mEv8uaMmSW6T6M3Fd90HcO/o1p7css3J2LZhCUD+rKQzaHC
DonTImuEaFapgVYepstb5q9eWIEb+mhH+k6UMeQQ16jEJWa/63A=
=zInT
-----END PGP SIGNATURE-----

--------------t0ihQmACXOEWelq02XhLBP1h--

