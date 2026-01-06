Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EECCEFCE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tR7f3o3xDPesUQHU2saQhPf2QeydtE64EkpRoTZj7tk=; b=htbe5tG2GEyXk7IFlXmQ7WGQk+
	xNU9bhMTjjsn7wIi/SqPB6m1QdPG8+HAxg3Lh+VB5Zh9I1JhI81aeBxLyxZgwaU4BCgBlAAGKAqW/
	xyiT3+A6LrsdaPnP7GRrjExqXZ1sZQtEnwySZRTcX9H99k5z8+OuVKWdtImOfuiKo2DZ4+bo7JNCO
	ZSxo4u0vby3B5Nz/O7eE/7JgMrQON33qFRSmpGIi1zJ8tDb8uJQ8kwDsfS0AdEIwpQUU746TMC57f
	tKuyunzZ7VeInjMCF8D5BLFz8jV7gNgnv6+8jdWgAPHb2LiumqIjl7NBoxcqtH/R4XZxkn4nGHbSY
	spS+v97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAuP-0000000DZe9-0YvF;
	Tue, 06 Jan 2026 17:31:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAuM-0000000DZdl-2TyN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:31:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Ghq57364609
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 17:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tR7f3o3xDPesUQHU2saQhPf2
	QeydtE64EkpRoTZj7tk=; b=g7Tf7qlmPp+umH1OgIEt2FQrpO5qwZlUUNF3FQZl
	HX1biqamPP+S3QFifEQzy9jaf2AY6vUJoF35oiXAOiRcf7HT/JpD4/pZg72K+t3C
	meDtBuSkuPUtpQRnlMI+BCeSgCLoRWGj5N8RRhOo6SsvbQAXRKQ5aOtEhqcE4YPR
	ygNhShsgBjdp+RDjAGGEWH+YOvuR9jhO2qYJ+ElfM8hMEzKhE2ZNzViBqTb49Tjw
	g8keG8le3o/HfvDI8obGawr+Rnl4TKuHIH1Kg8+DmX3jYJUlfvHZ3VLXqFo4lL1H
	x1kiM89xYc8xh3TUYxYELjFWUpGO4KxiTuAZ++/yYVIrPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh660r4rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 17:31:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee1b7293e7so43819731cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 09:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767720708; x=1768325508; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tR7f3o3xDPesUQHU2saQhPf2QeydtE64EkpRoTZj7tk=;
        b=I5zjJ1jXx2hMikohC5LEk1Jfb89EP9NfPr3hX0auSEBsksVEUMaB4HhOfgX8kpd9lj
         ytVrj6dkuP835RSXgz7RpNKkKAw38pXlLAtjbyxuyzEo8I6SfzL3Rn9U7Ug6c+V8Q67J
         he+jukY5SgMUg0ZCKKhs1sNt5obWrCcHeAVWCtJJVCBvRRgkhht26mHlrQcXsSEP6ok9
         4vKSJDkFmFzEbKRmBjvydTQ+Nw90miVDyhI8Z8Bxv/JTEvffDX1kBCT+8qmzmnmOWZpe
         U4kP2aeyhFvn/DaIFnvsBeuKIuQlP8n1k1foGE1vSeB1eWeErJqbWajPUPTWhk7q36V9
         oqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720708; x=1768325508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tR7f3o3xDPesUQHU2saQhPf2QeydtE64EkpRoTZj7tk=;
        b=MoCemj276EZHcdMOrKEk8UNAnSdiMbxmPOjtcum1NLQbi7GSA5h7rYvzp1PAfCl8Wm
         NXsHGLdcNfGLBFIL6wSfoOx/LNOle/NHC2gnrQlDRKaq6TMz6RkLJAhhKXDctBr9FK0i
         O/g7kMM1s3nIsNnidw59Fk50vfp0c4MgcXUrunz7BNqyJVBdtFMHmL/mSE2nZLrS1ml+
         4+4UvffliOkZfi8xaxksp50Va8qLvfMZmDXgvNmDC3anKApRtTmqZblyPuc7PLzERQ/7
         MUUpB6eS8hnxK5u6iwkPlFBkXAa5h6abdbOCz+MXHxXCcUPpDDe44VV0KQgmz+SXH+JK
         9uJg==
