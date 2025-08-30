Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E4ACA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJI2jcouIdNFIlkiN+u9++AoYlDayudAZRO2bQiSIRM=; b=MtQ5mnXCoNdaetxBoaGD2sZCXY
	d+zXu8DXwrW4+x9m6Ja67mTzQjLRJNpQBBbq/zWfoBqCfEd6JC6GN/HUFDw7Hr7hXir8GQrtvYWyb
	6KQDbBaiyIN3GTQDbtuznuvfp7FKjTq/pi5i+yv8HRDmbsziFe2p3hNjTXVIkJtX/w9uYGjwaBjEn
	s+3jkP99B7SV3biZWY2b65heINhjJAqfUm26cj6Vg7tDVdPFo1XylR35qPBsjQzxGoKjeV308tcWT
	vZX1uBe89yV11ORBHmM/94fA5j27L7pfl8NgdYxH3tebfMq055KD2hfDfySk1jBhW6CDpAzLtuPpI
	empS668w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9pp-00000007E8z-42hH;
	Sat, 30 Aug 2025 00:52:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9Dz-0000000748a-2rnd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 00:13:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TJrdiL025419
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KJI2jcouIdNFIlkiN+u9++Ao
	YlDayudAZRO2bQiSIRM=; b=ArwZuVrc8lDKy+k0BX9azqRhXwe0BKUv/v/i4vTd
	el/TJknG/c+BbwFmi667kCOPoMBLjvnJTROz1ZoRe3RUf7vjXT7JmuBFoB5fr75u
	azxh7vOcooBqfKOIC9EPta/93TbKaAmbTTY5lvqMnEvRUP/LDrNRIWWMwAqcJqRX
	1pRNjbTlcFWgujtSf7PksRjWj7+g5K1XBtbAyGAR8PadaOpfGA7aWwwHcpg1VNMY
	yOvmpp0JPQJvIZpglyDXtCU2ncujgvxUI//Lx1YGFuw4yZMGsWi2Qypt8y8UPsUF
	otSnDlQ0ym025ZTNWFpo9icxc84fiNM7ccudAGK/+Sx9zA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48u4xyjhqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:13:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b311414656so34363701cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 17:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756512820; x=1757117620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJI2jcouIdNFIlkiN+u9++AoYlDayudAZRO2bQiSIRM=;
        b=J6xtl5FE2E9sXa5gXt0fM4VeIg6ycuCfdXibAt24tck5+42kKrVEkBM4k76oXGb7dk
         YIg5VU0Vu61PNMiXYB/H0tnjej+4iZU98LZlMV0Is3hcnfGzmIRyKzHG7CW1shaj7zzh
         xPQ1uv9aUbMfXDZk+GZqWVBjPJHtg419kJ8ncXX1DcZNDvk/MtNQxtkgazZIPj+SsYEy
         yF1HJwxJQ5f6hi4jDo2s7Riy8zwl/glGL0pLbqqF/2W2CgG0GblVlV6Zjnux42T+gp5u
         ouNlt9d5C0VoILV7xjlZ7U8GpxerwTVELnRoAM+qPRygOVVdQoj2jSOj0iyiIvCVcBug
         6ZZA==
X-Forwarded-Encrypted: i=1; AJvYcCU52oi0XbMh3FCT5U1HaqOeEc1hXD1aiIDcVI6IYhojVnwzSQ2plYwWWn5Nl/8AzYjOgYfDe1FIzkWWm5dpkZLr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5VJRJ3k63tnDH9G0Mm6fSdHsMi6bwqBtMu5pCV5tFwbLphrog
	OiQkeftz2FYPCt3R+PJ4jwB9CxZtK4ZV0T9KeMaomIw76U3UC6Dkfzzg5Lh2BJPjqOu1B44PT3E
	9MsK9zTJPkEwQW2Ghh6HJ3p58F+ziQFLzYmUb4wmwE+oghx8xLJj7glNzbovYqknPJRxQJpEviD
	OyDw==
