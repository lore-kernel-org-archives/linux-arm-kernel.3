Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD0AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgvU8svwebeSekgWfG8Ih62ER31eTU16D7J6+KvsOhU=; b=vnMLi74zpZmGd8IkrLLx3f0YCD
	NOVRl4inOJurVg90Uhq78WJ19ByqzO1Vd0vkAg24HldDCQnaEpMTPyzd0SUFOq1perannVcxsNwqY
	TFFskT8dTaMNRGICRjR16v+bmjFxMLByyehK7js2YmUGW4ymBfkr/LnMhG+1bC0XGtVOlPtfmutAq
	/u0KzultAZgAL/kfqrrj8PekyzauvWcQxWJdu/BoFfqPKYyClHd9AL60CREilkTiH9bov7s+Jzctf
	mLzK0snuJ1ihkYGJ1qIV40LH/c3ADEAU25uHjXSBRXQ/3YJDLiXITazdPayPt6Zx0YUoURqD3M6zj
	ETYY76uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVwx-00000005s1A-3kkI;
	Tue, 18 Mar 2025 12:21:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVsK-00000005rJC-3Aj4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 12:16:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I90TGX004534
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dgvU8svwebeSekgWfG8Ih62E
	R31eTU16D7J6+KvsOhU=; b=gKwHanguLb3HGoK43kNjG4r5T7qWdF1y0X2DCVhs
	rZn0l/6NI4NnwmCaPtQ2gchz/47PiAJ58GHQtgiKKI9JPEFOuw6Gc9BSpXVkvySU
	RJQO0XhMmzVs98l1MDe5j+yT2r6tnrHRAwAZcFzIrtbIe3UGTkhV1l9DL32CcukW
	swG0WUvF5QJZLHG+uN+WNyo+QTGxc0m141HOOZaQIO3MPE7LOzVHatCZ/Dhm+Uti
	OTW7TiPYbHtWn91dHFgnXEQs69tCCB+rw3jmwKQu0NUH/U+/3tGLFDPb0v7ET2BA
	rQZSZNk7qEn0NllFMaznEc3K5mNI01XY/7o+pRFkBozSfw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbt9ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:16:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f64eb467so53982316d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 05:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300211; x=1742905011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgvU8svwebeSekgWfG8Ih62ER31eTU16D7J6+KvsOhU=;
        b=sWGlpNstNDvENHfHW+d5BzCrlw65H/wwLGimfu3MbEd8uXPJy4aVvrJWTY0rC7I4bt
         DyVVzflrWrkJAqW0YlLLuAbHxbdVg/ZGaLEjL7+JYt24X6eIZSo2Sy99P256NwW8QwDo
         o9mt6WeZGeBxL5og4ldiVwSu10JtU+mfLy0IzD1kAVMvKCH+ebvktKT5GZsRQsIufxnV
         CsntGDtQkQxSnn5ZwXzfJuGOuwwFxHpbcv683TkeYqZlZ2WJ8haCcfZEs4TdpTq66tYV
         P7UgopdexM281TAkZthhrto6qKxmU1jcd7HwduzfQg4KuIeq4Yu2nHEOwsCs+5zSzll0
         sgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSPdecKvRCLESZLl91XvbE/d4q2ZOJBVEkkVM3iQDfqjuWQGmKT+c9D3K3NzB7usOKBHFojFFsPCuBXkDpddeD@lists.infradead.org
X-Gm-Message-State: AOJu0YzVD805NTThkMtUXb0hMHuHUSZtIlid0PCf1PMulEKqab5pTG0Y
	9BYdhBFcB3dy6+tGqjo/jV4f80Ba4ia98wsDoB7Z3dVW5Ok3aG2oIfBwGwr3AkVmsyAkHO2NUvV
	Xvl3BycbsEgkIKFxqzYK5SvOBn3kN5wc1gNeQ9bb8iHltM7S/I5AriOihZLiqP5kv1RVmJQFmXQ
	==
X-Gm-Gg: ASbGnctujqkwtmxePbkW5pYWvgpR+WSTop64sVxIsnynOtKAEnsJiOZlpgeFu3dF+rI
	oCOCBv9nOPvFvsBhb9dUEgO1spek0NiiXQvpEmehq1vCWaHHIoiH9XBkyEbG1lnav9CPd2OlGRi
	yksWDGM64xAxiRLko0d7eDejqQ6cJGcFteWOlpqCejo9aGPIANTiKMvBgoLqtYiwIatwOC5+dtv
	QSG/b2qQPrn4xi1ceOYpM2vJ306oNi8iUkXHH8obVRV8FJy0Upm3Y44I3jDyQXzMD9n18S1brZt
	DM8IR02OE5VUhGcvmUC5cvCObHm6wGcwR4S07NWZQiLUahVXFqtIR3N72aQzl9HcbXG6a17xDE2
	s8/Q=
X-Received: by 2002:a05:6214:ca3:b0:6ea:d604:9e49 with SMTP id 6a1803df08f44-6eaeaaaa3d0mr230068386d6.34.1742300210845;
        Tue, 18 Mar 2025 05:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/QbW51i2QEA7DNMKYUIPNpOuBwru1TWa+7+ZdqHkmL4IbrVh78rOti4S492Vx7r0OVx87UQ==
X-Received: by 2002:a05:6214:ca3:b0:6ea:d604:9e49 with SMTP id 6a1803df08f44-6eaeaaaa3d0mr230067926d6.34.1742300210482;
        Tue, 18 Mar 2025 05:16:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f117b8fsm19530991fa.63.2025.03.18.05.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:16:48 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:16:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/9] dt-bindings: display/msm: describe SFPB device
Message-ID: <t37wdbwkbuyb5xn2lsdynp7on2oujvojmjkba24t4lqxuu64vl@htfidrpftxx7>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-2-655c52e2ad97@oss.qualcomm.com>
 <20250318-adventurous-cherubic-coua-eecbbc@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-adventurous-cherubic-coua-eecbbc@krzk-bin>
X-Proofpoint-ORIG-GUID: 24Sj5Avz5vbBA-mzf8VQCZXJqQ5D1TIz
X-Proofpoint-GUID: 24Sj5Avz5vbBA-mzf8VQCZXJqQ5D1TIz
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d96433 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=JDiau87qNJ9ckCeAMI0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_051652_917429_04FA50AA 
X-CRM114-Status: GOOD (  22.24  )
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

On Tue, Mar 18, 2025 at 08:55:59AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Mar 17, 2025 at 07:44:37PM +0200, Dmitry Baryshkov wrote:
> > Add DT schema for the MultiMedia SubSystem System FPB device, which
> > provides several registers to control interface between multimedia
> > devices (primarily display) and system busses.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++++++++++++++
> 
> Filename: qcom,apq8064-mmss-sfpb.yaml
> 
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..7ca105c97edd2f305527c58ae89b9b0cf22d3c8c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/qcom,sfpb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm MultiMedia SubSystem System FPB
> > +
> > +maintainers:
> > +  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > +  - Rob Clark <robdclark@gmail.com>
> > +
> > +description:
> > +  The SFPB provides several registers controlling the multimedia attachment to
> > +  the system busses.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: qcom,apq8064-mmss-sfpb
> > +      - const: syscon
> 
> Why this cannot be part of standard syscon bindings file? Looks simple
> enough.

Ack

-- 
With best wishes
Dmitry

