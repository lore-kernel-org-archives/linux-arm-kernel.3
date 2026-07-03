Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69027C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 23:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSahybJeUk4w63sJ9vrP7jxxk2JxoTxAM8oSmXe9jj8=; b=F6oikasSvoYAiZEkRv1fcxRrod
	62zr0LMW5owxVaIhINOFPcKUGmABbr4ILGlRYFUBcmjBSRgpeyi9dqcyEsbkFXUkCzh4PpXj2rETG
	oSb1lB9JssJMKm/Zo+AdAK3ScYhfJ+5V2rCut8GPfG1m7Jj0EDDm3hO5AbAjIXLo13wPuyLrhJniS
	zVhS7+Jt+6qn6OzHnxnn2j+wfqISS9u7mZ8qSHMzRZu3gdmYCWTfUrFkkfBsEDguS9YvRVUQSED7K
	UgCzaAtykUqI/jtP5cEOUU0QwLAfQHvFPvc4a4TkC+tsNoy1KqYhNYAVzmi7ptXSBc4+y26rBJCSx
	fzs/hhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfn38-00000007zpB-1Teb;
	Fri, 03 Jul 2026 23:11:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfn36-00000007zoo-0QVQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 23:11:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KQ0tJ1021049
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 23:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSahybJeUk4w63sJ9vrP7jxxk2JxoTxAM8oSmXe9jj8=; b=pziJtIybqcXIcHGY
	16uqYBUx5N/NQcu3RbmzMBy7qXMjMyRWnQnW0e+YAIzOO+/jIi2ZjOFdlZsUHK55
	MJtpBpnIaIsWphbHLScDa2McSQ6HH0IH4yK5eIn+0pTfNAZd4ibOGkecXIRnGMr8
	2ijq2jLz+kq9hb4PUwWsTAwX1Lh65nMREjjMqqNd3O7PyRCVk+5HOL/nmZiESBN4
	OtUEEqNhKVY18F+dgeSzsJ4+S3mywjbF43heo7nJVt5DD1hzNbqK6QlsAY/kSpr8
	E1gWIEN95XAGB50G4MF8OpxOcHhttAAvTJhhkdpPeDwOF58JURaMm7BEjwd21/GI
	kq9Tvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkhr0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 23:11:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso84996585a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 16:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783120314; x=1783725114; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iSahybJeUk4w63sJ9vrP7jxxk2JxoTxAM8oSmXe9jj8=;
        b=VqL0g+X23YMhqXpERaM8SoRDlyD9rb+guD5xBhhKjDtyDsOABJAduvkFsPo+RfHIfD
         InJjHSMbaMZW0hZRh92FbdrAncF8/gW8/LEotrHnIJqYPSSsUl7YR0k2i7GH/He5qkpT
         pf/V4T2xMo+b4kEk01AvF3dGk3V03NPNMy/jNiJ7RiWYD4Z/SghuTB5O7gW7QjN6QArZ
         v3DcSumMCl419TAW0sS7IwOHPXKWpmhJEJkt5lUqeo7HyIH8QZIPrQOoCKJxq8OkWVZS
         H+xEbyaZJ0WjYZ8PhlG6kINcq9lxWMXwPiEZx2Q7Cqh0hQYJ2R4mK/jstQ3adbrjEFYt
         yIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783120314; x=1783725114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSahybJeUk4w63sJ9vrP7jxxk2JxoTxAM8oSmXe9jj8=;
        b=mPT4YVMb0SfKLrupH/pHsyzDLCgIDYZDV1pv67LSAniKVREz54ezbKe2Cd/KQGrNJe
         DC0ED+NLKy2b4K4wPeIz6JOs/kxBU9Y1ZkLMv9C68b6qyJLnErdtoatJQRHSJcqw+iQC
         4AWzW2YxvCkTppZB06+qjFzSnWRBwVmq2tj6vB4HGKCGhPiF0yfTkz/hMP0jp7jp1LoU
         IcPCfUira/ltGC0MXJhU5btw/kAZ64HAZbLOsF4jHdbTikJeP3XmcI5+Q9qz55SzlggR
         z4kdZvPifz7fM14LneYgQLOh8srU94/YvigrmWe+obAMQgevOck4LeRPvGruQqCB/31O
         uclg==
X-Forwarded-Encrypted: i=1; AFNElJ93hpfLn9ZUQ1MjvnsydHnTZ4xsmDIeBOm7d4LnOQjAMKPKu7le4Iv3l25gTKyfpZY0X0lSn3Fnp7+0FMjwoxmn@lists.infradead.org
X-Gm-Message-State: AOJu0YwmAtKcn16maeqcAapdE6ywwd56+5DC2xwsKEU833ibgfz/QPnT
	le/1l2eUGphneKyjtrCbrA4r1Ax9yCejE7uB2pZtC0bwXgKA7i0M8CbEcDI59d09ynr/+5+W0O/
	XTvZ4IbTkW0oe9ln9pA+iyPXnm+MW1sGyo/GaMroCPboL3YmwT4NgzXHM/c7u431nFOv8auXq8x
	LtpQ==
