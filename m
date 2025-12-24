Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E22E7849C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 22:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnqeKfDVEUH7RrIR88HfljemBK9UZki/ZbbnLXfs5xc=; b=CrPPYbF/pGVwIsMItoQs6ymd48
	K380iu6RLkjd7F9C6igRaUqayfs1xJDgG1fpJFHimTdELB/ChPCHfMVmKoiKeF7HDHmZXpsRPwU3o
	O47N5yEHUfrcBaZaK+m3ui5kWCJNqKtq6P0Zjd/gFhdIbuBVa36JeatRMty/KZNVKDYDeWRd3PR5E
	e0b+iC27rxsR6YaCkg3tZtuNYolSNJM9DKmPO0zPU5+65/ooYVvaT2IBwb4+WXTGUeINO/JtIvmzG
	7xwITJ791uhiP1uDPhl3G/xbrOIK05Atk/du9ewT4/pRLK+cmykTX4u1gT/U4xg9BpbcXfVIPNbcT
	wR+LJo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYXLx-0000000HS83-2yjU;
	Wed, 24 Dec 2025 22:29:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYXLu-0000000HS6v-2pKT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 22:29:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOJP3gr4057434
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 22:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnqeKfDVEUH7RrIR88HfljemBK9UZki/ZbbnLXfs5xc=; b=m06/rbe/crPqalbK
	uh4vnpL9CD8E7INXhMCw4HfEx8iYczBLZ93py29srR9424RkTc+Yu9HHa5Mv5Q0c
	JSg+FDnZDK2inaQF2y82dQKTugivRmJH7JuhEdR63Ahn1ukaBStAQTeG33HzdE2P
	RNokJsLXaMcP8Gh/s7kXdXpMJCyB8l9fOEV214oZRnhogtKif/jk+/PjAa1x9Fg4
	Crx9f1OSriZhrDc4tbC6E1ItXmY+N/XOQ801h/6D/fNYEaPQl/ovAgiV/xsK+hBw
	U+zwqTezlYH1FjuPxLrlVWoQ9cu6C8baUUbzV9ZT/yrBcaoMhk+sTuk9r/J1lU3T
	AkkfUA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v3emw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 22:28:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a37ca7ffdso92723876d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 14:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766615330; x=1767220130; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jnqeKfDVEUH7RrIR88HfljemBK9UZki/ZbbnLXfs5xc=;
        b=XFaoDSZwdQtiMCtFB6gZsItg4xrL8uOUUZw98r3yrWCkbXUkXxJy5E6ZM1KL4bBrEp
         yJ3+geFtIedyVYaDsos01x2WcL0AAUzNakJbkRBY9d9UeVH+BWxZKhHOqzGH+PEXlbJO
         jdFxMJSFnDcMmO9F7Db2IoCEeXoAxxVzT5KLya87bsDBuSl0+BAwgUnMOPNT8gzQmuA5
         i1+B0zvV9OSBfGcj/3akxr7LB1YueC0TlbWrheEQCbReGiVaElWW/u8fmtOb0tFrzWJl
         AqgGBsiaB+eWayXLkzBBJO0T+qXcWxAUTf+IYXUhm65FHijcqHMvKSLbByA9jzqzmZ2/
         1hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766615330; x=1767220130;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnqeKfDVEUH7RrIR88HfljemBK9UZki/ZbbnLXfs5xc=;
        b=qWEo5lJshx16wzyIfmYh1uFrEOfjvF1rtWQiVNs1EWFfWmdWM72I8dxq6H1roJuhCz
         IOLOR5ZfhKcA32JFwzQnGmcqDpUqMR5qqG9iSFQqUQDOQQltZPe/DGTx0pGDWF6qZIMJ
         8pehuDhYWMffawZiZqDBYdjdmdK7puFKl/hJ8/9HGJpi+/DhuiD8PC/6v17s/0/F/nKt
         /SCK5ISBDq0X3qcX0meNWMhVmQFIINaSkERt95j7+EIzb+xo0Z/tHXVhqJZ5Se8Ko+5l
         xC6JzkXQt4qCp6wZyPIBFvMS07tvjeVIbxqRdvQ6QQXiU6GwCVN+oA/nedUNHqGs5XGO
         VJMA==
X-Forwarded-Encrypted: i=1; AJvYcCVPOC4yxhUV++PxWfYl6o0Jn/G2KYRfViERaDGFP0Z7/5SlYHDzhbvqsOZCEDZAO2FeuhLKMLm0ANkFL4BJBSOY@lists.infradead.org
X-Gm-Message-State: AOJu0YzEDGZZyAadiKxV41naeh7rtmKv/hz6GF2hcGfjT1z5gbAP7UlI
	Q5Vm1wvdlt7YBWCsHmACgnbYiNw8YiBNIEw9gii2QxJyk2QrTgplJLF9rCTi2Fe8/DdyX3Lfd4p
	0PP4pupuQ4rEPlDZL+zmUJpVZSdsOAs8jqrOGv9vsMhy1TX4jf6Usblqpf2c1BTaUnJKLknM4vd
	GhEQ==
