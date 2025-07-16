Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B030C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 15:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDf8cJibEjhiFo83apzBrmHpgcz1vDYMn9bRtB9wako=; b=OYqPEEhYLTDp90K3hq4NtYv4tr
	0bYDxNAyIcg5JejiPHQVkLdfwgpW5QEpO9ky+euwMuSoBaRu4Dy9LZ9yNflYqnSVUQO1jilfubFpD
	q5Eyj2iusrOc9yVFbOzKFoc4TtuJHpK9mpDPDPSzCJcDeEGZF6vqR0Ono5YhcWMMHwpWZqJJMi6CS
	MRQODgFRCptSwXsFOesQCBRYLa01+8o2mGJYHVhRmljPvZJzXpg2j7pUr8EAaqGwvmyvnZD3tS5xP
	p5cI2vJ0/RUz9Cdgr7FmyW3h0iF5hZmXIpbQIKpfm2F14zvAIyDVohWn2w5RBgw0xQnkm2oM0W71y
	K/nQp4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3nY-000000080Yc-0ivh;
	Wed, 16 Jul 2025 15:11:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3aN-00000007yEP-4BqF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 14:58:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD7pEY020748
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 14:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RDf8cJibEjhiFo83apzBrmHpgcz1vDYMn9bRtB9wako=; b=S/J9NI6+NVkFsLcs
	HyzjPCyusqVoUyOQhQWOgN30XCuBEKk5jTJU5Y+B3miL5fodY8U9LZQeELU1aApM
	VnZzSxcvy9uAKZkpdTWMcU3cky8nB1Eu+LZijxs1Yg+xajsblzBzy7RP5Q9tNFa6
	3HtV4uepI0W3Q/eQf23HGFl1hrc+YuFbNImCTUJKu6B3aVADDa2RLU9mbRt766kw
	OGmRzP+CDaEeIu3LSmlgn6XZQUlUySbfbHlVoKyKODb2UJ8rGvAja3qOG420brXl
	3Lt01qrG+mprDqi5EVACmAsUG6WMtFffNhOMRCjvBhBZKfw6N1PTIdJ8O4s2s501
	fYJC2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy47bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 14:58:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c955be751aso1059718585a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 07:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677898; x=1753282698;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDf8cJibEjhiFo83apzBrmHpgcz1vDYMn9bRtB9wako=;
        b=a4+NFTNCCyO/xsHWTd7w/E1BZyWCyMnOyylqyS2VFh5vtJO7mMFBgnFxLmB5y0HHXY
         E4ZB5UpHiqkZOOW71npUA98ik2Euet19GtdAVC9Po8NU0eQ8aObVfEIfpMUi8JDAMKPw
         gUH9+CP8hBLmCse+6iA1DsD9VH4C0b/uq1RuZFl14PNFrqopUoa2gncFXpHB9U2EzB4H
         fS1uENnGbrJh/thNpbFXWyjO5oLNcEz4jMUYTLYRpq64kxgjcT94dKYvtieopVs1/IUV
         egYaqoxdPobzKQ0sT2CUNk0PYG7kmOAKIC8tYgYZTAfRbEbTbruQYQnkxDNN2DmfwFTt
         Pkgw==
X-Forwarded-Encrypted: i=1; AJvYcCWt9SMPVuXOUzJzONYxETWMy23nzaSfPEY39GDajR5gaXgbVqj7FqaF14rt/HUctsOY0WOByAmNnKl+6+e/LeA6@lists.infradead.org
X-Gm-Message-State: AOJu0YzE8HnvbhWG5sGCWjzjf72YXwegCihzS/7D7LMw1NLRvxnMyE1J
	CdDBOMTGh37fKIYfWCJAMTrA2UMO/OHAFwpq3fOMm1xCBH02Xgiu4O0bmZQg/iZRN86u2PUp9ZN
	A4vuA0Gr+mXzsAS4ECgGIMDQVg7O4VF6uQxSg0JEfqYUD6SQxGLU/c9DnzStrKBAo54lG9w6Uoj
	fwRA==
X-Gm-Gg: ASbGncsy8hi4H+bQiGntvmZv1XEmhWb6pS7X1GhGezi99aj1MVaIKF0sKCXw7tECelc
	zRK4jhMl1iH4xZWrIHaOyx3mlWDOpnwuoaJRANT4Z/QpJL5VDYv2XDpl6+f305NyjHMPejmDTKj
	gCvOxcD196sYrhE2tCIWiCH4orr2+SAt2l9WGtyBSYBWNLOaqHnf7cjqXJyGV3Vtn3hud3O/CdH
	avYngQsg30HLEWIUjUvyvB5fNIOY9N2c7f4GZA0g9tUc3Ickp4X6yRayDaO2n1Hjbeo56HjY2CQ
	CQAViyCSPYJRfIxP7VIzkcF88JvgUy1Aw/khrd+3vlLCookR/36ZpYTLNZObstc9YlDcbbOC+rL
	Wto9WpCmNsHaMSgRXSfa1cwgHcxTdHiWhMdvGrI3cXjCxZ/tqdCjt
