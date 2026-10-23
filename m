Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9644606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QyoxqckF;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENbUrwKw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NuxL/lRg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/4w9d0sRIsQ7UXyR/DRVXY1zFUeXW+at3Um1GzAx8ug=; b=QyoxqckFi0W9nUcN5kdompv87h
	6N/VbdaqXPdYqnUAr5p+aejY6kD8yD5jGaPfAqTzyAUuJphkJy3kcI4zy1+bP+V+UdZ69AZfX4FQn
	03RkONd2fKBsJyHi2eEOapF+wYlngx/VkI2PQCAgKZbA1apqJxk3rXTkuhjqLqLLoEF5DHbbHVLj0
	Qf5cjPH+BzL24sNg4uLi4QYQoZ3fzuWJABaC0t8QDrDy5oeg+6zQ0rg/mcUskEWJ2FdVyCeDRptUg
	HkLkPDj9KmYToeYDMZEntUmDPF64Y6K6oyUGANKl8IJ+24SDgxjsUyjDmBL/znXFlryOCq9N3CK0/
	Bk3SafIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8uC-0000000Fats-20d3;
	Fri, 23 Oct 2026 06:37:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8u9-0000000FatF-1pq2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:37:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FOGF428562
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/4w9d0sRIsQ7UXyR/DRVXY1z
	FUeXW+at3Um1GzAx8ug=; b=ENbUrwKwANfB9VZ5cqxGMnLdt+7iBTxqZsStqlBr
	wO9G3FNVtMFEqSyfi35SvjYNEzqF7S7XLFlx06wItlOCffI2kxTGa7z6QV3euD02
	CZ2WCtzUMhdhFSHVZLdTRGMSonN2cf9wS8ES1FxfvFHHY36vLNW7v225W9A5s66i
	59MYsKf7AaKuk5f95DEZ5rzkk0cvV23yVo2wfUOmWLJci8Z3NuhSj7JYwMvltnx8
	XGAz9bm92jlcmI+Gc6hboVIMm3MT+Y2cZ9A1Uomyb96Ltk7pLaSm0Gjk9H71laSP
	QeMZYgd1V9xOS/p0en+11kCAxI1v4gUtD8+VtppQAeU44A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms28fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:37:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad5f977673so142417a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792737448; x=1793342248; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/4w9d0sRIsQ7UXyR/DRVXY1zFUeXW+at3Um1GzAx8ug=;
        b=NuxL/lRgMmG+fFHeaKJZghxcTLwkL7I2B1bM7PCpDu+jnQaJiZzeo/XGwI/7Eh8uX6
         RZnZyCS2dwRGx+4CXshnC1RKRw+fRPhBr8EgKwwC5bP3kc3VGunfC37RbnD0g/krtpzs
         Hy+kKGjP3jjvGVXibEZpqgXpkeEmoDSiEG1UEKDGWB9iXEtkjHoSxAVJ3UtfzGPE8+MG
         e8s+LkfV5U4SdhrihWWADaPFiOEXJphaeDtFU3SRfrk7AJkxa7LdRp5CEIjrpX7rkIr6
         R7X7gVsVKfZn02s99/R552yM8jEEngzBUIg/oJtiIbUVpijiDZEgDn2R3jFtVB7Zcs1T
         d/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737448; x=1793342248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4w9d0sRIsQ7UXyR/DRVXY1zFUeXW+at3Um1GzAx8ug=;
        b=CB6vZbrVrH/iVvRoB8d33fTY/WztBSO6u1AYez4qzlMJF+iQhI/UFRlRp7T9Eii7qk
         /oaeknggQbHfoKnbPXUUbcFYgpi2ryc/BUSZ0Rip2gxHDq+NcMB3pMcsd+fRTS1enST6
         EuR/PT/vu7D9ITfj7DjvBoOJDBQjH+z+KUwHnJmMzDeDPxzkX/UFWykdh+NHJMw4PWgg
         qg8+oLxlJ3jg2ETd70KF0QlX3qFJpXbePpc+p5DfEDED3TPyAR7C/gAiNmmsBlaYfJKn
         kGTo4w7ihGzEHRt1gAcQFj3DVmwnkRqwblCoVcLCUnIe7rmf85kTIUpG71TH/c8ci1fu
         +Pnw==
X-Forwarded-Encrypted: i=1; AKwUvBzKkAjmDnENb1hXBYfx3Ty57p4w/cqa3cuoTzaJmhFuCn4NrX3tItI/NtXxPrBCYT4iTOoAe01ByothLJ2fDavt@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6N/nW91vudeaXyFVIDQP7MD3IKhJ83bJQBo31BpP5U5YwY+i+
	vHPjIaiJe0El8IjzJ+m9WeDrxUdQ5K0MEpDXQ/ScCO9zN/pZrh2DCJ1texjW9wXdy4E6QcF19Ia
	U9jAhWc45Z3jRKgFCY+4ldWTKgA4mr4n2O2v0Dy2p7Hv8voSVopJu+C9mzVypGrb4UUB923DbyF
	vSfg==
