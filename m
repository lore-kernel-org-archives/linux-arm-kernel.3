Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999D9606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DS0H3RPY;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTdwGNg0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHvQuWSq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LgiwcLWFEkc9BGjIqmFkTfgmhNMEizrxCC66mDcMfXs=; b=DS0H3RPY917xKI+sQZK1Zc6m3D
	wHS7JrLGD9x52sKbAe7kFNB0rDZ88X3bAuLXYgciM84GWHoINrhIXIbV3AFckV0xzmdpi9raqJvv3
	4uqgXu2vlYx91HAgHCqAQBmxYBtwYCZvzRa9DE3FDuHJlWIss0JEk9pS9SOpZ3rN9afpWJ9webVH+
	P8sFo9K4pdrTCxJ9sWbjyqoS3f69NllbXweA52ZY+hWdosOyxS81N91Zr1SlHsAKyuwi9inS3KIwF
	87QMS2/RpnbUOZLJJQbIZwtWSaoz3ci946qSdTUCGDD2OBHHUu7N3EH8fg+4rcXY7X/s9rFQrD1Q9
	nQk57Dyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNfV-000000090n6-20F1;
	Thu, 29 Oct 2026 10:47:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNfS-000000090mR-1N6y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:47:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vUDn179453
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LgiwcLWFEkc9BGjIqmFkTfgm
	hNMEizrxCC66mDcMfXs=; b=RTdwGNg0g2mzmaFT1ybL0jzmDUqvqndr6k1OHGKF
	v7d/jrc4SwHopSpyBjyy1SpKs4t3vQT7n8DSfTNSsaxN0QeMEQUyHogHaG1UB8jC
	i8b5YnS3+8QbX7nMLJIBCoPYt3qwG/VV7MsZiRbE1OlCRSr/sPsSM77V/Ml4iOMW
	jKbENMJUIvZHOtG9+LlSlexWlJIEeJEO1eAZOvXHJiuLRosQpdHY2po+e3ZM62qV
	p9oT5H3vVGO/QmmekZZAYfx8XpIjug9r4oyh4pxBz4VMUO+wCHZy7z99n4GBvdW8
	WD8wJDcI0DVCVkNS7EPwx+2OSRIke4nGbtAI94O4n7Nvcw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc35ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:47:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-532f343a55bso38791561cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793270852; x=1793875652; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LgiwcLWFEkc9BGjIqmFkTfgmhNMEizrxCC66mDcMfXs=;
        b=QHvQuWSqXZgQVe6G200gClAUcWeuOPqUqgQx7PNCO5aKoepqZzT/vGGWEoXDqmLRuk
         4vPPy+fvWRjpsX72pj4m+jnLIL3G3yBG8iQ62OM2OHZHlrsg0CI9wwLW/qnw3R4e31+h
         qcO3uNz7Bmksodddztq3sUuEmSkpla6IKi8ZyIXakBoKNNWKqWFVgCtjivcyRyOcpf0p
         P/sFhAJB/NyoSmmP9GRgnkRcw+asbNJW5pPUWv2YAjq0OtSY48vLtcDTuels0L9Ej4gP
         7bTtHjhuvTIJu2ZwQ3TvGHbI/BeEB2skgFoVB9LpYBHwqFHZpJAt+LD80UO6Ywkp8Qyi
         k1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270852; x=1793875652;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgiwcLWFEkc9BGjIqmFkTfgmhNMEizrxCC66mDcMfXs=;
        b=HLneI2yhxzqtuVzyBLga2N5p+TNOFdYwC89RR+tflkOEa26XxC1Nox+Ng4oLxgYHWm
         6MV/JRtLo/vyW2amlGiGzOmSGUskFs5JdGuncaW5pHic2dSwBcHYQDX6bLnYiSVSItw4
         MlxCST2SZ1ebRDPV0HtRRHZ9TrEVa12Jl8DNhjgAVyyCxUymJWNr9Qy0YXfkua1dKMvx
         BAesH0Bs1TbES4rVXsc2BaToKgbaklKfmsg2ILfS2HcVGZ5SYBPpYRHUfN64DbL8+Jl6
         4CEh74ZOyESfq/mhVaZqcYTt80msxk4176Ync/39jKFrILsNVEzbwutdIV1TSNI14nwJ
         39qQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyPIY/inPB6U9FNbDFY0EXs1w6yi+vetls2h2q1OL2LNYDU8sO1BjolW08xNzJBn7SoaUM3kLSr9ch626yudCS@lists.infradead.org
X-Gm-Message-State: AFq9FYLL4RthhvGjc2VyTd1EtJanV4sd+i/RDlu7ZXPZAxvOxWZ/Sqyw
	NNT1P4yT/aufxMTT7FfC4AFZ4cHq0kQnrXOanXD2+KCu+a6C8vJPFwP0JGi+lIO+wgPwZOjPdBX
	GvojgNj6kfHDTTsa0ydAGHbcM5b6QsSjy9Nr8zmd4bJXZ/EX6Dx2sHPO6ODTpH9Bgm4Mo1enzVn
	RG/Q==
