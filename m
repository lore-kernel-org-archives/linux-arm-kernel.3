Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30799606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=20vcfdmi;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hp39N+GV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T6kqJiCo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KlXD+aOR63c/FOljEMI3DnU5RwdrA1mGi00aGRNoEI0=; b=20vcfdmi06y79pXQzQv3e9RZM8
	aC7UeFl68v/35a5T6C0AyE5kVvEPwb/OwGhrf78XoDtXCPs9A9yn7jqWnmE+zTP/wfAWMduNNnJhY
	mUUtclsX5/QdRGv3/pLLMGMDW/si2SuOzimWq0/e4T70lOWsuK4PJNIOFqibHNRSVKuSq5B8oRhfx
	Qy2Irj2dvt7E726awoqebQss1n47JMk/zwfV+JtLYyLIgVO5ChA9OJHZeiR+eDMAa/aVNkX16sK9C
	A2yJ9xoyWhtBk0tM37sUG/HkHX2pRuj36Y4ZL/OyPu4Zk0DXPvVtT5q67IM6NKAjON+g/qN9fTRir
	VoD3goPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrxy-0000000GaQo-11CO;
	Mon, 02 Nov 2026 13:20:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrxv-0000000GaPl-1BNE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:20:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAcwD3014637
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 13:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KlXD+aOR63c/FOljEMI3DnU5
	RwdrA1mGi00aGRNoEI0=; b=Hp39N+GV8u/o8iM+5Myo10stt656PODJcvKDZxE7
	JWSrdiOFqnM0taNmJ2WLDI1yBnsflmLiOqu5nWXXPBDNljgh4vDtt99cTfWdclj2
	iRjf2t3wUk6r0FCP+gHLTJy3CtwADEjbnsFO8SCW7Mnw3p2odyJiHX21Kdv/dl0V
	Q9ri2/YP9yBaUSsFeRifCzBsYyu1IP4GVpq1U0WXmdKRdKWesfrPKami20fCdIcB
	br5iLA/1ICURZPPV8hnL/8P3yadRhZlhktl3bRn/SgDx/5fqBJ27PUwJuZjOdDFo
	Ld47SFfCV8Jh2kQeuc7CPRxuc1n+DwpZikCIhzMMZb8DtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhyrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:20:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1e62510cso665404385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 05:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625646; x=1794230446; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlXD+aOR63c/FOljEMI3DnU5RwdrA1mGi00aGRNoEI0=;
        b=T6kqJiCo2bbZgFIxnr/xTPJbddqAg3sOrC8I6xnJeZa/8L4krcTcUxER6yYCou507q
         AItEI3H9ZErlB+xaGzuMQLjy5tl1MSZaim1uvqUX+lXYZfWzj5C/M8/WnJa5d+hlnEjc
         tqjSclGOwccvolNYS9F0SLhXSwCoN4rjK3YNGULz/JS+DodnbFUEicAaFCgV7wzp3FYK
         Sutg4ChlQVh+IEDm+QAYdeYGkjAmEcRwtt2kDfE0HFUmGbeG4C+Z03vd0VYhsTBL4N9L
         tj3gUUx4jcb/c/TS1slHGpUoJ5mhaTNrpdEKorVfimM2WR/flzNwUxmL/r2fpeFyuVVQ
         XDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625646; x=1794230446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlXD+aOR63c/FOljEMI3DnU5RwdrA1mGi00aGRNoEI0=;
        b=j9Vcf7MQsGz2IDyR2asDPzGsD7A2C6HS53lfhiKSw6l2eQqqbNL1uifLsv3R8NkMuc
         UTTjAlUisWYuD8a7vw/C49RZh8Mm0Yxt92jSaEV7gKlHEgmRlVyk8N+lHwEtkffUxUEG
         4mwYMwWHFXWTh0hl7vt/sL8pMKdaCvvBHmG8595cPTYMHVpdQnD5TPVkpzaEpw4dExos
         nIeh9cYeMsY5Y0E+Yz0XAyV3oUmO+XBHDQe2dfhiCr5H3fx4NswMnOXbYXAW0hxrepM+
         8oszxks0EqZr8CO0EjNKHGoMgiWdpIvtfzH/IagbMuszsTAamEd/XmKmH9eVBxj/rIBW
         nVUg==
X-Forwarded-Encrypted: i=1; AKwUvBwgDt1MAK6nNkKv7NyxqJnSIu5bdm0EJPVCs4t/xHUrwZgUXJac6cZwUwk5F5v1RfvTI5KS61EaaO/LW8GyglpZ@lists.infradead.org
X-Gm-Message-State: AFq9FYLEVX1WU6uihQgK59qOrDVbwqSazj718HRSTNnDAX5xQPEg4P2F
	Pp1nWXc1Uy14+6XgBM8ACryADQf20ZGDPk+Oq2cC587otTbh+OJMYYsUO9df7L7oRrIixPim3Pe
	agzSDXQCp+4J3jTDfGCiExVbIkUy910vAKPIAkrPvRnjOF8Sn15PFvWZu4MI9h8ZqMz1s8KYWFD
	VX9g==
