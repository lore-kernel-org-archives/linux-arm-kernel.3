Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C9606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hNHrla/J;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hUpRSQHQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/hjEnbS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E+qJ0z0fXRRbniKVccRo08SFzpNX7/DEea7wwix12bk=; b=hNHrla/JCa5KDrEaAaBUVgW7Uv
	dcUoXf63brzFyhslylLjKbtsxsX7fmbJlnoIZB0o8o8Vj5hSF8FhiQXz9Wj0FZNo3i2rL+/aLTl85
	TgboAQvH8EiikgXu1p2aEcbOdyN+Z/eANqHtpsvOj8sU+D/pA1hwy4G3wxDiPvFXVu4CBbNi7fCtJ
	v4miWyqoTiyZZRG5tXpeNrAWuDzB8y912pQYtY5mI4EgDQUj4ylFe7IDA9XZ5X6QORgDXrPQQxiqv
	9tydGO5nMToS7attY82F4TQ6aXvoNvNq9BI6Ccesx+YDTA+89A1y2HDd9+VjNJGpmsDltspN5Ah1a
	9Y/dPK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOu90-00000008Mkj-3Nun;
	Thu, 05 Nov 2026 09:52:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOu8y-00000008Mjo-13cf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:52:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56Tuct3223158
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Nov 2026 09:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E+qJ0z0fXRRbniKVccRo08SF
	zpNX7/DEea7wwix12bk=; b=hUpRSQHQNYfzfC83FLjaF9kiN+vrTNClTs2yMHLr
	V6U3/TFCDDuLfmA0v8TEcFYuBIc82veg0J/8uS8cQlbl7w7xhbaq5SNZVoA5PmWu
	dqi7rikyjTxN1viRfD7UGdZLuBBBa7t6Yv/mdF5kBHYjQ9kOczrzWlmcifJmnQBv
	nHZ3aHFDDIc7X0HnsSGD8Sl8VTl0roeSJuBw96nLMc2j0iLQw7OYGxUS9KPZD9+y
	TMZ/vajwlTI5PHq/BkyRlVH4sDSfcKvOiYkjM/LYrBi3JsTTj2iyazdeWcC010Gq
	gf39GtswjHYrSwOH71Q/qInyj2dBsdIcjU3DL5asIJXFeg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43he7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 09:52:27 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec21d5bf78so441833e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793872346; x=1794477146; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E+qJ0z0fXRRbniKVccRo08SFzpNX7/DEea7wwix12bk=;
        b=R/hjEnbSGkVxPa2196Kjdi98qgOClhI0nAwzR1QovKJnYayM4IDMzjijgJM8hbZd4I
         mXUBoPtnrascmlmPjF+V6BLcWKmIFMYDJQCRmmv7JvtlPYIijklk4aK120ef+cJzn8QF
         0vOyq6TSHVcA70y+U2VkXRhtub6GuUtK42ZUUV/O1R4lf/jxxhqqmad+nQ+Pb9Qm9w1f
         Cv2jJS69Io5MY6RQcvx5nxJYzmIysSQblIFgX3jGeODzDT5Tuf4mFXuCVfxxv7yG8cS4
         r9GLl6ZHgJ598TJv9ygQ8goc19vQs9eskCuoQsgkZwkeM/Iy1OXme6nmgqJZ4bJFXm7E
         C58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872346; x=1794477146;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+qJ0z0fXRRbniKVccRo08SFzpNX7/DEea7wwix12bk=;
        b=qvmJq9J6aD40FvesBTXmDCJdLNW2eekbd7VhacmRcrlvG8rtLWzuCT6e0s2KiYg5SE
         J7a+0xqDoIphO2m+OYzoMsQMWVDq4CSSaTLb0PXyD5mNTo9+2KGKbVWDzCUr2dv9aZDW
         9d3kKR3xpQOevZGklgbgnOPuxHojLM6ad7pzmEI1ISuaTEqodrtQsjjSAdsfcIL5KEVE
         jKJ5Tf/VOlhHFFM9uiLqEoLAP19QvH9XB5DFlCDF67008+K7vYACF/hUakJuQ/BeLIN9
         51hhFUapDpE0VEEbIMCh9t1zL8CUPpEv3T0Tgufk/yEILlnY2yVKH5+Xj/rrqW1NrAFU
         IaNQ==
X-Forwarded-Encrypted: i=1; AKwUvByHB8q9f4QzlLYPlPVXakfWTHSV3bS5ZYDQUisthYd/z8U5mcDEnm4MUhd+bUhWnCrV+yFc5JSuHdSzWI5/zpof@lists.infradead.org
X-Gm-Message-State: APuU4Z9JvQLSPGDMyowpJXKb+qovIJxErSFDVjpFdBPO6Lr3Bp2Ie4tB
	/pfRfQiXrOlHfyPDtMpih04pIxHuzG/Oam+C15LBlt0CicvmqpbY+6NdNSdNeeQVqd+aW3qM2bS
	sJx9Xk4HabDy262d2gOPCAo8kPOrV0jTfxuM7KB/mgevT4DAFTTGD/qTN3yeKzenBCym93amhCj
	cXvg==
X-Gm-Gg: AYBFou3PpQpirV0FMEE73AYyBMQPJbk3LCOhtO5FfDKPXe+K+edfvDkXIy9lqB9KCXq
	8Og6iFHjFWNmnCpPkpG4NJIA3kJa71sG+SOd/eBqa5kzagwv5kaLwU6l4GBCXTtLI+sY5RmtplZ
	Pv4/D+hBBtHXT9XCPVhNukT0Su6k22eZ+9BPrtJzUqdnozZR4eIUMS6CefoiQEHrrD+TdOjfdQg
	6ZeOSzc0/UJKRrb/8iZXEMlXexQfwbLgTcP2FCQEEG5u8GyrBmNwsn7E4hJdkv6hiuDFOufNKiO
	MOfs8wu32WR6yTTBVT4ind5dqLy5X/KUFarsBqFQ0qIEcSK7C12bxajOVBKt8dh6F80ZUXaubdJ
	LbUlxW2K1OTrUKmv9DPPRrqiB6DMBbICnp0/jclhPhShNRkCSks49av38t/9hjg==
