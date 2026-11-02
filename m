Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2670606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3dyHLJ0A;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fOgOKLfy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5+DPM5u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BszySUEPjFnjPFPKoD4QC+UNJxKQYQi24xnCbvVQ1JA=; b=3dyHLJ0AcEIVF5s4UMWKsF/+QB
	dfgRKqUreG6Bx2o3RO9hbS0UdJ4s/DWIDsbVqWrrXNPmzBc98uAr57Z/00caD31+lPX36nGjZKCmG
	IDFic1WWmkAFJRHJGbG2i/xSJLgPokc3gaK5j7KeHXTFESwwaTihLR9y/rkyiY0sAXEQS5bRTa/Im
	iJz5RTR6vApKOO8Qz1Dh+J/dBylrCeN1RjoeggzyDL39yZXHPY5Dcf7lPg6JPHEvPyWLU4Vx0c9YO
	o/RyIur7DnSaWc9sJ7ODiQ5cfEWcbLlp6IHLZajUElouhXhgE1M/hrlPZVirCw+AONA3QhWFt1eS7
	xHqErXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzwA-00000000Vyh-3nra;
	Mon, 02 Nov 2026 21:51:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzw8-00000000VyH-23zU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:51:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K5vr03292400
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 21:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BszySUEPjFnjPFPKoD4QC+UN
	JxKQYQi24xnCbvVQ1JA=; b=fOgOKLfycPfDArfTtGck2stxo83UKmu18QsSyRPX
	urmSrsEGARLNWVyoCDnq4w4EAs5U3rhk+O9jAtrFKMU4hlT5Z84o3oCuukDWMKpF
	roCyjIov+6wkgYQ79IS274Q2tFtrDLNyVpkJHANOIJnurb1apJB2nO/xjHybv7cy
	Qn8APGWxpULqhB6SASlrY+mKcHKRTcn0P6cJOKvStoGcAN/2Lkz+06k1/XmQ06Df
	VE82aO/+eW1PnJj+XXdZwzFI5nnTwG+XqjmhQAjzebGCjHhPB4LPVT17+B/D3Pi4
	l7/lwkTX3snb2Xd5yV82nPuWxNE7AA0iiP1sixzdkzgQUQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07egmnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 21:51:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso772536285a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793656287; x=1794261087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BszySUEPjFnjPFPKoD4QC+UNJxKQYQi24xnCbvVQ1JA=;
        b=I5+DPM5uAzTonDxrFGM70kcJSIVKMJqUmk81vby58VF1hZzM1mQ+G6OkQBw5GmrRbp
         3HLfO4bMosqakw+vJh1q8YwTRio1RwMmAfFhfBG1My/XFNhunQ9Hbhwp5f83vKwYQMGm
         aLCHkQ8kuTudqdTaHzmiF+lImaB4Whi5EpNk7la/upgev7Cz4JLoiUqjMoHUS4A7zcoV
         nwHGJSrJ7zXSss+6QEvr6AiVJNwcSjJP1D2Pv1/Tb2WGXgDI3WZILiAQvNA+pmoGH6rP
         m5JjirqADaeCnfm+5shGqcOWs+5P42RJhXgSOfe8JWHmNu9INf/6Enefv+Bu6pcthriN
         Sd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656287; x=1794261087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BszySUEPjFnjPFPKoD4QC+UNJxKQYQi24xnCbvVQ1JA=;
        b=20SjHnacZTZVgDjtgRRvZ1vjWBiQKJN5XsT4H8yoHwXuObJJYXakaeGV82nHWM5Fn7
         kAPvmxaWjK5ywx7f/1EsB7p6zuNg2HBKWmTe5ShvTnQFiyrCnrXq6AxxsPg5Dn1p5Dp4
         H3K5W8ntyLPQaSMeTJ5gCyqvbMAxvteK2OP5oGiBAGjmEvlmA0E0gSjGwX4ot1yPfNe8
         TQWgCoXhoVGLLoBoTwIdbcLwRBJtUs+4M4uNhsoFUeaqbntDEXV05TRI76hO0kd0jdeo
         +uiou6JzpQ+f/KPk8hURz6zWNesRLiMqFx3JyScjJkEpvA1vCB8xle+aQxHER8K6s5VP
         9XVg==
X-Forwarded-Encrypted: i=1; AKwUvBzUHT87R4E+MU0IwYKjYLH8sYj+y8fppNv3h9h7jmxfksSkR1hum9de9yzjH9oWhkKrgY8EN0cK/ncSD5qtt7a5@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4bZXJ3f6WMFxT2DvdTIQVYj2+jVVdlqmkMJKIHO1bEWAQbwzw
	guxsQ9AbIkZfvLWtm+e8ndPL60o3WOHn53FNuT33T8DY79DJhta9fUa3Rnjd0BPN/WDmj8Rp5Bj
	XDYzod//6Um/s0x7EUMXKDJCCp2dxj3av4dlE4igGpzLIrcPDuCZbZrB/2gYm6NDRTLk2b7fFCQ
	dabQ==
