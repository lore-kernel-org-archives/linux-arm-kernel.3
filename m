Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D56FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 11:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PffpjeU2jjzDgU5tqSe+zBEfKdG5CBffNrOKWE6A8zM=; b=S6oUD8v90F8MYHrfHtsH4NyrgU
	7P2q2g1E+UspghT4WJEFXB6Ge9PiLt62gN0aHmp5bBO7Zlrq9CrXUc4r1LCvM/OJPh8OK51ae/wQ9
	YiSuVagHaN3tWAmypBQjBfSbSaPYBMcnoaeRFngZ+mt9D932TKfhv2FeRCn4636JXqwaU9nHlbLyd
	j9ytbt4fREcxrtXEN7pin8NBvQZUTFNrUAsUwi0Ygna2hAohvCGthyvM7OsvylaXUvQEpRkHcOx5A
	/glIldjK6fJ674Ip34PKOnqGP1JpzQJ5PnfPh9O252bCgtfHiVqkBYUDEhcoy2eKRWZSlsQQn40Li
	KbG1wY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgia-00000001MSo-0opI;
	Tue, 28 Apr 2026 11:35:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgiY-00000001MSU-3COQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 11:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PffpjeU2jjzDgU5tqSe+zBEfKdG5CBffNrOKWE6A8zM=; b=EmgZHvEZI6NyeldaTLNvGyOjEI
	hrDKmzyY/yxcZ9R1OmpZDOS8sj+nlQuXFBTGi2H+ahEuTBY7c1Xsx+cvUs2wNphM7DcsaslVzkURz
	rWvCYfDzdPT4mcfuT5jzm6cqwyb8G+jB27BQAqnHSZ5TKdeIVKgtU0X9V8pZ/nJnVYTIdQcziIaWT
	DjqS2CKvJPFuIAiKr1c2hZz+Bcrfhqy7U0lP5SNOqAQtqwMD2Q17JJbI3MIcL8F1bdFgSvoEna7Sx
	QzKSfGmS+9AvpDS72PqHYGfnyWCTsYtLWwMiz+037G3rzFs5rk/Y4GWHcZJpeIoNq+Ca8EU5cxEVZ
	XqZwFDgw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgiV-00000002tiU-2JLq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 11:35:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7vqWC1744983
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PffpjeU2jjzDgU5tqSe+zBEf
	KdG5CBffNrOKWE6A8zM=; b=n7IPcpfbxW8Kbc9LBIGAsME04k+zoicwwnz8zyRC
	sf8+5tu7dFguRjsVLTtuk4OLv2kSpFBBH4HSf532tje1UKSzv28xz4ZwFBEwYJZk
	FsyljiOjsw5E+ur704bQ1BTjt7oRcGDXvQtVAuq7ZMaeAm0MZTPsx1U2b67pgROz
	IETJdkjZL2V8YyZKp7iV885fXhUZonAjMgcjsR4urluhVmfmjHiVDk67wkapk7fe
	sMs4iHn9me6CnXoNzu4GBm2NZ1b+u4VGXdcZpNLfaJm47mtObcc7z6qwYIcuLGIp
	V52wJSaDRBXpR6YeAKjCjTeXblE3Zoa3YwwY+sq1e7em5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryd8u16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:34:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e8c47a3so307084371cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 04:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376099; x=1777980899; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PffpjeU2jjzDgU5tqSe+zBEfKdG5CBffNrOKWE6A8zM=;
        b=Jbe5cwwgXTRX8BBL0TuIzgefBP6dzm52JmIi/N5/dvH8dCrmqwpE7GS7MdZWnKbIsy
         qzqXSGbWHehAC6clFYH00hVFCPRR5LOmQvIrSQag6njvgH1FqxCmlEZ6Qz4SJqqDcSPk
         X8cXsIJKk31wgJg7NZ3IA3Zy6/zOfUwPK7x2URduLSKnRbqXihtE6tKAPcB551yoLRNw
         S9/aKIZBor/5ZiQXvvXbhV9xYp5ywOsT576/k1SdLOvZkpKdJV8zhcrhclnZLcpfRXk1
         DoGhC1vCzAnS/Qarzk+cLRpK5iEelAyG3fX8in9RXmRs7Hfqq/SgiNZLywwgogC9PcVF
         XYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376099; x=1777980899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PffpjeU2jjzDgU5tqSe+zBEfKdG5CBffNrOKWE6A8zM=;
        b=Cq/DySdvK2K9g1EPPwY2RnLitkwWe3Wj/Ip8LSoHQFDOMznhd3XhtysMdNLGNUxfkE
         sUhWQ9xQgperm4pUIiDZlkQ11BRiQLcDnPvh/jjmZCeNxc4Qsvshn3PI5UXzlnxWEg5H
         6RyW8NdetyFTfNukbipObvV87gRzg8GlCJnhKgp+RUe69qxWRs9GFDsiXeuNw1AiIJ0Z
         VDFfqS/3L4oKXO6W6xBQW7ndmwUZqdstc7yYrURmsCNcZlxqg36X0djOINARRz5UPYtr
         JoIMHlUkG3+CLbdS+dKKeJkXSDiJendi6kFeD0DCYBHdA84z2HP34vROeQNtny5OozDr
         1OAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RYo/Hm9w94XWRFYFSc2RExuQICcvNuL4hOrncFgzbloWuwG86OqI1c+FtRtenFWX015kLuNNLhq1Bz7MDNlw+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2pP9Gta7+h53f8g2fRZga5gzgfz8C95biswWsT4W7L+BiVBGc
	8ZMixAg5QUlQgKTKA/8Biik6yLvdedUArGqYaH1QBNJ4p6MqXaVj7q1Hos1efreQOovZY24YnJE
	Ujh1aJOH8rKyN0/bb+Q9GIWeiksLhypyQY4IVQEr6k9PiEMm8Etn2SeMvBTscR4SWGmkWv0nGPO
	wcQQ==
