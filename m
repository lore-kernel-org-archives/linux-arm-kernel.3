Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9244CEFCE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzSTS8fbRs1wSAGF7WUmIraz4oEVJgEJtLyxFPfHdeY=; b=Gw+94AB5zkKFRN8TfyeMuaqv0D
	lMNgS/wMBIpv9Usfy3nPuuQeOieSFaxLPRhU4X6byDtP0Orz0SyJqONF9qoQly5I80vslrmhzxc6Z
	qL4sRtpqc5fjnM0qVQXItQZxu5g9pzbOsP8Ph0VA3hMoPQJLXgoTKrb/fJ3eLfhSZtlKxU8ErAo0T
	Ry3H7ONf6MH5+a+Xsk30C6+FN/lqoWWfTovaEPuDfqU0379zvv0DN8tDKU5FzMOjH61ugkc0zC5aP
	jmkeq+2s8evV/3Ju+BT9yoKItnTvUvHBpHvgDm7N7xFpFYg0CjWukYweaPLkf4NkSAqZgsNHmmJd3
	6xr9WKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAx2-0000000DZmT-2xsn;
	Tue, 06 Jan 2026 17:34:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAwz-0000000DZm8-44Wf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:34:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6069W7fh4090703
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 17:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jzSTS8fbRs1wSAGF7WUmIraz
	4oEVJgEJtLyxFPfHdeY=; b=jh0WVdvT/iHJCW9ccrMMRQSXa8S7RznjJF2rwsEN
	YKwyXrzMt1PfUGji8KYBTIfsqkOYc3GpQakVO9XP2+xjmyL6iXyXAFfb71sInSdv
	kWR7WbHq4o4RAv6mIDMxZHsbokci3U62YI6Paaf3X2NngzaBz4EKYYB4U667tyq7
	fn1r6oK0Nid52Eg2ESQNbj+OEW++qF/UfR9bcvHyZIrWkZcaUrFsLyPAiE/LR2Pd
	sydRPjtTZOWB7NNLg+Yzs9VHBMmrEhJ8R9K14MnudQhdrTihKF8rlaiHEKxKmnro
	t1+GLHOBC15gk5klSTnDod8Ij2r5Jn4z9szjZqTb4BWpoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun9c9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 17:34:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaf9e48ecso35209101cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 09:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767720872; x=1768325672; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jzSTS8fbRs1wSAGF7WUmIraz4oEVJgEJtLyxFPfHdeY=;
        b=hWAWavqgVGFxilAtN/u5mRAWrEb9yDI1qvc8cM8SHKFRznAcpnpS01MYSg3YhtYAO1
         kya6ey4qE0y2NRiWVcths9evDlQINj+Lr8HSm9KcXOEKpNzmt6/TgxOB7mIFbm7JECDh
         Fsnw3tskA4mCnT8h2GFmuLCL0hOvEYR1QMYdJI7Y07VE46mIHznDJdWf9GAKDt4+Qf44
         BqKKAcwfnwc1wRbwQyOmgs5my9tQ5wowNbFKIf/ZpsQN4b3+Y/17TbUs4Izib+cxYCop
         9pwPc1qDc4FKyXuRW8h9feQbAS2tAilQmXx79pZ7QeVbMDQQHLOQyEmPOvPMYlGM2LKr
         0Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720872; x=1768325672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzSTS8fbRs1wSAGF7WUmIraz4oEVJgEJtLyxFPfHdeY=;
        b=TlIyHdJINbB89yiOPutISj2i/70+DWwnBapxWWl6ivdHq2fyUZwgR3CIuxihkFnBlX
         j4Pf8bJscRsAVlHuFOLPq9mzvBL8w9VCcZnjsna5PfEB2tNGHY1mu/08pWeJWJYGhREU
         XJvvhI4Kd+b0F5Hm4rR4j60NI0avmIajfQzuAJMvelrP9DbAEoTfpd5oGGetegcBFSsc
         L20n3iYsZKX3M+uIbQS+qoJsonl9KeRWflLoHpjhz8zBnFH4qzWtHjyZnZoy9kDt446/
         U5iOmuufmxa+gNp+pkLwJFwywoarkW7DhtnFsB4Foyd3ehd9vqUR0DKHu8J0WyI8J4Oa
         ppFg==
