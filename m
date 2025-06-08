Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBEDC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 15:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZg6uov4M3COUU/cAjeod0ONVmFRFP7In1KT2LtVH5c=; b=OO22vOK6UZvoJyk7ucyul6CQU1
	QNrkzHzfApesVEAoa/YWtRL3StzEmPvDDOcpHvkeKD2CSy4yMPyP57E1zd1+/QwNg+bOTFcBTjuLw
	yRx29lSSNGa+I3Inv+u3jdxoPe3mmDiAGC8HgAtDoVZBYG5h6eqdEjz0MOR+Re2oPD8Q2GE3NqTkB
	M8aYwIGR6x0b/MyGB3aOUuDDk5zxHAdk8M9AKDKkYYkXj02F4nQDVFe8J3Vw8b+ZleVgJp3f2uUj8
	qgJNLlE3ecD3dWVNGEf3w5siijsByPrmhFRr1VcLMVDm0dFobcW3MA9KbBaAALY2vQgQqohervRH3
	91NBrpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOHgV-00000002jih-2S6g;
	Sun, 08 Jun 2025 15:11:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOHeO-00000002jc6-1e4K
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 15:09:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558Cr3fH032735
	for <linux-arm-kernel@lists.infradead.org>; Sun, 8 Jun 2025 15:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZg6uov4M3COUU/cAjeod0ONVmFRFP7In1KT2LtVH5c=; b=QiCoVzmtOQGUjWRl
	KvbzAgMg4OkzYlkppjTxMBmsoTwcFjEqOxxluJY9kzVfEFAcS4/XbtlQn2wnzEdX
	2FPbyv4k4aOhQrqm7Xhu4rVVxpkXYrFHSGEhhPYTTOA2p8Gh11AVC0g7gwa9u7Ey
	jGDD/efgrW63QJA75+mFclI+gGIO0lJGPqbU0FyHEzSHmQxGxrPT0gObyfyMEkT8
	Ny0ORRN4suBnqVna6TaKiIua24aPLUBNyFa+gs2S2UzyMz7/Fz182/YDV+xVPYlz
	J0IkxAJF2qrT0J4ity+mIEetpb8RhyVsKLjBVqoNBoDNy+Pyi66IX2xs8OuRZI3R
	VhzrEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcaxw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Jun 2025 15:09:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f876bfe0so681155085a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Jun 2025 08:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749395370; x=1750000170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZg6uov4M3COUU/cAjeod0ONVmFRFP7In1KT2LtVH5c=;
        b=phnXOqZ4eWk9zPSLVk72N5yw6dix+nV2LWqB2E1qtwajMeIvqJ/OAUmzwPHhH2lhtg
         trhkHPOdTd4tI7Bdiuje5hfZnsvSnsKjzheYAcF/ny16dLQKYU13FHruq/KwnE0x+LAv
         R+pOlfmP7GANL+xRL2lwU0ejzjmJqTc/E24nHSHBMDPEIamFyesygVn8yuiokI8okQVm
         4S3Ag4vH2zMFagGGbkgldU6T228w6jbOP5DjhKSveSO1ghlz3bQsQd3cSbiiNrx1XSqZ
         s7SO31vcQfJExVW4Hp3hC2blmkMniw3shHhqpTB64x8FeURzMTcOe8lp2ddzuhiY4DOO
         rJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCUwFeZpvPVgf4vixbY3oSOosQacThqi+NAFmALYohz/EyyO6tzhe7PjMIQLFd/mEt2YIu27he2Nb/RatU3Xmvim@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0RxXLSpMG6a1dVJ20JD0FKfAJRvqI7nV6A7gyHL3H6Ssr+0PA
	1NG9htKOKVLfATK+p/1HuOJCndhC5i9rzOIrQ0MpZoZhfvnP1R4MJASJIiGx010/ndcsJUFfLja
	UcU97QN6No/pCPmLmQhX4JZ8Bq3kv4vE6CJfX6duJMWXaEsuEvzSpPh8XTI+Y3GLi9UPyjWOoHd
	4ZDazV6e7U5Q==