X-Gm-Gg: AeBDieuzojdxuxH9qHDjNQQZaZGZI0FBZfxd/HR9/NytafItVQdSaUp6ohPGsEEAVrR
	A8JeRr4PeMhq8RF+TyR2aYjnLkynAbSNCKGz/i/AWYI6P8dTeTzghxXrXOClrCnXZlfjwNvTKdz
	Auib0pxTTjjVXvlZ88ui/WFceny+2FFjR9PXL/3aT6XbBPFEIuxxUnKtuelYCUnQFOolpvqNRTb
	ybrk2NvKUm9yVvPHhn7ZUryCiJFKg0SCp3j3qs6gvceRz/85ZntMJYBtVG8TlGUaV3GlQxen+J3
	CcKoFrdSDACtCq4pwokAReUaD6S1SmAQIhQEiblQRXM8kiBl1hAL/n+8KM1VVRO2KEHyHa+G19y
	Twl3bLR5FVlxaTIzcqvhKYkshkKNUWKXj9i4D6vp5RUxUEaneJiHsqKEF/4FhWMkfH3744d1DHK
	oBZeme9XmfePNltxLBapp2Z96cBP68A0yePR/8ouifAsbt/g==
X-Received: by 2002:ac8:6f05:0:b0:50f:bb77:a084 with SMTP id d75a77b69052e-5100e146630mr31518331cf.25.1777376098513;
        Tue, 28 Apr 2026 04:34:58 -0700 (PDT)
X-Received: by 2002:ac8:6f05:0:b0:50f:bb77:a084 with SMTP id d75a77b69052e-5100e146630mr31517541cf.25.1777376097914;
        Tue, 28 Apr 2026 04:34:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74640b645sm557987e87.79.2026.04.28.04.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:34:56 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:34:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 09/11] drm/bridge: lt8713sx: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <jeoq37unyevaxozcryvus7u4frdwayqdxej4hhq72fjpirr3gm@e4yagmhobqdj>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-9-4300744a1c47@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-9-4300744a1c47@bootlin.com>
X-Proofpoint-GUID: s6Y0rjfVnby7QLgpkaaFch29-Rnegi4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfX/upUWfXNFGRV
 suOZm5MJYichIO2AOJopweo5m4JexRC0tSilWVM2g4r+csUwApApA9REOggPFba2B8sdlyr9wYQ
 FCmZtl7BRlbFbDhLzEm0yZGLoRyICy+gryFsP4ZprxH3MXsdAjWp+OPTulT1rizkSYFNfKfU6rw
 k2AK0mdXnRuJR4zLGplO1BDyiNySekryuTMuC9szM61IsNrgCpzcuQc8bb1sc0wHQwE9C9de3eA
 5kl8CPmuNZe/qG4DCG4ipmhWkmRdNk+T9l0W4FDzVFsy1okfFwBFu9aDqJnLtZ70wUTlC7SlfEN
 Ibz64QPDpqKUx6/FKGHEL9RTngAi8y8VDGdPJYV0Mx6c0fU2PExMYhgl+e49RiSH1EwmIQFLi5Y
 yfkvQfcMul8XAd5QNzYb3jmKiu4iKkzMEOFKgB2mpOGUpMgC/6TtmZDOWDJyc45jRedp1E9wsut
 lMKRLTa+I39IrNyuxbQ==
X-Proofpoint-ORIG-GUID: s6Y0rjfVnby7QLgpkaaFch29-Rnegi4-
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f09b63 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=SbJqdHswXr3mvj6Yul4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_123504_020786_218557A4 
X-CRM114-Status: GOOD (  17.88  )
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

On Tue, Apr 28, 2026 at 11:15:55AM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt8713sx.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

