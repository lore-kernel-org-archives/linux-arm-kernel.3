Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046D9CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 20:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JBiBo8u7UaSC9Rv39cO03Yjk1sy6Ysk6M919UcSD1U=; b=sCy2qYE+so9JVmHWW1n8LvmejS
	QpA/DhZlhZZuwA+83Tp7mIcfL6hzTfpjdwIiQ5ieNpFmOUlX+t8V5Coq0d5a2t+dS903LrcDzMh3/
	Gd3Z8DGJPtGbGYYGBXnaTT3sVJNq1bBecmjS2FC3P5uNkHjDu/lzNx9IRFr8S0lIBKExQ7kv9NuCP
	UyEDYYN1EHzyLbeo4Afl9ci5WXQ1VBLGB6GlH8e6QyJQcqoMqIQo+OzWL4khm0mRnLOuGmC6usZFt
	7w/tPcgpVk6tk1CpFMPh/REy5g7xzd1TK2WYLncV4eTT8j35BfrPoC8SHZq9qELK87zvVJCL3DNi9
	wwfvmyMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5gS-0000000GGuV-0PU3;
	Wed, 14 Oct 2026 20:34:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5gP-0000000GGuL-3LM8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 20:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0JBiBo8u7UaSC9Rv39cO03Yjk1sy6Ysk6M919UcSD1U=; b=cB4EXToBn8dzqMxFk3w03sfvjw
	dCfcpbfqiiF7N7U8D3feGxTJ5ZmnG+9QxCmv9KbJHqwpkd6UvNuFwFTiXLI94AfUzzT0l3nW1k5Uc
	KhYMGhaNFLs7tYLnIOt38YQfAeV2fH2oLX2M/HHjh55tS1TOiSaC7SnUoBF8Et8Bz/rjl9i2aDhye
	Kv2lMOjmYjVSsNW9iT8W8mP45mE3j23R+0ddtJRuCVnA3+W4SDOFkNTLc4MoOxAfIxAllzHjUhfxM
	PBPa7R4o6v5L8uy1C9ePmtLBgqXcZTQql8XkvJ+HTeD8QXfktv6EULaqQxzbsM5c3QneMwwHiuKoF
	qRz/w2dw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xH5gM-0000000HC2r-3Nih
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 20:34:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbEIU301147
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 20:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0JBiBo8u7UaSC9Rv39cO03Yj
	k1sy6Ysk6M919UcSD1U=; b=hEtReE35PA0qGR2ehdV3Eircseeb10WvpxANT3GQ
	bXVdx9PHWVniLRby5yl0FeVagccHR5TDoGEDG5XghOnI0OdLGUmOuT0wNjv672ln
	EEKLjixkKJWzveJZXp39zO08sb8+sdXFm7LXCYBtyqYxr4dGRZzA69gJaMOh6LKs
	ITcYq/G25/7wrqfEcMBfonGwX70mPxSscwy8EH7yJ+IutL5vZoOFAiCEetzXbiy/
	bYN7idogpgpZfoYnTsd/Ld+1ljulYnnu6on1E188UHe2OMdFyS6Hhwrqy+tP1NG+
	P0X9HohIoEUTHsrjJo2nKivGXq3o6Tql6NZ/p7g3sKUTTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4623ds1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 20:34:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so1382078585a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792010076; x=1792614876; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0JBiBo8u7UaSC9Rv39cO03Yjk1sy6Ysk6M919UcSD1U=;
        b=bsAYAuhvCvZZoFAB3dOhZ3vAdv7T03oNW+GrpsPRPHheEjJTsFI3zYti+3lXHckhLY
         MCXT8FEWGj9TK/re+DeeG/gvXjn3u5tVz95arAqHIat4DqUoMF5dbxFWIgb3FuBnCSWW
         3gLrDQiyXVCRbIKeuV4DmJLT2qssCIE6WAWNpz9BIMn7fXZE7BteUdcgbQ8yDWO3K2zY
         90PgrTqTNsV3eKp7uGDJ4aDq1kdK+UjW9XBoQAt3c+yYElo5BAWYPWKVC6Ogi/EI0vck
         RS+nZ7x+5lTrPSYNZSzqp5qjXUxIBZZSe9PMF+EPUINe1vuHLtr5RgTXYgU3mXE/9Azi
         Aa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010076; x=1792614876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JBiBo8u7UaSC9Rv39cO03Yjk1sy6Ysk6M919UcSD1U=;
        b=sqnVm0bzuplptTaOguVme+V3XlTRFElm4bf303iCnlOEViui8dyd6MychTPBJhVQ5p
         Y/cAXwXeKRfrov1WFVJjqt9irKq2G6a9gglfH4DwScy2YgPqMORQmcxauJYOneJWb8hw
         U1WTiEIeBmLr5sJQMnAR2SZyWhw9YFSb+bbeYTtr1i3ttYkMJN1pALMw5HyncI4nAmBf
         RGln5/cxxafP3wbyB+cG/CLNQw0zNRvPyGX51vma6NLF5HqiCwfBHjR44bcak0vnJ9tK
         vwLHGLWdNHwmMHzgruGkPfeirec3klHjLUkUaUnf+KUItZHvMFMAh5NCGmPFFcTwEUV0
         qUug==
