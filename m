Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F36FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVyKUn6Qgeu8Cw9tv/zF53VSVfQF2ch+8IMvAUMaMtg=; b=aGA/yZVroj0F/lhRtSK1wx4t3A
	5VGxd4406q7vcd5zTiQidzBdQcezRUNRJhNJMmwvX36vYllnfSD59yesn5ci67DAHDLzM0v6sHIVL
	IkSWD88hLfeKFVeywZPi5y9JU74O5gZww9El0AmlUzmAhGOSh8KhuzzfEZNjibHSrbhHTmPRxTxWa
	TY3RxnHSUDoOc5/DGyTqjuNqRU3YTBDs7VjMJVzmr8SIc6bXh+zNypWZHuT2CVivs4r/O4QjSknrB
	Ib1v6PMQS7WWF6BIIuNC6qBk+0fvkJGWpCa/uxQfU7gx/lC2IJhSCHJg3CTql0/+R+w2mxEfQVpd+
	IP3jXk6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqrT-0000000DdMY-3lWy;
	Mon, 06 Jul 2026 21:28:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqrR-0000000DdM6-0XEj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:28:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDtjN1495406
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVyKUn6Qgeu8Cw9tv/zF53VSVfQF2ch+8IMvAUMaMtg=; b=B6vUTsF+PZo2s8op
	k91yrrH8BFLXGcc1v+dH/Y87y48/xr52B74MZi5C5tje3zjT50YWFG9LgR5OFtoj
	uZrN7jvmayh/z0oeFDCqXT95ZjU7vAfo76FtEQpevDbYtyoExwqDWadJCmmPwgTc
	X+VB1dDee4x4WOaXZ1LWivrvuBv7hagIygLM4VZwgi+L+Zc8stvPbySIbh++poei
	UNgwUeZDOlZ1IgxfltcCPkwhSNd6fQYwfEhuzWUHmZhj//qsu3VpZbg+YQdRF0/v
	XQgqErqLYI0rzGYUWqLwQ8gYh0IDHmtYvPATrhY3u2NOpORD50A8YO+sRN7Z5QAU
	RtbGIw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8b9pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:28:16 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-737d34a0dc8so3759642137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783373295; x=1783978095; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XVyKUn6Qgeu8Cw9tv/zF53VSVfQF2ch+8IMvAUMaMtg=;
        b=TRT8HVA+wbQ2ZbNf4Yf0dj3fM3rxNTkS4CWJGgRavnlEXV5YqARKwgAZyMYDmh/nwR
         DnzWPrMJn1wY24DZmd30j9bVE7eRisYsCE7/iR/VHeRLIvZQEJZr2i8eauVjDr4469x+
         XytB6Ujb6kVMNEwzfjyEofKdu7S+q9JMLfgiJ2GaGPWlJ3lIcnalDneEk5VBkFnOAh3/
         I6GK2lctJPSSCyMjlxUh/aIJLnw1+NE2MRdFkaOyEWuJXyCFuU9xQnLkqnaDFg0ziXgT
         DQhYB9nV4VGRGC616t8hwDpjyxYhnKWfjFHF6xQ9G+Z1jpUbFOLW8AQoFhRu+oxNsy1A
         hT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373295; x=1783978095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVyKUn6Qgeu8Cw9tv/zF53VSVfQF2ch+8IMvAUMaMtg=;
        b=X03dXoRpYplfMjo8pFCPQuvOr0qM8eQ5S2ODYMwHzUUGxGOpDxP5fHhCqItsHEq3e6
         dWiorDGSugnMHm8MvuklU8mPmv2KF5eilZD7d4NOsyupnRiCX4ENAQU9HjMRlGuTFVUf
         fjZXKwo/pk0Geh6V8RFfUQ1o+eaZFtQn+cFrIDOrnba72h2wphyghx5LbyymM0a0tbUg
         tRZ/HsdYzNuQ2MZ02uIGEdKUM1XBw1rVwWghf2Wo84kErPskxsQEUm+HMCQYlTFzxlpD
         UB20izT59+ViJMOLGNEeh+CQERQ2s61uNCN2OBMPObSaCCrs5kI1M2zww8DFCpl4NUGG
         EPVA==
X-Forwarded-Encrypted: i=1; AHgh+RrW/amjHvJ0+cyipA6dMn3I5OIn3btCXTdEPqgYCcX437PvGog350t1K6gVimoNLoraIm06vTtPqgam/HLkiZkj@lists.infradead.org
X-Gm-Message-State: AOJu0YxvY8lv3ONiK344u4zj9yBnz6IU2MF6bnPiHzQDf+AgcGSiRXuS
	a7eidPux6rCVwWeHLydXNURa4QESrlexit8xXSX0eNZt0EvF2FVZ4anQ5Z04ibdGGUwY2PEMfYe
	zm4JS/r9YmBxve2L4IJ8WJtB0gR8a9HLaeyi4uFv1vCZcF97+cN9JGsbRTNA9lSSOJ9VT4EjzeU
	WxgA==
