Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A063CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 19:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVXK3wyj4xgxBO/QQE/5ijkihmvihUgMziMTP7OJVrk=; b=11qFBaiLwcFGLAfMnEFqk6HsYw
	qcnR9/yhuAEeZS0h4bmvkMfrp6vIEmfsPrbEYlaAm6/jxbvNaAeHXd9ZSa48IHhFbNbefCXfkTGkN
	amh5C6ZaU09HN9BC0xQd6vYp+P0EBmGkF2rU4cVf1IeHfRcIX9Gf1WdRoRajNdQ7jURs7QLH/CHcI
	Crb1sxZltXzliXnKoKOur0RnHUiD8XyAUEejXTpyM3WMzlwJbXmkKY3fLwKO8l77CQxmsS90aVeau
	gC3AKx2kfdfZqVzzAyQcnowb8SLLRwUQYCrQLn1xZ56bYbcYqQFPYfqjDbtU+NWeXEeK/9h4Gr2Cc
	bXznQ6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fuA-000000064AA-3K8h;
	Tue, 30 Sep 2025 19:20:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fu8-0000000649i-1cBB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 19:20:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC2YiX012677
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 19:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVXK3wyj4xgxBO/QQE/5ijkihmvihUgMziMTP7OJVrk=; b=QvqfauCoLCsFHunX
	BW86ook4l0mDvdjjOiDOGqcsZnMBR0QjXPr5w0Fh1ir4MAaYUxNmE6N3CorKuHcS
	QKTAtV50kLvUayA/gTgxQnrycTPzg4KvRmimnmFUCiVKhAEQxjHx4tdZxfvES3RG
	oTFF1PIpdIK82Q9Z7I+5YFb272irfvWvirWb4OkSI+9/Ldi9J8ogcHCM3H6mbGyw
	K1vSOcf++D5HqneStj8qqQlRJKQLOQ18NF3asMJW1gRAIbj9R/P8vwxt2OBXCsX2
	UTiu3mKqXDwbiLQ+13xAqQqmcQTt/j7yeCJvE5wF2yAzDnBMZ6uXPiee71XLOU3w
	7VoiXQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a627vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 19:20:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e0fcbf8eb0so71990651cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 12:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759260049; x=1759864849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KVXK3wyj4xgxBO/QQE/5ijkihmvihUgMziMTP7OJVrk=;
        b=qsYhHUmHvVx2eNmFrphDdAXHslUm86eVfus27h4If97l56gsLJnEI7QGW96voz7RRq
         yPTT9HdVgre9SVGsHqueRxkv6Gyw8v7f564mAXfYioOaBE+4gRN3bRXWjXkzKr1Vd1MD
         zAzE7c/UmJjfAsNKJFWXXfcddy5tQS8fjs42c/ZQUnd247GjPg4N80fkcu6dBKdBj8rr
         2gEMzlcqC8TDOkjva+3yX6llnoq24xWMA2CXhvDqsF9kUEYr+oIIRaATH1fnZdVqtO95
         T9OVWchbBt6oYCugha0g7d6nBWP2f+5YWiq9YOes7T2e8A8EdQXw+jBleg7g8/W7qG98
         8a7A==
X-Forwarded-Encrypted: i=1; AJvYcCXv3LkeeYzY65xsF6YPobDBrKzDrPZ+F+QKx3fIO3vI6OnD06vZxiOJDeiW6UXRbZUDrUjCxxJm5CE0IrGxBzU2@lists.infradead.org
X-Gm-Message-State: AOJu0YzUumkb3wBMWvNk05NwHwYK6qAI+zw4ioh5p/Tw9vl5/YYy+VPK
	zuZD2luRRfWWbZRSmeZtlzE20sRlF0i8lD2xe+J08Dy08ot9djDxlrDnhUgjXHMLZK6Kw6dlvBj
	84cUEb77Ezp37PqcsissbrageS03uwHcfXMNXs29kxB97ZEzONcKTkeU1d24XN2bXvDtUquD9sX
	nSWw==
