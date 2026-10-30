Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B66F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4WP9r2Bn;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCHkCNGf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9fAEa1k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rQqAjjFnrAFg1/5l+3pgQ8JrQXRSksXXCKCV2WK0j4o=; b=4WP9r2Bn/UZKQ3g3YiY5muE/ao
	v5aDjwupk4WuK87w+AOezD6WAJ6YUs8g21mLjLuOeCdezmnYsZV91iUWx+oMmRGOiU0DD049RwtmA
	Mbrd5Bg6wf1GRZEm5CUtlmdCa2xvNbBAqMcAAgZEJ1CP3FnXcDi8ftNQY3Z4nlg+fJeAae2GLmEro
	upN1gThNGuaIq1WVaQyszhrDC2UsH8dR17Gy6HgHusidCsKm9DfC+kbb1NOJ0sYEWwfGtfd+2Z0eu
	bQeZvE1+uX8zBFHfCEK6YZhkiKivzzcb3hWA8vHpNgvJLAeaORMNnGQ4Ok4D3kVt0JbGDDdSUu8Zs
	bxGNuwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlmp-0000000BgbI-1ct7;
	Fri, 30 Oct 2026 12:32:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlmm-0000000Bgas-1mae
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 12:32:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG8GI3719548
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 12:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rQqAjjFnrAFg1/5l+3pgQ8Jr
	QXRSksXXCKCV2WK0j4o=; b=GCHkCNGfmbNNJjSHkVyyxURW1u7Wzc/Wm2MtFr8F
	mnIhv2WWR6NYTnRHkZ/grOTE6esHEj9SQdNnkreNf5NtADxww6qjKZqHUkofExKv
	tJp8w6o242AQCI5Ndu/sulPY5KwSuZ2qNzmwyjay7LuF1qoJIWM5rU7JJo4fpFGn
	CT+bmjUEYAWWMauwZ/94UNJV22uP5aL6ZRuGqFw6PbeGmJKA1NasvN4Y7MQSqYN9
	fiGmSbIYvht5V28cytcEvXU/XHBB7gL6qdIErJSZjHpRNY5m+Z2pJA2dQMK8QMAZ
	BIRc5OTfmxulMcyUaIeYJr1wEuB4qM6FZZoQ+yWKsSttJg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qu072-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 12:32:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c84af45c8so14307996d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793363560; x=1793968360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rQqAjjFnrAFg1/5l+3pgQ8JrQXRSksXXCKCV2WK0j4o=;
        b=b9fAEa1kZdE62teOMXgAG/sqKWf+5GhNoUu3UP6c2rL7nJyt+CIfbebMH/B9oohDos
         lBfLTb27QTp+S+RcdIJ9hH9UKN4hTfK1L3/amOGMYzR1vSIzIz+dV8HibTRaOU7VBsyJ
         eInmxXq9sDtsX7eKtj0/uizXcIcfHSJHTdFWQhTgW8X1B1V6IB/JqxtZs/QQTVaEJ6Bx
         TRhHb5Hk1gb0KEpeiQWBDB8bfS6C9KQRwrpX8GHmHMyPRdDFW2gTVpTAQiUVFGXglugm
         0Gqp3Vmu/pqm8+GgRLxaCP3AcBqF5uMK+YWosl0N4ko0TisQTcg3d/4YFYzVeruWjxeQ
         wrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363560; x=1793968360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQqAjjFnrAFg1/5l+3pgQ8JrQXRSksXXCKCV2WK0j4o=;
        b=FrS8mnXgCUNOmzCdPY86XnSkce6EJvgpnf5ZHb4Rr/in9fHu+njJ2A5J4SHB+bh8lV
         t7Cg0vGkB2XY2EtcFoFVsdlvXymTQM3sMRYNu/KbWaBAhiND828xdEVZ1Mvkya+HHMuF
         yvejmevRY+6V9eDjUPr29l/6Gr/ivtsaOsiGoAJBRlp7tr7UUbL6TMX3m3XPELFOQtGW
         76xKzW4cPx4VluDqLDgJuNcuEfMmjiA+2DNibtyIwzbLQETJmH+pGPRdFWy4k7Jjafgb
         Wc3ZKMMwDhC15BAY0yvKrRZVj5RAc+AK+p4G3eCDEzujW+5tfwjFgrANgKQFP9ZmhWZW
         MDhw==