X-Gm-Gg: AYBFou0Y8EVkeb7SNmrD3p7Hk8lQfzglp2hN3tAFfs6ohf1LSpEyS7JJr6c8burz4C0
	VG1bDk1yuj9KuxHIqJ8YCo1dvOayr16RAhfgymUW/gkfwxRCHjn3B7FriQ7mhEcTqJRlmQIw1OC
	yMLxHB9/lAReZP8JJC+5AyDxJ7RXJfbFwfplapTTXuToc0w1kAYbBYmvSkzxVYqdstHozuy0TYc
	5r97lSgkW1n0Hl16E+1fjShQQIfx6e2h2gYdfBYB69hmo+2ZTuGVJnZz45oElN+CAAtbAXSGdXZ
	Jfrqi+Aj6LnYt2ltlKE2F/4mrJioglZDNeJPLkyuk4OMeCa/zKcjMWqgvBO4RYGXmJMQNF0Vn8W
	s2O9UVcfbr2q4gjPuYohF896MW+jUCJW2SFWqb9/n/T8Mhrg6cMefIFrprVgSKw==
X-Received: by 2002:a05:620a:618e:b0:93c:6e1d:96b4 with SMTP id af79cd13be357-944217b4de9mr1533410985a.62.1793625645613;
        Mon, 02 Nov 2026 05:20:45 -0800 (PST)
X-Received: by 2002:a05:620a:618e:b0:93c:6e1d:96b4 with SMTP id af79cd13be357-944217b4de9mr1533404985a.62.1793625644858;
        Mon, 02 Nov 2026 05:20:44 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ad414e298bsm125215315e9.2.2026.11.02.05.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:20:43 -0800 (PST)
Date: Mon, 2 Nov 2026 14:20:43 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Song Yoong Siang <yoong.siang.song@intel.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: set XDP metadata length on the
 page_pool RX path
Message-ID: <auiOKxu4PY2lGgkP@lore-desk>
References: <20261102-stmmac_meatada_pp_path-v1-1-d93cc4f9a864@oss.qualcomm.com>
 <179362019361.3286.8732260602904932373@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hEQCQpva2igBtHcT"
Content-Disposition: inline
In-Reply-To: <179362019361.3286.8732260602904932373@kernel.org>
X-Proofpoint-ORIG-GUID: ucTtAbwWiyCKGOR4CVXfK70VTDNsFqhf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX0RPd1A1hgwwf
 fPPYEBAdazHZPPGjuwvcNFYrT6dFljJsDZLdwS+kpNEKNiQuM2+m7sKKk26ci6ykW25hqfbm5hf
 VjD2LymHt7A9lf8AZQNZyX8mkHMDEUnXMeobURDI4NmbNH7M0VBNH3tpzHRoFtet/FffzGc5YCL
 Bsdar5QN4uQu28SFJQQkZb39dEizIowPQVRYplOQafyBslB4JNJapS1uJAh68MOYYLXQZSzC/oj
 B8GOZpSMG+2Rqfxcbs3M3VmJdszi8LWscjO0pMai8fw/qwuyuleOEOE9JpSuogJsGLXJifWTWcv
 N6JX2zUiYUxpeOLlEEQWqqnq1kMr/Aaxsl731eb++g1jRQ0nseWh/hdxdGyrhdIx6pbvRlnQYKg
 ruN/QBxnoMF36Qg41FjkBXzd8n/Av7yDbVZ3Mzb8lYaru4tx/otbRUJzg2bXLHapq8K56ymf/PV
 4mLTIfDkI3BqEdNNUaA==
X-Proofpoint-GUID: ucTtAbwWiyCKGOR4CVXfK70VTDNsFqhf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXxhcHU9XkweL4
 vN4n9yuAlCKkLiUrlogJzi+Jyjq1H7gexSLv6cRUYOGPu+qxltBUBhS/kvIfnJE0pqf7oPQt3Z0
 PXQ28fqU27xo0O/pFdjd09QeDYD1zS4=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae88e2e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=Go-FRpC6VwjTotnDkukA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_052047_325346_BB531E7E 
X-CRM114-Status: GOOD (  25.61  )
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

--hEQCQpva2igBtHcT
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

The issue has been reported by sashiko

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

This is a real issue found by sashiko

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested the patch on Qualcomm rb3-gen2 board

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

--hEQCQpva2igBtHcT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauiOKwAKCRA6cBh0uS2t
rHRdAQD/v8Dhm8FIwTs3wowVw2wCikCGentLt6uK5GTW5atbhQEAz8EIXwAcWJPJ
sqI3crlBL10HzgL1B2U0IkCcfwTQngA=
=Z4aK
-----END PGP SIGNATURE-----

--hEQCQpva2igBtHcT--