X-Gm-Gg: ASbGncuFIOF8wVjhQekEU7XqCLO8bd6+SGus14u5Piw7IcZXh8LgYmQrDdOoi6jnZfG
	D8KTiSKJ2mUJVRUVnz/0EtHkHELqCXFWlWyIwUmpy3I51+m+mJCzXO3zhpLwiMWtmQEmbJ/qBOS
	ZU0IDUKBeD7Qvisz3W1NegFGKv5KgYQuKwBnvraEqlLUrPaHqLbe7rACGj44eqGFZZwg7g07KxB
	GQBRYsHmMvqvoaWD6v8piiUYQhdN6MycjaeB0yZh6XacWfpas5y5LMZsVdIOLBWxWTYf5qF2FKj
	YtFLUkKEUBOefyfOMz1uLCpQKqMQgiX+maJsyLr5kgcyS/eEZqofuqOH9E+JLcwCpm5sdobaYtI
	1vVHDQ64Zmg==
X-Received: by 2002:a05:620a:454a:b0:7ce:b9ed:24dc with SMTP id af79cd13be357-7d22986ec74mr1503743285a.23.1749395369651;
        Sun, 08 Jun 2025 08:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWojoQQKm6zmBmTfsN6DQaVIzipmhF3tAmQHC4y9/wG04I+Q+kLtPPteL2vns5BpTi9vfIOw==
X-Received: by 2002:a05:620a:454a:b0:7ce:b9ed:24dc with SMTP id af79cd13be357-7d22986ec74mr1503737685a.23.1749395369172;
        Sun, 08 Jun 2025 08:09:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722289sm792024e87.117.2025.06.08.08.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 08:09:28 -0700 (PDT)
Date: Sun, 8 Jun 2025 18:09:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
Message-ID: <rwjc7zkitubi6cdre5a7owmo76nopavkgifvvn6yq2mv2hrth4@bhwbodchd2gx>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
 <wayrour74vlli27xrtxi2ff2v7q7ye2yknmk2mjpur5ry5gruv@hhh2mdb6lw2i>
 <CACSVV03X5EyAb5yCPDn1ot8vOFV_dKG7f6+yO5t9srr31AiUKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV03X5EyAb5yCPDn1ot8vOFV_dKG7f6+yO5t9srr31AiUKw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyMSBTYWx0ZWRfX/56o8u6IiCsc
 u8Yh8WzupPc5gN98O1bT2rEHd34+FFWPw8fmD5MgUAltoWqcwpL2tAY4clCfmr3fg/VcA1DTy/0
 ZEUTNcrRJC172LkbZueqXEJthfVMONayVqrKFV4BQc/njpRmv7nQMU6OpcJScqsUZPSE4l6vzZR
 L5CT6Cq8z0iknnOeV4u8BaRJ04AMpnW7Th+7DeMtad/S3Uu1MV+dsNNwc/f8EtY4SOMAFdWiNQM
 a+3Wxis7C7SlL2snur9yPLbakN0vGnMMoOlFK+RfbHctlDAa/yK54J2OTeagx1OJ/0qMLIiWHIA
 TmJrFdopaKiL0UeMu2zPWvA2UWBNv1XhXXb85wffYSFe5pDhxpDZ/BKsImkihWp830uIMjZl+M4
 6gb8NJSfqUFrkRr4ZDDk2fAqm6W2e4108JygLIczGm7G25CO/c5S5EFbh9u3EqIRgiWSorKR
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6845a7ab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NEwny6fml6yhTjldVekA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: FAZlggCGEwtvPNY05YLg0N6xkW27Adiv
X-Proofpoint-ORIG-GUID: FAZlggCGEwtvPNY05YLg0N6xkW27Adiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_080932_438761_06EEFC45 
X-CRM114-Status: GOOD (  25.78  )
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

