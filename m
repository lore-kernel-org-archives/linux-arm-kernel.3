Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC9F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WEiPZ8nO;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VlNNsFPt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NYGuFk+N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JLouBngFmyzeStR7jpDFnM6B5NYmg7+fEs/IrATZkD4=; b=WEiPZ8nOtuAFVNRtgK2RmTV8/X
	8A93BjPc8O8I201ub/zR+D3RvSN9AZCMfZR9GrGP/lMnb215nkRWOMiC4mWlVsYMzLgSGoNmG8CJF
	hBYamgCriVZ/7lyZf5glTR/k0ygcVvEl3geM4oQZqOw3IPE6v6JrbUYk1V4vluierHUo0AHd04HYL
	CRqk+9qQKgGpDJ0dO8oEqkKdWvr4U7nb1kH4Hw/pTZL5fm4ccnmGHHIJww8gBN9yFKLDS8EjzI36P
	jucAQFaAPggSaq1vL5Ngdx6Tvfm3kt3m66ODdj1n12sZ9kO1uKOzP4sHykAoJ5tQ7tWzuh7DMWByR
	In6CHJ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAjG-0000000FwKW-07HS;
	Fri, 23 Oct 2026 08:34:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAjD-0000000FwJg-1bC0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:34:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FDO81767187
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JLouBngFmyzeStR7jpDFnM6B
	5NYmg7+fEs/IrATZkD4=; b=VlNNsFPtHpOEOLBQPIEyP7I/jaEfftcF7F+mvdHm
	sGsdlHAs/Xooz0LLYCCk0jG7pQSMecK7TOhIkM/90it1WQcsFKptZxtQkdK/bVhE
	9U3kHoD0zyE6n9EmF7MqoIdDhA3CBcaruxo+7hgNQTLQpAvHmfGecb/DCZ5OWj9d
	p+9k5t8Ov35d9WRSTgUfhM/ptvkDejcm8wx52XVo3Ty6tOIwQ3TrjjYwWaOzuXVv
	mCcgFtmO7y0KI6n9vXmBYZcann6XoaBaYgKWmT0LwPXze5N89qDVgyEtytOdD0hN
	v6wbu34r1auqFe773kYRjNGYeTmtntTDC6kxG+TVOdb+WQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahu6vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:34:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337f26ee19so18185111cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792744457; x=1793349257; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLouBngFmyzeStR7jpDFnM6B5NYmg7+fEs/IrATZkD4=;
        b=NYGuFk+Nyqf9rJanBGTC52TmOH/zpSULU6FKWnAJXuiOii62ltwae6K+aTHIa36qtp
         +KFEPTmv/Gm+tkoxKagig917eUw5MWM58mvBYOS1i1Lq5T8RwNmJFqV0OFNFM6irzylp
         LfGTktT5YE5P24DXtvn1ywgB7Nt9SVtRy1Fg09EF66SEeiJDE0FYWlW/2VQnUkDM9Sx6
         lcNZzbs4i8iArnztrh+eWmTGMwpUqaoc0ILP6PMwkeDhBfNKR+LvLBytKtwJNCpJxW/+
         9ked/OBLE1r/pcAhxQNscBG5Va71ABGW4rHFMg2QM0yRjhe0HpQo2hGogs2s6SF6GKW4
         9Bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792744457; x=1793349257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLouBngFmyzeStR7jpDFnM6B5NYmg7+fEs/IrATZkD4=;
        b=jb4Fqg3ODeBiEBtGJEW5Ju5KL3OBEjat8ffVYKRMQy/78VbXZJZCvMDg9c+eHO1fvI
         sVQJUFrm+8AF4RgZOtGpBlLZZQTOB2bHy8O5k7ZCVOMi02yOUSX7LJROAASsderTKbkk
         o4HvMOyfEoAgnqRzuZka5hlI4t6AgI/8/7TIHzASnDV2qeqBjJEvlQovdslrf5ZUaiLF
         aIU4jrH3of/KZ7lZSlJ84q7q1n7QQTlW6vC9uF3vXAIGFKNWM2KJVchIgJm15Qf/tp6b
         HzuunQIVWLJDvVGKXpRni3Y/ydUd15WleIZEOVIIyyO9odD0kqxbvJqXjngU+SDbO5RA
         bceQ==
X-Forwarded-Encrypted: i=1; AKwUvBweyekBGfeLeBYn/34YsgSPg/2V/zvTSo+oQxP4H0KaexquXLZIm3M24zxnM3OR20vuOp9ZvPgCqcIKYfkUlnao@lists.infradead.org
X-Gm-Message-State: AFq9FYIeM2JPAkheXYhaLzEFwlEPNIehJVahWgbAug9UvqNOSL0D0vRH
	v+a7M5tttzhlZbJ6EterURb8zvcRoBCsqmFG0NYV3Z7KBKeXa0wdUW20GHyXlHndgqWDlOTEtai
	bD2UrT+IwMMnhzRrWkW/+ttx83lkw1Yc5mATIY+FWA6+An7JKckF6J1ie02K8X7gfFDJ0wTIz3h
	PnzQ==
