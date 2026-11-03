Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AZOX7mbL;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OWmJBZ9g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XCSwYsbI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=; b=AZOX7mbLPW76lU
	CP+CbNKivv2v/jLi7uNdp5IGrp+nzz1B6S2C09GRh+UuFFLQexVUC5XXjKOn0WImChsx7DaizyfG0
	t2miPquNCJGhV661YeCz0RdCNgUGjgrSPib+FFCPfJrClgOankGax9dhuLKc88lPHsyQUE156pvBs
	eAsiyrNQuoGt+ojem5d8yXiAs27Lp0791DHEqeNrCIJElM5DfJHhinHPloomeFUyogbcrt8wnbOeI
	6+uic7us5fUdeBNjC7RGF77/1mgK9vc5oY3qmT2WaM2HLF2PB6wbXTo07XH91ivar12v8hmK7xUbH
	Lr1GmyGEcIhLkGmNRLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAIs-00000001eN8-2DKx;
	Tue, 03 Nov 2026 08:55:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAIq-00000001eLr-0743
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:55:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38A4O94002807
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 08:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=; b=OWmJBZ9gc8nkZerz
	b1HG3TUo8MIzBBrnc4dE088yesRqksaRibt7o2ejR7EMPKLM7Sd+wr+prPDIZVwl
	Pv49uXdDmq2HLJMXKLwIKsL+mhOo8lJkCv4lGoLBRzEmzEeUP581zuX9q0KUlZD2
	zo+oKNv1sqaLORWJq1VbGjXIHmE0UTS4R5/AsES2rA4KftwMi6NcmdQUyurgGFaA
	2S8lf/Gz0dBh9bpxXBZbI/0Z+PTYEbDOvuEeu0QNPDDmxmfyp6lVSyXRCQd6+QMi
	cYe5cxo52UItq7Yv/2hPxg3PiCga9BvqtFeDnqs7EUGIkRbi6O9tX/WQvKQYPeS5
	CNW8/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ejuwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:55:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7cb9e267so46377576d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:55:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793696134; cv=none;
        d=google.com; s=arc-20260327;
        b=NXogBVcfOAufUcJdEHtl3nB3B0SzQoTeFikHcpcOYicoFEdkxP0OlNY8Lo9+lkmrV0
         xl327srl5TGxj5Q/Jx3Zetof2QGMicyfBaFbgc9W1QWKmEMp+2/alIANTuAVoT+xqHeK
         Kwn9TQsfCMR2JW+OQD7krRhsFnM/jt2wHPdKKSI/Unp54br8F75Atlf3cfaj32/Vy0EZ
         rf/WVx1SMf6RKiNSowc0AdwMRBfHaj4n+j19IHicL/7ZwZ4sZIQFsnHvx3J7WjuBbPXC
         Dp6g/6FX4V3NBW7B1HQtRm2iYZFI0IueSIDgu8vxnvXY7erOZkRr0f9oAnd4Ip5sddFx
         dVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        fh=piAurkCSjCEK1tTzSrCu6+rZIkA8MpokY7rnqu15H60=;
        b=CBxjBZlUCUkCZsJ4DaqUeGO0gpLrNsV7Ig0329s45ieHWN93YnG+3uJf5QBz+mKKYA
         rOaD19xh5eLGLDL5HogDrvNwIwin1X7CXv1bC5aYZ6BrLtEiiaWOO3UP2LFnhSv8LQR4
         gJk0R50ak8+rVUl1GYHG+8uNHAvJMDaHwL12Qx4ILDr3pXPJuPom5NYHuBo7NsogN81O
         NdjwWOyLWRGjj2qnRXx/OJUqhfm6IRaUXBo73rVKDFBD2dj3GaQ89gCRUjHtFnw7QrhF
         W/no9ThHOsqxlxVFUPRUQ9W6eEEjMIYgqvrOXpUVz13kDPFlQyDPTF0ud29Nfr2O8V8E
         /smQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793696134; x=1794300934; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        b=XCSwYsbIVNKPQdCaGnZQbG9iidcSqejP66LB1ahz5pgVTnW1Va160l4Z9cF/KhyqRY
         ix8ZJy/UWmG+FXZxCijSx3WO3l3dC6ePi+H0AYPNFA7WUI45T/iJNJIOGTR6+dslE7WV
         LrFvBBdYGJKmBQjQNs/1b6R6lnCdWVj+4cWvDPCp6H19d4AZudNJpmN75eQc3eR/BRte
         ab7/ikHegxHtnwKnbmSgYzgCIVG+FKebcDurlOGNZ/I6VBm0dJoRyozIIKVURGSdzHCH
         YlxfWjkDv7h59RA3t7pdRkB+SjZSKMZCr+ng8uI+QWR2DJIhow+Y4hZ186CDyJqyVoFH
         qczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696134; x=1794300934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        b=Mks+GHGIBcF17eN7CjYSVCo96Xq34zUjYsSXkCdZm6v7U9AQH8TGozZRz4ufsrMnkI
         ZU1dJnPFtq258gpUuFipIVDb++h+vehTPYJFGnmWGiIfdZn+cK5dTrII/1LWoGyv+t75
         X7Uy7+LlBO8jxacW97NOgSKxI/S2lQQrdK70w+TpQg4rfeiDpEKCW0Z6cqyGnkb+mKnS
         fZJ/lzzDIsgzkCtcKLMFOFh+A/3lId0IMgRR7sLFp+c+wi52iLltZ3zs5ONuRHDfUEgn
         dsrdFT1LiFIB4zEe3VMKxNL3IJR8XXtDuBjWQfROYFG2vrzscLm0l2vnYpOrwXoUNOnE
         qrfA==
