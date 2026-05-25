Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057CBCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQBUQK+ERcgosuGR7NTC0wOZR9xugN2ow/YBjTyK1Iw=; b=JPg6UzyCiB2uBoDEp0Yt9m9R5U
	GKGzVCrOSP+J/zEOPi+hnLvqiMbsQKGyRGJ15HGLHCKbF62o0afG1rmxIE0My/sJrDR5XjEKLW6Pf
	nSxM0r8uaQ6Lzv4aRPGkXhqxChZIBpv+TKH4q6KVf0KEkwBfqqh96AgGaZUtVfbc+aJv97L9gtRVC
	kKjLU5lIa4ysM3ztSSwCZdl7Lw6L2TcyX1WECLzuIhhfBgM/2KVftcMyRUUNR8bNyZGH5OE6BTADt
	e4oTsyG9Xpx9w7pOd21rX8ARcz77ORujWoSFqC5HplPcBtX/Pfv5Rp3Y0C/kl+iYrp5djjTQ5cnYa
	fG8ULqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTAD-0000000H1cj-20A5;
	Mon, 25 May 2026 11:08:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTAB-0000000H1bw-0ryG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 11:08:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7SuVe961954
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BQBUQK+ERcgosuGR7NTC0wOZ
	R9xugN2ow/YBjTyK1Iw=; b=XVS+dLy/RFtu826qPtQMuxk+BHyD5ZXsASq4GYvG
	1UhkAaRZLGsZS1qqo60dlz+3TKh0TzAi0METbxd8pdlrtVv+XkxXo9f5XgSGEp33
	PQGy8s0G436YEymGx7nlWEQhA7U+E7r/zybdER/dTe/2pZCzf7KNSXOxQZl4uKVN
	xJDF6xqEXG5+TL8fkr8lfDSkl+DF7E2ZEie2mV261jkg9ZPZ9rIofjtsvYNYlr8y
	E8l0tHGmzbyVD+jAGNRwMc633sdcFVgqL0l77S8ZkdEtcWyrwwepctsdTGCdcHSD
	lCq4ZOYOv8UvfWLcXDDVr7mZapD3d47NCnF9OO1wxVLdxg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3eb0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:08:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95fc647f356so13932986241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 04:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707282; x=1780312082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BQBUQK+ERcgosuGR7NTC0wOZR9xugN2ow/YBjTyK1Iw=;
        b=jhgMgpOYJBq2QGxMblkZrypsMOi3FVrxZiJgp+OwfsUy4r5RUgqHjcXu22rVMd89h/
         q8XWaqn3j4TNrhp2jLgYI/Sr/g8W8rP1+PcPlGeZitjbu6VyXQmtTh46gbB8sIzzzeSG
         +nJr8yL1VsUv00Tr+kn1MMcI26OeBdxmeENVd0zTZo3SPj0Z/G/ox8zB3/oqjss93Q/j
         H4DH4lP0kih+zf30LCa9ZmKqXSVsuqrYblS5OyVhJBdolb+bcwBfGBoe0YZwvF66X/G3
         6WUNOrCje5zUkiR2FMF/eEzSmojcnb7gM1wR5wkH229y0ueY7GddnOFP2979eoeW/ciN
         eMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707282; x=1780312082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQBUQK+ERcgosuGR7NTC0wOZR9xugN2ow/YBjTyK1Iw=;
        b=VMoNUDb1PKBTo9GGHJMOeocyPc+gE+0yByIgQsNYXhIIC5rF+I6oZuyhjkd4uKtCgj
         q9vPPK3f8JNEoSCDc6j0nfV5ETiIpv6siACGZcq2rN57lbyoT1xwOVsDbCQ2WVQnDbQ0
         9cLAipRFvOnNyF00+5RzfPHU+69fsP/oeE5A33SbpEDbscisERIFTiVVA4xfLLUYn7IL
         fqJrDP8XVBbkv0Eq672ZYxz8Y52wyXq3C3V3t5jJv0G8hhU3X570AVMv6X72n7TSkyQm
         9IY4JQe5CxEDxArufNyJIUvVZlhLLI00Xlm0ZgR6efuXeDsdOno1+rT83QW3ikERy7XJ
         kkJw==
