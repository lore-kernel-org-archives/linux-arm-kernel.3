Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA98CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sc6ZaRdU870GtUz0ddcaJRC5N+bG/TcHWfDRb085fYA=; b=UzGU7TfTTEp8FeBz1iZTBOossU
	cE1CXSxD2Y9ehBPT5KPAocns2QVfqUgOtoipXIP8ydDmXBv2jZV+ppmjRszBtifNgdQArx3eWSk4k
	j/xelDV8hVMFzLIQzXSBQnZL2en5ZByoZ7V+iHz1NPz3GBjrwG4ZHiYLF7OrLrk6O19PGt/6zTTGn
	jhJtBetZz4uYdhJmb7rS1ucc6/qrJG69Qy2BFlK+vL56C1Aiv4dpqOdoNd03gOQkMLEwdf/C3oonf
	miJn1cdjbp2wCyplovnDV+g0vwfwyHvWms1cKIDOlrEGQyDx18btf8vSEGR16yIcsp5nN+s9t7gra
	TNPoj67g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1Ns-00000008hp0-1esk;
	Fri, 12 Sep 2025 10:52:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1Nq-00000008hoQ-2GkU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:52:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fIYQ019781
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 10:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sc6ZaRdU870GtUz0ddcaJRC5
	N+bG/TcHWfDRb085fYA=; b=KglbGKZyau0m7rAfBtql8TcV3fcXhTM7IRNfHSM4
	rF2R3h55HNvAAehUvUeSIJipGzrkTmsIXkpAP4Zp3ct56EckVcUgbSE37bG3m9/x
	DZE8ngbQ2V+07qXuBQAu/PWgi7Ae3u+9Pgjz2t4qDH7+QpdpkOgfSStc1tPR/BIO
	AEqVJgKVNn4mXEAeb1xuKqynNrJoi25eFFzp+dtMBenfkCxG1f80DWz+E1ezUGv1
	3wbBWm6QU599/45i10OCayUyfxJJTYNsHoo6wq/EdlS4qID7rmiAtrd7iK4qm469
	gteRU/oxWdaTh+ANAeoDnrxfKWeYpEBhUjqu0ctuhdO17g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t387nx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 10:52:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5d5cc0f25so35985121cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 03:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757674320; x=1758279120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sc6ZaRdU870GtUz0ddcaJRC5N+bG/TcHWfDRb085fYA=;
        b=wXcNWKtQNtdttUb4IYduovR4qNiblhJtLQCPQQEVyMZxHFx4aYC5Dkk5zjBB06At+T
         XE+XXiStpe8RrIfGE4rwPprUZiU9eXEZqE7dI848GHNa4B6yaHJarcQosfHJUj9XI7A3
         2QGIq6IElAfQKMalkAS3TEl23KzAq6Tc85mIJ3IRxkXDDbLRJe5Za7f9LiRkKQ9DqhvL
         O+3pysGA1ft2ZxqzedUYmZheq4QlTDmFTVmCKKdzzHFbjmB4n6MDnJc9z4g1NM5y9jKw
         VCBVMONURDjZy6/+DPymci1xKy8TrJE6tLMWW3oxiBcnDR7wLMpTTEni6qRI+Bjf+22r
         BOqg==
X-Forwarded-Encrypted: i=1; AJvYcCVgJQxbafNrW8pSSAlUoEpvG0k8kGZ4MKlejVjx0My1FVnoPIrymQL8bTzhtlnRxCeS98nXBaELB+KdRLwc43As@lists.infradead.org
X-Gm-Message-State: AOJu0YypSSryeQMxFO/YcQdHVFPITusmhZkLgdUOSQ+J31SqETAlVcIH
	0tIXJ9qI7aDskUWL60J6JyAqbLJpXE1IuRkXf4yv61N+1TfEMHVxq53grAEG4lOW+gvLKJmFZq5
	VKhxc6ZsrMOvdPYeuF9o+Idf6P7h59q4yWPtzssLfVfFgprpnQnNKtKnCkTpym54/attp2WeOj+
	ZTgw==