X-Gm-Gg: AY/fxX6P2ckf52k2I5Rhce7DlO2KYhinqM0bvYQL0HfE+2sXJCUxsXtCe5UPOFjzT7R
	T/HGrt192ZeGjYASiueXRBEYGs0NhLTiI3Ys1heNoC+BwII7/4AqWAGqzuvravIwf276ImpQaCe
	nxwOj5xlve5t2kcfD2TKQtfq3jq2nwYcj94ny9e6mUiQdWo/k31qZLdn+hk5laPoVPYMeYOAhEd
	/jnhmWD68AjgsnO2JAOm2JCf/ADr5332lb9WS3+oM7vxpkE2YNm1thHZQdYiYqZj3r2cxlcm6Q3
	wrpOGtO7xwHaIVcyNjoQGFfWHGr0mvMyQXYaPHEpyVnwe6RGSbTcZMunRJU9vbRs2DuR9tnupd8
	uFx5IqaFHoR9VUY6xLBNlgqG47uV1whX1aKztdukExioiU0EZlpHFr6pwiVKv2CPkyogSR6npv6
	nFB26ltBrmm2XEHLgiM5cBq3A=
X-Received: by 2002:a05:6214:1cc6:b0:88a:52a1:2576 with SMTP id 6a1803df08f44-88d816677e6mr313884066d6.1.1766615329935;
        Wed, 24 Dec 2025 14:28:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDjHfHLudL34DV3f8CJ7r61XAAinJKO1G9J6E+GUx3WmZ4f3SX+neuLfUYgLL/zzuLkHENnQ==
X-Received: by 2002:a05:6214:1cc6:b0:88a:52a1:2576 with SMTP id 6a1803df08f44-88d816677e6mr313883876d6.1.1766615329428;
        Wed, 24 Dec 2025 14:28:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd1e9sm5197038e87.23.2025.12.24.14.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 14:28:48 -0800 (PST)
Date: Thu, 25 Dec 2025 00:28:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Andy Yan <andyshrk@163.com>, neil.armstrong@linaro.org,
        andrzej.hajda@intel.com, mripard@kernel.org, jernej.skrabec@gmail.com,
        jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org, simona@ffwll.ch,
        tzimmermann@suse.de, knaerzche@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v8 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <h7iqdiolwb5hkqdkbirqjeytxu7h25p6aptspgdvndbv2husd6@mb6vroredden>
References: <20251016083843.76675-1-andyshrk@163.com>
 <20251016083843.76675-2-andyshrk@163.com>
 <8913609.MhkbZ0Pkbq@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8913609.MhkbZ0Pkbq@phil>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDIwMiBTYWx0ZWRfX+mFz8UNrJ9+G
 3bi3R3W5iSGZcdKtLfqKNtMA7urummZisSbhSHUl7jfE6lvd01Vn8QXRktLe7StRvqhSMgHWx8l
 qKJItxzHebG5HTQReqieqlWs1JsivxZAo36ck3wGVA4bJ/f4bUjjcBdvGsSMBrd8Uow3hWRAgiF
 17CJ3PuS03D7TBlhNIxfYsPdSO2CxOgzs9UPGP7aLpwoLh0zDZezUZ2waGAz5pSykEZ73SN/vbx
 Qo7juBC5uH4Mzv3NZtqH5mfmUr+rLda5aNcBZMCJdanuk5ywlHZJ1nij299B1i5Y7quIo+XEohQ
 DT/FymcxkkTzHdfV8hAXQa6/4JDDVhLb6Jq1TyZ4xAYMT+7eNxiToNmDzsgE7Dk7LHj8ajS/wrA
 B5vAJK4SCwzkrdSi1ubrsZd6R1uTVi03Mt6XyaPYcwPffI0pEr+MjzF6rCOoeF/+bv990OM+JaL
 aWW4/D4dELCbY+emeOw==
X-Proofpoint-ORIG-GUID: EUBNthUZbj7FW0R4NJ4TehIDQafEGfUO
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694c6923 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=Kmzl1NW6Bz_df4YWhFgA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: EUBNthUZbj7FW0R4NJ4TehIDQafEGfUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_142906_995534_56876A23 
X-CRM114-Status: GOOD (  15.85  )
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

On Mon, Oct 20, 2025 at 02:45:34PM +0200, Heiko Stuebner wrote:
> Am Donnerstag, 16. Oktober 2025, 10:38:31 Mitteleuropäische Sommerzeit schrieb Andy Yan:
> > From: Andy Yan <andy.yan@rock-chips.com>
> > 
> > Convert it to drm bridge driver, it will be convenient for us to
> > migrate the connector part to the display driver later.
> > 
> > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
> But of course I would be really happy if someone with more experience
> on general bridges could also take a look.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