X-Forwarded-Encrypted: i=1; AKwUvBwy767VydSEOj+Y4+rKc+0ZzEGNUmobhoAd0zU2mwYRvpuFownKNGkDv+er4HCVVHQ/BwNVcFI6b5i/dkaoFb1E@lists.infradead.org
X-Gm-Message-State: AFq9FYKBqy8eI1YQ2vWgCTo59vsgJNToEpmes/1tvAP0bXEqPyviPRT2
	Oi/6Kp6RrrsTbFx4jDAOLLwjlHVDO9YYSL+8UFkCyW+jFnXhriKJOh3nZnS+jKslhfqwB9naf1S
	CZ+pKdKE4q1N+CQssu6zLEkp/Ouwy+KHCG9YdcGKw6Lihi3FMz4ebT/kMCMyJj0VNFw9ygWVpkq
	Z4hA==
X-Gm-Gg: AYBFou0RYKfO7vhko4L/idrQSCMQU6YZ8CGZrvnlp+XIENJpDfz+u1ypZFwU6ZdwK+p
	/WZauxpc4ECnCKSiSGLDc4IL1JngbHS79LDO496INtH5SU28tPnkHaCgwJ5cXr+f9cyFcdeUGU2
	r4xfZhjwSXni3zYPGLRWVCrwNwWguIGoR1mtyGMLtByJQy5OoxzwCIXdp4AP/yUBaGHDC4WfC1G
	U+vNnCvXr9gTG/hCEQ/d6rODkBY8Vzuf4vvyb9BYYiOe6/aezRwrxmU6gaqKEevfl+l9mv8boxo
	E45aguKWDCs6zkgfrr1t2MMOAg/HfoP5mPqp+la7HI5BhGiW/VFxZBoqKBKOonhUBqlPV3zTrrC
	o/bQX41SFFF4EKA==
X-Received: by 2002:a05:620a:6007:b0:93e:a91d:6f94 with SMTP id af79cd13be357-93ebd224f61mr2537120985a.18.1792010075882;
        Wed, 14 Oct 2026 13:34:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6007:b0:93e:a91d:6f94 with SMTP id af79cd13be357-93ebd224f61mr2537116585a.18.1792010075116;
        Wed, 14 Oct 2026 13:34:35 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4f34sm14487762f8f.28.2026.10.14.13.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:34:32 -0700 (PDT)
Date: Wed, 14 Oct 2026 22:34:31 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Subject: Re: [PATCH net-next v3] net: stmmac: dwxgmac2: enable L2 split
 header support
Message-ID: <as_nV38iPqeDnSJN@lore-desk>
References: <20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com>
 <as9XUbOfJazEQ4y5@lore-desk>
 <ff4fac87-380d-410d-942a-a48edce70397@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+LIltqUKrDa7jHaj"
