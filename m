Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4AD606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FVH0v5vx;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+u+GPLB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYP06evq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DW2w0x591pvjHkfz8jt7Fqo1AwPIyp85Xma/TxwZuQY=; b=FVH0v5vxQvsH4dcx1TaKXsJJxd
	ZS2b5V47siL+LxRaEpWe9Ulbpg5vXlKBkC+JtbnEgHY8A7HaeA6GcwKjkOpTcShmcz092NUSlfAhZ
	Eh891U8jNplMWJhEvSwJ4Tb3RWHZCU8Dl1BeLLpRvOFKlZEcfcW/WenTJlx2sykr73w2h4SXdAifA
	aF2DJOOeLgY+kKBlsPnZIQTSJiyfdJheTT3fdAvMc+lbiziCU41nhmmuADTId94qAqX5oVKZ/e6Kc
	D37/8P7lKwCPizA4Wj7kR2GXRfUBudu5zAi1RxXaqh/bwguvBh/6Yxo3j17AzcpJkQcVP+ruo8LD/
	Dq2MHUoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8lm-0000000FZTS-1jqs;
	Fri, 23 Oct 2026 06:28:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8lj-0000000FZSj-1gdd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:28:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F2Qp1868776
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DW2w0x591pvjHkfz8jt7Fqo1
	AwPIyp85Xma/TxwZuQY=; b=m+u+GPLBPWPBd6lTolvyN8SBmqB80emrAO701WFU
	rJiByVr/KqWc0kdL1MwrXF+dj8MH25FWQGdMontfbuxAh3rXEFxvID6Nfbg6yf/s
	ojJWPM2t22z3tdwabCyJmadKTAjVLyOcxf0ft72r44SQUtFpSqLyLz9EIXQONQaL
	cc51rE7M4lhu7HhTtCJI/HUGUjD5bdMnUswvXjYP+EgfNm/MqeYcaG96Gpt75n2S
	FbPaZHKH2PMaPOaoQ0FwRcRsKVqmZkKRilDTl9gej6SzC0bjFa3eCKqAxS/M0CLd
	6dXu4oUUUKE05Wy9bJx0NKlaVdc8kOkPR5G1lICHcnhdPQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmja9jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:28:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e848cd27beso1974695ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792736924; x=1793341724; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DW2w0x591pvjHkfz8jt7Fqo1AwPIyp85Xma/TxwZuQY=;
        b=MYP06evqugHDVcUVEQB1i/sbH/i+9+RmI8p0Klp9J8PBwGcCfaFUhWDp9qMHmXn8Fn
         ekF3RG4/ZbYVsRNAEUWW5injvSN+uH9N+jBh3iCAKJs2Bo2Uv3U3hajNM0WbfYSAZ4VE
         hnlYQfmZEV/ZgnwyBA3GSi6Hd6hsiS42mrUzdR2ST8jDlaiOXewkMPT+xq83cQSrq7EB
         7luxBDp8L5SK4KWdnA9gpQtkBbrVpQhAw6Tg5WPVNxAM7R/oLRld73YMZYyecxkDHiI9
         C/+XTUN6Z13U1ihwF2VPTVq4ZrDQnZJbLR9fI4oEiLRs4n+YKT7rEFUPmazT8/BG8ORc
         TgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792736924; x=1793341724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DW2w0x591pvjHkfz8jt7Fqo1AwPIyp85Xma/TxwZuQY=;
        b=HfvyisuExWbIjtULxfTmJjCHkvmu20I9kb4aqGOStQGZcslGfSdFpcQNAAqz96BY6X
         pSOmGVMiwv+m0hpWjnEQgIK5n1/I5pjfTSyAUOW1NBfFSxAALvyKcij9pskJWu+fIMzA
         QBMfetOiAhlxJycqb3ojarcfjYpQgkOh6X+st2DKy9+fCCzjGPyD7Z816LkcHXZ9H4mH
         hN7lHeOMuv6sH3gxH1khbfXtfiqK28ZwyyYCznH60vbXJfo5/jRUe8jThS6c2QYWSdIY
         avPkHLzW7E3GQhfVmF9vFpiTfcSfvnF5p7dtRjIZQ+BFWmZO4bu98yWPBVQxVsXeHMyS
         m6jw==
X-Forwarded-Encrypted: i=1; AKwUvBymbCgAEuLiYDUbkVGf6RsiUdLmvGnzc2Sg48KFgr+9VKCj3lU9sd9DhxtvD0gs3XivhhfI11MsRXliWk/ijbkc@lists.infradead.org
X-Gm-Message-State: AFq9FYIT08wr6r8LgclhtUDoaX9VJWF/2RUW+81gn1ZrWpcnn8ehpaXc
	ZrxkhuVEDnS+HRwmwIW/PAWOi2N4oRip9tis9uOpSB/qjcj6exenneRkpzoeAIlj128X/o61YUo
	3qpgcmNK+43+LCI88U36lHpBPLoq/YjCT/zd36neICYhvr96g/wMNukzhwIzFJy3iM+JiIY1CEF
	91eg==
