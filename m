Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BBEC4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rnuTTxS3dtHAIgoofax5iZiwmNO+2ul3JOTWMDYSu8=; b=AyJjm2KFBLEEED2geHuezQVuDx
	P4L9SDqkgtZnuaa1TJRFoaCMaFPFAFYnMAdW67r1f6UX50BYf3AnngvJakiL9BCOr7yDKvhlrE9+n
	hwZvKQFGVcgHCU4Apkk4LCD/ZhRPgvaZiCRkKrqLah8XmU07QaOtwiksP8f4wCLg+gaS1D2Bk+cvW
	OoVTOb1Y8TviEYO3bnYBlLwBwa+/mkaSqiDRcyXovy4kUZRqpwbZquNPQPe7ANJquIRCTwnzKXf5u
	6xhC2tp1z9PG+SaFtLLz9zxG0nhcscCNbKFFslTeW+aamkVaP8Es2XblbgbXr9k05urER0WEnZBuk
	wnKl0JFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnyv-00000006nZm-09qZ;
	Mon, 20 Jul 2026 13:24:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnys-00000006nYT-0nL2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:24:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvXaV2457842
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 13:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2rnuTTxS3dtHAIgoofax5iZiwmNO+2ul3JOTWMDYSu8=; b=eFxtgw5wut5B92w3
	RtZVhajGc7llr/dfSaSe83kq00XNfrpnd8/z4naj0xu1FB2kRE5ClT3jFInM4NUk
	OYC/SDqCunEnuJAXFLaWEamwJE+jF5XzAECMf0TH8KGT2GCGKsBD8RkQNevWqaUe
	SK29H3kDJuKVntvjF3xkn3T/XNJ0RV7v4Cai3cKyn1xib7zOJQVepqd0zgt1VCQN
	D3OTVNOlrhrltPMuOxNITi9kr6IQGWHxBm/b4Nhd3r82vSAGMSCSGnDWu/m7z2Zx
	I4Ku6WhSOp1WwCOM61lpaFPN07QxjYiAtxTHCypTFVRmvMibPCSx0+cK0rn/r8f7
	HoC55g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0kskky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 13:24:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c110a3b6aso109115701cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 06:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784553864; x=1785158664; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2rnuTTxS3dtHAIgoofax5iZiwmNO+2ul3JOTWMDYSu8=;
        b=DQMugsXOJKYqSp46+HQNvJQdI46KKu0cmkfSqgB3rfcbiPbPMsguqEBThY5DLmqXcu
         BsNyRiIdknDjxE8Ty3YoR6cxcwD1ettFxmDNeZUQQ/tsiZxpcR/emz7jxTLf8Ps5y6SY
         zJRjLNYmOZI7+u5BYFawc3HPiXjarMd68Xd78opBOjxI4/3ITVP9DnKsoFLkQRSiDbv5
         Dt9DWhUA+k6+MSP1iMvgR/JNxkLpquISZxbx1QQJztR9bMxA8SrVggDCugfUEi/3rSUL
         wJRANaFfsC0m4mdW3hPtxxHV8g1lKONpKp02vhqc1Hfr/gx0inSLpP+Fq7hpkvKAjkdO
         gqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784553864; x=1785158664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2rnuTTxS3dtHAIgoofax5iZiwmNO+2ul3JOTWMDYSu8=;
        b=LFYPET4KKWGteWDNmA7x+vZBtZNbHx2MtxeQJFc5fpsdZjCMjle/Is3HJhcnrfe1Fb
         hl0FXUGUU8Ssx8f/hfA3MvUyash9LfrCQ7toaVviLUqgb/lUD87w+jAbZLqLO3iDVObl
         TCNcH1mCBliumziTC4PZaLiNkheHWm6klsPguzGq+ZEigTTNpW/cwhAf/pAlgjoDDU5H
         uuA8wG8M0cr/CLnd3Ic14OwAkPuF29BMlNWNeRKgtfvoBiNXhnQEW8Xn4XUmRvDI+EC8
         9FkuGaleA8PomPtiP3Dx6KgYKOPSF6H4faLCw+O1g9upaQf6yEnVu/8l5yXQJg++Dwbt
         U0bA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8iRHyIhJG2arxnpDE6u3XOvR7vK/tF5mzuXATDOzUZaE/5SZYJ9Tkr2i+hJa60TxkF1Y9ztbgMcbdVzcmx5ZF@lists.infradead.org
X-Gm-Message-State: AOJu0YzOZ8q7OAZ7+DfpsLB4NcyLW5uyQDHgc27MtRriQzSd7Ui6ztAc
	dHGP76EQqEjUvIw3IDYJVnLpHFoTygHpTiTcJmkAdDfYduAOlINRThpJRy8stoxMejn4tvZw1R8
	U/ksUqZdML7mc21I+mQEXLSlEt4xoseJZ7SUhmEG08WqTE5TvTIxa6W4R7XuXgwg9jIa63ST8pA
	RlbyIkvT5+SA==