On Sun, Jun 08, 2025 at 07:10:11AM -0700, Rob Clark wrote:
> On Sat, Jun 7, 2025 at 1:17 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Jun 07, 2025 at 07:45:01PM +0530, Akhil P Oommen wrote:
> > > X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> > > version of Adreno X1-85 GPU. Describe this new GPU and also add
> > > the secure gpu firmware path that should used for X1P42100 CRD.
> > >
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
> > >  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
> > >  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
> > >  3 files changed, 131 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc901f461384dd9b0d4 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > @@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
> > >                       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > >               };
> > >
> > > +             qfprom: efuse@221c8000 {
> > > +                     compatible = "qcom,x1e80100-qfprom", "qcom,qfprom";
> > > +                     reg = <0 0x221c8000 0 0x1000>;
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <1>;
> > > +             };
> > > +
> > >               pmu@24091000 {
> > >                       compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
> > >                       reg = <0 0x24091000 0 0x1000>;
> > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > > index cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af83078253fd39ece3a0c26a49 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > > +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > > @@ -15,3 +15,7 @@ / {
> > >       model = "Qualcomm Technologies, Inc. X1P42100 CRD";
> > >       compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
> > >  };
> > > +
> > > +&gpu_zap_shader {
> > > +     firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
> > > +};
> > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d43647888aa6eacac3de2ac9d 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > @@ -17,15 +17,134 @@
> > >  /delete-node/ &cpu_pd9;
> > >  /delete-node/ &cpu_pd10;
> > >  /delete-node/ &cpu_pd11;
> > > +/delete-node/ &gpu_opp_table;
> > >  /delete-node/ &pcie3_phy;
> > >
> > >  &gcc {
> > >       compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
> > >  };
> > >
> > > -/* The GPU is physically different and will be brought up later */
> > > +&gmu {
> > > +     /delete-property/ compatible;
> > > +     compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> > > +};
> > > +
> > > +&qfprom {
> > > +     gpu_speed_bin: gpu_speed_bin@119 {
> > > +             reg = <0x119 0x2>;
> > > +             bits = <7 9>;
> > > +     };
> > > +};
> > > +
> > >  &gpu {
> > >       /delete-property/ compatible;
> >
> > I think, you can drop this line.
> >
> > > +
> > > +     compatible = "qcom,adreno-43030c00", "qcom,adreno";
> > > +
> > > +     nvmem-cells = <&gpu_speed_bin>;
> > > +     nvmem-cell-names = "speed_bin";
> > > +
> > > +     gpu_opp_table: opp-table {
> > > +             compatible = "operating-points-v2-adreno", "operating-points-v2";
> > > +
> > > +             opp-1400000000 {
> > > +                     opp-hz = /bits/ 64 <1400000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
> > > +                     opp-peak-kBps = <16500000>;
> > > +                     qcom,opp-acd-level = <0xa8295ffd>;
> > > +                     opp-supported-hw = <0x3>;
> > > +             };
> > > +
> > > +             opp-1250000000 {
> > > +                     opp-hz = /bits/ 64 <1250000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
> > > +                     opp-peak-kBps = <16500000>;
> > > +                     qcom,opp-acd-level = <0x882a5ffd>;
> > > +                     opp-supported-hw = <0x7>;
> > > +             };
> > > +
> > > +             opp-1107000000 {
> > > +                     opp-hz = /bits/ 64 <1107000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> > > +                     opp-peak-kBps = <16500000>;
> > > +                     qcom,opp-acd-level = <0x882a5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-1014000000 {
> > > +                     opp-hz = /bits/ 64 <1014000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> > > +                     opp-peak-kBps = <14398438>;
> > > +                     qcom,opp-acd-level = <0xa82a5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-940000000 {
> > > +                     opp-hz = /bits/ 64 <940000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> > > +                     opp-peak-kBps = <14398438>;
> > > +                     qcom,opp-acd-level = <0xa82a5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-825000000 {
> > > +                     opp-hz = /bits/ 64 <825000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> > > +                     opp-peak-kBps = <12449219>;
> > > +                     qcom,opp-acd-level = <0x882b5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-720000000 {
> > > +                     opp-hz = /bits/ 64 <720000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> > > +                     opp-peak-kBps = <10687500>;
> > > +                     qcom,opp-acd-level = <0xa82c5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-666000000-0 {
> > > +                     opp-hz = /bits/ 64 <666000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > > +                     opp-peak-kBps = <8171875>;
> > > +                     qcom,opp-acd-level = <0xa82d5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             /* Only applicable for SKUs which has 666Mhz as Fmax */
> > > +             opp-666000000-1 {
> > > +                     opp-hz = /bits/ 64 <666000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > > +                     opp-peak-kBps = <16500000>;
> >
> > This looks odd, why is it so high?
> 
> You want max bandwidth on max opp

Yes, but can it actually sustain / provide this BW?

-- 
With best wishes
Dmitry

