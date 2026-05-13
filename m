Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E945CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 15:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fO3GIoebdKzpsBOhpeDD2jjEE1BJjszUQkNE/I05Ws=; b=w6l9pO4rvz+MrIOAws/fwNXvII
	WyAXFu8Nd3/9qiCJYdTLCj8sZe5gGY+OtExCwx0f24ya7ZUfAG9f+vDCG95oqd9ceUx1lN+o7U5t7
	EKGKMEPPmSOnnL4svAzmlMh2IJacQmWylPXWwu8BjNe9BHltfpgVQlOq7qwGtE1POK1KIPjjdCzVB
	OKt2bkk4QzJJeOE8TAnYeXxFmu2FSsP3aSNkLkf9sBSYGn3W+OU+zRZOUmGf2wPgyA2IqaI2jxGyS
	fptHpplwT51yE9iBwodS8f5HI2gxx163+GXQyvkDGD5TSg3+wJSo5QogCF2xu2hQ8Wv6/oOa0nOl0
	cwYtNLNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBua-000000038b7-46x5;
	Wed, 13 May 2026 15:54:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBuY-000000038aL-2fsp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 15:54:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWr3w1393359
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5fO3GIoebdKzpsBOhpeDD2jjEE1BJjszUQkNE/I05Ws=; b=X7gAsYvApGS+z9Rt
	TnNMVm0256GHawyhFMcb4BlFUWowrdmntRtghlTVq2XHEXyqGxohcRd94gaTu+zO
	ANiNkee5FveAgHngmge6BzaPYk4EyDdsvuhxgiW5hFOHon5yp/i8nTKZdQKQhMR6
	1UgurvO/6lKvZUvacPCmPZ7dYSZKWFDraErEOpJ63eoRbo4k/y1o58kSRKIb6pyQ
	X1/9weGGlIdborSDO5AfPCqkBCTdbdU6mN0a3H7WgXY527YJNlAOOcnozSEB5MJQ
	Q10IAuW2yV/fMEf09o5NZXSShfnrfNpmQzQjzm6hArQaOunQ4H6iD3K2AwskH8ET
	QKWPHg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k262fke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:54:13 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95f7fcf4b9fso798036241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778687653; x=1779292453; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5fO3GIoebdKzpsBOhpeDD2jjEE1BJjszUQkNE/I05Ws=;
        b=Jjn4WLx14B+MKy1kkiVGYHH9xMJzFvkFkZO1aDnf+Qi72ONrYov7SC20KsbxQAEC1f
         DBQCDVz2yfE9EqLe5c0xSFHMsZE2BLs+EI0H2wdkU3wwXQkjOUC+zqLROCoFcV5o7au1
         rm2MWQNx40fJ8+nLc3FWQtoyrZTXEdHRQ5GFf+4q7qxGnDbwwVAkaLOgfZNCEhCyY8wh
         VIs3KpEeR73H54fqPZojs//VzR+00nzLWUrCejEuePlaLWM9ThIAeG9cVhRTItpxGw0H
         W+vTp+ocOj6EV+ME5FJW08eDl2VZe6291NKs2E2g/Zq44CgHTcPokbqIK/dU53+uPXGZ
         L7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687653; x=1779292453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fO3GIoebdKzpsBOhpeDD2jjEE1BJjszUQkNE/I05Ws=;
        b=aU5u6nhAYNDUUWAVbC/Y8dd7CGwstV0N7T+oRoNtB2f9TavB0dra0HP4oIg5qacvsa
         5s0r/GU2etPjXf4xj3AAmi8uiTyADThjVjR8JRpW5UE/96a1k+ikvudk1sjHxqnBvfW0
         jEELy3lDBphee77Sk1qQpoSx8obhsnEsJbOJ9kqAIfr1R6soBMgSv/mLgyZMv+n4hnJ3
         WF5fLsBZfgf41ZBRHUtQoN2SMU6rW7HXueRgBS2GW+1usAg3BLNL5ATvuFzkigIgbLcN
         TqrZBexMSyfRc4bKrLsq81etLSITKyrTlE/04Ur3mDyXWTAvfeLF2CvbnWhdcRxHNpFU
         4bwg==
X-Forwarded-Encrypted: i=1; AFNElJ+vbrgdTKNFUSwSkjPD73gl30G9ysNfWQd1BRE3cEPa8Hw9rmWHMT0iVaw8IG0NGF4kkbG+o6Y2tyMeIUfvC1u2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Nq38HOT8MY/I46+P/UGkpTjbR5J60I6hQqGCEC8MCn1RxuiY
	RFllZ40tbDLj1hdlAfobceFAWua9pbWn8r25hGX+DqQOpC2XT2LQ2ytXptLx+QDkS3DKWrlGiDX
	vslc1IaX2ea8fK/Z8JjP5P9h9M3YMhlcA9XyEOh2b4EQZ8eioCSeVoHVPDLNk7uVNSJdpBlOs2E
	L+ZA==
