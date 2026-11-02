Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A00606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IzfuDUiF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=B3LYtbUb;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYVjH4Z;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GC1RSGP8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=; b=IzfuDUiFo+3ZC1
	a3G30k2OclDm9tagzRK+dZGzgQEbONGNwUw/oJhbASiTjjDgnN/tENtSgnoH3MAkYAwSzeKd7vI7F
	XjljaZxHKX7Ilzx7HbMcWE6RWaNyn5SU9Lnp0IJUe72WQyJEm8GAezxbD3GEJV4YUyIczRiRWgrF1
	UXP9EQRSty7OmyoKVWNK9mm7a1OSxgsvE8xJhthhind8A6qREMN/pkEG5NGsOwtLsDyUe0io/F3Ec
	BdRZGbgtfzbPnYxnf7wU135yw85MvhtERx5cyRz4M/asTHDH9FGJcQrkLLphbp3Ze1X80wSB574g9
	dtr0BhhdFGyxtZGFfM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrh9-0000000GYly-3MtE;
	Mon, 02 Nov 2026 13:03:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrh8-0000000GYk3-1Tdv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 13:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=; b=B3LYtbUbmfmlYqpsb0WKOQbm0T
	ADOLdHbsxhCazy/py4u5qjuhiac+ah5pSx1UANN24Y67DSi+wrKdNS2gnegL66rCund6xr/OOJwI7
	KBKrMObVTs124Fq8Gl7pfEgrwgXlMGf6GSaXtPY3OZ8DwQhmNIidjWrY1MO/jjbKSoNvTow6y4BW5
	mX8DY9h8qdhfSzq6fC83XdYK90Q3t35r95nk16MhfUFBwiwS+r80pL7KfnFVysvFkSFFGMNdKhDPm
	MErGRt0LjCGta0vv/i086dQxQSMnWEKP/dvuA/QEwmvnvTQDh3j22vnbAdV66y2lEJ3AaR4f1VfqR
	djeFpj0g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrgy-00000002XBz-3Yz5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:03:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2D0Snu3400756
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 13:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=; b=YwYVjH4ZysaBu8l4
	1s0nZo+iGjK+TUj4pKtuAYIgm2/oTd9cAZnCEL4/aJ3SCEY/bVs/r34GqFyhhDtp
	kE+HM4nuJAUnHGyB1n0J6SXPgq3yzYIdLSmt/DkJ+T1gC3BQsG47UfIs3rTpJOM/
	5jAQL7jqFSR/0nSwD+nc1UirHLDAlQtXcr9FWk1GfPinRIlawK7MsGKhEwfmUKSA
	dAQdl2CwFaleNszRvUFQjup3/S7IZXIVMB32ZADWZkIdtm1tNMWBpVv7KNKXSm+C
	C/KpfRer8MJDWFk9C1SwR1VPXBBjMbiiFOBvmgiq/yB2NbTHWtqUEGocwvSR6aWE
	Q2ddTg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgx0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:03:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eabe7151daso90695e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 05:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793624590; x=1794229390; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=;
        b=GC1RSGP8Z1F0w9F1OKSt8fRA0hE8LP5fUsHhEo+jj55ytdV/X35Js8+wjka6mxYsL/
         GgdMwHMTBIQucIMCB6fn97+yBXvpUjr76teOgkGuAxLRXQi8G73GPqpJOUC0pwR9S7hs
         a/agdzTOwICccBXH8Xu2JUqRz0ldJA37Qm35XfxQ6OmrbuMDE8pn4654lK9ZB+1efqdG
         DNaeuAbXCmytt2dhJXwhHIfqeVmulx2M8YE63mSBRErWG/7n5AIhVk4lLwhZyRXkykKk
         Fnff9Y8rLMQh8TCKJfznPZ+sn6wb+kvLHh0kALjwjWgfSarA2sag5jGlcyEi/tIk7EOq
         pEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624590; x=1794229390;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=;
        b=GJxWa/E+w2Gqx/u4Esfx01vfuQHLXHb2Sl8kKiJgVBaVktm6DzSREGm2nW8XheQDLG
         yYF1sOf8dAVVkeKRAuAUtOa4NFppTkC7BqVWvnrkMNIBNh7VoadfW6um7ivXaCFboTCg
         yjnTSb/PgMq/LqW+SQGPWp+JVRgNjf2EBkMVLH9h32S8wrEvgI9kIq26GXPnNJRQ0hVg
         cPgpfpz6YfziJy+7er3rImEl4kUbpGqv3NwdlRspOFCXjLa1OO7YMLwMrfNsg6gup8P5
         kCL1GTRQRbIMcGcqLj7PdFUzO31aOlVeHPykgOgTWFO81SekZ/EF4g2hOL192liPgLkd
         5zXg==
