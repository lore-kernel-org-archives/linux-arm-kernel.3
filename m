Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281F8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 12:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7l+w1LkFRue1ZQFudjsniOqbsa/avBSZQtqmMh9NKg=; b=gBb+QoTIaDk5WmBzRaVqrcXS0r
	E3HOcG7ksVojCv3uN4lPeahpj33PczaQE3Ap6ekeCfuxM17XRP/+ZQ16MQtI5l36MBRvizUXjkfQC
	mTAge8MtK87HQUI+U3bwCR4hAK4rgpKYdIvph6sdwK1Xd7VoJM7KGZMjsyBDxcN21earyaI5stN83
	QvwTaNQp6zbMisQB8GI+izZYxQ0uCToNE25onf+fs2ysxuZwPxAYVdoeBTO0AP9ag1NqFd0XfWP70
	iy3NOimGMzonI1s2HuPacQMvU6udJm9Y1oUWLXo8vo8vPX5kJbbFYuV94E+W4lyVwn61fP8x/SqyQ
	3fTFYwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfzYa-00000008R2O-3BXV;
	Sat, 04 Jul 2026 12:33:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfzYY-00000008R1v-1eJO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 12:33:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6646hh8C2147071
	for <linux-arm-kernel@lists.infradead.org>; Sat, 4 Jul 2026 12:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7l+w1LkFRue1ZQFudjsniOqbsa/avBSZQtqmMh9NKg=; b=NxwSLxlnSUC+g1lR
	7NVdxQqrD2X5yEP9GceoXfoUjZh44a4vGxUoQ8nhE390jEYQSfUgen9jyHzUGs2O
	D5Bl7af9JbE0T9NtOGr0BWCOaaI/RPPDRqSAZ7ibwp8/GjX8JJKrJ5IUoBJ/STIc
	+byoJEJ2LJJmEaI7i3sGeBmcuG4zYZaRNqHV3Fsai3x4XZzu6f2irzrW+JvBADal
	b5PT7fNps+909/4cB/5uNGhJBY20GRg74igOXJGhxGlzsszkWnqmmQQK+isRhf31
	R2Lcit6DPc0dptb0CaKNoy4YmEUg73b2VE0vlpNyqpNIjBPTuI2dbAMqlqCfDgFB
	5JyiQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf80phb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 12:33:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e606e8f3eso105140985a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 05:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783168392; x=1783773192; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n7l+w1LkFRue1ZQFudjsniOqbsa/avBSZQtqmMh9NKg=;
        b=bOVGkkFmzWYj5bECRIxWMDmjO5Zgq4Siw8shx+m2H2q/D0dnehWbmvJG1UrHgUDjp6
         WPudy9Bo9xa85mEptAORvrKvsXKXoVYQls3cm8ElQK0LTkqXbxMi4HHVeXjf72LL/o0N
         54Iap34YgSXBw+u60ZC5jOO0M41l3M8bjfeKfJP0qqkoTKAuQwyke5icRsiLRTlfnE4J
         3UTV45WS7/n+O9ldj58cO+wzZz7dLQjWrS9vDqv1nxHg9P3hpyi+SknYUughawZdrGVa
         IyTMzD/NirNnpLEtuI67BIxsC+aIlhfkBRxbeFooaIaIGoY+YJDZntSAsXUeBBiwfhhe
         iMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783168392; x=1783773192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n7l+w1LkFRue1ZQFudjsniOqbsa/avBSZQtqmMh9NKg=;
        b=GOL1TvvBMn6yalwRtBVphWSqzQsRm3k4tnOgPO8p6y7qXQToKMuF0J7dwYE8BBVZWh
         /hYc5OMmQErPs6h+k43aFSbCqbFW6080olBIrm3rwZQAZBbwNuY89/bnU1KePH9xA0C2
         OS12pPVpb/1+UhmHVTVPaJ52yhHsl/Duw750aWyvexJAD1N1st0FPdcUF/FeCsJGMd94
         kWjhrluOaISV0FdSG4OagJpLFeXExgurJurpJOvzp0wriYcjaMmB7Jw6ycCo2QLZgLYA
         1FrE/wwvGmL5WrdRv9VBiCxz7p2YIm9fVhzIuNKXn7CjjkrTZXO3g3LnMCKgrbjp9v1s
         y7hw==
X-Forwarded-Encrypted: i=1; AFNElJ8UZl6uY1fUg1MjfJnK8A1lks8zDrMXo1JHZ7WnNJSmJtFfco7tnRYNrS7cclbfWCdgoq5j8Pn8sltmsZ/+2Qrc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5xDRZVxdfqK62isBjDrHwbyBYfs4GEbHQDImx5gK822zNvyhu
	bqAbBQZY3l1z1Q9ALJwG5Um1Zt2VNMdDrmOwFhdaNluOxZDDWhPIYtEBby5CIjyBH6Oz8GQkSkH
	AMA5XMGCKjUU9flvi1zPyA3LJbk78pBT4qr8S1HMuZ3sSX1xLiZ6C/g1Xf0SYa72a4m81NKKzem
	vyAA==