X-Gm-Gg: AYBFou0E9BoLeH8ufcZojr2ilO0KIHc0Tvpdt8IFT6yMHbtTyV7/7ZqXNvHf3ZXhU1x
	27HtrYXDtuLrPeuP5vbjAbOYWukL5g+aL1rqas6Z7agWALbtoi3+EYva/HZyxK3Ln0vr0itvYaI
	Vt/7lNLFYa4STQLNqB5zSORfCg5rgH685IMOkoMZZFOvV0P+5dlXBBtzXkqry9senjTsrZmwEKr
	E5BkMQAfOUzxDVV97B4OwQ0YBD+rgM40Ig9sDdBL0IAt6FtZ5apbMgi/iV7g1YkVKwuLUKQPA6C
	Ky7/z6pDftwEnOUPJ3GN29jvx1oSLf9buRpYNBE9zLU8Vu0IjlZZEHVgzXZcaHItFqtdA7PWagq
	doI8+GvbCut+vvdRFZdq9dX8VYI29V+deRjffN+52lG7wW4mqRPxWaMBLeLKVLmZpgaKysypkpt
	R2pje1zG58YCfIu3CjAmIbaQ==
X-Received: by 2002:a05:620a:29c5:b0:93e:561c:5bce with SMTP id af79cd13be357-94408cc4177mr732143285a.55.1793270852170;
        Thu, 29 Oct 2026 03:47:32 -0700 (PDT)
X-Received: by 2002:a05:620a:29c5:b0:93e:561c:5bce with SMTP id af79cd13be357-94408cc4177mr732138985a.55.1793270851575;
        Thu, 29 Oct 2026 03:47:31 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm33612971f8f.54.2026.10.29.03.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:47:30 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:47:29 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>
Subject: Re: [PATCH net v5 0/3] net: stmmac: re-apply taprio offload in
 __stmmac_open() and stmmac_resume()
Message-ID: <auMkQUigOy-gkXmg@lore-desk>
References: <20261029-stmmac-est-fixes-v5-0-85b830a795a9@oss.qualcomm.com>
 <179327019639.3327.12142593314341295904@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S/8J51uVc0oNbge7"
Content-Disposition: inline
In-Reply-To: <179327019639.3327.12142593314341295904@kernel.org>
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae32444 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=jeKYxtEjmYGD5WCmXysA:9 a=CjuIK1q_8ugA:10 a=GyJ7KGb24Wf4tUF3bmIA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 8zYWhdN3DfCJsJJPRuXUvSLj9uzKOT31
X-Proofpoint-ORIG-GUID: 8zYWhdN3DfCJsJJPRuXUvSLj9uzKOT31
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MSBTYWx0ZWRfX8m0BeXbrRPv4
 xRvYJbmvmzzvomkOf3VHF8Z+aHCBVgWRNvnnoJxX6bFVcW6VS6an9hFBE42HosInyIu0o7DD90L
 Coz1yE6y8GbfJPtSEb4GgN/Yr2rUfaEn5zt2V3Jtbiz3OFHD29/dLmu+cmEefzMexT2c5eajmGY
 BlfOht0OMU8iry2bK6+QapYZwNIHaG3T7z2NE18Y6sYgYL9OnEcXrm2ZYOQj9V3KTOQ73oEd1nc
 P9rtCoqkYo/Z0/6JBvX55CGDxxmkZ6tGZWlAvHlPZWCI9WYkjHTlK8thIWxBit1fW3/5e+SYumv
 GDzKurlnqWqEuCgkyzm5ZtIm+J6im9vA7Gl9EPb2/aVTiz1pGL0/a2xGOqciHwmqmlUEnPXP8Hk
 nQTR4CAs03jYmLfFeS+Y63uRlC8iCr9Pcaj3aMAzH9ECAMr2PPOQKxrJZVQ36ZTh26FPZtfZSbB
 6vP3ewdAVKypi3RGRzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MSBTYWx0ZWRfX78l6tAywpQil
 Gnm9bIcmRsLL8zTLYSWpJJ0VVY2dUk8avW0Zc9+4os9O+EhCzNx3mtamVZo47v6dibvgahtUBdd
 vJNrTO8SiUqdolhpyKSG9lvD6v95K1o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_034734_485418_5EA70BCB 
X-CRM114-Status: GOOD (  24.30  )
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

--S/8J51uVc0oNbge7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 29, netdev-bot+sinfo@kernel.org wrote:
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

This is a real issue reproduced on a Qualcomm rb3-gen2 baord. Flipping the
interface down/up the EST MTL configuration is lost

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested the fix on a Qualcomm rb3-gen2 baord.

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

--S/8J51uVc0oNbge7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauMkQQAKCRA6cBh0uS2t
rEXIAQDUS/tjzpfvhs+2vPuoTrHqPDKx9gNvQP0LMjR1EeK9HgD/SdNaGfEDpwlx
7815m6JJi4PS+5bjnGJC+iJ/VxseLQ8=
=eqAR
-----END PGP SIGNATURE-----

--S/8J51uVc0oNbge7--