X-Forwarded-Encrypted: i=1; AJvYcCXXVmab5knUWIO2os1CFhpuFuRacnNwPhZ84bTNgKwJZuoCYsKol9VnbBkvgYPlkhGzmZ0FAvFV2H2wlFOt+u3g@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9sZP7ZtKmAbJQDSg/4Z/+b/Z5iRycR6eV01IfJJ1Xrl1oVIun
	qEr/tEXMqt3KMVJ6AygPoAhVsh2JOa+fumNZ8yWqkyPABNDBs/9Of7wD5K7nj6WmaKfqqv5hdmk
	OHK4ntbq/V0EfdSw2bdd0SkuzS6TSAP4Aa1BxhJCXxcmO60za4Mk33HXqgNwKIYyKoUjAOlAsQb
	jVSg==
X-Gm-Gg: AY/fxX5TA7K3+niUVCrIkImE3xsXCyQIXkV8G38Nn9fGQYzj5hpCqxADYAhRRiozm8V
	U1xjIqKD/2CvAECKeBzfSMVZwPaiuyxN6NdsVchYxNnLywgfiXxHLQdXOneM4uSxDrKRNFJAWRI
	YLsowvlHf4CBfV68T5GsBKUVbZD6JTPjDDJVoeNFkG56mbHroLNDYBljWyfFMjS7iiEQDwqF+sM
	7NX2EPJKFwKwy6Ae20xAOsJ1GEhek2NWPNByrtRl9EGixhAhCKxseD3P19LkuFl1A/XVS2aL31v
	I65Ae9NVLesWhlwUmKiIQ9pyObru/e4FNdYZNS8UM257IKAOz+gwYnNBH3cV85eVp6PU6YDCjta
	lepbWzkJ3ilaLgMPeXU5U
X-Received: by 2002:ac8:57cb:0:b0:4f1:b9fc:eeda with SMTP id d75a77b69052e-4ffa77597abmr57402791cf.37.1767720871914;
        Tue, 06 Jan 2026 09:34:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsS5Q8M4Ax4uLqCekfjuM/TS7dC5bAY2/2l4KJvBIfjf+72ZUp+kPt+lte2C5fe//DuAlvyA==
X-Received: by 2002:ac8:57cb:0:b0:4f1:b9fc:eeda with SMTP id d75a77b69052e-4ffa77597abmr57402111cf.37.1767720871283;
        Tue, 06 Jan 2026 09:34:31 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm2551707a12.33.2026.01.06.09.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:34:30 -0800 (PST)
Date: Tue, 6 Jan 2026 19:34:28 +0200
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
Subject: Re: [PATCH v2 07/11] clk: imx: imx27: Simplify with scoped for each
 OF child loop
Message-ID: <pbmxwpyohpq3pi552pjwwgfe5wcj7qq7fx6lofpod5mq4bvmwj@sn4yfn74sgiz>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1MiBTYWx0ZWRfX37nRIYeOyH5r
 /9+aWwQ8/hmIg24ftT+ZYqckDeRYB51AyBZ27b6LTMmyfNgYYO+aAzbPO5VAP4T5ipfwxq4HI5q
 h2ymHjwA+KIXlQ1TplmB6h1YIFnQNUaAzrLekrBxmw0HcBR6Il3GsyjXtT4f7ADKd6nqAcqEppG
 VqRhPjwv4tbwCDj//AdzP6scrEEif6ZNWIVVHrJ5wtIxgYveuqzVNYfjrCLej+wjq5OnHWU7HCB
 bam/tB6D+EXa2jhSKv4Krm98nreXUAKOyQYaZ7aSiVmcNI7py4EI9kPyd5uDfspNBAFIjoybkUl
 TN51FAUtm6jGzXPcbevmTaUt5trbObR/DXeNT66Ni2qaNJy/FdDsqjJILUwWxe2+oUR+yzWCXp3
 /OQ+QbKEC4sTPv3iQ8zZ13Le4bQJF0kuelGiC6DjbooT1BwgW0E5AP6NhTcjbechA+flOyYrV5Y
 7B6Bz5NBlTMpZhb4pzA==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695d47a8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_Ixbbux_C5oTi3JCwyIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 7TQhK2qFWSOKsH5CZDY8x1a3jTyfuxvH
X-Proofpoint-ORIG-GUID: 7TQhK2qFWSOKsH5CZDY8x1a3jTyfuxvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_093434_129727_A1EB8604 
X-CRM114-Status: GOOD (  13.17  )
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

On 26-01-06 10:15:17, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Abel Vesa <abelvesa@kernel.org>