X-Forwarded-Encrypted: i=1; AKwUvBwWyAwENAxxSQUI8I25ouIpJHE/byNAyA9QH4DaqAPU4Z4p5b1AAV3hp7Q3HZbYp/ehz5/E0PFkOCyVQDCKQc3G@lists.infradead.org
X-Gm-Message-State: APuU4Z/3ftoxkUGXlX9yYjW2JSKEiSxXuslT6MaThKWCb7ocToRyz7BL
	RlCa+sur+cZtaSiA0abQADQqVyyx2yYyDcBHgN6zWeEmzdDxZ/etrVGgjdsGoOReqodIPZE1xcN
	gVEs2JkxjyBARyFRcphXernAqDA6GMlTAyKJrnTxplPaX2/yTp+7ve0ak8EZqKSkc/H/Nh2cSb4
	5Rcp9CJTSE4eaO45WPT6oKc68XVI7mvM6MMlfDUW0i2c7kpmIf6JNJ
X-Gm-Gg: AYBFou318sz94qAApQTayUgDCNcOhbNj/JItptw7M5pAbSD27rSqsMJUDrCDBq3N8As
	Mn/zTXqfsqLorRrP9zUasaYCDjD2OOd8Oh2qEUu/3GIEs8EmqFXYfJy4/eQhn046Shk5uEp3KLu
	OWuuGj/+hJH1qoIrYxl7Tfj2OJhPFrbavVjgsFj4WQnxYvAFgwErRofxHxrH4ZFoBrTs51v4/16
	8HIa/eBBJthSwqx2AgAgqlnc4HToT4kggmLXKuDPYDJu1eoXXkx4Y+56QIFZ14RushRgXcnnJw=
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr2157958985a.28.1793696134264;
        Tue, 03 Nov 2026 00:55:34 -0800 (PST)
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id
 af79cd13be357-944216b1af2mr2157954685a.28.1793696133721; Tue, 03 Nov 2026
 00:55:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:55:22 +0100
X-Gm-Features: AclHuK8MJq-s56wdtunEmLoEql-aTRrOrw2wQVU5g0yE5nW0xqWZNoiPrAFZCeY
Message-ID: <CAFEp6-0CkkoT_xP+zvJ-ffVQnn2E-9AuiC0=cer-Cm1_s1dZ4A@mail.gmail.com>
Subject: Re: [PATCH] net: dma: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>, Frank Li <Frank.Li@nxp.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Li Youhong <liyouhong@kylinos.cn>, Joe Damato <joe@dama.to>,
        Arnd Bergmann <arnd@arndb.de>, bui duc phuc <phucduc.bui@gmail.com>,
        Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
        "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        imx@lists.linux.dev, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfXzj/3IBgZG+iy
 ioG1vfn/qr97ODV/M7wD6ol8/S/RZ78NdB7IxOrZe7r9ygNJU86naN6eI4wpOA9pH0LIEEMYPv3
 k9C/DIGEyFnd8SCpmWwNcYhqBJqV5Ku62oZIZEwWoDgHuxebFElAkV+CzLLdRgPovchKf1/ruZ/
 ck6sq3azxX7WSddoLOtO2z4p6i3ymmvPbxMQBThRgo6IJwsBHrQdl6pMOe+uIYy8LQZQeZAeOJz
 F1ekoQ0S6tRdUFlQ5jRVyM65avT0kENp3/m/UFyCf8MHgz1jtvqNj4ZKAWZ2KMj5Gbo3igvazPn
 KRPiBaqCLi/p3BtGdH7EpX8IuY+n92sazxsjKtqqoUcCbHDyA0JnJk9De/pZUjhADoWg7YP6ryL
 QbEgthMBTtwbSwYBqBS2L3FyIbAMxOphdpZze7oK0OB3Fu4xa9qgxOCX/w+e/sJ3x2bSFOdXZgd
 4eTcJrKHTKhozC/eTNg==
X-Proofpoint-ORIG-GUID: 8CElsktJBlM7tuvHaQ36yRTrU7QFLGRe
X-Proofpoint-GUID: 8CElsktJBlM7tuvHaQ36yRTrU7QFLGRe
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9a187 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=OV43vvX7PjCfZyRFssgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX2GaFvPrgyFCl
 G/Qp6ui7u68uvdtqksBPPizSMY2ThOzCz/Eqtw2AAWdG0KeJJMHRjxX+iWaZNKBFVLBhMgroja1
 pfbjX8n0FRvVb6yBo9xAfNI9zbEavjA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_005536_077102_C4D7949E 
