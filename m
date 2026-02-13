Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E6FEF99CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=; b=y3t3o/f0XH5W9yykqUaR/ewOsK
	2fjtD5KyEYXlzMvruBokoa261PtgSAeS6bSEvw3V8H03IKQXJDPcOCw7DYnm6LrCXGE7OvQ1N78m8
	GM4ftQqs3lcKqXxjyRUr/bJJDUgMoSfIyxtjw5eF0zN5EJkz2MxqTECCFGEO/4QpvUIgdT5LmTXWv
	ljCGZsYxh64vXXB1I93ixNxC3oWL3z6djiCJ8QBtVNoLvZ4Fzie2o2kanXx7py6pTpZvVu7/pK2+c
	R0kr1GDm9qOaur9fICkvkR/WmZmvAPnzzxc18fMZQlyI45ldH+2HHVTqZHiwDfZswd6NmFqksagpW
	Ym21PKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyjH-00000003qVb-3dfz;
	Fri, 13 Feb 2026 19:21:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyjE-00000003qV4-3IPG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 19:21:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DFJWrR2628874
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 19:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=; b=n6Jpo9CHKdqjFPx7
	v5EaF8vVhX2l082qisnceDw76JfYyuBwc6L9g1w4yVqlFMNWW+77QDBsi0b7372K
	+S9LsOh9lh4EhGHWcLlUSXL1ZlmBcX1kbd5uNJqC7Kg/Fmi496jZEkJXjGsOWufh
	juv38KO6kgtRk1KTohNdRF3wQuzpnB0cBkPNi5UkDvfn0LhkabUfLFxuKPnAjLnZ
	gZJh0ap9UNNJfjyQNpivsLTgmzY4vpQ2AV6HOKKWDSlVPMu3vAERkLjC0Re8Qfw4
	YbH1nE+Owm7rr8tFYkNi51LG1delweknJC1MCdM+lOQcbsLTK8S5f07uEuBiu26b
	UfGh4g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ygutk5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 19:21:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8243fc3fe8eso3292587b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 11:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771010482; x=1771615282; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=;
        b=gQ6s5ucdC8iciM6LCctVos2NJeiehlzRjImnxSFym6ANETRWrzJ2jfD4Tyfb06CWqg
         9UWKB0hZDGVDTJpKSZovcCjqhOOvb42QgjdJZspJ2GdvadAnGlrj66r0qHw5D9fHtnu0
         HZLKH8eksi7me9NYvHsgSrg45z60176QQkjzk3J5YsrleJpCjKq/DQnDdvGF05Q305eX
         Lwb9Itu1/2SOGA7hqY42VsbW536gJEN9Hc5jDu1D/zKjPOrOWaDE/E/8n3HuXWlr6Azy
         pV9jyeF7jcKcvsHQPlgQtNPRz+r3hLkFSIaaPwm8rqDcIAFv421bVO/Zx6regQZLROJm
         tWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771010482; x=1771615282;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=;
        b=oP8JdFCkAXdudX4xPm7FLhy3AzoRb00478QZsxTcUvr/E/V5jqDE4CWg3d8B7kTNma
         HyDirX4MeyKic70jrc7QMMQijvXrptrPhfYIy67eErWj8ynr+YgiJQukaJenuOHOypdY
         drZYUAhvHmLtycgT0bjc1i8Rwpu+qyfgMomXHBQ98FFwzFdSAlZxfT9fRj3hln/K93BE
         k7aGn6weWrTPPEa+LljGdPXz7GpN7ftjiDC2wZ66+ekPk32LPaMtWiZHAPzWB1IxCRur
         OGSK1CgWGbHJ4+Zk2DQzW4yNVkpbIrG+38eRI73Zh1YSFwyHoMtuP6+je+a0giqCLkM8
         PU8w==
X-Forwarded-Encrypted: i=1; AJvYcCVEcVlboim4PQC2z2UCfyL4uyGIiDUETq+nFftVQwl+nHRvuxhoiqkPR+CqDgkcGQIJNlRB7BHK0g19rQYT3dpB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6XQE3BQrtGRdVjRrLSEax0JKAsF+iANh0hXqDQYNmWycnMFBY
	eQK6l7u5p088Ffa/ynfTvDScPnvmma9a5CGnkrvRrgeUOT8FijMRvkR0+KZ0/ZsdYz8XZhCAL5A
	V8j/Zd7nu0V5n1fJ6kTaLjNn1+3qbi7RsSfE5z6tARWZGP39R4riDntHfyt7mmWyna2oFKLaCA7
	D89A==
