Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7A3606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3JacmNSu;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BsuknYPv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jKY1VXEU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bcYDRPzyHHMEv/pDR4h+hjr434XL94uQThpC2nQ5TSs=; b=3JacmNSu8VbfcaG2EnxuCbBTn5
	AnAoCzHpF3ey6W36pyA1XHj+2bhGnCwii0NUMNCzygQ5M1Sw3F6VYrkmVEytI4elui4wkKSbVs4E8
	S4uQVU45cS3nSV3pY49Vy+eVKvb2IdzmcELiQKkivSNCYGwiSigdc58hiOooxQ9RB/8HLWexRwCL/
	cVCSnhbD6uGD+9qzV1tX1gpxr5vxRsfa/HRGzxZlvM+yetOKniPgHXqzB01V66K+M98kYa8lkrXr9
	Dyq6KL/L5qEsqD1tzMYSAulsOw9PXeF45JuOXRzIdesAiC9kJMIqtxoZOaKzAoSuLeozMxROsUU24
	1BA+wveQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOElo-00000002b8m-0p9u;
	Tue, 03 Nov 2026 13:41:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEld-00000002b7s-1GpX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:41:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZHEu3612528
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 13:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bcYDRPzyHHMEv/pDR4h+hjr4
	34XL94uQThpC2nQ5TSs=; b=BsuknYPvWkJzbbIe1z590ijeM3b2T7J3/0ij5cgZ
	0rnhsw38ER2IaEilQDxD0QG1tG4kpQWj2bRyAbn/Z1p3/IsX0hBU0A8hbyB2sZEA
	kw5jcPMc+IPFplYRN2gfTVO+iAShtYvWIOsQUcdOHSYFenTIWeA7ur8i2Er9H+GI
	2J7ozGwle8lWyl3wqa+9tZeATzwSjHW51SmraQKCwyOyMNDGuE9U/Sg8Y0NZteyw
	V0uKTrrY9Hedxn3ZBW21ZDnBU5MemPuko2429Pk1Gece9258eG3Cyi4r+ZrZBCR3
	Xnw7c7AEJdZAXe1FY4uT3RLKRUzX57C1uYdqCYNYsaGWrw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9ag1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:41:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb71b1443so866573385a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793713295; x=1794318095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bcYDRPzyHHMEv/pDR4h+hjr434XL94uQThpC2nQ5TSs=;
        b=jKY1VXEU8vAG1mZMWQx4ph3iCwpHcIrdXhN811dYbqB2zbzhcJVeHwoTd3B45yI0ZP
         9K/xOGE5qxWDFiTZcNrTzZJEz2Erok74IBEu3XYEcf0j8r0JrnLBKZ9k8DXnD69cYV7H
         mB00KN0jS1hxH6+kFoODXoUDpSjT1xWNwn0JY2qAsIPgisFgtR9DJau8zn+ZVKuALl6Y
         R6wwTYLOz8WaIDLNkv1B61/7Ymbszsn8+xGQZVxSPiByUloGAntYx4csKQQNOG2mx4jp
         k/x3IJGV2SPNAoENk5XG0xFkrfLuBN32/931+ZQ1jfMffsmW5698ihNyFhxzP6D0jOZw
         BIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713295; x=1794318095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcYDRPzyHHMEv/pDR4h+hjr434XL94uQThpC2nQ5TSs=;
        b=AWnaWjaPYiPie02r3HtUOdzKxQV5Q3X5zrC3nY0RDU8KJzpMhySOGuyCrzAkg1nVRf
         aWshD1id3PhueI7ILh0DrfFb/vF/+tqPXkfx2dj1i2E8uFHbc8ynY0mmqhkEeUoWFiRp
         GK3bChlpppHGdyr3AklNltY/9zXJ8LrXuvghtVWM7pkHhgVShrUcGIca/Y/Jz0DrwMwE
         4BRFkCsHIRWQWlmdDuYhoLYzndF9tyoh5PQXWF1m6pBRwEY1rsr+g5xW4C1tQsS+VJsJ
         JSBEaeCA6y7trphKjpynRQimTyzwIcp0KjWl7LQ9L/1ISoWOpgERHzqbNsPvJtONoDfa
         gXWg==