X-CRM114-Status: GOOD (  20.10  )
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

On Mon, Nov 2, 2026 at 8:19=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across net drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c       |  3 +--
>  drivers/net/ethernet/micrel/ks8842.c              |  6 ++----
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  6 ++----
>  drivers/net/wwan/qcom_bam_dmux.c                  | 10 ++++------
>  4 files changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/et=
hernet/allwinner/sun4i-emac.c
> index 09b2abdfc9e84..d7ee42b2c1976 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -303,8 +303,7 @@ static int emac_dma_inblk_32bit(struct emac_board_inf=
o *db,
>                 goto prepare_err;
>         }
>
> -       desc->callback_param =3D req;
> -       desc->callback =3D emac_dma_done_callback;
> +       dmaengine_desc_set_callback(desc, emac_dma_done_callback, NULL, r=
eq);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/net/ethernet/micrel/ks8842.c b/drivers/net/ethernet/=
micrel/ks8842.c
> index f0d6bfc6025ca..c68abd4643e72 100644
> --- a/drivers/net/ethernet/micrel/ks8842.c
> +++ b/drivers/net/ethernet/micrel/ks8842.c
> @@ -453,8 +453,7 @@ static int ks8842_tx_frame_dma(struct sk_buff *skb, s=
truct net_device *netdev)
>         if (!ctl->adesc)
>                 return NETDEV_TX_BUSY;
>
> -       ctl->adesc->callback_param =3D netdev;
> -       ctl->adesc->callback =3D ks8842_dma_tx_cb;
> +       dmaengine_desc_set_callback(ctl->adesc, ks8842_dma_tx_cb, NULL, n=
etdev);
>         dmaengine_submit(ctl->adesc);
>
>         netdev->stats.tx_bytes +=3D skb->len;
> @@ -567,8 +566,7 @@ static int __ks8842_start_new_rx_dma(struct net_devic=
e *netdev)
>                         goto out;
>                 }
>
> -               ctl->adesc->callback_param =3D netdev;
> -               ctl->adesc->callback =3D ks8842_dma_rx_cb;
> +               dmaengine_desc_set_callback(ctl->adesc, ks8842_dma_rx_cb,=
 NULL, netdev);
>                 dmaengine_submit(ctl->adesc);
>         } else {
>                 err =3D -ENOMEM;
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 8a50cad1c104f..7e83c4b5f1931 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1014,8 +1014,7 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, s=
truct net_device *ndev)
>
>         skbuf_dma->skb =3D skb;
>         skbuf_dma->sg_len =3D sg_len;
> -       dma_tx_desc->callback_param =3D lp;
> -       dma_tx_desc->callback_result =3D axienet_dma_tx_cb;
> +       dmaengine_desc_set_callback(dma_tx_desc, NULL, axienet_dma_tx_cb,=
 lp);
>         /* Claim the ring slot only after the steps above that can fail. =
 The
>          * completion callback can't run before dmaengine_submit().
>          */
> @@ -1565,8 +1564,7 @@ static void axienet_rx_submit_desc(struct net_devic=
e *ndev)
>         skbuf_dma->skb =3D skb;
>         skbuf_dma->dma_address =3D sg_dma_address(skbuf_dma->sgl);
>         skbuf_dma->desc =3D dma_rx_desc;
> -       dma_rx_desc->callback_param =3D lp;
> -       dma_rx_desc->callback_result =3D axienet_dma_rx_cb;
> +       dmaengine_desc_set_callback(dma_rx_desc, NULL, axienet_dma_rx_cb,=
 lp);
>         lp->rx_ring_head++;
>         dmaengine_submit(dma_rx_desc);
>
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d64371..1479f8362e04e 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -195,9 +195,8 @@ static bool bam_dmux_skb_dma_submit_tx(struct bam_dmu=
x_skb_dma *skb_dma)
>                 return false;
>         }
>
> -       desc->callback =3D bam_dmux_tx_callback;
> -       desc->callback_param =3D skb_dma;
> -       desc->cookie =3D dmaengine_submit(desc);
> +       dmaengine_desc_set_callback(desc, bam_dmux_tx_callback, NULL, skb=
_dma);
> +       dmaengine_submit(desc);
>         return true;
>  }
>
> @@ -477,9 +476,8 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmu=
x_skb_dma *skb_dma)
>                 return false;
>         }
>
> -       desc->callback =3D bam_dmux_rx_callback;
> -       desc->callback_param =3D skb_dma;
> -       desc->cookie =3D dmaengine_submit(desc);
> +       dmaengine_desc_set_callback(desc, bam_dmux_rx_callback, NULL, skb=
_dma);
> +       dmaengine_submit(desc);
>         return true;
>  }
>
> --
> 2.43.0
>

