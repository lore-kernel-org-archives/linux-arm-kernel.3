Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F9BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLeD0IRUCCbH+NWwe2cAI6SCf7hCyLNverNen8uXb/U=; b=nGZD9J8sf5+HE4+9Hnt3If6goT
	ZUHpJCJCXNpXBPNBjp5SXZtfv9LYSDIrIdCkdnuEE3FIz03cRsJE/LaGMQIuIp1RK33wkVOTOsniu
	xSK8ZgiwdFChEV0BzBWbTYs3+W/0XSRnLgp6dX2VAXYWSOEx5L4rasE/ZEdzV4pEvnWBsUN+tF9Xh
	KckyfqB2o6Kq1+9WmQrtjsBDFwzQ4F5QP4/qZr5MObtTy3RWuyrzY965bsT4S0XxHL2UyxsXLfSQE
	C3anSkOx5jwunF0zme0d/cpnC2mZHW310oqtX7T0fM33Eq7a5rbiJzNUibMyYUzSDd55mZzZXfXUA
	XT49hafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfb53-00000006asQ-0POR;
	Fri, 03 Jul 2026 10:25:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfb50-00000006arg-1KAw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:25:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rfFT2994873
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 10:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLeD0IRUCCbH+NWwe2cAI6SCf7hCyLNverNen8uXb/U=; b=iJxAZ0lRy9VMvl08
	AswHq8gG8SVa2G21u2tYKvVg9RmRMC68nB0h4aZiGIs8q5x7RLADvxk/1BTMAjni
	jU+M3P9rB5BsZ/wOiKw8HBPZpm3lTWVqxY1LrwcZSNaw+43m3FNQOrf5GXa8R6BB
	kQfK4Ga6v7Bem/tCLOqOiAfOHCJLwWFw95bUhaHzJclBkWs/nygbRj3COWB1aet8
	NdbXdVU5CfQYp2flEkVGYD/NWyGYP4hayuLopwG+XHMJ2WtXtwC1T3k4mlMZzy6y
	u4AWbpcMYHNEFfR78OmHrYkC3RDoe1Nla9na3y6xI/y/Twi8jTG5Qt3+Rl4E4cyZ
	55WlKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1vj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:25:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c069f73e4so1375211cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 03:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783074305; x=1783679105; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLeD0IRUCCbH+NWwe2cAI6SCf7hCyLNverNen8uXb/U=;
        b=IZSLA1Ikv1VgQwqU5YwkZgaGozwNttVxoJOnrlUCWqvart+ifPf1M0LP042SSCBXob
         6f94b7TYbtnjob8k2CyPNt0pQcPZ5FETTf7jS75337R7ECMsMSp6nc3YBv3n+fq0EH96
         fJIAaQHxDHKrVt4zMEkXks4iplGWZ0/oou0qZl3doMgdZVGo68+ry5EuSOU/fDe4cMVh
         ntF3lkIISIyhhkHy1AmcUWH6WV1PCig/lPM6InlRKU0ZXWLWxm5AJgZuknQfK0h+drcg
         +lWAZ4EXgi0bg/jD2eZDc7buV2Og6gIsgIANY1ifxSVsldOjh3BclV0WLHs14mZ++eBm
         vVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074305; x=1783679105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLeD0IRUCCbH+NWwe2cAI6SCf7hCyLNverNen8uXb/U=;
        b=SD4l9/Vy0Egiulr4cBmP1aa2L9DazUDV6sKpTUIFwGzfbnuyxJ2Mw4y/D5okY+e4Dy
         zhBzkRJ6lfsoDjePoGvNahqc9GiF0uFS/ZWrlTqH4arTAMH0gcKoPynF3L2e98h0YHXN
         4ZQyhsBEMS0I7drE+/EHAZwXBLFGFkqZ5uNs08TB0XlaJAAZ3oxb6iIkqNqBhl/ECc/I
         WyyKjNBQvnktHB1BKMZ20AwzxYnjmEw4cLDy7qTaTB5Y4YKlCDYuKLTdZUW05dgUpAXW
         CjXqqOAu5+OGgyVLwB924bWtKfmoyca82Vnbjf61AzCH27Rytx8I+H4/54jrDv/hFE97
         1hrw==
X-Forwarded-Encrypted: i=1; AFNElJ/LmzaGxDjhFpuNdAo5RnYF7mmPDIx1UtDbzN1Okfd9pSMycA6Qp0r2AmSPD6+FUnKAZXs0DuMmB414kXK1i58n@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3OnNvPisl2kWaIhZvCzSfXceKu0xouL46y6Xra6iLlah3oWAY
	hJ2gFB8CfQ1Q8XmCwLMzSN/Um4/5yRyP7i2imgGA4sjupzbTIF1+myvTeEsQPGO8ZA5YRlXW5Jc
	qcS8d/G2+va8+p1kKUI3l42MngIOVyWLrUcPswn9usorogBujMILPqzv4qB4ARRxnVqb/xE9Hnh
	I+Yw==