X-Gm-Gg: Acq92OEEJz2SAm81C8aiz5oamGoykyL3kcdiggi8roLTUI65oNfmnYa1PCMOvennQb/
	b9x0meRM5C3U8+hvUtWKq//mfxMCNSVpWuXspvB2uKgvvWIu/DNYyN6ExeGvY3Oglbz6Rklt0Yo
	wCO/yvjTlanxxoLMKvb09jUbPxZkVOIDxeUyj0YtkEB5cIKnFV9kOzuH0U2H6iy7K1vlIVnMie3
	hP+ezJwXe1Q+mCniPDKqDT83201s7hZ/sCK4s5sPcM26auEY9grOM4kIUWwLXbGyNIj4r31HlOV
	4+cV7znFLzpioTUeXxh1PVqNKdwjqEpbrvLuGWJPXOBL8WHIf1Qa5hRFJcMF1rNlBUX6wkQg/um
	VLmQkYwBQ4iF8QUp9YauBMQkzhyrNSkjPGQX7MBhJNm7WfXa5p/XwKlJizJAfBvuENJFHgljM1Z
	e22d3E4HlL8kPTLmrZ0NSTl2guRYqO9EHhikY=
X-Received: by 2002:a05:6102:b07:b0:631:e729:4575 with SMTP id ada2fe7eead31-6377156b7b8mr2051106137.5.1778687652731;
        Wed, 13 May 2026 08:54:12 -0700 (PDT)
X-Received: by 2002:a05:6102:b07:b0:631:e729:4575 with SMTP id ada2fe7eead31-6377156b7b8mr2051076137.5.1778687652271;
        Wed, 13 May 2026 08:54:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b325sm4032979e87.79.2026.05.13.08.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:54:11 -0700 (PDT)
Date: Wed, 13 May 2026 18:54:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linusw@kernel.org, alexandre.torgue@st.com, andersson@kernel.org,
        andre.przywara@arm.com, andrew@lunn.ch, baruch@tkos.co.il,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        gregory.clement@bootlin.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, krzk@kernel.org, lee@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        paul.barker@sancloud.com, pavel@kernel.org, pavel@ucw.cz,
        peda@axentia.se, robert.marko@sartura.hr, robh@kernel.org,
        romain.perier@gmail.com, sebastian.hesselbarth@gmail.com,
        vincent.knecht@mailoo.org, von81@163.com, xuwei5@hisilicon.com
Subject: Re: [PATCH 2/5] leds: is31fl319x: Fix shutdown GPIO initial state
 and remove redundant startup pulse
Message-ID: <pvwvewdkqjh267qwven6gs6tptbrmj4et5ab23urfx3jqiqlgp@wl7khtx5go3j>
References: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
 <20260513144414.244968-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513144414.244968-1-jerrysteve1101@gmail.com>
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a049ea5 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=-Ea0i9WH77qr097UAlAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2MiBTYWx0ZWRfX4Y+yRDH/nm0B
 9mNwB6Rjytliyd9M+e/h1UX5UxNQEDm6p0Ll28vD0SQaTtvPTJB4NcdFjGxlUDyXzORqmgIK1DQ
 SNAHjMLM6IsJbzDe3SZfzrXFMOcbgar+bSobQJR3bbH2CbC/3klvr4QIO9+4NnEhRs3gi/GXDps
 cARNPpRYZwoHSnUM2bC1El9x81OFAe2ou78mAUzqTwuhyN0MQUFPQsXqUo7LSUIrr7er9UGOA+H
 z6vs10jQ1btZRlKdGUT33eibFXVrCmonaoEoL0a5i30iq4n3uYuF/9srP0VwmQVtpMQJXrNO+3E
 3YXY5bfCzhPuU8yNYlyp2F+hOCOCEtqH7UiIUBM5tgiEum0ldPipGVqqz6a0/pXOOBBpEEr4JaM
 hBV/r9ma8aQVkgZOcvcoTw7IhnjaAqsq3zS5Sqmbr8CwJs5XueXNXA18Hbzfw8fdtOdRbFWgYdV
 D/isa80PRR1sjnvAIUw==
X-Proofpoint-ORIG-GUID: bq8_r9lXECSQnjFpY_3ne2olffeeSbiv
X-Proofpoint-GUID: bq8_r9lXECSQnjFpY_3ne2olffeeSbiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_085414_684093_99180722 
X-CRM114-Status: GOOD (  17.02  )
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

On Wed, May 13, 2026 at 10:44:10PM +0800, Jun Yan wrote:
> > On Fri, May 8, 2026 at 5:26=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> w=
> > rote:
> > 
> > Have you checked any existing device trees so you don't
> > break something here?
> 
> I have modified the problematic device trees and CC'd 
> the relevant platform mailing lists as well as the device‑tree mailing list [1].

The biggest problem is that the DT is supposed to be an ABI. Older DTs
must continue to work with the newer kernels.

> 
> [1] https://lore.kernel.org/linux-devicetree/20260508152435.21389-1-jerrysteve1101@gmail.com/

-- 
With best wishes
Dmitry