X-Gm-Gg: AYBFou0gQwiy3jpgxpAG+6Llt4qvog5cBjdKCyJKrOTVkPJf0xpGojrrGhbmT4991Co
	Vq572FJ108NJTgQSw0l9+KId2tJF7DAP/EhSPlrMbl5vycUlIKmHG+wKbP1fL5VASI0LoYx/dmT
	zyRT+3WSVI+oyMFTAbxgpOb0ZIlcjZtJywBnVYme6cvruvh6s+m98hfBC9al/AyRHFXgF4tyvx3
	0S8IVSYPYgDdqHksRog+abb+1pIMzvOKyZPPb1G5/vSQBPupoa6bP+/dqL5I4kjRfsw2NEXhdoY
	TPTC2JQr3p0+mljI5YR5+2JMSWEa6+NCqY7cyZwTQRqCaIoBuGp6ifftKT8Lf5YhmWqeE2ARfDB
	Ay5+HdKD1MegecGNRTZBppEBwVsJEjt1b+Kzt0oBIINHxs8HFo5NdbcPJyq9tPyzSy+ccNAZ1zJ
	D/mksTMe9XTqVdkqFSgRya4vuaeTz2BwZij9z3EpCFZ0XuOeB+8WIP
X-Received: by 2002:a17:903:390b:b0:2e9:d00d:1307 with SMTP id d9443c01a7336-2ea7cf21f70mr23118665ad.3.1792736923926;
        Thu, 22 Oct 2026 23:28:43 -0700 (PDT)
X-Received: by 2002:a17:903:390b:b0:2e9:d00d:1307 with SMTP id d9443c01a7336-2ea7cf21f70mr23118515ad.3.1792736923522;
        Thu, 22 Oct 2026 23:28:43 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3b01a6sm5982175ad.44.2026.10.22.23.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:28:42 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:58:35 +0530
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
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk:
 Add HDMI overlay
Message-ID: <atr+k3qqNHWHlvmh@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
 <f74579a1-11ca-4201-9bc2-369d5c2dc58b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f74579a1-11ca-4201-9bc2-369d5c2dc58b@oss.qualcomm.com>
X-Proofpoint-GUID: zEFikxWYd7szpH4PSXKiw4Hr_WCWTKvD
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adafe9c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=N28F3utlMq1gC_S77h4A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNSBTYWx0ZWRfXwJdGAJfNOgzq
 kaUxwapUuvRK2Xiol7QWgjr04eFxjPk0WoQPkAYB2Xf4DpLdskwRsWXaITpgB1HMS3E5NvV6fYA
 euA3yPeMeFjXrgGZtydwHvydmTdJgtY=
X-Proofpoint-ORIG-GUID: zEFikxWYd7szpH4PSXKiw4Hr_WCWTKvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNSBTYWx0ZWRfXy7c06reYU3YH
 zeypHPNzCCcZTTagaPAkgAZ0+dyB8WEspG0QDwPcmBX2/z/gnPCAh10m/vDDVNxEz2az51SmY9X
 yZHur0kyEcX8V9kAH6EdIC04efJNPL2ThSWtQDeiadgPbKFv4+u9m7ip8uWpf2sDnD6bbFTbxB1
 DYdxe7oVeAa+H6kobZs0CtwJOAAtGPtO6gYikG0HSrndOyFHPWTzSaXXb5b7LcgAo1466egnr5Y
 7tf8o3k3YT0iNLZhtIN7eqVyxq42Tx8QfkcOXa4kg/0UlDEHTC+RN3cdsJfoqo3C2qRV6CcsL0x
 9RJFIFlOUdDHy0c9hfW/SUvWtVyJLwQj8l0rEyu6gbMN22eKjPL7O4JluWxobVoSZDSUYTAP3+O
 PPYIgsRnIeOCuWVvHZqCjUhnOC9wXVaEK5zopBV8qCeD2HJEJkhJCo/BG425Zw3kwoTesnd3iYz
 49xVNgfcu9qvGwDjo7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_232847_575839_24808D19 
X-CRM114-Status: GOOD (  15.44  )
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

On Thu, Oct 22, 2026 at 10:13:29AM +0200, Konrad Dybcio wrote:
> On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> > From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > 
> > Add a DT overlay for CQM and CQS, to enable HDMI output when LT9611UXD
> > DSI-to-HDMI daughter card connected to PDISP1 DSI0 on carrier card.
> > LT9611UXD is connected through I2C4, with reset and interrupt connected
> > to tlmm GPIO76 and GPIO85.
> 
> [...]
> 
> 
> > +&mdss_dsi0 {
> > +	panel@0 {
> > +		status = "disabled";
> > +	};
> > +};
> 
> Please refer to the panel by its label directly
Ok currently label is not added in base dt shikra-cqs-evk and shikra-cqm-evk,
will add label in next revision.
> Konrad