X-Gm-Gg: AfdE7cmDJYr5uC68z3tRokfXexKK17s0YwrQbIjVEOkzTuXod1sLMd6qeAtEoExT+Z6
	illeqkU/N/0p0GbmktFtSF2aBg6Y8pKYXP0orUeqPcBiJKSuw59UmSqyTQco7kgezgTh64sYWG/
	BnIpy2CnrsAznkjYIk+YdT7dsYnnKRV5F1gh+lI8RVFxakcb5pbGVQNs4cxciEoqe/r2WUnUK9k
	vC2UUqu+acEf4urjaZHbXvJ6/4j0/0kvK2VKWz9MwconqD2U4Ks4J99jIyQmAN4F4fR0tSh6lUP
	5MHnosvGL0pVVWGwf4BU3+cbxL+Zxd70OGYBH2sjI2Fb0SrYpDeRo0I7Ouv0D5NULQN8p3SRVfo
	MovzFkdIRObxtA6aw39MUBR4PH1qiLRPKmKkNPDB8iCFNMel1+AwD7ZGkElnlTqH2NtsULK8skc
	h3OoB7wC8+vfOgaAFVmGO63450
X-Received: by 2002:a05:6102:598c:b0:744:a3fd:410a with SMTP id ada2fe7eead31-744b7d6e301mr1160560137.14.1783373295348;
        Mon, 06 Jul 2026 14:28:15 -0700 (PDT)
X-Received: by 2002:a05:6102:598c:b0:744:a3fd:410a with SMTP id ada2fe7eead31-744b7d6e301mr1160536137.14.1783373294919;
        Mon, 06 Jul 2026 14:28:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839bbsm3150167e87.35.2026.07.06.14.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:28:11 -0700 (PDT)
Date: Tue, 7 Jul 2026 00:28:09 +0300
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
Subject: Re: [PATCH v5 6/7] arm64: dts: qcom: shikra: Add GPU cooling
Message-ID: <cikq6wyljzdlyuopvxno7fipifzc7f2zc6hs2ligiu5esnljui@5mxhammibgpc>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
 <20260707-shikra-gpu-v5-6-d2f373912d3f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707-shikra-gpu-v5-6-d2f373912d3f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfXwvW+fIHCb7WF
 t+vk9kuUONNDPWpf70mXoO6nC58iMF/1iem0+OuUs0868lJTP29i4EztcJcL5yWWx2lRRCJooTH
 PqrRFDQoMXB9QY3seUYRsFIfQAyYPDk=
X-Proofpoint-GUID: 0R3nFvE0AutMYR9bYKmGhuZ5YdhzG86k
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4c1df0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=wZTYHpkevF83xUmX0v8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 0R3nFvE0AutMYR9bYKmGhuZ5YdhzG86k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX3gZn41q8VRye
 eGdG0EMp3z3up5vUN7TEPsHR4eTKYncvWHtIuDy5F4vIaTzsdlu/YwzgCHoM21phueGvSx5kSoJ
 Xnx7qUZQ1x4CCqxDc/tXcRCBjgw1OjScHIdwbgLlOCHW/svBzDvdLOvu2nv/dGo0NqBJYngP/NF
 J64ha2UXh3EABpPpvhZ7HcdWTrj3ijrjlkckd4jvx8tmR/9VDw2yqg+CGtxjZCKyO100ylZtDWf
 Nw+bCnoKuWg8tDnV7IwACCS+PkWUHF5/aJd0LO9DLH1FTrnrkjlQzUvZcUqXwwLjWpBNyX7UHWZ
 2MGqCVdo4NDge/ZY4b3WdTbCpGIwB9zzO0lp+HWgeKifbhI29Ux9pQOeIgD+CrksMoW516RVViq
 m6DdClN8JDP014xQBnw2MSTYWK0utn2HZSZBJ15PKfnxxEucbiiY5ZpPn7Xa4AhwRaa2m7M0qBf
 CWaxoAnEXWmWFzD6qHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_142817_169662_5DE8A168 
X-CRM114-Status: GOOD (  16.61  )
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

On Tue, Jul 07, 2026 at 02:34:38AM +0530, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed when reaching 115°C. And
> use a passive polling delay to ensure more than one "passive" thermal
> point is considered when throttling the GPU thermal zones.

I'm not sure I can parse this sentence. How does polling delay affect
number of thermal points to be considered?

> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