X-Gm-Gg: AfdE7cnxWGcTRBhbe42NNvaqnzd7qIsaKiLQuQ2SVLaKYtRc5Yj0WnVVRw4qu/P9bEG
	fQZliBaNq6Y8gBIkCkfUjAOoQvolxB/XhDVSFwiW3KO8LE/rL4tNdb/JQ8c1EabusaNa/henXwo
	Y90vGN2CnEVjxonDO4hKlBYj1FRHu4U6GRCDbls2cEkwNONR/41Ps8ZbIhQOoXqjHYKKBYeCf89
	zw3HGlXi7P0NFJMFo10WN4oSSfa0JrL07p8U+RrnTIGz6x3SbUIGD4G9xQA80nTcdLKLqz5b7hW
	YqLJJ2ZPeFT2TvO1hMF9MdK8FIjf5azgK5ORyk9ikQJOeswJBQhHxJYo5+LpTDRByOW3DBZEMHB
	M+Qs6sxsi4sTWg1qTZw0kUXQAut9RdyFEYc8/97JXVQMI72wgG79Etrqs3P6nfU9hg6vS5KxCpn
	Y7NXWFSXaE2CoXfg==
X-Received: by 2002:a05:622a:4110:b0:51a:8b64:69e0 with SMTP id d75a77b69052e-5213d2b7109mr130718291cf.11.1784553864335;
        Mon, 20 Jul 2026 06:24:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4110:b0:51a:8b64:69e0 with SMTP id d75a77b69052e-5213d2b7109mr130717871cf.11.1784553863758;
        Mon, 20 Jul 2026 06:24:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e0ea8dsm2337558e87.41.2026.07.20.06.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:24:22 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:24:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
        Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas =?iso-8859-1?Q?Niederpr=FCm?= <dubito@online.de>,
        Simon Wright <simon@symple.nz>
Subject: Re: [PATCH v4 1/8] phy: rockchip: samsung-hdptx: Fix rate
 recalculation for high bpc
Message-ID: <al4hhLKoufegMPAg@umbar.lan>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-1-ce5e1d456cda@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612-hdptx-clk-fixes-v4-1-ce5e1d456cda@collabora.com>
X-Proofpoint-ORIG-GUID: rARWVoZaNhWHAhu-3ijkPGkUfhO-DL4W
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE0OSBTYWx0ZWRfX6ynZpLkUYTXC
 mJtNnhyjFvhW38lkGf+kqsdFVwcIG2/+iwC5xODMTNb5Js9Z3nkr3SZ3veFHQFrXMFLXGLOmt+l
 yWQBlBqAfFg6q5hc/tsLBVpHJXrhQP8=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5e2188 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=LBX7SfcbrNp00noYVVsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE0OSBTYWx0ZWRfX4FqCUPtGQD+c
 u3saG8O1suV5GspUYvL9P0pcjc1PshimzI0n8/ggUhz1ZFM1uEEFdaEAIOb4dL7Gl4S/NHbsg0S
 c9ZQCBRLwu2JGZs3GHF3Anm6Y8JPQ/qG/s/69yT3ZglggrYFtYzeK1R0MTHb5xR49tXRLBaDXE1
 YaT4Vq3cEW41XuV/kvIpWrg2SZmO+txlA2ALiqzFfJT7CjaQLu7SP7Hn6RqXNnjBvZcYkZ+Grdn
 XFpKBeTm9LDDjp8atNtal7kPy9D79SN2y4GvaR86iLFYwlOGhKyT8T5G8576uybWvRKOwZ2oiP7
 lADjjj+mFu2VOTfn8LCgvOzBqQB00F2T+CEiQd6cC4lyMPNsWiVJ2L7d/WA6RmM+ETVIoCq3VY0
 XojvRvCjINx9O8IkOJ2+QFhMgH4cAYTXafu0pNLtJFRiLW+kN3sUVXuVWUESIkflzTlcULmqhFF
 C4Sf+B2a9APLX9PcD1w==
X-Proofpoint-GUID: rARWVoZaNhWHAhu-3ijkPGkUfhO-DL4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_062426_340705_B485BFF5 
X-CRM114-Status: GOOD (  17.07  )
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

On Fri, Jun 12, 2026 at 02:45:20AM +0300, Cristian Ciocaltea wrote:
> The PHY PLL can be programmed by an external component, e.g. the
> bootloader, just before the recalc_rate() callback is invoked during
> devm_clk_hw_register() in the probe path.
> 
> Therefore rk_hdptx_phy_clk_recalc_rate() finds the PLL enabled and
> attempts to compute the clock rate, while making use of the bpc value
> from the HDMI PHY configuration, which always defaults to 8 because
> phy_configure() was not run at that point.  As a consequence, the
> (re)calculated rate is incorrect when the actual bpc was higher than 8.
> 
> Do not rely on any of the hdmi_cfg members when computing the clock rate
> and, instead, read the required input data (i.e. bpc), directly from the
> hardware registers.
> 
> Fixes: 3481fc04d969 ("phy: rockchip: samsung-hdptx: Compute clk rate from PLL config")
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

