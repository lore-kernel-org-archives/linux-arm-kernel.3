Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83388CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 20:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qjeya0IdQ3BzmDbZDR5yncWIDXEvsfN30Jepiufy56k=; b=3HqxEeZ3suBRc1mXfD+K70LJ5+
	scEVB5B6FGvT1xojLhA/ygF9vXPLeajBdeB/FVXmQpbW2/ZepuiYUm/H2RLI+K9LW9wskdOekNsho
	Q5XDmi0gaDAxg97n7SuwckVTrFeDrGkYz8O4kY5YlIwbCRDfkIJm9AyV9INJknzZegAY9eq3sbAR+
	oGSORJGspoYU6QFoYAB1EA5nvPJzuZOO2UBwOXe2pfsV9qnAgNzZEfjC3OJ4ILqkmFRDSsMq5lYcq
	FmxPRYLuMet3t4eYLvjKRXA1GO+9T91DhOYZHDb9D1PC7FPT3YzIKeL+RaHKXgfhKmFf2T9nQSBq3
	l2erlvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIXpo-00000006Dkc-0QDO;
	Sun, 18 Oct 2026 20:50:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIXpk-00000006Dk0-3eTJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 20:50:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IKApG4351687
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 20:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qjeya0IdQ3BzmDbZDR5yncWIDXEvsfN30Jepiufy56k=; b=alPDUBmXZj67otSF
	nWir/HmgR0gxkaq9xp6Blsw7Nya0qwRi1CBwOiPBMf0eMHnvVwQDhl5fdH4Ag/UL
	LaA8KFy8Wj+qLHgKRVIP1Vaxj6VWDxhQbs/9tJnAiWfvyUhr368UuawqW8vnG7SS
	ODCoO1dfucNZky2JVCE+IGAt/BYrSW+aLK/ICn9DQhApMT18Nskfb3r3TgXgPuBo
	i4Mh/KCxROcs6gibcBeRmDPwcBiuc2DKpMOd0sHQ9sFwPi2U7Fuw6qzBziDRZlgC
	Ki6jYeOX2lv6KKFD+Le25U9cMmGYoDBfzyQMugtnw0hiLx3KyPh61BlFrHw6PvCv
	yYg+Bw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bgm0u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 20:50:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso218749585a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 13:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792356619; x=1792961419; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qjeya0IdQ3BzmDbZDR5yncWIDXEvsfN30Jepiufy56k=;
        b=MQgWj5Cp3lJMKmOPYbWUNYE5kxHEpZ/pkF8MraDx3jvfcyyOyfq7m6cX3fAHzDBmSp
         NWswm5sSllJJxpxRHBWavmAouooC2ylT3XnNXjrpPVQJMVlEgINAGNoAwde9cp8QMs3t
         TUkRbJ6H3mMjcMmCq0Y5qF8bcUyvCwxxTAyIiQ6juHWehLxLsDHMPuOc4FZvve6b3ugC
         WRSg8KHY0htv5ZoA1ty2KFLeP6eUCIjHVakFfGxlnp0tc1sA0oRemzD1cwN36ujYKZdT
         7f9Bh5bxfOpDRliU3ENaqg4XLSjHee1zLvOtyLiGHVqRFt5DeDHDGqLHR/vy5vrDEPxM
         EhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792356619; x=1792961419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qjeya0IdQ3BzmDbZDR5yncWIDXEvsfN30Jepiufy56k=;
        b=V5FBzZMQvG6uNccUVQ2OANTEhMhO3s9Y3XvPKi3BeJ3HNKhz38m9nJ3WyjndusKHBB
         zr7KKjCPoiVZF19qSnnhoqH2iyXVX8W77T1NxpuWNj6wLU/pEC3zhUzWhL0MWRx5mWVd
         ylj7DHrxuKeBGYERGAapShFshmhqehMRA7xHmLkKTxonvmJ2VmfeRWoytlX4GGSA6Gkb
         Wo5WUtVj8PeriOnoVz7X4MkJ8XvciilGNpsu7VdITZmK40y2HGBPhx9/hidWOaMliVc3
         2G/BwVibG6KgKSHChv+AFAKTfABq6NEy8As6IGEuD6r/eTStDkTwbMNwvBzgzzzGo11j
         sZ6A==
X-Forwarded-Encrypted: i=1; AKwUvBxc18q7X1pCKWrgjZ+VCFcUuAuW0JrQ+gOujcW8G5C3AhGZmJgZvdgsEaOdp7F8shEUcFe/i6O1bU6tUcjtmKHJ@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6mdRoculTSYpCa3LASqTb3DbREODd0cg2CSmRARFqiaqY5Daq
	HwgO/Rq2e/mlc67+YTvaEVrwQsBkpBzyTaUjIrJx/T3HDWxBjloPdIqEMInd3lgR0V+cN/So0fI
	mdFUCe8TIyivk1HnwQYD/2p6bbH5v1Bq1QyvNDNpKLWSeMmkRqHJToUvlahelcER3p/zoQcYCF+
	k69A==
