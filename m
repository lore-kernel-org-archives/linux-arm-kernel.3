Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92C1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 06:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BNPCVEG1;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XW2U6fPE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i+s/PLRi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K5N0tp6NIiHbYJA78yp8UEG2k3L5MK6OnFuRMDqwAEI=; b=BNPCVEG1Bw1NKYkm9ofkCm/xbO
	6MXMLyXFG/guesvswEroEK4Q5NhoN02BjfoyV2vdF2AQg+t8mBf24pybZE8JnbRHQn2jIY8+Stsak
	npz9tcN7V+1Qu+hcksLfQJBsHdAsbGHP1/5s7RgHzXM5dWrPZ4uwa+SuTV49W9OA6C1gDSsASsLQx
	YWkJCMGQKF/URnEA2NPfyDsV66tA0PL+lMC6dzRHLYg57IaIK/Lv3KEJnRn1x8JEZX5vVYTt5ehX5
	d4YoZHFe1zu3ErQkp2J7JZKsM9UjrhLAUnPLhTZgOqZBTrY17YUtn9LVBPQZpRuuSrGWBaC7RFGUN
	hMHgNWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLwz0-00000006Owt-3K7a;
	Wed, 28 Oct 2026 06:17:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLwyy-00000006Ow9-2Bxs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 06:17:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S6Aa2d327544
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K5N0tp6NIiHbYJA78yp8UEG2
	k3L5MK6OnFuRMDqwAEI=; b=XW2U6fPE6C4yHQ2co7/P93VyMQJKxwrPo2T4NQ3q
	oTvpJ8ah+XpqWFUebYTjh/EPdByKg7ZP0WGr973GUIT2m8ZdKa//XBm8EUSTid/D
	avgTP1xxBrhGwAnXxyjlnwnPy/L05el8TPmxSsDllxIn0C7Pj7m9KkeXmbpY5On8
	KmXD3pwRJr5LrnxAjD3ERtYU2UD6tm4SsIrLHJn0GtwTLzj2uZL0zug64wC+ZTrX
	8kdRoyH/bs0OYLNtBcanKnRmuboxpVDlntnaaDBps0WeWHdzGRgalsFuLKHs1BR0
	EP/341ip8E90ZJwhBQtnHeqsz0m07uT/hdMSm7BP3d2smA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw80u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:17:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso489237a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 23:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793168275; x=1793773075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5N0tp6NIiHbYJA78yp8UEG2k3L5MK6OnFuRMDqwAEI=;
        b=i+s/PLRi0RCBORWqS3aI0kdjBCG4Q3RbFZhGuAWs3wl93mdfJlckEetDZfcelFCwui
         1abtQissw/l9eepihvqlg+5NkcztUqAXM6Ql1CFCkJdbeDksgB1QH5KMTdOcP6T3oq8u
         7Z2tartgejdxA7DrPnndHXxzYjXkcrk5lKh9fnpqhNejjMt5HZX6lLquc1TucgF1yV58
         hSngRkuBgU56h7NE3iegpoiWzb0UzJ8/YH5GQMHHelvItf7K6jtY675EJr4NZToTZB4e
         jpQZbIYnJo7s+Msw9+vNcUSD/w/8NZmcbPKrHyBhPioQ3fv7p48Rb0l/RT1PrhmwThj+
         Sb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168275; x=1793773075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5N0tp6NIiHbYJA78yp8UEG2k3L5MK6OnFuRMDqwAEI=;
        b=Lk8gVlXMbd4AY5ZVKz3pSEZqezUNmuRSK1DgBB4BM0XK2So6mmcxA6yoJzT4MsGE6d
         SanCpKsABixYQ2BosebyYysmSNkKqw9xLp8AO9+wRaoTdLVj+WTMr5UWf42PIjf/FuUH
         98VtbBC32DdvZ/RCv7fSALx5r5TGY4f9p1t2qlfjA3eHH6Ul5S0jO0+gHaOOT1EStBqN
         gCy8gakl/+nVLy/6D+2ygO6nViGAnw9HILIlnOK0+L7jgOwUC7j8qbu8zgPz4b6RaHtC
         eMeE9ITyvZ6TAoGZAkgjV5bkcs7jkj5tR1F/NFv/S7QX9QPQ2uXdnwMRcedOS4LTIHx+
         5xmg==