X-Gm-Gg: AfdE7cl9b/9l+d+E2/OGsC6YmP4yKoFZmuQ9GjHhLOKz23Fq5uCUzNV/cbh+Qa+Fm+f
	NFp5sppPfa5+6aJdNNvF3yTuOYLU10/Ps2eX7VBoQUEovmJGkgYfG9urlV317OqBXAKP47WFBzX
	IixdS6uAwv8dgzAP83xiR2ByQTx0Bo6h/i/Qb2y5nhKY1LuC5SmvuJ/pFdsz5Lc7r9DDoSTUcn8
	atc6bIJqIyKjdGOckw/QCVsG7nekiO5Z9TERuITSDxB7VkjPZxXw6X0EPaQDLxtDeLKCigWw9Xb
	0Gf0CpWkxZRnQIiTlK/uBAusYUd9YfJK3zC2SRA+VGg1lGXOONuVEzF2lj14K4ybVBF355sL4xm
	VujW2rmwW/T1Vop3j0c9dEgua/Z/7TOYMyW7r82y1f63SyjmkhkLVRFdQ+6ECmVgk/BEX8j6X9C
	u1b3miiplhwiKsri3aF723/Thh
X-Received: by 2002:a05:620a:372a:b0:915:9125:e652 with SMTP id af79cd13be357-92e9a481185mr196239185a.48.1783120314143;
        Fri, 03 Jul 2026 16:11:54 -0700 (PDT)
X-Received: by 2002:a05:620a:372a:b0:915:9125:e652 with SMTP id af79cd13be357-92e9a481185mr196236085a.48.1783120313712;
        Fri, 03 Jul 2026 16:11:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfdf2sm835345e87.58.2026.07.03.16.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:11:50 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:11:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/9] arm64: dts: qcom: shikra: Add GPU cooling
Message-ID: <opgj6twppqwhb77itqelmyzniaifcja3wdazyzeal5axstr25g@a7v634mnimbm>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
 <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzNCBTYWx0ZWRfXyG//SVlRl0H6
 R02qJ3BpgAOX88R8zo6O/uDwL8swfAKiF+8D8XxXisRNPaFay75h1tLY5/3WROL5ZjWTx9C9wnm
 Ypd1otl1MwoQwpDVmMIb2PmiFQVbuAAyat6kfM0iCHtFvQwoK3Od+0iyUph9SpFCr/0yS0j3vLA
 o7c145NmjKG8gUuTGoFJc6HsMUUisOJmrNOhVyVpZOv7CGZGps60gLf3/kku4T6KZLhH0xO656+
 c7U+yUFsf+vO5P8ZkSlXo/rw7m/6rmHQCjH23Yal3UWA9erc89idXdwiRoZlkVXatnDBrq+EjLy
 Z6jg+IN9HwDUOfIUZqCnux1b3QKmZrYa/fcSACypVUgzF0NXJcrRaBC1wDbIRtGmMNIqfjdS7Dz
 080CgCSXgwAjJf1CC77wRORuCMpLmQctkBaVRm/vPmSYytlio/sM+wcO60up8dz4tqMDtwAdH3p
 izCU6oFd48upHF8ouGQ==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a4841ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=fEDeFOH8jy0W6kBJ9PsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Q-8Mh4Pe3Exli_CVsy-OpLpfECb6DQXC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzNCBTYWx0ZWRfX4YRr/ZeGUwpL
 pIV2mo3K93nte3itZ4KG8d7Qd4PT5MU/FofYXRAUtscqeT2zrk0ly11yTkF2X0vpH2aJK2Zn2GN
 Fx3+xB2r+TDtlWcZXwaDqlkLrSb3rg0=
X-Proofpoint-GUID: Q-8Mh4Pe3Exli_CVsy-OpLpfECb6DQXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_161156_322294_4030884B 
X-CRM114-Status: GOOD (  18.31  )
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

On Sat, Jul 04, 2026 at 02:04:32AM +0530, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 115°C.

Nit: 72 chars. It looks really strange to see two paragraphs with
different line wrapping.

> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 34261221664b..eeeaa369d3a7 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -2510,6 +2510,7 @@ cpuss0-critical {
>  		};
>  
>  		gpuss-thermal {
> +			polling-delay-passive = <10>;

Why?

>  			thermal-sensors = <&tsens0 6>;
>  
>  			trips {

-- 
With best wishes
Dmitry

