Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A24EC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyZTxG7+Rkh2o9N/uSYU6cRoRSlOphjtgwLvLuA/HA0=; b=F+PbXtW4CZwTg/RCknw36Uq+nZ
	uhdApU/a2WoyyEmdnwGMEv2qOr4uu/sXUQBv7r/SCodbjcOzA5M46CcsGNdH+SMLvXQcQwds5xJqG
	PuSJJtRafQ8p+mFFfhLeLmJPQDdzHVemxLT4aDokhPQ3Ut41/xYtwyNg7p3cB3TTJC6LE+9qqUUUn
	e26QiED4PnH/p9e4nNiOAD1tqToIdrB0CmesPJmn42EXBqfCTgqxgg3FN6e9u5Dy8ioAOI2koiMAA
	gFQeWN3i45o5+Qt/TNN3mWwx2TUX2UPpZsoST80z1QT7ZRI4R4l6HDQjcoMdA2kn44Q3LAo4YbPBZ
	+AYpF+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlonx-00000006wGH-39fW;
	Mon, 20 Jul 2026 14:17:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlonv-00000006wEs-0gRD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:17:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqkND2604972
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XyZTxG7+Rkh2o9N/uSYU6cRoRSlOphjtgwLvLuA/HA0=; b=Ytn5/mj0JWhrVIWs
	cxPTq1K/nohSxW76BAh2IAcjy8DN+GzFEdiYTfifALhLJTtULkotM9bHes7Gagd0
	jmFf5Cun40sHSNeN9wiGBw5quHdHNGGYk61NI6wTcKbWn6vfbK/c3fCninX6DEoV
	GQB9J4ySQImyAeSyTOicbYkn4qAnhxFxSoPtpmKYT81zhBl1a1jYttOrV7Hgnj4I
	MVmJUKyirLHnrZCAVaXcLgbOlsyeyI/MDRDi/rXSpwKie+0//8eyj3CCgETKPbvr
	J3+RxG/81afFNWtdZrv/jCtA4vpjAuqXbqkO2L++1OeyGvAIEBgViWN+DtszcX5j
	JU5kjg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg9gy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:17:10 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738e5b5ef68so4004662137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784557029; x=1785161829; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XyZTxG7+Rkh2o9N/uSYU6cRoRSlOphjtgwLvLuA/HA0=;
        b=dMNOHzB5GKiCIaCpzr83LxbVEhMFli6bZCEAEctXOY0DdGVUbKPV7FQ2ZjcAz4ZqS9
         elyTu5eda6ieVaZtb9JKCAnFgEyu8gzJ8Ep1UqBqKvsxnOEZHVlqsDv8Jlx//uvAmtN0
         t7AISdvecwVY0wDjuziPHBFqQhSj1T2zItkXNPwAjfTV0Ujp/vXCmZzJwgMCCxgsUTjG
         NZSZ7fW8mOyKrYbk9dDDVjQXNh4YRmaCtSalKtpj8zQcVIiYYBKQzK5O144IRd+32Rtj
         3TJ9AHQZsn7VNqAPoVWaYhgbx3SSm14OweaN7+KorweWbi/cgi3Z3t7UzysnP+3zdCL4
         tlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557029; x=1785161829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XyZTxG7+Rkh2o9N/uSYU6cRoRSlOphjtgwLvLuA/HA0=;
        b=aIgWmPxGHg3UhX6RunCtM8ykvZIQHl/5hTRI7BO+2baQwbfvPJx1yHC0KTvH5rPc82
         i/WnRJGWlscqLZ/dAeNZFTyUR4WUWYxHuDcZ53LbWZjRsLxrQt+dZw4duKiDR2wLR4dz
         OzAE9h5Zl1p4gCGj5a3jRi9kHTUvPAFO+gZx7zsuplJ7sZLnsCWMFDvYHgi9V2QfO6bK
         isIUNMjTQtGZEJ/0axaYX2sae2s/vVgLVe3XI5dvlTiljWY4Ugmj9VjmiV4aSoFrzDuL
         RZUyzSVA0yXP8e5PmtcNcKGVeHcHyc3ZQpvo0FUvT/vrL5BI1rG9daWwsHvGvl9OQkit
         iVjA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Q5ceEvz9iV3x7JzUoXTZIYYsf4SUu45+PeLWOy3ZBTpc0Jx0B99C0LL9IfP2G3fm/rrfyj24cK8V2tVT6eOx@lists.infradead.org
X-Gm-Message-State: AOJu0YybWjQ+eVJY3MopCrotRVYe9yy6doDs2PsZEpndk3woPN5eAKnl
	QGMB6jJESuGDa2XwLC5T0wRmQSHDM3W7XLjvi5llkyTilFEF8yx/ZFvdn7cuxetB2TYYcLL0qZo
	ttfs3HbIMJ/k+Ov5/zbjq+a82FLjpC/SOFhOeAceVe1ZjNlOvkzaRpCqxQy9ASkcTCSVEYy0s6u
	9Hmw==
X-Gm-Gg: AfdE7clzNYski5SQXiEVOOfd1JtHncEeP0E+SXfkyIVQMHXhzHdUtgKCKCt2vKl+tEL
	gv4PAcOGyt0X7G4lCSo9VG3lpce9d3DaXfUEe/LetxQmOnHFoY6ajsIQKs8c6xgQvF+uwu9sRU9
	X96O/7SrCU2CgYltdcCCa6623Q7MF8M1w7LLNyySfrgIPdRkF4tBdQHWGTbCfLb1PJDKZyWAD6E
	xtxsqH96hqYRk+vX1KZwzNKbmLTcWBJ8iK4qFCxFZEBgJlcFxH90xl3U/2cJPjO0YwD23LxcC1g
	ondegSPL+7KCfLXuQPjqikCsN7M2utNnpvw5wkabbwFTHu6Xl4OuTWwUDyFxHEiEuErohHlV3XD
	iEfFgFuv/J41Y0Xpa2KMh5lccpIOXufbBK2Gmh6U6MYD/Q3+l2KD8OJYKa7wIem5TK0j/3VkG3m
	F0ZFrb3ouT9+8/ew==
