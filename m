Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1B9606BA3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AThu8cyk;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cnTpACR7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NC6PrnHy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v9r3g5keo8SdS9B4mGrqQdcoTte1OjZar4nWVFfkp8s=; b=AThu8cyk2Mj0t0Bx9G+nvLzlnh
	rfUhouQpDU6NDoFg9JHE960y3sBmoUzCc4qb7NdWNmprdZGtFa6+KMHEKk5CqthQs/Tm3BROaqvTj
	oYy8Mh53EQR4smZRAQdjelkyz0vvM3C6nV8frn/neSKY93TP4+AziIflUm8KaAlIE1gMNmKR9kVtG
	tyHOWPPSJAfbeERGGe3JrugfGJmrfEf4/Ue1YejDLVEWkWb/hTH9p4tEtWVffp8LF3eOUsxNc3cj8
	JKMdoeAoRqjp+AaQr24C4KDQMCxA1EWTHkIbXbeklXqJkBclqwRKe5os4uFwBsIkhe6vIPG9772iO
	Eq5r0I+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhdG-00000004xRf-3aCc;
	Tue, 27 Oct 2026 13:54:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhdE-00000004xR2-24qZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:54:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoPIp2397365
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v9r3g5keo8SdS9B4mGrqQdco
	Tte1OjZar4nWVFfkp8s=; b=cnTpACR7Ca15wLGgLXZxFnkBR6lQFrKltQqV4MeH
	MyOGSawRypQrtAkwkKSwCIIocHhwNmD8vT1sa0Ejw58JGwNk29gUJuEW6CpH4Gf0
	XgxjpqVWjxO5NmlorvmBch2tXjvHPAX96+k1WXXEqjNk7dNpSikHjJt1nBKLs7h1
	4EYdKoREtnKcoVekxMC4VswLs1nMIvRT+gU7g0g3Wvl6W1eElypkqcc95+aQzE3B
	FGSy/T0Dq60GQU48UNPOut+Nfkt4aBMXSEidxbpwCGdE9BCtVY12kN+nMRWyw7Yk
	HJHzyJzaiD4+YFxC4ycFc8lwsQJsUvT5j0P1YS3b9kGaoQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gvu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:54:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c79ad0decso5557586d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793109267; x=1793714067; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v9r3g5keo8SdS9B4mGrqQdcoTte1OjZar4nWVFfkp8s=;
        b=NC6PrnHyrDg/qp/2eZkWTj+XRvG9GB0Gf0ZHRBsBwrlu9Exuz+bANGA2E5xKkzB25f
         XBXUpgaPSQUyJz8OLJHUKaLrBdrSIt/3Sb87M5NSmgkcMPw/J8McjMkzbiuCdNRg2t+H
         vw4qquy3fj3t0A7zRcYnQni6TJdnpD39Ze8jrp9LW0IXl8GcjeYfWkFIoYcwYp4Qb/jx
         dZPknjx1THCad6wDQyu1FXO8eTUQUtIyulzJgTosV2eFlsUGEhoKIPs0YjonSzAhKwnp
         8ym5sXi9H9uSMH8YUZvmfb/WQxhgA+8dqFSDC2lUjIuMX2yD1HY6eePlYaRAc3ApLEOC
         MKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109267; x=1793714067;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9r3g5keo8SdS9B4mGrqQdcoTte1OjZar4nWVFfkp8s=;
        b=ARKM3+SsE6lz0J/NJFnu5pUiLmyAX4Vns+yiWZPSIr/VtLpa2uU+EmJJz6SVWy0yVE
         upGcTOKTb1M+ShFfeRFO1lH1cv269hsAbeWNSz+bFaZ6BMo4pCjTYiL2XPfIwbsE4Skh
         f/EB5kVQml3HACxtYSr6V2h9JbhNF4PvAutWjyo1hBmqrXCAVi8jCJtZYwDYfRJ9eYLG
         19t111kgM1lB0MMHeb6KNy+hybp9HQjNTIInDzhFKh85NmEDbeApz6LGm9LlA+T23Jnc
         DXdgMGvdtDgn8Xvm3uAPzym4deOREHzvOoXMInIckrbydbbrw3+1Ubaq4F1Yjebtt3d4
         PfGA==
X-Forwarded-Encrypted: i=1; AKwUvBxntIH9bcKB4PpLotuLIQds75PdKSNfmL5D9J68nn4TTmEbg2kOKWjYObywszSEL2VqtUjBcMRG8l5mxPwU/qNR@lists.infradead.org
X-Gm-Message-State: AFq9FYLnnuSFsIfZUN2l6EkdPG3ZjBEUAWcNuQOTtw2leJLbIT6roDWC
	V/hyzwd0zh607RqDPwe/+zLecJEK556Xd2s3dP1Pk2uoDZxbt685h8nFIE0jE5n8jydWd94CpCu
	WjafPOMc2FMScXl1Z0/hL6IjhW6oVVtpNEEHdCVr4DayOlWKuBYEaaQQxGRjBJAKV8BpKykW2oU
	ogQg==