X-Gm-Gg: AYBFou2JZV1dW4JSWkP66trK4U8fdLf1z80SnIwOecvwWQsRQ4IdGqwj1hiUcN/w7Hq
	EcMAfCK2AW4Oc9DIe6IisJOm0hLdG/PezDG+hcmXpm/fwJ37wWZTJVzBvgXm4INclY6+z7qUVQp
	Np4wU9AOKOWAHEblyx+8jON1Z/sedzgcznChIP5UkMk9y4GWBFV5Bjwb/8jH+fzrsFGRwnCwToc
	ypdUdFFsWmgBpTb1mSxPcGk4WalBlvWr0dRn6mTjHjsZVnVuYy4eSh+4S8ry8XeprrPD1VlUJVU
	HzrpiNNK6fiNfUtw9/fRy6+xPCy4EqZaJvzviiUmsZMKBLPYXiNR6KnLC3EjMRan85NcT+Sihdj
	y3+fSf81unUNf6/cT3ryTVVbR+asF15W5NZqjYjqBDEHxU+3od/MAbCU+VyTrZw==
X-Received: by 2002:a05:620a:450f:b0:93b:be6d:4f3e with SMTP id af79cd13be357-9442171a2admr1910973285a.25.1793656286662;
        Mon, 02 Nov 2026 13:51:26 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:93b:be6d:4f3e with SMTP id af79cd13be357-9442171a2admr1910969985a.25.1793656286075;
        Mon, 02 Nov 2026 13:51:26 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm202480035e9.1.2026.11.02.13.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:51:23 -0800 (PST)
Date: Mon, 2 Nov 2026 22:51:22 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: keep est_lock across PTP clock
 adjustment
Message-ID: <aukF2h2J1xqAoQ_2@lore-desk>
References: <20261102-stmmac-ptp-est-lock-v1-1-76fbc0cb230d@oss.qualcomm.com>
 <179364145292.3286.14851003961835841774@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oIisQCZ3+3E4e4c8"
Content-Disposition: inline
In-Reply-To: <179364145292.3286.14851003961835841774@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX2OOjuXoe/IL6
 ti2DYchg2YGWSmrvJXvGeJtzLOYQOHqc6jBCfngfeWBM0sBanQ6x+YnI7i0mRBhYwtr7rplERSA
 Oj8LKJi6f/yjl5hLKwaOCjpCqJvhhsi1AGePFvxwKcEINOoyFF2eWuYQwShK3q44e3U9wBDuoB6
 74ye+wy8/+6TpOSuUDzio6ziFaifKfo5IysMEzBD+FsfePp9M75g0R4iQXShlhvJsaeHYXixkMC
 x+VmuRhUptfCiuihXvbbcjqAuZ5tO9yqge/9I5pmWiIRYe1BQzhuYhwJgqPepPoE5rFZ+q7NaSj
 GLMX9tX4nUywwt4ds+VRbt99MXpMiJzlIjrnarwi5QVeZq++W2ToXHESUMCbLOq6yXTl8p5yOMX
 S/EliMnW3VrW1qVZ5rY4t7+PDrmxHyR7q3HpAAHcAr+eLi+S7H74NAZBllm+sN20sp6d03A5E8R
 pWzpGErzV07/gGJmCoQ==
X-Proofpoint-ORIG-GUID: FG_mEBfFHeQBoeETVi6EjJWFe4393wJH
X-Proofpoint-GUID: FG_mEBfFHeQBoeETVi6EjJWFe4393wJH
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae905df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=sDj3ZcXk5yIpZCrTAcEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXxDjcablNwfpK
 Dt7GgITaoi50mDxxXHQ4jrji+pAxLWn4MP6zCZRbi41qwi9CtRNneg8w0/n3/AtOVShd/7AOvbx
 Mz8OwP0q7kxmoIsLAMZ8A3WlKQpL/z0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_135129_190551_48C26A80 
X-CRM114-Status: GOOD (  25.28  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--oIisQCZ3+3E4e4c8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The issue has been reported by sashiko.

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

This is a theoretical issue reported by sashiko.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested this patch on a Qualcomm rb3-gen2 board.

Regards,
Lorenzo

>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

--oIisQCZ3+3E4e4c8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaukF2gAKCRA6cBh0uS2t
rKx0APoDHiyVUtnqxqlC+DCpn/kQT0RDUuPkODmxd9Sg16fQ6gEAiiKM0PQubiii
b30zB8+8T3QvXbpn4ZxaIdYaagNyywg=
=/4i2
-----END PGP SIGNATURE-----

--oIisQCZ3+3E4e4c8--