X-Gm-Gg: AfdE7cnLTc7CUtsgikX5W3OBIVbcPshxiGTDsUinzVfk4F1aE0WsxHPNGkf+Ht9kerI
	BksUTnSXyOMCMV2+jc+Y1Z9DbjNuR7S6nUseJPKfA4oNd8BLh/BnR70At/CJ4gSxjNrauZ5qVk6
	GhxzQMZ4Cd9RpHNXeReac+8rC2wYsAOMlW6oWYfqgBMJZC5W5TLEk0SQY51I2MjL3CfkqysuDiA
	UKsFhrxAkUlA1WDVUv9xaC/wjve5/IbuXOIw7Of+zevOxXMJ1ERRZ4CLeSxUwDgWemSW1ytiPhg
	TrGQ0Do919bs8bUv7OA/NjQaQY/bziKhFnVkJ/dBRbr6e/qlbRUicdCC3k0iRg8Tj/aiIH2lhrg
	V4J8ngWm9dIGdEB8lXHeC0ABoqDEa1iACl5nUW61j/YB0HX12fzkDtp5RYCfJDxOcY1OQ+CkBaA
	AJb6KrHJuT3bGHHkGDDhy6eiwC
X-Received: by 2002:a05:620a:4398:b0:915:9d08:94e1 with SMTP id af79cd13be357-92e9a43b335mr448897085a.46.1783168392436;
        Sat, 04 Jul 2026 05:33:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4398:b0:915:9d08:94e1 with SMTP id af79cd13be357-92e9a43b335mr448892785a.46.1783168391916;
        Sat, 04 Jul 2026 05:33:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4aba9ef2sm8519151fa.0.2026.07.04.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 05:33:10 -0700 (PDT)
Date: Sat, 4 Jul 2026 15:33:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        iommu@lists.linux.dev
Subject: Re: [PATCH v4 6/9] arm64: dts: qcom: shikra: Add GPU cooling
Message-ID: <qqdaoc4tacx3dlh6bp43gu56w44cezkm345iconc7iqngircxm@hoywvq57otpm>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
 <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
 <opgj6twppqwhb77itqelmyzniaifcja3wdazyzeal5axstr25g@a7v634mnimbm>
 <ca8f3731-3f23-45f5-82ed-ba1a65514b95@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca8f3731-3f23-45f5-82ed-ba1a65514b95@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: iRDBv3fW74KXBGC7ykG5Mvc0VAV5ZjiU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDEyNiBTYWx0ZWRfX21eURSsuctcT
 InYsqBYLlWE5Q/lF45O9H48krds7ehbpawlHZW/WqEb7yzwS1Lj2KAL0l4ZjY2icJlPdp0dRh6n
 EYtfCc0wEhVIAbLifGNQ5GAtEsFBvO8=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a48fd89 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=CvX1hmVerT4HThdZ_8QA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: iRDBv3fW74KXBGC7ykG5Mvc0VAV5ZjiU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDEyNiBTYWx0ZWRfXyGXFUeiRkXPx
 BBXgxYo+a22KMjE1HIOvKhF8K0ScE+M6Oa9pGP7XEDvD1v/CYs3HOAm1FXRuySQ/yR5BfxQ1cY+
 +XQGYKrCEnKwpgdRryqSrTxlMxntDmZVpaMZBeZC5TRGFK98JegUp9vYiPlkGQkzE24AZtCCD9K
 BQKRH8NoQfZ30RtaHjwUpUUYchjowMGSZdBbqjNLNWG1wwn85slbxx9aDHtkP/uaqfWdnrbeiqf
 kBeyjhEY/RuBwXBftiivroacuBWGncpZSbY5WLYmeo7ZACDxJgoOp7y7rxuAWuyDvkRksNTlYxz
 QWCrlcNo/cHQxqJCsyjzaXxso9S2OXl5eX2ZlwScNIlBvws8+y6PdWD2YcH0pfxn4kG6OyoglK6
 fBYhctEaHGhJ3emDty92dXn6AdYp91hWjWFAmGUC1cxrHS4St4TSpxrBe1mquRPoWZSkLTkrCm4
 GpXhboeBnpgNy4Cbwvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_053314_446596_E70E336E 
X-CRM114-Status: GOOD (  22.54  )
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

On Sat, Jul 04, 2026 at 01:56:30PM +0530, Aastha Pandey wrote:
> will update why part in commit message.

A. I should not
Q. Should I top-post on the mailing lists?

> 
> On 7/4/2026 4:41 AM, Dmitry Baryshkov wrote:
> > On Sat, Jul 04, 2026 at 02:04:32AM +0530, Akhil P Oommen wrote:
> > > From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> > > 
> > > Unlike the CPU, the GPU does not throttle its speed automatically when it
> > > reaches high temperatures.
> > > 
> > > Set up GPU cooling by throttling the GPU speed
> > > when reaching 115°C.
> > 
> > Nit: 72 chars. It looks really strange to see two paragraphs with
> > different line wrapping.
> > 
> > > 
> > > Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
> > >   1 file changed, 15 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> > > index 34261221664b..eeeaa369d3a7 100644
> > > --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> > > @@ -2510,6 +2510,7 @@ cpuss0-critical {
> > >   		};
> > >   		gpuss-thermal {
> > > +			polling-delay-passive = <10>;
> > 
> > Why?
> > 
> > >   			thermal-sensors = <&tsens0 6>;
> > >   			trips {
> > 
> 
> -- 
> Thanks & Regards,
> Aastha Pandey
> 

-- 
With best wishes
Dmitry