X-Forwarded-Encrypted: i=1; AKwUvBwy09oS3lTHT1L4qy+q4oeVbkRCBEege/LgMunfa31QUiqnFNP1zNRQ6ce445HSitxWOyHZR7yTDIOvCNCc6bUU@lists.infradead.org
X-Gm-Message-State: AFq9FYKZ5MRdP/YBCVgrEEPXyYCL4h7F0wprncuDt5jhP2EYH5Xt8FLc
	uzG1EK0cPavr1OYl/KWd8ypmwkEVwIoWpVz2heVOJAqnWjTCFMOw9dYlZXeSOmVZz++LB4toOP6
	41xULV+MiEXrZ4AROrHPWY0pfu7avNU5SSqBpweaqoNGbBq8YDPxEO8Qp4C6K3UeRFgpJhioGgj
	5H+DyB9iCuzg==
X-Gm-Gg: AYBFou14/gG+K21kX8Y1gNoZJWHzBHFEgAsdAG52IWhv0xYjmJlETGAeb/p16GZXBk8
	Ww6SL3WeRzTFxJCKeLAnlMtHYfhyXslQcCjrJTN/fRPx//UBte+2pnRS4EL7B0yXh3FUzrNRsZE
	xydmtg8ArUMpMXlxOb6SPpnB3th+AsAP4byjCQTk+TdCe1OGpn1cHFCm4/m4y/vrNPaSukfLRWZ
	vcMEYSUpXOpLFuAWyko11qHaPzvxEh9shs3eQveQRuBEi4SvudxNLUjbNcxd7wxrUKVvOkui3Fw
	FYf/IMQrRQLcHC5R9iKv+u5IKOBO23fvo7IpCGPAjGxWrCY3EZkJ6sb3QQIRcyJH8KqGp6r8K4w
	0u+iHKrFFVxHZXKLLQaLF1bm7Tx9kKrZgoq7kt78aPvbnt5Hc2gUiHMwPnkusQnYwKz74rdW7xK
	Iupbq+
X-Received: by 2002:a17:90b:51cf:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae57f627aamr979107a91.20.1793168275410;
        Tue, 27 Oct 2026 23:17:55 -0700 (PDT)
X-Received: by 2002:a17:90b:51cf:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae57f627aamr979099a91.20.1793168274988;
        Tue, 27 Oct 2026 23:17:54 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a944acasm1441431a91.7.2026.10.27.23.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:17:54 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:47:47 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
 panel overlay
Message-ID: <auGTi2SWAeT8fg/Y@hu-anantiwa-hyd.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
 <af0cf1d5-3b0e-4534-8a85-e373834e2f0d@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af0cf1d5-3b0e-4534-8a85-e373834e2f0d@oss.qualcomm.com>
X-Proofpoint-GUID: jVT4uI5ZhRSu19UZVfMOl1NQzQpyYzfo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfX7+cobOPGK7+x
 J1IZxeqqwAiUS6STFcXCBGsPZfD+LtXIKVp6Jdt+tHLdW1kw84fBZ9vwD58Z2PduvS/erxfKVNT
 v4LO4BIc18JKjtcieXA75dQjGzNBfdI=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae19394 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YnGuxi4p6G6sd6deudQA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: jVT4uI5ZhRSu19UZVfMOl1NQzQpyYzfo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfX5MRQfbHeh0pB
 IfUQ+hIlRK0yyXejdT0Fq7Apqj+KEiWa4+rOXGNOD9WABq9nftWf78dR8WW4L5DkCfiFlcb6j0a
 3/qAA56fT57xGPJb/N41s+o8cxLa4Yj023SHZP5ksQ5TX/zRELb9Q8zliZ8Cp5MT+f0lhu3op9i
 919j3W5i2wZNra6M1nA8Mc+VC12dSFOkTaA6ynVhzDQ3TvfR35nuPDEf/f0Fzksc7vd2CWBBkWf
 Tnevn2oVCsustJsG4sfML3PIYBd4en8qk94WRjbZQem2jGEsPqZL8Hi75JtSCSNaa2VK/O7kSkr
 IZ/6I39/I48Qi0cHCTRQctYRPaF86XYEFLBsjmn94WzhP6HLM22LwZWx/oZN1JhKnbqLHnRqqQ6
 69BBLR7apC/qX/gagUSA75buQ85aR82LVrvQbuipzBGRQxhNeV6EIF1Vo9NYHIMxm40xe38mRqz
 E8LVX6Xj+YU+c6zeFvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_231756_567203_EE93B030 
X-CRM114-Status: GOOD (  15.37  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:06:09AM +0200, Konrad Dybcio wrote:
> On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> > From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > 
> > Add a DT overlay for Talos Lyra EVK, to enable DLC0697 panel when
> > DLC daughter card connected to DSI0_B2B on carrier card.
> 
> [...]
> 
> > +&{/} {
> > +	backlight: backlight {
> > +		compatible = "gpio-backlight";
> > +		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> > +		default-on;
> 
> This is a little strange, doesn't it come on as the panel unblanks?
>

I verified by removing default-on and it is working. we will handle 
it in next revision
 
> Otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