X-Gm-Gg: AZuq6aIr4lVHv5RkiyfF+1wiuQwYJmrJCvRuVVqhQ6VvEPVcYr+eTNR8JMIIbg9z9ik
	MmVYfqA1+H+3MXXhaZU7FzLzoRFtcE1oJ2xa3qFFwosDQcEZHnnqqHykr3npQcQisoSH1f5Bl3l
	moErrWw8BtrEqkLY/mfmYVZQ5BG+2WIK2XvAV5KoLhlOnHoUx31XMCrKX28LAqj7OQVvAZqqrbW
	Q15skptISEZJqV9ysopSTtmh+ocldSvlibJQnVZioNSQk95RQAZ6kpPUbMuQHkrsDaIW5eXqAob
	gWXFLJlK6DvKQga+B0s7oMy3oKy8ct4MVCE8a2cW/NOEhFUgdi+12fRawTcOvQ/4+BgIBNbFP9y
	mGpK1++MO4bAE4wsB45V1NNiuJTFz88pIh2A=
X-Received: by 2002:a05:6a00:3996:b0:81f:4675:c2a9 with SMTP id d2e1a72fcca58-824c9310c16mr2776886b3a.0.1771010482225;
        Fri, 13 Feb 2026 11:21:22 -0800 (PST)
X-Received: by 2002:a05:6a00:3996:b0:81f:4675:c2a9 with SMTP id d2e1a72fcca58-824c9310c16mr2776865b3a.0.1771010481623;
        Fri, 13 Feb 2026 11:21:21 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bb55adsm3238949b3a.62.2026.02.13.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 11:21:21 -0800 (PST)
Date: Sat, 14 Feb 2026 00:51:13 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
Message-ID: <aY95qbcG2BLGVzHy@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
X-Proofpoint-GUID: X0bBa8M7NEWZsgJgSEStVmUyam8BtjPo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE0OSBTYWx0ZWRfX4GKeM/qdKjLO
 O+BoQxla0DYHL/Xamlvyd7+uD610adKtt6a8X8KJQQ9+u6A3b7OEehGpi/ULvCFreF7Cog9UoFj
 Cp3YO+ZVe9zu8VnWdjmRFRGYlzy2mjjKBg6q7a0d6+JPqEEIfdZGIDS7zbGZ/Z0mDuSvmBNfGyf
 AFI//5DsRN1sAvzb+CYrqDhYJX81dLUcZ4JRCeK6EjoPuoP6Tz4Vsza+Hx5iztn5Qu5RFnOfM9q
 c09Y3QwhM4jJeZEn8gouyya9EKVsvMA8pNd9zbma5xsP8yeDk4kwbLTBdPeScCKjs48EMxDFj/H
 x32NVu2HJk6SCTKEaPWurin3hPiayzC3Iga+7e4mD9Z7fc2PH4+3qR09lK8CpqAbP3YR0NX9uMq
 N6lS4YWEchWaz1ylUA/GP0noyBHHVeBj+4+Jx6bIImAcotW6loFe5ytNpno2hYEKboWXeqC9XMU
 zwZ/SlE3CiA82IPvWhA==
X-Authority-Analysis: v=2.4 cv=If+KmGqa c=1 sm=1 tr=0 ts=698f79b3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=D3qBBfOVRyNl_mCGRPIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: X0bBa8M7NEWZsgJgSEStVmUyam8BtjPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_04,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_112124_956128_3D546AE2 
X-CRM114-Status: GOOD (  23.66  )
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

Hello Russell,

On Thu, Feb 12, 2026 at 12:09:10AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> As the last series had issues with stability, I've changed the approach
> in this series to concentrate on keeping much of the SerDes related
> code within the qcom-ethqos driver rather than trying to move it out at
> this stage. This means it should be possible to bisect these patches and
> pinpoint exactly the code movement that causes any instability.
> 
> This series starts with various cleanups to qcom-ethqos (the first four
> patches) before beginning to move code, passing phylink's phy interface
> (which will change) to the fix_mac_speed() method, and then using that
> to configure the serdes and inband setting before moving the SerDes
> code.
> 
> Please test this patch set, and let me know whether this works, or
> where it breaks.
> 
> Thanks.
> 
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  11 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 114 ++++++++++++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  11 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   3 +-
>  include/linux/stmmac.h                             |   3 +-
>  8 files changed, 90 insertions(+), 61 deletions(-)
> 

Things look pretty stable on the QCS9100 Ride R3 board (with the AQR115C
PHY). I would like to test a bit more and should be happy to provide a
Tested-by once that's complete.

I may also get access to a board with an RGMII PHY on Monday, so I’m
hoping to verify the changes to ethqos_rgmii_macro_init as well as your
patch from the previous series (“net: stmmac: qcom-ethqos: convert to
set_clk_tx_rate() method”) soon.

	Ayaan