X-Forwarded-Encrypted: i=1; AKwUvBy7Dzq2Hfy8ZVLzfFHBDfhEiPHg+QwLmKnY8q/ABNu1nrwA+bKKWIvuGARZVpRBWVISY3JMte3br4jzSJyENbBG@lists.infradead.org
X-Gm-Message-State: APuU4Z8JU3+LnplXdLOYgPYKbIyJr3K9NADaEa3Eas4vWpyaoSPSMe02
	VauKDri/d3akAdNRLTAxOTHCjWZUD5uyUerYjkv4kPYec9QtFpjGTvCfAnrrQXbVb5wORNrtsAu
	CQqe+vpJpAPP/uDHdEHv68iJDcEnTtsVl+qUKhKS4+YkpTNia3nqP0hN/VuJHYfycOnuCmdguwd
	vccA==
X-Gm-Gg: AYBFou0hXWPVq4tmYsjvls3O71riEm3J8+WwqpSa2uNuLMRV41U7aTiFBIUC554fc+Z
	ZgDINybMJ3k7fxcgPE87HnBSAnSp/nWokpSxJnqCAh93l7kObNUPcDC9pRSmr9Ih6I2HE4V9g4Q
	KLyrBlchXZR5n5bl19JUIzD+g57K2+Z9u70T8kJj93d7iW5Q/8AM9z04sFIypzs/tcvrwA/KZ4J
	EXi7+HnniklsZgLGx++d/Ar4qR1nKJdUxEBJFtzvIOebQmgb4Oim/fuSocdD7YEFqXAKPK2FfGQ
	HerXxFd9pVkT95ohvIB+sXYEMjnmeKt1YJmbFYcNHMjXMvyGHNE1jboFgSCJquFZMzi6ZUxeO0Z
	d2FbZY62f68uxLk0Bt5zxiQgeBFEz4AMMdJC5pqpW7Uxtmm2Jb+yEF8aLvBA98Q==
X-Received: by 2002:a05:620a:272a:b0:93e:c35b:2332 with SMTP id af79cd13be357-9442184e908mr2122586785a.73.1793713294586;
        Tue, 03 Nov 2026 05:41:34 -0800 (PST)
X-Received: by 2002:a05:620a:272a:b0:93e:c35b:2332 with SMTP id af79cd13be357-9442184e908mr2122580485a.73.1793713293852;
        Tue, 03 Nov 2026 05:41:33 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09fadb75sm222751545e9.3.2026.11.03.05.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:41:32 -0800 (PST)
Date: Tue, 3 Nov 2026 14:41:31 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolai Buchwitz <nb@tipi-net.de>,
        Magnus Leatti <magnusleatti@kernelriot.com>,
        thomas.petazzoni@bootlin.com,
        Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: Clear DMA errors for multi-channel
 interrupts
Message-ID: <aunki9NNExOeLaAb@lore-desk>
References: <20261103125430.962715-1-maxime.chevallier@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VCchJjwU/KronfNG"
Content-Disposition: inline
In-Reply-To: <20261103125430.962715-1-maxime.chevallier@bootlin.com>
X-Proofpoint-GUID: HfILaCb3UNKWk2RY2PqQWPMOnRw1frmW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX1bEGxApffXFW
 Yizby8DHqrwmuZdss77Ns9VzEtplWgoUIoIbK823VchwMeeAGq5s1CmWBKSAuZ53ZfrWCS21e9g
 RU20SSZRc4x8wJDes8hajB9sU0Okey4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX7bA9unLiXFJh
 FQy8spVHsDUQ6ouyDTGbhp1+NFXjJ+fDjkTx+opaqqfRBEGS4RYqjS1WGJ3Na/2Yd+Hye5oJ53z
 ib06V0UZqu344iAZT+1QCZygWo0T2YVmC1cCZ3z1PJoM6qzzafkANR0YVB6fHxWIBWzkp4W8pqs
 ZTHg+6HNR62eNP8H4qYI+E5lgl+MP4z6NKpt1Qwsqqop1XnN47Td9J3pB4OjqsR0esJNLQRi0AX
 jhBQD9HJnmW09en8SxxMso3Jk6RvUFM1faTrGo43oVDcPplR8jSWvRRc1z7foFv/zD/geoRcOjt
 48/BHkKnSeBIQcXEOYcIEox3NO45d7xnCytB1SRIN0e20BNDYkaVe2MBOHn1KBJIKWpmS6JoJM8
 CUQKns78TN6tD63Sp4wronNZbOvOVaKYNBTqOARVF1BCzZXVmlZ0NM/jZBVZqZBxyy+5OE2hnuF
 bKwmaSzqP3TypaUiQRw==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9e48f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=hUCKMWOQsVhIjlt2O00A:9 a=CjuIK1q_8ugA:10
 a=N9U-9oHc826BwoMl2xwA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: HfILaCb3UNKWk2RY2PqQWPMOnRw1frmW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_054137_491239_9191720E 