X-Gm-Gg: AYBFou16k2gwi3O33jBCEFwNt8FEaEg7Wgl45csAbkh+GXerM6sfvryzAireSMKuVn1
	mIlzUYE/gtZ2TDasCLXDzE2NjHPgbe8/hiAcXTNwl9lCWlZeaovxiSb9fRT8vdjsowJ10ObxZRp
	whvO2H0n78aAHeAJ2CMHZryeLHpKMXo5b6q0efUwIUMn+49lGb+52SOF75jvNhy7erp4XguRjX/
	1Qq8ygH0PVd0BJI7XdATTorqbsGK6Llg/IThPZ0pwTyUdiKMVuean7cBOAEU0L9dMkmRbmgXFcR
	8td1z0XWsM0ZMtVvTGkSE9MKOh2RJX5SxsR3op5cjETfH8GR/tQ7a6wXw6HyeMu6Jz9+pzAuaGb
	Cg+nH1F/ttZ0=
X-Received: by 2002:a05:620a:1d09:b0:93c:c96c:a5a8 with SMTP id af79cd13be357-93f6f8249cdmr284071985a.53.1792744457085;
        Fri, 23 Oct 2026 01:34:17 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93c:c96c:a5a8 with SMTP id af79cd13be357-93f6f8249cdmr284069085a.53.1792744456592;
        Fri, 23 Oct 2026 01:34:16 -0700 (PDT)
Received: from localhost ([93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2104627e0sm58222525e9.9.2026.10.23.01.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:34:15 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:34:14 +0200
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
Subject: Re: [PATCH net 0/6] net: stmmac: XDP path fixes
Message-ID: <atscBtA8faGJ4o01@lore-desk>
References: <20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd@oss.qualcomm.com>
 <179274313871.3327.10475535220969393247@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lRlEkSG0nrXxOB84"
Content-Disposition: inline
In-Reply-To: <179274313871.3327.10475535220969393247@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMyBTYWx0ZWRfX/GRxm7NJx/Tu
 265pYqrAfd0Lb+vViJ465k1kSls3hcmsJFYf4u6Ivk5Kjtc9Y0+nzqpKjhJOM6Ql9igg6g35d/W
 HlUwCGO3flqmsG7ZfWsh8hxjqNIoE5g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMyBTYWx0ZWRfX+adDXzTvD/XJ
 gooNCrBOkg2yIcyUR2XXKE1f5weKHV9rjqM+v3PKEjZGC2HSUDWYyFwX75e/4ws+/rBLio542Wg
 AfM8zUiZuW4MK9BY77seYKBDWsfTP999OtzV0LrMIjkGG89Ud2FbtuHhdECISbBVb0Vur87+Eqk
 vxTIpQ8Q0xCsizUpWBUjN9MRmeCn2ppOLAZ9gEqbX8J8AZ6L3uToAvLmBZhZ7+j3X1GXdMs5lkw
 iwNQMoy5uB3HOfwN1yT4gDWcjYQ7RNqX+1ZofW2UgCC3u9WL879AFWfx1RYYNxL7fPJ1AseACiU
 0YCgdL5E2NikhPREgQcyWIDdX8LWx+4LP8bVwCw9OPeTiz8FxVPXWoqV+wgRNNtSokAQ6I/U41+
 AmpSZPP+AKdfEYQcUpK7b1+jmGkYya3ZFvKyAGGSKttaNWIrkCN2i+t8REa89XfSNOBq0sXI4SH
 KhcO837M6iH8FGDPRhw==
X-Proofpoint-GUID: Ez_ZDobGrrOCJRDuSlFpibv5VwkvV1XK
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb1c09 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=TGL2fYcsFtN_zcw-cNEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Ez_ZDobGrrOCJRDuSlFpibv5VwkvV1XK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_013419_542749_02D207F5 
X-CRM114-Status: GOOD (  23.30  )
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

--lRlEkSG0nrXxOB84
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

The issues are reported by sashiko or spotted during code development

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

They are real issues reported by sashiko or found by code inspection

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

The series has been tested on Qualcomm Rb3-gen2 board.

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

--lRlEkSG0nrXxOB84
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatscBgAKCRA6cBh0uS2t
rIpOAPwODAt8L3TAMPYqpuMKG9zg5Q3KhWAnQEHWpI/u7fuNCgEA/kCIx4D8M9eR
jTH9fhWjO4Baz9wjR/8WD+NaIz3Hegw=
=X5cW
-----END PGP SIGNATURE-----

--lRlEkSG0nrXxOB84--