X-Forwarded-Encrypted: i=1; AKwUvBzF8JA+JuJQLrEyYfXvUsOak8Jna2NKMHUr+yDtqecuqh6+9ltXvSwVviGydy6OOAJzR7qUxlbLsJ6xBgeUeklc@lists.infradead.org
X-Gm-Message-State: AFq9FYJBrwNWRzURQA9PM1hMesvXDzryyT2Jfxys/xXQpySo/zTPuPJD
	S25X5OQFc613hOH61UtW29NxW+OHk07k5Wfv2RoKMSih1YWYzF/hKW9PTg0aC2MvTAfbIBmmccF
	JvxOzMoksF2PXn8/R8Cc4B7hCz57YSGr40znuaqxjpVbERv7euJGjt5tm7RD1PtYFy5OHJx0Zex
	6TMw==
X-Gm-Gg: AYBFou1HNbUdy3Sr8r1Q8g/G0uE2Xv7/BjpKlwVquYKSaKx5rdfbGAPW6SEZchsGuYw
	uYagvxxbDWz7ZCaSkAqKUlAs+5aQpmYIAfTvVPFkc+F6eVyc+4y0J5EvkisJVO0B5oQ4PhPdybQ
	b/FbQmUM2S3mGuiiRNQ3WthJbER6tgXECTIh1jpQLNtgsP87+b/1hzootJN5JqUCvrUlo6QYSfk
	IScY9puvLELje4/Jcc7azY0l9OL+uJIiyPShmxwbcRaSDASbfNIUMvmXsBHUM7wm1lK4PcGDzCj
	gBFbVUuOe1PzLTEK7h/LfbSNvjrWw/QuyByh83KUjoxbgI7GDMla5RNGDKXOKIS4YkRYdoGmAiX
	PJPAhYnORTWW9XdWCQq+VdZjf9Gyj4qXVmLX0YqvglmiO4cvOzJHCCBX8DURD73ezk8hcR/9rU+
	HiZ0QnKWa3NquUP3PA38MqvQ==
X-Received: by 2002:a05:620a:838b:b0:93f:5593:5750 with SMTP id af79cd13be357-944216ee79emr335402585a.17.1793363560105;
        Fri, 30 Oct 2026 05:32:40 -0700 (PDT)
X-Received: by 2002:a05:620a:838b:b0:93f:5593:5750 with SMTP id af79cd13be357-944216ee79emr335394785a.17.1793363559439;
        Fri, 30 Oct 2026 05:32:39 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm136475475e9.7.2026.10.30.05.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:32:38 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:32:37 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
        thomas.petazzoni@bootlin.com,
        Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: Clear DMA errors for multi-channel
 interrupts
Message-ID: <auSOZaH_Hu6caTSH@lore-desk>
References: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MiK4MvEZXEgqTADb"
Content-Disposition: inline
In-Reply-To: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
X-Proofpoint-GUID: 5h1djR5h1IFiSj6DYidW71-m-yTmqCpx
X-Proofpoint-ORIG-GUID: 5h1djR5h1IFiSj6DYidW71-m-yTmqCpx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0OSBTYWx0ZWRfX2j1QsplAoq6g
 NHp8WpXjJ5h8LzHeXNNvEJjvT2mBglpZH3e9FigkpwWlEwLzO153Ts9WMx8FHXgzTeVHlLvvw7+
 cv/Op/rJUqrqS3d7rhL6L8dT4Z9bPByzwzw0aMb9qbOey86ejz00aeYWH6XMVESwyk8bQRs+nV7
 ZsMoQ/nhWjt5bDl6ulvz/9KAYTetft5ApAB19IbN771+hLI1/DrvtiDuYfm1A8FveHkQg1V0sVE
 PcYsaGlj1XzcV1uz4GiucTZspk7j10gDiVDdLv7NphgUilPDnqF///pHix/Y+PeqRKPyM5Ditqx
 rSw/800DIIFclRNJSbsraUMAdJ2q9/kHdFb2HIMmrXU+ZKsV9IuAtEQRhRCknFz9MDaPRyjwqmv
 Ag+7uMuIJUjctXhOtoq8jXtTGkZs3M3RqoIJS5zpVRJ2vj/EjgsRxjTcFZo8gIvnG11FuDrKYAA
 OxFYILJ9luGRQiU1uTQ==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae48e69 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=TdYLlOzfE9KcRv6nyNQA:9 a=CjuIK1q_8ugA:10
 a=4nU4Df6lw9LS-X-cepgA:9 a=OIgjcC2v60KrkQgK7BGD:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0OSBTYWx0ZWRfX3L3JAx/xLyGK
 Y+C49HxggjdbMW+WdVUqit/4A1itSQ4347PCDl58BXUytdp8FX3wc+eMM3NqE52MmUED2jcvbbw
 kFqQrDCn9/v0MqbIlTSwt1VHgrzRzoM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_053244_894835_731CB31A 