X-Gm-Gg: ASbGncujEej8DxZR3rB9ndDWJTjZCoeYWcytpI6CR5sQi+UATXPJflriscrulGUnyKZ
	HtMeXjbsRPzaU/PwI+y7abCZNbTLnx2LZFo7DEqjwY1HQOFQwXUigSqryBV0EMOWDzif83oUHex
	EE55HuK19LLEOHUeV6ag4tjHWrkGEbLM6TUO+beEF2CMnybLnOrRwNDwNsLspqSLrccBDE8fIf/
	zYnWJvnv23b7fuiWv/nB51Ftdly9zj8Jl4TlQvsScYfUkHkZpKThVFJmrmr27d6NQOcWHOjYTQx
	gRNKBn53+xTSN7KSYlIztnOIzHQ6NiHSUP0pvC6P2S4LLeQ1fP42+GlZlaQSQN8T/01ncXu9th5
	PYmzaNYYOGB3oxEXQh7S36oUYL6r3Te7PelV2zgvbcnlS2WtD3Uom
X-Received: by 2002:a05:622a:355:b0:4b3:5081:24c8 with SMTP id d75a77b69052e-4b77d14cce4mr29097631cf.56.1757674319968;
        Fri, 12 Sep 2025 03:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1+roIEGAbRV03P+o9D7MGOVoPmamN2QAkYmfx/FAe0qn4B/Og1foVsAi/kIVH/xOLtFDijA==
X-Received: by 2002:a05:622a:355:b0:4b3:5081:24c8 with SMTP id d75a77b69052e-4b77d14cce4mr29097151cf.56.1757674319346;
        Fri, 12 Sep 2025 03:51:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a821180sm7960691fa.32.2025.09.12.03.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:51:58 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:51:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, dianders@chromium.org,
        m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 07/17] drm/exynos: exynos_dp: Add legacy bridge to
 parse the display-timings node
Message-ID: <xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-8-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: nfVneTxMztHqcrdunhYPtpzikPUNSdbB
X-Proofpoint-GUID: nfVneTxMztHqcrdunhYPtpzikPUNSdbB
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c3fb51 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=xJsYSp2GQeFlw7CnCu0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX0hYN4OYeLgEi
 s/tAtlmDQCendzPfrBqcFU5CnktCV5saE5p7+Smv+kPzhxYPJDFIo8Xe/V9+b33avPIpnFBzRiR
 N2rXZ/j530FYA8N71WkOcP7qi6t/8hb1IsLuyO41IceKQB2P/hCCxG0s0Xvk71hGpQhovqaU5TI
 3lvvAJwxF8XmaPdGzaJO6vW5wCD9+/Q6rs2BC68dakpjOLjFHeVpoHArGHxRZFbMAz0DVh1GpkF
 SwefQQ8xCOrAhMso8aHwMPjCVhZPaZmUSzi/FJCaG8jMwfL1cn3eWkPWPNQ4jXgCiP7vQw89o6r
 WnorliuLAJLtiVVrAXptu9ZvV9mwisOr0TUnMymPfB1i5s4pNlkgZf2XFx3aHBhrOqpnLAgAWdU
 w8I0lftJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_035202_576523_5F435E70 
X-CRM114-Status: GOOD (  17.93  )
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

On Fri, Sep 12, 2025 at 04:58:36PM +0800, Damon Ding wrote:
> If there is neither a panel nor a bridge, the display timing can be
> parsed from the display-timings node under the dp node.
> 
> Adding a legacy bridge to parse the display-timings node would get
> rid of &analogix_dp_plat_data.get_modes() and make the codes more
> consistent.

If it's the same as imx-legacy-bridge, it might make sense to pull it
out of imx/ subdir and use it as is.

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 132 ++++++++++++++++++-----------
>  1 file changed, 82 insertions(+), 50 deletions(-)
> 

-- 
With best wishes
Dmitry