X-Received: by 2002:a05:620a:22ab:b0:7e3:4413:e492 with SMTP id af79cd13be357-7e34413e876mr264145685a.62.1752677897601;
        Wed, 16 Jul 2025 07:58:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0jOujE3U+BYkwFkxZi068fm97ejo79VB/1BsmjFpf/HPzJEDPZJZLcHh9+NAlr5Fw707ZVQ==
X-Received: by 2002:a05:620a:22ab:b0:7e3:4413:e492 with SMTP id af79cd13be357-7e34413e876mr264140585a.62.1752677896933;
        Wed, 16 Jul 2025 07:58:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a0fe70bccsm1355597e87.30.2025.07.16.07.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:58:16 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:58:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: arm-smmu: Remove sdm845-cheza
 specific entry
Message-ID: <2kpb6lwr36izbbp45dbv7lg2akjdxteiadhtc2bbphmsreycwu@nre7uzuezydq>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
 <20250716-topic-goodnight_cheza-v2-3-6fa8d3261813@oss.qualcomm.com>
 <CAD=FV=XmwiA_gX9pF5Dja1vezson7f21WHC8u8+Rhg_6OUJ+rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XmwiA_gX9pF5Dja1vezson7f21WHC8u8+Rhg_6OUJ+rw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzNSBTYWx0ZWRfX6s/AGdmzadgW
 O09NgT1K330FDtbPXqFcG+CFlhhuXSKpow8vUH9GZAmLdT7Z7iD002pW67tqUgJ8N9fq9tkpC6v
 bFKijOOdLNeQjQhrg51948sY8RaYO9oWoVww29XxCYz1ed3zDtZMLI0lrrT5ojpViFe85dK5lNV
 ZDqiyYQv5ADR/bZ6eJ4Gn+PcfYmNWS0l+Z3sqPXwKEfexGnBu1Ho1rIntByEhsJAHTGfKnv5+62
 NptVyszQqotzDXcNepD9yK2ycozJJeZb2b0eQkUksasQkU1Mvee/vCFYaeq6eKiV2DFhyovoJBQ
 +DlG8IiD7ZLeu5eUviv8Mc9oOYCdUv+6cLj5oVNuWkW3l3HaY6ay0aKbMw06+ACXrYv278qiZMZ
 iLXHdcRdi+q6r79j3QTkc45PszsgDOZko2fche73zlgSzxbm1LJy0L+SIeXACI4wnQc+BIAg
X-Proofpoint-GUID: NQUbSyG1Np_SaL3euwM47U-etWDLYqQE
X-Proofpoint-ORIG-GUID: NQUbSyG1Np_SaL3euwM47U-etWDLYqQE
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6877be0b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=HCTRSnsxAeQ6huVMZXoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_075820_039702_F0AE2969 
X-CRM114-Status: GOOD (  25.53  )
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

On Wed, Jul 16, 2025 at 07:21:51AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jul 16, 2025 at 3:16 AM 'Konrad Dybcio' via
> cros-qcom-dts-watchers <cros-qcom-dts-watchers@chromium.org> wrote:
> >
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > The firmware on SDM845-based Cheza boards did not provide the same
> > level of feature support for SMMUs (particularly around the Adreno
> > GPU integration).
> >
> > Now that Cheza is being removed from the kernel (almost none exist at
> > this point in time), retire the entry as well.
> >
> > Most notably, it's not being marked as deprecated instead, as there is
> > no indication that any more of those ~7 year old devboards will be
> > built.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..646814ec7d15f6d8a0136de73b7eaddae232ea64 100644
> > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > @@ -132,10 +132,6 @@ properties:
> >                - qcom,sm7150-smmu-v2
> >            - const: qcom,adreno-smmu
> >            - const: qcom,smmu-v2
> > -      - description: Qcom Adreno GPUs on Google Cheza platform
> > -        items:
> > -          - const: qcom,sdm845-smmu-v2
> > -          - const: qcom,smmu-v2
> 
> The code supporting this can also be removed then, right?
> 
> drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:     { .compatible =
> "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },

No, we must keep it for the Adreno SMMU on SDM845.

> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

-- 
With best wishes
Dmitry