X-Gm-Gg: ASbGncsLUcJkk4jdQgk5gclhHy7WG847LokWYfxNUn/EuR7BPWM8Wh8SVv4LqSKFqzw
	gRGFJlBFy7FKaT/KKX8TJwFlJBpHKuHNfsjsXNrP36+HRRwoUoTKLp3nYC0Ga2gwd/lp5DbCH4y
	T18AA3iSzuJ+EC3fcoAU1NIwc1WxMS0r7zbhDBFciBdsXGwqPP9LNKazj0o/X4jYdZnI6QyKx23
	TdepRBnIzPVZTTTAegi6z9tH1AeVg42IY0+GY5TrxlKBly794TYgyQS7ob7bknCoAqhbSf6WSTH
	rFks+7IihRz3sxiw3alxI7ds7zrIXiMglFerUE93DYiNKodG6HR2rZ4X9Ds/9Pcultvrq4qziNW
	j4ZCPkx/nrsLTl+HAAGQnEOmQBXxgfoC/7s0VGsaDXlarmg99EBKn
X-Received: by 2002:a05:622a:1353:b0:4b2:fe63:ade5 with SMTP id d75a77b69052e-4b31da02273mr5934171cf.29.1756512819908;
        Fri, 29 Aug 2025 17:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG7ajyHbJajLssqNp8zWk8T0G5qqW1Lj5h06mAnpHjHupukuww4VcBryXSzV5prlDAKnbf/Q==
X-Received: by 2002:a05:622a:1353:b0:4b2:fe63:ade5 with SMTP id d75a77b69052e-4b31da02273mr5933951cf.29.1756512819440;
        Fri, 29 Aug 2025 17:13:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336b484c959sm7333281fa.43.2025.08.29.17.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:13:38 -0700 (PDT)
Date: Sat, 30 Aug 2025 03:13:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alex Elder <elder@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM
Message-ID: <forjnpvup53gpezaaqg4kri7uek3qipgamqhwub5ke2n4gxfkz@tovo2wzvppqo>
References: <20250829165031.110850-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829165031.110850-1-petr.vorel@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI5MDAzMyBTYWx0ZWRfX0hy4CsApfBRN
 0wWJlqTmpq8o7mAUYrkxDDYVdh9SnTkbQtcmO2MZudGSfiWvs/vecF4yyCh7nN9CxwacbabxGuR
 z+P1y2XuNBdq4q6u72RxNcygx3S6n9+wrdlAiJ0VSiAF4mao1ni+movMIUNsAH09I/SFaB60ay1
 KR7lBEyZTmFDkrJVuZx3kNiIMbG3+NHedwNJjlY9D8uztjapDv4CG556a4iDhOtAF8qrgSEzJ02
 a/PKYiz+L+5L5QUl2S9g5+tW+YPGxThYx8lVEwtTBC6Jj/DDlnRkxVfwXqVO9D5u+yoUBgDQJwo
 QsMlIMgLPADraSrkPhTKZ4OgWFBg2WVTNyjRen8qDYqB7knCWa4B3S+PnmB5F4jUD2aOrRm5gEo
 Rlao2xjO
X-Proofpoint-ORIG-GUID: GGesRIjp93mBVkSzME1lc71wPKn9Swb0
X-Authority-Analysis: v=2.4 cv=PYL/hjhd c=1 sm=1 tr=0 ts=68b24235 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=dHa85sIdWx2pRmVuYm0A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: GGesRIjp93mBVkSzME1lc71wPKn9Swb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508290033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_171343_741493_74CE0EFE 
X-CRM114-Status: GOOD (  14.77  )
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

On Fri, Aug 29, 2025 at 06:50:31PM +0200, Petr Vorel wrote:
> CONFIG_USB_EHCI_MSM was removed long time ago in v4.14-rc6
> 8b3f863033f9f ("usb: host: remove ehci-msm.c").
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  arch/arm/configs/qcom_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