X-CRM114-Status: GOOD (  33.82  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--MiK4MvEZXEgqTADb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The Multi-MSI interrupt handler doesn't clear the DMA error interrupts,
> and this leads to interrupt storms when one of these interrupts starts
> firing :
>=20
>  - The RBU (rx buff unav) which triggers under high traffic load
>=20
>    This triggers easily with iperf3 and small udp packets, and shows
>    when running the netpoll kselftest
>=20
>  - The RPS (rx process stop) which triggers when we stop the DMA RX.
>=20
>    This one shows when restarting the RX logic without doing a down/up
>    cycle, like when attaching an XDP program. The XSK kselftests
>    triggers it.
>=20
> Let's make sure we clear these interrupts for multi-MSI cases. It's
> already properly done for the single-chan interrupt, and for that
> introduce an "ERR" DMA dir, as we don't want to touch the RI/TI bits
> when handling these interrupts.
>=20
> To avoid duplication, the DMA TX error handling is factored out in a
> dedicated helper (in the same commit to ease backporting).
>=20
> Both of the above storms have been found on dwmac-motorcomm (YT8601),
> and are triggered by the xdp.py, xsk_reconfig.py, xdp_features.py,
> ring_reconfig.py and netpoll_basic kernel selftests.
>=20
> This seems to only affect dwmac4, there's no multi-msi mode on
> dwmac1000, and on dwxgmac these interrupts are masked as of today.
>=20
> Fixes: 6ccf12ae111e ("net: stmmac: use interrupt mode INTM=3D1 for multi-=
MSI")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  5 ++
>  .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  |  2 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 46 +++++++++++++------
>  4 files changed, 40 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/e=
thernet/stmicro/stmmac/common.h
> index c74bc7c9750e..a972bee66504 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -382,6 +382,7 @@ enum dma_irq_dir {
>  	DMA_DIR_RX =3D 0x1,
>  	DMA_DIR_TX =3D 0x2,
>  	DMA_DIR_RXTX =3D 0x3,
> +	DMA_DIR_ERR =3D 0x4,
>  };
> =20
>  enum request_irq_err {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/n=
et/ethernet/stmicro/stmmac/dwmac4_dma.h
> index 43b036d4e95b..a7caac3c98e6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> @@ -173,6 +173,11 @@ static inline u32 dma_chanx_base_addr(const struct d=
wmac4_addrs *addrs,
>  					 DMA_CHAN_STATUS_TI | \
>  					 DMA_CHAN_STATUS_MSK_COMMON)
> =20
> +#define DMA_CHAN_STATUS_MSK_ERR		(DMA_CHAN_STATUS_AIS | \
> +					 DMA_CHAN_STATUS_FBE | \
> +					 DMA_CHAN_STATUS_RPS | \
> +					 DMA_CHAN_STATUS_RBU)
> +
>  int dwmac4_dma_reset(void __iomem *ioaddr);
>  void dwmac4_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioadd=
r,
>  			   u32 chan, bool rx, bool tx);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/n=
et/ethernet/stmicro/stmmac/dwmac4_lib.c
> index a0249715fafa..02aa1a3dd1e2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> @@ -150,6 +150,8 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, vo=
id __iomem *ioaddr,
>  		intr_status &=3D DMA_CHAN_STATUS_MSK_RX;
>  	else if (dir =3D=3D DMA_DIR_TX)
>  		intr_status &=3D DMA_CHAN_STATUS_MSK_TX;
> +	else if (dir =3D=3D DMA_DIR_ERR)
> +		intr_status &=3D DMA_CHAN_STATUS_MSK_ERR;
> =20
>  	/* ABNORMAL interrupts */
>  	if (unlikely(intr_status & DMA_CHAN_STATUS_AIS)) {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9ded31150fbe..2068b57df8d5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3141,6 +3141,16 @@ static int stmmac_napi_check(struct stmmac_priv *p=
riv, u32 chan, u32 dir)
>  	return status;
>  }
> =20
> +static void stmmac_dma_tx_error(struct stmmac_priv *priv, u32 chan, int =
status)
> +{
> +	if (unlikely(status & tx_hard_error_bump_tc)) {
> +		/* Try to bump up the dma threshold on this failure */
> +		stmmac_bump_dma_threshold(priv, chan);
> +	} else if (unlikely(status =3D=3D tx_hard_error)) {
> +		stmmac_tx_err(priv, chan);
> +	}
> +}
> +
>  /**
>   * stmmac_dma_interrupt - DMA ISR
>   * @priv: driver private structure
> @@ -3165,13 +3175,24 @@ static void stmmac_dma_interrupt(struct stmmac_pr=
iv *priv)
>  		status[chan] =3D stmmac_napi_check(priv, chan,
>  						 DMA_DIR_RXTX);
> =20
> -	for (chan =3D 0; chan < tx_channel_count; chan++) {
> -		if (unlikely(status[chan] & tx_hard_error_bump_tc)) {
> -			/* Try to bump up the dma threshold on this failure */
> -			stmmac_bump_dma_threshold(priv, chan);
> -		} else if (unlikely(status[chan] =3D=3D tx_hard_error)) {
> -			stmmac_tx_err(priv, chan);
> -		}
> +	for (chan =3D 0; chan < tx_channel_count; chan++)
> +		stmmac_dma_tx_error(priv, chan, status[chan]);
> +}
> +
> +static void stmmac_dma_err_interrupt(struct stmmac_priv *priv)
> +{
> +	u8 tx_channel_count =3D priv->plat->tx_queues_to_use;
> +	u8 channels_to_check =3D max(priv->plat->rx_queues_to_use,
> +				   tx_channel_count);
> +	int status;
> +	u8 chan;
> +
> +	for (chan =3D 0; chan < channels_to_check; chan++) {
> +		status =3D stmmac_dma_interrupt_status(priv, priv->ioaddr,
> +						     &priv->xstats, chan,
> +						     DMA_DIR_ERR);
> +		if (chan < tx_channel_count)
> +			stmmac_dma_tx_error(priv, chan, status);
>  	}
>  }
> =20
> @@ -6466,6 +6487,9 @@ static irqreturn_t stmmac_mac_interrupt(int irq, vo=
id *dev_id)
>  	/* To handle Common interrupts */
>  	stmmac_common_interrupt(priv);
> =20
> +	if (priv->plat->core_type =3D=3D DWMAC_CORE_GMAC4)
> +		stmmac_dma_err_interrupt(priv);
> +
>  	return IRQ_HANDLED;
>  }
> =20
> @@ -6500,13 +6524,7 @@ static irqreturn_t stmmac_msi_intr_tx(int irq, voi=
d *data)
>  		return IRQ_HANDLED;
> =20
>  	status =3D stmmac_napi_check(priv, chan, DMA_DIR_TX);
> -
> -	if (unlikely(status & tx_hard_error_bump_tc)) {
> -		/* Try to bump up the dma threshold on this failure */
> -		stmmac_bump_dma_threshold(priv, chan);
> -	} else if (unlikely(status =3D=3D tx_hard_error)) {
> -		stmmac_tx_err(priv, chan);
> -	}
> +	stmmac_dma_tx_error(priv, chan, status);
> =20
>  	return IRQ_HANDLED;
>  }
> --=20
> 2.56.0
>=20

--MiK4MvEZXEgqTADb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauSOZQAKCRA6cBh0uS2t
rLt2AP94/xq3HXI972oCxjUn64hJJfAqS/VqduknEbpg04vgCQEAoFB4EmEfJdaY
5GXrYPGGorHqDH29hb7XSJ6BbhpAnQI=
=yMqN
-----END PGP SIGNATURE-----

--MiK4MvEZXEgqTADb--