X-Forwarded-Encrypted: i=1; AFNElJ9vXg2ePryjmRyxjoRBIsUE1Pa3go3L2tQm+53TeOLN70YuKisWcX4O4ZAmOFVTOVBA7HvmFztsw2LqD1WOqtp7@lists.infradead.org
X-Gm-Message-State: AOJu0YxEQq9SjQirxLdJIO1/FgFTNNW/LflsUVd0fBfa11XjW1S2BlAc
	9dXL7rYHwhlin9QZKQhKtIzEbbp9An755dz+gfuqURtpveinRwnuqp1C4jARaiI9V+uP5SrYJ0e
	TQFi+s/X8vRwZkzcUsFLQTfY9Xay7RlbFWx23rVsYz/BrfH7savsYGksgDj51eZoARmP8g5Cveg
	JIxg==
X-Gm-Gg: Acq92OHf/UMG8Y4hK2hrO+A2e2uo0BDPnzqml40uLulyAqsZXt8ae6tTaJOkYFU1ZqZ
	NZfbr0fwiOqZsgvw0jyKLG5Chh/H4hABu/6ZBueKcRXzmddZ/K2JZYXVw7beqDKMxq4iPNDm9c/
	hqp4jMalLSfIBFHmrGG7gONGk2llSLt4xc/IeM9Uk8TLyjrUXDvB9D4gFt0s2DudWLur0BPdUYC
	+Fjto22VPgajmW7LVF8PzylfCr/Lq5m5+6ZJXKzBEIuebi/hyRQOJyWUGVT2+oJamdD9o8mMOeu
	FWHz1IyucWeT8SUP0nXei6NMdrFuixHdBFOdAdSvJbbb0/0czCQg6YtBF4CavjFnffXEhUu+IHR
	27bHQWNPYVJmQTkTqCGfOApnsuKR+kWNq+luayr4qjjWNDN+lIGcrONs35J/MsuMPWLriYiasPL
	VWrUnEZsTrDE1nhPeCjeouy+OPreU4IkRF850=
X-Received: by 2002:a05:6102:4b87:b0:632:d8d5:291b with SMTP id ada2fe7eead31-67c8451a9fdmr7416027137.30.1779707281657;
        Mon, 25 May 2026 04:08:01 -0700 (PDT)
X-Received: by 2002:a05:6102:4b87:b0:632:d8d5:291b with SMTP id ada2fe7eead31-67c8451a9fdmr7416011137.30.1779707281261;
        Mon, 25 May 2026 04:08:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf4f1csm2578738e87.70.2026.05.25.04.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:08:00 -0700 (PDT)
Date: Mon, 25 May 2026 14:07:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/7] clk: qcom: gpucc: Add GPU Clock Controller driver
 for Eliza
Message-ID: <kmscrht56ljnkntponlvzuumxgdm3d5s6ttye4hwtq3uaykwsj@z3pyzcib7pk6>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-5-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-5-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: d95i1QX02S4rBztenBCU5qd0OZzhh9tQ
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a142d92 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=whjPl3NbLinN2m9j5McA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNCBTYWx0ZWRfX80pES+/TwT3A
 +vckCPNMj0Ge/Ot9C3vahjm1MxlAEsnguv7nwawLxWbZZ9KpWXFA1qlg+SmxI22wug8G3vJUf2H
 f2dD0o0vxZdvAyM1JYNQaMjZjSG3lwFDaiQdMotibpt6cQ25h9aE/Kdk4USXOZYy1k9G1IP8dAE
 8Fee/PfGsHH3N07W/LoLii/Qdx7TuYwHLe6W8ZZbvqSOCXv+qX5hEMFcobberSEGcsvOZUWou5I
 dN+hVwgZOcfUfzgsLpse5EpqmT/zgslHMvauybG2nP6neFyH0JkwHxNF3dNbgaPkyWqYDu+Q1cq
 ofeHoEK2qp0w83kD+PIbbYUJLqavDA6Ey2wdKl+EfoQeLlrNTDFvSVF4bSTsKMWLurcymEp2l/Z
 g63x1l72yYbb3Ry/EECXhOCcfm9gm5iRtxFsJTaO9d98t5gwWdBAY7rSvgO4Vg+qHD0Rbpx5vP+
 a3e/J14uRshEwIwoB5Q==
X-Proofpoint-GUID: d95i1QX02S4rBztenBCU5qd0OZzhh9tQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_040803_252964_7363DBCC 
X-CRM114-Status: GOOD (  13.84  )
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

On Mon, May 25, 2026 at 04:16:07PM +0530, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |  10 +
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/gpucc-eliza.c | 607 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 618 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