X-Gm-Gg: AYBFou3QezDdnulyUybC7xt5YS6MVUaJvil54bcB4Uo8wdWD0lbJV9vF2nXX93YaCbm
	qSR2C/LMYUb7wsulbF8fQHjAnUoWxhCeykS2NGUs6LaBB5fHxQw6sf2Heq4He9l7mbgACHAUl1x
	Ur7nZ4bDJ0PN9eRML8fEJXRIlrFSeEh/Zw1JGgg1576obfLdqxIk+zssPiNGaQkbdr3v1vePWno
	QGGVSpP2y112Z5pX+S3OVkXWqn+16tPK97cgETsrLMgkLBoEjfCWy5Xl7VC89kgzzQDmT7q/aNA
	eqZV9gqyw+nd9SVXVtdNKN/jotRJ6j3aVOAlpjy/4rwhSNOIZDOTxvD+8p7DVVAv28seJmRgOKn
	5otg1t1/rVmOOQhIVfBiq5iGKQGeQAvPRYZHPJtnVYUdxmv2ndHlclO3SJDBKMvsxfqQutOk8xo
	XGdds8WUHaHnzP
X-Received: by 2002:a05:620a:1a0b:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-93f29dad8fbmr992433585a.66.1792356619125;
        Sun, 18 Oct 2026 13:50:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0b:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-93f29dad8fbmr992430785a.66.1792356618645;
        Sun, 18 Oct 2026 13:50:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63a2edsm1669525e87.68.2026.10.18.13.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:50:16 -0700 (PDT)
Date: Sun, 18 Oct 2026 23:50:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?Q?Micha=C5=82?= Szczepaniak <m.szczepaniak.000@gmail.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
Message-ID: <svmk5fixazvuzkkug3mvay72kah2kf73iptrrsc5tmjtqmpp6e@4663g2h5qumr>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <1a469aa9-e4c2-4d13-b544-104f4065a14a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a469aa9-e4c2-4d13-b544-104f4065a14a@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA4MyBTYWx0ZWRfX6e6qUrcbIPBg
 vcwIQTZYunt0KATEJ4v7bIy2Hf/VJxi0K+UNRJ8alkSAb/2oZkPvKU00vtPF3aI++HZU/Ciq3mJ
 n2nRDWmQTbur9Q/apz/H+W+bLXbA+TU=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad5310b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KAcPb9uwQpV6Y9LkPCcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA4MyBTYWx0ZWRfX8j/2NSSIxShF
 bZ1bT+uYyHc5SKKU7NXxlpkAhQUNPhtNnlKzmIpZ1wvNmGm87cKnaTV2aqLT2Ak03FFzQXt6epR
 3/oubWmCdLsFDWMqoE4MFtnNNN2FLcmtl7iUi3CVc7VLT9clbfp42fPRvmWmcoAl5ZFBM3sFWyp
 U+Mz3w93JhuO5mWG5EQcHGhQ4CNL8HICRZ7U/uOY8DLd4c/scwrrFicPHhNnTfjYUaH15AXDQyf
 Jpb/SkXc5ojk0I7D0I9TgfZg5JGk6RgoAudvP5wxpJPkrhk6cvOYeb+Yb4ITClbkCynt14Z7WgG
 zMggFOwuhbgvAK0jDku7YrJUI2oGxYOa9dj8wpIvkkahE6zHtUTd3UE2dKrZEhyCq8umgA+DtXF
 ThpCOHNUmduZb0R97h/PJ34SVKL+fZB1XwF7UZjcYb/B/7HyyKxA7pwnrowmd62JtEFGkOLm5z3
 AkRSr2SB81t79b4oogA==
X-Proofpoint-ORIG-GUID: eYpNVAQUVDMdZOxQnXrnlt2KmZaY412M
X-Proofpoint-GUID: eYpNVAQUVDMdZOxQnXrnlt2KmZaY412M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_135021_637542_0C67B639 
X-CRM114-Status: GOOD (  20.22  )
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

On Thu, Oct 15, 2026 at 09:59:44PM +0200, Michał Szczepaniak wrote:
> On 09/08/2026 22:15, Dmitry Baryshkov wrote:
> 
> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> 
> Hi Dmitry,
> 
> sorry to barge in but I just wanted to let you know that I 
> gave this series a try on the Motorola Moto X 2014 (victara,
> MSM8974PRO-AC, PM8941 + PM8841) on top of v7.3-rc7 with the
> msm8974-mainline patches and "clk: qcom: mmcc-msm8974: add
> GENPD_FLAG_NO_STAY_ON".
> 
> Display (command mode panel) works through the MDP IOMMU. The GPU
> works too: the Sailfish OS compositor renders on freedreno (Mesa
> 25.1.8) through the GPU IOMMU, and I don't see the reboot reported
> on FP2. I tried 3D acceleration, and it works without issues.
> 
> Hope that helps!

Could you please reply to the driver patches with the Tested-by tags?

-- 
With best wishes
Dmitry