X-Gm-Gg: AYBFou0s5fM9mQl8zc5m3OD53wEQs2kALlvyKPdLqZ/TOh+b3wvRmu7HTZHGu8MSRsU
	n1F+qQZpkAryR1IqTHvEn1AkURV3dSRgiIeC3mOrxg79RhohXEOqod6s0kqfLq6yzynffm5xY8r
	LqpOCFHrr530xgiJkFeLaEWiztSwHGPNVx3ZGECUrw+CMU0HqnOKqDJQSp2IIrLbSJLXqT9u8zz
	wBVgmWiYCIlFUHHiYhKpbzb5vgYlBsBvIERzphrxoqkQ8upGODa+lPNS/dAyH0OkfDulyNfxh4/
	5TGbng63Jxe+yg8D7sJA0COEH07xLJnpVswt2n/CiflEdRUU47doL00v7xm6SjsIPBYsXWRL521
	iqJYnwScQV9rxkYlseGoqViHXdF/EyuPLIxXWmbApS/VGjRt9cBEwoQM3zj+GZQPxqRNmy2peHp
	yA8tcLGpjoNdsCK75/u51zLXN8tqb0h1KWskt/TrMepvT32H/EhqX/
X-Received: by 2002:a17:90b:4a0c:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3adce72b4c2mr1870526a91.4.1792737448027;
        Thu, 22 Oct 2026 23:37:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0c:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3adce72b4c2mr1870495a91.4.1792737447564;
        Thu, 22 Oct 2026 23:37:27 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890bb2sm7300020a91.1.2026.10.22.23.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:37:27 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:07:19 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: shikra: Add display overlays for
 EVK boards
Message-ID: <atsAnygcrej9e8Af@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <9da45e28-ca6a-47e4-8a04-f1b916552f80@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9da45e28-ca6a-47e4-8a04-f1b916552f80@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfX6uRZRYi3Io7g
 aNhbpzrAWvCeVMXm9icpClVc8U6CYT4AxcsiMn0u9I+4kPu1Ng2BxPMI4O0WtaS5khc9ekNDLLS
 okc0Cpndi/gfAoaJ3n+zBvRbq2loZ0suZ/EA8GZBBS+odTTc34gRQQ3bnhjyRWx7e+zF1o69LTn
 aCgl/8mTMAuNaoLmSrayiHK2ggDPvjj72qQCoeHkjDvrNQKYHiDCLvWikUNLdOtQfNBDo6CE40c
 qhn3YasMk3A0vt+uYKRCequ58+IJYev092P1eaZiboxS5x83uQGTMimGc7lk4rn1YtGYQAHvCjz
 H6+dhMzmZIx+IOs5emflm4pEqOmTyO/k4JTvgXkL0z5J8dHDyPn8V2qSmmI4wJLgcwkKNDlA6U7
 rHTzvslQwJXvHVO0PbezT3GkVt9maU6lbyFCaIt5pcbDYly7BWW6okdb9rPASdOJqKwlek7Xtaf
 lAVJLFnGD3liz/9ml+w==
X-Proofpoint-GUID: nu3f4N2NCo0hKATSWog84J67HdeB1eSw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfX0NIW5XMzkHuf
 RgbA2XdwmWTBoDP7kgOtMWQUOvYAD4sZu13ZS4qgZiScVLqQ5tzlX1FXxtk+fwgk2rL/6lpWAJA
 itoqutazn3AhfxlEaGofJ6TuNQpu08Q=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb00a8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=i8vls60rVJ9ycRQRyeMA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: nu3f4N2NCo0hKATSWog84J67HdeB1eSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233729_476721_795F43E5 
X-CRM114-Status: GOOD (  17.98  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:14:54AM +0200, Konrad Dybcio wrote:
> On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> > Shikra EVK SoC cards (CQS, CQM, and IQS) are mounted on the Lyra carrier
> > card. The DSI0 interface from SoC card is routed to either the 22-pin DSI
> > connector on carrier card named as JDISP1 DSI0 or to the B2B connector
> > named as PDISP1 DSI0, though a MUX which can be selected by a hardware
> > DIP switch. There are multiple daughter cards designed that can be
> > connected to this PDISP1 DSI0 B2B connector.
> > 
> > The below B2B display interfaces are enabled by default in base DTB:
> > - IQS: DSI-to-HDMI using the LT9611UXD daughter card
> > - CQS/CMS: DLC0697 DSI panel using a DLC daughter card
> 
> But if they're daughter cards, they should probably be overlays too?
These daughter cards are connected by default on the respective boards.
Therefore, we keep the default display configuration in the base DT so that users do not need to load an overlay for the default setup.

Users who want to use other display interfaces can remove the default daughter card and load the corresponding overlay.

> Konrad