X-Forwarded-Encrypted: i=1; AKwUvBxTWz51zF7GlJOnI2FKtLwTmBs5Tw8RIvCMcL6M5uw1HcFwPs+IiJhtUNEtdeYKe7fNG5hsxurJEXXmQ6YYos63@lists.infradead.org
X-Gm-Message-State: APuU4Z/WftnZq7fBiLhW//Q3LcPMAYhA2G2mq+7z+KYbuY67YXC13442
	t4QS8rNWuG3c2My9wTkR7JFzYl8LHFRTEh6tpw/vwvxnmNY2S0lwrg6qmp/fpl1xqaZCH3RDYW0
	pUUhpN5vCmQohHHVXS6ZbykfWH5IGFEC/BpzxNPSZrvLqdISR9gZZKHwYSeU7PGzl5zhBxIQ6+D
	yGKg==
X-Gm-Gg: AYBFou2z6htTYS8oRv/+Kyr4hdTAJXPemAM13VqtpqbS6SydZVQeNSeepspnaBnYq8t
	uRM+OoxYTtWwL161qdRiF0oNrKMPE419YOROMTYlCFpG5yuuewTVDi++nlwOfFlfHO4xU9b/Yl4
	BgYx7ltPa97lIq0Ght2SpliWiAiJG1U0BOM+f5w4L/DhB2Av5vxWn6NJ9cD4aEGkqAME29+wPAD
	I8+Q8qPTXrEAjEw2sHn3XrMWS6DUk58yYqtEonbCLO3rJBPA1037g8/KH1sSZtKKlOp76evAMUI
	bEaPOaSrkttVRf6AOe11Sv++LVGaP3WAY+xVr/pA9v9yPLgfjHEYrBfVsdNbwurDM5yz324KEJV
	ppmbd52vpxhOgJWloaYa4M8HCW2C0vi7rsUbu0T849GP1sRNhuQTQ5HIcPw6Zyq4jxMkLDqU=
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr4388730e0c.5.1793624590335;
        Mon, 02 Nov 2026 05:03:10 -0800 (PST)
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr4388694e0c.5.1793624589652;
        Mon, 02 Nov 2026 05:03:09 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072d19csm1698389e87.40.2026.11.02.05.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:03:08 -0800 (PST)
Message-ID: <14d63775-3024-47fa-a495-60351c31e6eb@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:03:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 09/14] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-9-a21a5c850961@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-9-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae88a0f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=km2EZEuaMOR48S9SEsUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: mcgeznxhQ43ryVKBBtBYgzfEYLXmdu2f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX3rYDCpXt0yns
 JECsa4N5/yHYb+1qRbZzk9GBXcWYftPZtdostMheC4NWu9jEz+NirMq6k4LEqW33ecbhm1bCsZP
 JLPsGQH/PUMwUOhXn+EbYABBVNaSOxE=
X-Proofpoint-ORIG-GUID: mcgeznxhQ43ryVKBBtBYgzfEYLXmdu2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX//CUx/b+y3+N
 aLkRTU+5osPXzpJLb4nQ5Tg7g+mqwjJ6FEpn9bQw104AxWzj3tCVptgOjiYQP42/w4MC2phycjM
 GXtgM479gMdHr05+5hiPn/aBRJyuue17OyDre6D00N0cjvZiwYd6KyKQAEZcTnuQpuc00ujMR84
 P/PsipoFe0MyOnIrgxsYUD5+TTllhdCR3j+GZz+ax/IfcVePoxg9EzjCBGcQtry8UCvufciqDFe
 xYb6CKDPAFTgd1gM3wWoWZmUOeJxLzNZMGI/mzz0x8JMVvqnLhhEd2QxXJyp5fUgrfeGtv9OztC
 ErVGff+wdOc9EGRZjLNxb7VC9g9K04OXIKmsMhbkpjROGXVxnqZrt24Zup25+EPL/K8jxHv9/tg
 DxiDTgjisM5Rn6Dhw5SY6RVyDScF/YEtQXLPEw4wYBZCH31/kOFLsg9nAVGekoO4qINpGPswpUf
 7FtbQyvoRO/uofuppiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_130320_504802_1B4161E9 
X-CRM114-Status: GOOD (  16.61  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 2:52 PM, Anna Maniscalco wrote:
> Program all the register needed to start up LPAC and send initialization
> sequence.
> 
> Additionally, now that the LPAC ring is live, make the code aware of it.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---

[...]

> +	/* *Don't* send a power up reg list for concurrent binning (TODO) */

Here's what my robot came up with

human tldr: missing the listed registers from a750_ifpc_reglist_regs[]
and a7xx_pwrup_reglist_regs[]

LLM:

The strongest IFPC-specific suspect is that LPAC setup is not
fully restored after IFPC. The series enables LPAC on gen70900
(Adreno 750), which already has ADRENO_QUIRK_IFPC. When LPAC is active,
patch 09 programs several GX registers in hw_init(), but adds only
CP_LPAC_PROTECT_CNTL to the A750 IFPC restore list.

The missing registers are:
- UCHE_DEBUG_CNTL_1 (bit 30)
- CP_LPAC_CHICKEN_DBG
- SP_CHICKEN_BITS_2
- SP_LPAC_CHICKEN_BITS_2

A likely fix is to include those LPAC registers in the A750 IFPC
restore list and the applicable general power-up list, so their
initialized values survive collapse. The KGSL code in this checkout
has a similar pattern: it conditionally adds LPAC chicken-bit registers
to the Gen7 IFPC list when LPAC is enabled (adreno_gen7.c:652–660).

Konrad