X-Forwarded-Encrypted: i=1; AJvYcCWAxPaeFmcDiOdEeZ6q5XK+5SMVPDpCxav+ZiSnI3THWzhSRRM/CYEbH/Oncve78g1uws8LyCZw6IGDA1hHCaiL@lists.infradead.org
X-Gm-Message-State: AOJu0YxCYjh7HYbKtpBRs7uqmBQg+NVtNGVXJ90IPWIDLOv/VO97Biwl
	uqTUar4TEL6gSzxMuf795QhXI+cR9IoBd/BWWQ+1Ziwhf26wSn0jYALggWYYh7L2BjA7H8g5U0v
	ZTAL2JA55UwbS4J84d/5aCIMWfrOMZWlUh/alv5XvwU1Rs9MAkhjO/co14b6FqwTBC825NHavlT
	RKcg==
X-Gm-Gg: AY/fxX6UniUhEuH9gBOeSpe/YKo1AzG0U+U8AKfbI/U7GBcSC4zsI+APqcGKUDtb/us
	iI05h/5d4/7MQmghObGJREKyXjDra+Bv4X4/QNmHEYM6ShT7SNrrb9i+fO+4MhrH3y7fjvkwZj7
	JV6PJy5Zrq4YiCp/PnvGxaoSBpciRR916hbsjW4c3qk5azJcV3zi76hWph/UCtuL9iDcTiWPZ6w
	7tgXr57sN5cNwpMOeZWuHjzi3sq3oYWaVwAuvdU4wbsD+9jyogZS+ZgTOG3AeDgBsgWfxSV/NWq
	OHdt1QZz5SLfScqi/RkKqvuqgJDenjQKpaa0ZjbBLI5s4b2gE4iAEvnwSGM9Fd4wx1FHVg3bdDL
	n4Pfs1532FliZYP8qwyKp
X-Received: by 2002:a05:622a:60a:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4ffa76a115emr42211191cf.10.1767720708536;
        Tue, 06 Jan 2026 09:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjf7OwaOn3HaZf8IWNrZ2eDSIxGAY9pKKIzvqd/zwCSP5LN8zraKCLgL67UkescNPyjj5pgA==
X-Received: by 2002:a05:622a:60a:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4ffa76a115emr42210511cf.10.1767720707970;
        Tue, 06 Jan 2026 09:31:47 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a51183asm282053766b.49.2026.01.06.09.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:31:47 -0800 (PST)
Date: Tue, 6 Jan 2026 19:31:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, llvm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 08/11] clk: imx: imx31: Simplify with scoped for each
 OF child loop
Message-ID: <x2md7iusj467bjmmysckbkehooua3he652qqwr3yzaoka4sjm4@pk6uy7hq2lku>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=695d4705 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_Ixbbux_C5oTi3JCwyIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: TIXUxmLg0I9LS30H-x_-n2Y1d9WWgNwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1MiBTYWx0ZWRfX1O9pcknTk+6k
 +goTYymdkxit5wnpO+/4EkVZdmAh5H+pd9x13Usu4zmIkiqPxirOwPAhyAzgAFojWJCElpnlWs9
 GTnlT0cO7q5LZQHEYoUzunRNRnc2/DbxobzuJeyT4POULZ4qvPHSn+tGIO3Di13eLvQuo8cyD5d
 uCA5QJDO7GOcgBlrd1t9gnEu8dvMlVQUY1o3IqVnbJARyn03vLR3QWca9i9B1bzBceXNGmU5DGG
 LZtlwdvXR6HIfZyJi01ujs+nGIRnMlG869KOI36W8k6n8p0kZtwGv9aVIOHqqmgKAUI4AH0cVHt
 PkvEX+M6ygneFcTWpXMX64W3782fujg3HJPOhU/jWY3QzmVEShXkW6wSauwYh109LFXnlUYeSit
 b+tGg0hBxsX8LKGXWx+rSdY9YcSR/J590+v3JG08YHIB8/JoJaC+jvrRXxQ07b62Untk4P9DTgM
 xu9lUjCORveO3q0fe2A==
X-Proofpoint-GUID: TIXUxmLg0I9LS30H-x_-n2Y1d9WWgNwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_093150_634577_9DB7F3AB 
X-CRM114-Status: GOOD (  13.04  )
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

On 26-01-06 10:15:18, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Abel Vesa <abelvesa@kernel.org>