X-CRM114-Status: GOOD (  32.66  )
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

--VCchJjwU/KronfNG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 03, Maxime Chevallier wrote:
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
> Let's make sure we clear these interrupts for multi-MSI cases, and call
> stmmac_global_err() upon tx_hard_error to avoid possible races with
> other interrupts/napi.
>=20
> For that introduce an "ERR" DMA dir, as we don't want to touch the
> RI/TI bits when handling these interrupts.
>=20
> Both of the above storms have been found on dwmac-motorcomm (YT6801),
> and are triggered by the xdp.py, xsk_reconfig.py, xdp_features.py,
> ring_reconfig.py and netpoll_basic kernel selftests.
>=20
> This seems to only affect dwmac4, there's no multi-msi mode on
> dwmac1000, and on dwxgmac these interrupts are masked as of today.
>=20
> Fixes: 6ccf12ae111e ("net: stmmac: use interrupt mode INTM=3D1 for multi-=
MSI")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V2:
>  - Dropped reviews/tested tags as the implementation has substantially
>    changed, sorry :(
>  - Discarded the helper, call directly stmmac_dma_interrupt_status on
>    all chans and use stmmac_global_err() for TX hard errors, following
>    sashiko's review.
>=20
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  5 +++++
>  .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  |  2 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +++++++++++++++++++
>  4 files changed, 27 insertions(+)
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
> index 7ffed295eb14..6360605ef5ea 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3145,6 +3145,22 @@ static int stmmac_napi_check(struct stmmac_priv *p=
riv, u32 chan, u32 dir)
>  	return status;
>  }
> =20
> +static void stmmac_dma_err_interrupt(struct stmmac_priv *priv)
> +{
> +	u8 channels_to_check =3D max(priv->plat->rx_queues_to_use,
> +				   priv->plat->tx_queues_to_use);
> +	int status;
> +	u8 chan;
> +
> +	for (chan =3D 0; chan < channels_to_check; chan++) {
> +		status =3D stmmac_dma_interrupt_status(priv, priv->ioaddr,
> +						     &priv->xstats, chan,
> +						     DMA_DIR_ERR);
> +		if (unlikely(status & tx_hard_error))
> +			stmmac_global_err(priv);
> +	}
> +}
> +
>  /**
>   * stmmac_dma_interrupt - DMA ISR
>   * @priv: driver private structure
> @@ -6494,6 +6510,9 @@ static irqreturn_t stmmac_mac_interrupt(int irq, vo=
id *dev_id)
>  	/* To handle Common interrupts */
>  	stmmac_common_interrupt(priv);
> =20
> +	if (priv->plat->core_type =3D=3D DWMAC_CORE_GMAC4)
> +		stmmac_dma_err_interrupt(priv);
> +
>  	return IRQ_HANDLED;
>  }

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> =20
> --=20
> 2.56.0
>=20

--VCchJjwU/KronfNG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaunkiwAKCRA6cBh0uS2t
rGlyAP9/4lNlgiouhiFLBiFnn00p1XBEQmgCE2YDorFQ6N0/GgD/WxuwNcrXlVbI
Kpjv1IOByUWMenAa0cv2atKZQJ1IKgg=
=mOzg
-----END PGP SIGNATURE-----

--VCchJjwU/KronfNG--