X-Gm-Gg: AYBFou04356F0WsF1qFbYXqZ1bgX7PS8a9vx/KE17s5Frcv2iB/+dVFbha3tMwSZxqn
	1GQxTUvfXmKDqFQmNteR3+u2NJVIPgp5lErVTV3voc2p46YeASb4YfC1UU0Y4yi2mD0NiqVLs0Q
	LCIz23QoE7ksu5z3hHBugJumOHC/lskhCuPWA3og6MNQc1cvy1r2GwslP3nj8ofwEcAT/+zdpDy
	KsMTHPRAsjKkTH0q051yTj7sQZNimuqZjmw1DMMrc5pCEQMPBlasIs6NDirbOeZ1+ADYjgBVmrW
	6ELd5vBqtVxaIlWC92NQMzNPVNTrJjc5Yo0BQeWTiEfwL9vm4BbcpNKc1wEDxxGg/GwCA4rYwbq
	q++8Rqd4Fq8A=
X-Received: by 2002:a05:620a:3945:b0:93e:f931:a886 with SMTP id af79cd13be357-940ef927359mr1664223585a.57.1793109266510;
        Tue, 27 Oct 2026 06:54:26 -0700 (PDT)
X-Received: by 2002:a05:620a:3945:b0:93e:f931:a886 with SMTP id af79cd13be357-940ef927359mr1664218585a.57.1793109265836;
        Tue, 27 Oct 2026 06:54:25 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a4e208d1sm144595566b.85.2026.10.27.06.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:24 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:54:24 +0100
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
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        James Hilliard <james.hilliard1@gmail.com>,
        Nicolai Buchwitz <nb@tipi-net.de>
Subject: Re: [PATCH net v2 0/6] net: stmmac: XDP path fixes
Message-ID: <auCtEFmNWwGPHKxp@lore-desk>
References: <20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8@oss.qualcomm.com>
 <179310900894.3327.16366770051104266138@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wa2Ya5IEJj5sSuGt"
Content-Disposition: inline
In-Reply-To: <179310900894.3327.16366770051104266138@kernel.org>
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0ad13 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=jeKYxtEjmYGD5WCmXysA:9 a=CjuIK1q_8ugA:10 a=LoTJxW7uYgufmn43WDUA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Mdwg1yhZXfBhl9O6hzwmSTZBcf1IDMe1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX9MS42Z0kizo0
 XyC8avshXlvb7jrpTaxEEHcajxqox3Q/oxCYbPwE+nqY/HD9m2mmzVTEtjFLuNrMa6eTVVJb7IH
 rEBrTIp3I0M5RH/yK5X1jJ6hMtIrMn0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX+QxP0QaUbcag
 D+Se7ddRIlVgZ7omIelMadfZyRSBG0VJbEwocvaYwc1iPSrnKQ9bMv44aK2TkpFOd0H8Xmp1ZYN
 onuD2ySuR1tZ5NUqzzeN1I9TLhJ7s65z/NoI8QajK0uiSNFDXu1psqs4S4pU9IiY1KjCDi95wVv
 w5tNR5kcM3DOTcOHJuPwyRPa7qQzY0H6bQmhzJjylhG8KRVDmDXvTYsXOCR5xL75RO6qnJohsRd
 ylMZtxY9HVWNtuIkaqWBHVWOdJnjtsb+3YY5DXvq5UA0KrMzr7HPRJLXV0CogXtqlm7Nfm3zPs2
 uG39H1rl+WJypgyfEsWnttSAviePAQNo5Y/Kb/IdKyZoQK1dWd7/YaDvtIt/FhWYfi85PJ9GYJr
 Vm4HfZyyfoJv0p3MUYAcCW30D4UlxhHS3AjN4xRHl/RsS0tYCTQGalazhmbbDvTwLWi876As5Rn
 QiV9+gFOyL//W6ituJw==
X-Proofpoint-GUID: Mdwg1yhZXfBhl9O6hzwmSTZBcf1IDMe1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_065428_539663_1B10DFA7 
X-CRM114-Status: GOOD (  24.02  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--Wa2Ya5IEJj5sSuGt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 27, netdev-bot+sinfo@kernel.org wrote:
> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The issues are reported by sashiko or spotted during code development

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

They are real issues reported by sashiko or found during code inspection

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

The series has been tested on Qualcomm rb3-gen2 board.

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

--Wa2Ya5IEJj5sSuGt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauCtEAAKCRA6cBh0uS2t
rIR1AQCr+nG/Dx+y/qw8KFwMjZLoidUREPuG+M43m63c8kjpngD/Smo+d7AhTLzI
C30f4bu34pPv+D7xj0sZCyysyVmqZws=
=pve4
-----END PGP SIGNATURE-----

--Wa2Ya5IEJj5sSuGt--