X-Gm-Gg: ASbGnctwpwbkhIYCYiGF9IL54UASUpm6ImJfY1nPgiHQhCgptQSHOd1WPzILqQdpwFC
	Xl9lRwDMEicOhFCQCHvukkQLKaAn2JcdhXizLOmK2mpaqvWxgXEy58egxnd4tRzueyPppzm1lCu
	5FNd6xZY2HbjRbNQ1hatvlYnFdMUjI38s9hsoT1iAKYVWNTojQ+2GDzShXuigIQgKxhC/oVO33W
	uIzo+CtgmhdP8BtEndTqOZGDOSqjWiUXbDS6PIv20ivM9l+SiS58CsV4Srjp518plRSurJt6rQ0
	QFNuc+HmLOQoObLdSPO1YstoqHDWXsVIlQDEx+PhSytPGkSmyAM+vL4ylSO132NQQB60nsVN56I
	LFn4H349mO0RccpYXRqqYUjsMnRVE9VV4AkGDuWIDsaINGtzej6NGbixBog==
X-Received: by 2002:ac8:6906:0:b0:4d2:d413:1f3a with SMTP id d75a77b69052e-4e41e256b01mr10937051cf.64.1759260049464;
        Tue, 30 Sep 2025 12:20:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlv8GouDfLH9jxcZXz4sZ9qg6O7hSAY2xOrBu+sewtGI48yKBVhvRDPT2OTQMfLyqgcLMpDQ==
X-Received: by 2002:ac8:6906:0:b0:4d2:d413:1f3a with SMTP id d75a77b69052e-4e41e256b01mr10936801cf.64.1759260049035;
        Tue, 30 Sep 2025 12:20:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583134310bfsm5244156e87.26.2025.09.30.12.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:20:48 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:20:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm/adreno: Common-ize PIPE definitions
Message-ID: <ftbecn7dlcp6pqtpfl5v7kv2kevz5m4yqcy7fg3atkdjabkt67@zqwwostqqfou>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com>
 <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
 <CACSVV011=_szCPbdm6YA8aJjm76r_BZP9QFeOzcAGCvqUUTebg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV011=_szCPbdm6YA8aJjm76r_BZP9QFeOzcAGCvqUUTebg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dc2d92 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IkzWstXsGuqL4x2q7pEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: VD40kU5D0TswSuJIUppx2GYdijGKhYui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX3C9MYp6PPaan
 Yv9RW88kXB5LXgAo/NSB1EEitRjO4DQ6VaE90PWSGUU9AuYiIDcWkLLQxmGC0zu2NJ+aaICDtHA
 R2CNkVcfCm5ZEMu8PSYtu6trjB86kd+K76RyeEA7KSDJ6VzZYMDnpiuO8DkqEsl8GOqkazpeQ7w
 8o5RD05n9+yYUJPG13r26gBKZaUU0/GTM1pEfhZBWcA153xikPHTiJE2mR7qpoZb54MOq74MnCa
 NcFNnUfAx3Ka9DX93qnuHzZRJaunntT0qEpwtPGtWHJpxP/MqpJwD7KkUOMOXO8CSBmM2xSKhYl
 fK1Zgp2J2lGkp/EeC7S0ec5o+rhIdAdXTfPirKW2hs7iUsML6gqvM9RWjSeIUTEIIpj03xqsknY
 yCy+uXkKvPgBgA907RWB+4Js2QLxOA==
X-Proofpoint-ORIG-GUID: VD40kU5D0TswSuJIUppx2GYdijGKhYui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_122052_541022_990501CF 
X-CRM114-Status: GOOD (  22.19  )
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

On Tue, Sep 30, 2025 at 12:25:55AM -0700, Rob Clark wrote:
> On Tue, Sep 30, 2025 at 12:05 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Sep 30, 2025 at 11:18:08AM +0530, Akhil P Oommen wrote:
> > > PIPE enum definitions are backward compatible. So move its definition
> > > to adreno_common.xml.
> >
> > What do you mean here by 'backward compatible'. Are they going to be
> > used on a6xx? a5xx? If not, then why do we need to move them?
> 
> Newer gen's introduce pipe enums which do not exist on older gens, but
> the numeric values do not conflict.  Ie. each gen is a superset of the
> previous.

I see.

With the updated commit message:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> BR,
> -R
> 
> > >
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  10 +-
> > >  .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 412 +++++++++---------
> > >  .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 324 +++++++--------
> > >  .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 462 ++++++++++-----------
> > >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   4 +-
> > >  .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |   7 -
> > >  .../gpu/drm/msm/registers/adreno/adreno_common.xml |  11 +
> > >  7 files changed, 617 insertions(+), 613 deletions(-)
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