X-Gm-Gg: AfdE7cmxdJcUyj2BC+hjQkTvT2/C73ADhV7p3GIVYDrpnnlEqGjTGQi5tg3tb9oRTMQ
	fulhM0dzh26p264xfnaMaX86jzf0g+fe03v69FeAeR1W5r25PPR27doQGv7txxs+0UQml/lJqup
	VHjlPIKhb3VK2UUpokwnm90ysGPSJlCjXPijI8YgZebCP9NwE5ZOnQXo8LotwGefCNrMcEHWSz5
	mKXk8gKEx4P3GomB66oEfIRnMVUmVJnqxTjNJG4Qp9sdY/xYCqTUaJL7U1K34GxgMLZYsE5UqDB
	6zQUDmVkyf54qN9DRiOXcuJyXiFkN+WYQ9f+rQDJUwe1ZO/vZaXalOAUU+FWLCLf30/KyjgqLeC
	/X/10KfPi7Mz5AaY5FvlMzBBgdrNZOsHLEvM=
X-Received: by 2002:a05:622a:118e:b0:51c:2324:666 with SMTP id d75a77b69052e-51c26a6b823mr79308891cf.3.1783074304705;
        Fri, 03 Jul 2026 03:25:04 -0700 (PDT)
X-Received: by 2002:a05:622a:118e:b0:51c:2324:666 with SMTP id d75a77b69052e-51c26a6b823mr79308631cf.3.1783074304270;
        Fri, 03 Jul 2026 03:25:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4a72sm262349166b.43.2026.07.03.03.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:25:03 -0700 (PDT)
Message-ID: <424aa2d2-aad3-480c-b63e-bc557839971d@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] clk: qcom: Make important ARM32 drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
 <20260703-clk-qcom-defaults-v3-4-78894525e54a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-4-78894525e54a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwMCBTYWx0ZWRfXxoAEZIvcZ0em
 xOonhlmpauBXn1p79rWngeb3GXoNFCUaZ8D5KWab0BrfioUTzguPjTazPfzgVbqVh4g51QwVkSW
 nIx+2SVdd9BKdbzhe0sa9CpLKGs15Ko=
X-Proofpoint-ORIG-GUID: VkRZxB5CmRft_cmPqGC7O7ynutb9zLlB
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a478e01 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YbJbqLu5s_8SUIbSLSYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: VkRZxB5CmRft_cmPqGC7O7ynutb9zLlB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwMCBTYWx0ZWRfXyEUx5mwBtgLm
 9IdmMr0SMxnGXK2LNfxaNsdNsJQv/9L+ev9QEO3N2oUUWu92EexaiGEQSh0OKIYf5k5qCWGkLhw
 It6hwh9HapUy31ZlqYM0N4847fFIljXRhabgaU9jj0WGIf9+Z/jYD7MxA1cgLxhaZZv//WQYG9n
 t93peE+mVqiFtillZGtjZnl8GLra/8VN5nlqM5iUGfnnrhYbwiiqGY2Ep0osDDD8KMZAXVWWxCy
 TwrLfVb69sIichddsXT3GwkyxYz6Kr5rsVZxxXrAK/Br0ZXDDYmQaKT/bo5l74SmodUArCMgqWZ
 INSiVYQmvLO9/mmvl5aauOwQ6NdXAtsRX9OjmeM66N5z88t2cNXMpYV0sSewmaMjkJ9pWH2lazh
 N5565KiM+kYc4+Xugexj5pnDt58/VX9FDPLz8jFyw/yf3qTgOC0rmnGXsNWYks0Ginpuhk9fijl
 sIwM2OsNNm8K1QsUIcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_032506_486281_269FD27B 
X-CRM114-Status: GOOD (  14.78  )
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

On 7/3/26 12:04 PM, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Switch all Qualcomm clock controller drivers which are chosen in
> ARM 32-bit qcom defconfig to a default 'yes'.
> 
> This has no impact on ARM32 qcom defconfig and ARM64 defconfig
> include/generated/autoconf.h, however enables a few drivers for ARM32
> multi_v7 defconfig: IPQ_GCC_4019, QCOM_CLK_APCS_SDX55, MSM_LCC_8960,
> SDX_GCC_55, QCOM_CLK_RPMH as module, IPQ_GCC_806X, IPQ_LCC_806X and
> QCOM_A7PLL.  Enabling these on multi_v7 is expected to properly boot
> these SoCs with defconfig.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