X-Received: by 2002:a05:6102:32d4:b0:7d0:3ed0:c61d with SMTP id ada2fe7eead31-7d07227ce39mr7822341137.2.1793872346267;
        Thu, 05 Nov 2026 01:52:26 -0800 (PST)
X-Received: by 2002:a05:6102:32d4:b0:7d0:3ed0:c61d with SMTP id ada2fe7eead31-7d07227ce39mr7822312137.2.1793872345655;
        Thu, 05 Nov 2026 01:52:25 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm8898539f8f.56.2026.11.05.01.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:52:24 -0800 (PST)
Date: Thu, 5 Nov 2026 10:52:23 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: keep est_lock across PTP clock
 adjustment
Message-ID: <auxR19bfAdOc288M@lore-desk>
References: <20261102-stmmac-ptp-est-lock-v1-1-76fbc0cb230d@oss.qualcomm.com>
 <b7102713-8bc6-4a5a-bf33-b79a646f4126@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rMRGzwt2sRAw4qTo"
Content-Disposition: inline
In-Reply-To: <b7102713-8bc6-4a5a-bf33-b79a646f4126@bootlin.com>
X-Proofpoint-ORIG-GUID: b0PsVcxKADl9yu2oOa269W0Ix0dWbVaJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfX6tvSz3yYbrBt
 Ut/LRlk0YgH/nSqo6oB2+xdiX6B3nZH7LQjKGZcpzoB6MqYXC6S/GMGsN+Lz2CjqvnTJ4Kc4IO6
 WwEJYvAgoXd4rWoEs/PlDGQoLXlqRhLsbDyzbCmnnLv60bUBvfepQKvQ8MQvMGcLWVPIzVkVrfn
 Iia0+R7Y0HLQLPDxAjaqetMH9GzWiIcAKtEsWUFcsVPf16suY4XDz+yRoDDRFGW05lheGT/H0Ny
 YJKZximytHFqLXlxYRpd22wl9kaFTEl3gkYk6Q6E+rgdZkDj8l0KKvQZfOZ8gJPq1GBERytWKpE
 iHBqvepMUNyoNZBY/hX+AYvxzx7/6V14OCRAvVAWQgIhkHB1ZviPnUk/ZvNWsbaPgvcwx4Zu7RE
 ebdOyA15vaODlVVBlUHjTrey2Esv1Bv7F0iYX8hJJZMvWvO3Mz/tPnpDHzjjl55qil5GaI2f1dj
 /bQFsJKn9Q4zTT9sc1A==
X-Proofpoint-GUID: b0PsVcxKADl9yu2oOa269W0Ix0dWbVaJ
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec51db cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=P-IC7800AAAA:8 a=yEE8vCkc6EYpfAGo-GYA:9 a=CjuIK1q_8ugA:10
 a=bkY8HCoThClCxJ_FmXcA:9 a=vmgOmaN-Xu0dpDh8OwbV:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfX7BvgHWHWJDKn
 TOoIoRP2KCzDcBt8WOW1mXqdglJXHhxJnN2OP0LmGc76KpVCYgDvK+ODYwGBZgWFVbWV65FmYPc
 hFBmIFBMd7MQNd/S76hQ1DYY0J2agPQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_015228_293176_6376C740 
X-CRM114-Status: GOOD (  25.01  )
X-Spam-Score: -2.8 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--rMRGzwt2sRAw4qTo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,
>=20
> On 11/2/26 18:37, Lorenzo Bianconi wrote:
> > stmmac_adjust_time() disables EST, drops est_lock to step the PTP clock,
> > and then reacquires the lock to reprogram EST using a base time computed
> > from the new clock value.
> >=20
> > That leaves a window where a concurrent tc_taprio_configure() can progr=
am
> > EST enabled with a base time derived from the pre-step clock.  The gate
> > schedule then runs across the PTP step with a stale base time until
> > stmmac_adjust_time() reprograms it.
> >=20
> > Keep est_lock held for the whole disable/step/reprogram sequence so no
> > other EST user can program the block while the clock is being stepped.
> >=20
> > This does not introduce a new lock ordering: __stmmac_setup_est() alrea=
dy
> > takes ptp_lock through gettimex64() while holding est_lock, and
> > stmmac_adjust_systime() uses readl_poll_timeout_atomic(), so it does not
> > sleep under ptp_lock.
> >=20
> > Fixes: 23d96de472f7 ("net: stmmac: re-apply taprio offload in __stmmac_=
open() and stmmac_resume()")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> I couldn't really figure out why the lock was released in the first
> place, LGTM :)

same here :)

>=20
> Do you plan on addressing the sashiko pre-existing stuff ? seems to be
> rare conditions but still :( sorry you end up having to deal with these...

yes, I am planning to post a fix for it, I am just awaiting to avoid to post
new patches on the ML before these ones are applied.

Regards,
Lorenzo

>=20
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>=20
> Maxime
>=20

--rMRGzwt2sRAw4qTo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauxR1wAKCRA6cBh0uS2t
rE67AP4p7uxcDSU+u+UHizM3E7eioXxcsdqqYLpWaO+hcHviZgD9HdVMiBiy8Iav
M8tJFGknKjS0Sl1s04n16G8Y29tblwI=
=6ZuU
-----END PGP SIGNATURE-----

--rMRGzwt2sRAw4qTo--