Content-Disposition: inline
In-Reply-To: <ff4fac87-380d-410d-942a-a48edce70397@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: X66l7xYZp8RN82MyPTrOEDCcblPCpIH7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA4MSBTYWx0ZWRfXw6ofs5pLzoOZ
 4M5WzCucGIy6jnSkBGntOzDW7BsFyNcXsb/yMPUMyfZ+EbZHjO2LGxdrA1if/Nk25OUUeItrkaB
 n02kNO/nyuTun9M+CRxN0Zq0+W3VmjaeAUJdMqSY/693m0Kcf29ms4+6a/BHdOcFe0RsFf00V/f
 aiOd5vZLcq63vezMzb0TxaMnU5v8uFIS0aBTAQaE1T4qVa+TIDK5EK6ttFeLeqB7pSVinlVdD3P
 DtCLyjKenWguRWhpXmGx7rImPB2zfit3ID80mNNDvfTxLazBr5SZ2rJmdnxq5Zhur3nPRg9qwS+
 8eXry72QKPQn+lFxeId9FOROuwVElJEvqWJjSZSn41jU8iknghxIZbceiUzQpBEadVcENMKKvZN
 MFDsMDomrFs0Z1JlAwKUunYmKa3Ldg4xqnzUYmCpZTC+04uSpYMV7mpN9aIPY3/u1Z0tVx+Vhxy
 /aK0FencaGyDoJTwKmA==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acfe75c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=l6KQ-lo0NrS8dpgq6q8A:9
 a=CjuIK1q_8ugA:10 a=5EYT4Zk4UCsHSFwCBpsA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA4MSBTYWx0ZWRfX5eEpw8Eiq18U
 GvljHtO2Da6TJ7ReVo1BO7nxDwJNWmuLUdnmEH1NWr/5NuQWqxcOv3Suh+n1dIHzVNRQGSQlgJj
 NAq320CiQtY63NDdot1nNTdxdFJMoE8=
X-Proofpoint-GUID: X66l7xYZp8RN82MyPTrOEDCcblPCpIH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_213439_197307_D689CDCD 
X-CRM114-Status: GOOD (  23.76  )
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

--+LIltqUKrDa7jHaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> >> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> >> index 6719ac6e395b..65ac5403ec58 100644
> >> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> >> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> >> @@ -292,8 +292,18 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *=
p, u32 *hash,
> >> =20
> >>  static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned i=
nt *len)
> >>  {
> >> -	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
> >> +	u32 rdes3 =3D le32_to_cpu(p->des3);
> >> +
> >> +	/* when FD=3D1 and LD=3D0, HL is RDES2[9:0] */
> >> +	if (!(rdes3 & XGMAC_RDES3_LD)) {
> >> +		*len =3D le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
> >> +		return;
> >> +	}
> >> +
> >> +	if (rdes3 & XGMAC_RDES3_L34T)
> > should we check FD=3D1 here? Since HL is not defined for the case {FD=
=3D0,LD=3D1},
> > right?
> >
> >>  		*len =3D le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
> >> +	else if (rdes3 & XGMAC_RDES3_L2T)
> >> +		*len =3D (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;
> > same here.
> >
> > Regards,
> > Lorenzo
> >
> Hi Lorenzo,
>=20
> Thanks for the review. dwxgmac2_get_rx_header_len() is only called from s=
tmmac_rx_buf1_len(),
> after the sph_active && len early return, so with split header enabled it=
 only runs on the
> first descriptor (FD=3D1). I don't think an extra FD check is needed, but=
 I can add one if you'd prefer.

I guess this approach would be more robust.

Regards,
Lorenzo

>=20
> Regards,
> Sagar
>=20

--+LIltqUKrDa7jHaj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas/nVwAKCRA6cBh0uS2t
rEcmAQCnBV/1zib4lq8ykuIgs4S7yaMfbi9Uf4Qr042Hk0VQWwD/eZ03uS5gU21E
BglezNU2cYxJHHkAwFb44+hYCJzZsAY=
=jxn7
-----END PGP SIGNATURE-----

--+LIltqUKrDa7jHaj--