X-Received: by 2002:a05:6102:3751:b0:73f:7bca:217d with SMTP id ada2fe7eead31-747536f091bmr3504163137.20.1784557029405;
        Mon, 20 Jul 2026 07:17:09 -0700 (PDT)
X-Received: by 2002:a05:6102:3751:b0:73f:7bca:217d with SMTP id ada2fe7eead31-747536f091bmr3504137137.20.1784557028783;
        Mon, 20 Jul 2026 07:17:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e189c7sm2365363e87.57.2026.07.20.07.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:17:07 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:17:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
        Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas =?iso-8859-1?Q?Niederpr=FCm?= <dubito@online.de>,
        Simon Wright <simon@symple.nz>
Subject: Re: [PATCH v4 4/8] phy: rockchip: samsung-hdptx: Handle uncommitted
 PHY config changes
Message-ID: <al4t4aN01iiUKff_@umbar.lan>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-4-ce5e1d456cda@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612-hdptx-clk-fixes-v4-4-ce5e1d456cda@collabora.com>
X-Proofpoint-ORIG-GUID: SZ8ZOG8I7U_XoF3zHwpeOorHZ7sF3pUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1OSBTYWx0ZWRfX1zvpq/v9CSLe
 H6d6dpVICHZnvNd74JcK0lVi0TFqGVWUBuBgTeCEqrJ07vRaPven2I7uRWWMKg/PUUj/jv+ilmE
 YeyCTvRWy+8PnP4goZnbTEDebrKMW0p61QPONLbH9T2W0WjpwEfe5nfac3noFq/3Mv0+anhrG6w
 oH2NS0r8wozbWyi3dB+rvvV7sqLhz6PmBTmVM/7dYDMknaeiKmyZVfOvM8KzhZmzlo+yMtPeQ1C
 Iw4CHke7gPapi11lw2RD2XEEIQDz89Wxxo+rQkKGBStuwbKlWnpoU6Q+/XsqlZkd/on+hgEuU0P
 bqLqvffx+goGyoF1KT+vl13RaiRbOi17SNmB4kJB3szX07ZvjrM/OOQEU404ED3rQlbVHG60a2l
 pG75qP7s/sA1Uz9qQyLYNNgeE1CTOLlxeyWEceWeQdncqtvWnDRnDsveg8HVjnrIXc6BJfV9D0i
 U1zpZL358fZPWDdEp+Q==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5e2de6 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QX4gbG5DAAAA:8
 a=shz021jzHIKqnGQv9qIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: SZ8ZOG8I7U_XoF3zHwpeOorHZ7sF3pUc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1OSBTYWx0ZWRfX0bLlNuQwxlb9
 BAkxHabC/qrjXAHe/zJVGQH6Ryswj4OvOx5g+E/wOBKfJRYVtLqfMeXQfoZj20ZIWclyv8r1CGP
 9gZ6VJazMCcybN49rfxPoNZvyV9hXh4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_071711_322061_C9847947 
X-CRM114-Status: GOOD (  29.89  )
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

On Fri, Jun 12, 2026 at 02:45:23AM +0300, Cristian Ciocaltea wrote:
> Any changes to the PHY link rate and/or color depth done via the HDMI
> PHY configuration API are not immediately programmed into the hardware,
> but are delayed until the PHY usage count gets incremented from 0 to 1,
> that is when it is powered on or when the PLL clock exposed through
> the CCF API is prepared, whichever comes first.

Why do you need either-of here? Can it be just one path?

> 
> Since the clock might remain in prepared state after subsequent PHY
> config changes, the programming can also be triggered via
> clk_ops.set_rate().  However, from the clock consumer perspective (i.e.
> VOP2 display controller), the (pixel) clock rate doesn't vary with bpc,
> as that is handled internally by the PHY and reflected in the TDMS
> character rate only.
> 
> As a consequence, changing the bpc while preserving the modeline may
> lead to out-of-sync issues between CCF and HDMI PHY config state,
> because the .set_rate() callback is not invoked when clock rate remains
> constant.  This may also happen when the PHY PLL has been pre-programmed
> by an external entity, e.g. the bootloader, which is actually a
> regression introduced by the recent FRL patches.
> 
> Introduce a pll_config_dirty flag to keep track of uncommitted PHY
> config changes and use it in clk_ops.determine_rate() to invalidate the
> current clock rate (as known by CCF) and, consequently, ensure those
> changes are programmed into hardware via clk_ops.set_rate().
> 
> Moreover, proceed with a similar fix in phy_ops.power_on() callback, to
> handle the scenario where the CCF API is not used due to operating in
> FRL mode, while the clock is still in a prepared state and thus
> preventing rk_hdptx_phy_consumer_get() to apply the updated PHY
> configuration.
> 
> Fixes: de5dba833118 ("phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support")
> Fixes: 9d0ec51d7c22 ("phy: rockchip: samsung-hdptx: Add high color depth management")
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 84 +++++++++++++----------
>  1 file changed, 48 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index b210c1a88b25..25bd821cd039 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -413,6 +413,7 @@ struct rk_hdptx_phy {
>  
>  	/* clk provider */
>  	struct clk_hw hw;
> +	bool pll_config_dirty;

Which lock protects it?

>  	bool restrict_rate_change;
>  
>  	atomic_t usage_count;

-- 
With best wishes
Dmitry

