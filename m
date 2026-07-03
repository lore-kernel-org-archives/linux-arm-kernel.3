Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5DCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFmVjSKmtezW+iC/SEgcCIOX0juiZJsRO1owbDX0Df8=; b=3JlDzsyFWVlUipXGIvYFsQpmZS
	Ep/8RhXiP1cEezgltCgyY6Wvzilksqdn0rzBxCOsA2B+eaZCB+TnX5T8QZ6+gs+R4blU4IWhOWljO
	nvlh3gaVdTtYabP4aO2q3dud7hDosGyrOWteMCCfoVMHimCqJ1WOPE9a+2AepMwtBEycSKSYnYlIN
	2h3P/sH+5LpvpnMMG1Ae9XNzRi0Cvm2pWsQlI5fN8kohtDubSIyRZFCC9s20enOI2Td0uo9ULecZf
	2KJRt+CnUPwJzMpw3rNODU/8RxuY/ij/W2RlOFOHun97J0+rvRVUSXpbC1bo6ad8pXnJOokFFlRbj
	4moXCaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfb5M-00000006azO-1E6Y;
	Fri, 03 Jul 2026 10:25:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfb5K-00000006ayc-3P0R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:25:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rfdL2994867
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 10:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFmVjSKmtezW+iC/SEgcCIOX0juiZJsRO1owbDX0Df8=; b=jKYOv+4lcTBCAhE8
	i4qzPPQPd2ZSydMfWzxqJKxKm0IZpxvIA/KGMhN3OI4abRxDi9gQiLmaRJqL5b5Y
	aFUf4rJs1Syyq8JARo7FvZBtcii2lYmTGNz71PV9aBb4acrn9IPI6/EBwlyLbzir
	iSDSozwFgnyylT/P3uHoTq6zEWJWIv5qjRcgmvpktKz8qGDP6ghN6P1bFxMJYSLj
	dqkS+5Tk1hujIcGaBlS5K1V5blo7Nk7qKE59B405z6d6f3rpxqtcURpI8kcQjuqb
	TjPK7vKPi2fRQurlmLxZypy5q9aU/GmrDLj4yDp8xGFWvvRNZ5MI9LZiU7/RF2Nd
	KSLXzg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1vkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:25:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e777a15so785191cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 03:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783074325; x=1783679125; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFmVjSKmtezW+iC/SEgcCIOX0juiZJsRO1owbDX0Df8=;
        b=EHb3MhGipTrbZxX+Hh8xnfPo3yKriigBZQN7aIOw7UmdKiBKRAjaLB4DxFsapPIAa7
         UHVRdrtYqf4dKYxLiMzn/OLC9+m62arabw/Ll+kq2vARBY55blLQu+35xjAS89NmhNib
         C2GBRgaGlmp0cqy5rg3nt7LxzMWQWsJB+B23klmNfIQBCqNzYPyoQK7EL9nL7hVi7wzi
         hgIesALtVpuhvXv6p1lzlQp1+Vz/Mv9aQtp6pJnB4cbeyJ7uR04dGXk5ajDzJU6+GtXf
         IuD9va95Z2v/46A/FoQ0uEITJ9R2szmyLMUe1YkPGBy/AkL0jGzo5WgDF/wUPf9k8VUq
         4B9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074325; x=1783679125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFmVjSKmtezW+iC/SEgcCIOX0juiZJsRO1owbDX0Df8=;
        b=CrXazWKohiJ9/by9HqAe8vvzb0EE7xcCLztC2SzETZZ5rhvqmFPuGm5i20YP6Y5MkS
         9Qjgt7jzlYCBSLrfBDampTIqyAWfAUgSCJHuWW4N3Cu+MK3MzytXf5FUUthgohF+o7lK
         19VOnYjhdNMLytQlZgLPq/qEt7TDCah292Uw3AtI07krxgZnHGqzZpVBBB1fk9tDhccQ
         QoU39jRaBRKbhtZefhuwanq+JGvvIqkOm+SPBEhRPuvbitLfx1iRmPrlJTx/sMWbdImK
         9WY3RYlLU3k2NhyM/nrsWftk+54Yad6ySPcwJp9072N/SHDSVQFpd9tuNrhR9BqF5oq2
         /zhA==
X-Forwarded-Encrypted: i=1; AFNElJ8YoXIzsO+kaNXnuqO4gfr++Mg2wytoav2OPHoq9M7SAzkcADWp9IFVBZu1Vxcri9Owh9WDeoV1GYf/1kJOcsMv@lists.infradead.org
X-Gm-Message-State: AOJu0YzguJxndM5pzGrGDNjDrp/gDztS+07KNIg3ML0DbGCq5nZ632jr
	i+ViwmAfdgWHwQC84pOaYle812zEvJUhi4kCAxWwSEcCq57jX/wAziBMO4cH/q2V+HLYyoYIIKc
	M9gMoI+7tRJo9YySXyqnINYM2w31G46DTolPGVx9K9yp1f3//r7SjpLuWGf1Kovbp4dyCy4Pnsp
	lxIg==
X-Gm-Gg: AfdE7cnKiNO1P5nL0uf4tHEEWgPiDvs5U4r2lTBEMJJM4Z1TkF1cymM6d1UHJ6f0X98
	zYo8qVKvlTL8+NWRiJ17YOyGWDlidzFg4TSUcMWVoEmPm58LiYY6XKXX1W5scOmAjKbv//PfmOj
	MPk2oZFR35rc7lrnQK+9G5jaJUlEYjLO4AZXK6aYmt3FFSPWgrsh6brZ+hRdeuAl8Gz7gnsHqY6
	c4gpcMzEklW1rPyA6xRe0k4aE6Rnds4YlDg5mKQI3YWPKKH+3dRcNir1TDb+Gk+NeejZPOJF/pv
	JcW8c1B+KT70KXJ6P2TO9ClZF7FblVrue0RRSZexd0rItjGAXyckMZHKC0HSxZEU/H5d93DZd89
	PB0Sbwqy8eMH/mnMj1vdm8WxgeVsBloaYnJk=
X-Received: by 2002:a05:622a:1aa5:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c26a69173mr79863651cf.4.1783074325293;
        Fri, 03 Jul 2026 03:25:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c26a69173mr79863451cf.4.1783074324941;
        Fri, 03 Jul 2026 03:25:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm263041166b.1.2026.07.03.03.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:25:24 -0700 (PDT)
Message-ID: <e5c4c9e3-aecd-4559-a536-e5f2f9b19ed5@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] ARM/arm64: defconfig: Drop redundant Qualcomm
 clock entries
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
 <20260703-clk-qcom-defaults-v3-6-78894525e54a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-6-78894525e54a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwMCBTYWx0ZWRfX42RIReeRcgYC
 hU29zbmxovnYZW9wxawwQcIDh2+IQPWONGO637lMAyhxpFCH2OujG1KD7hQpHg42PaJan+Q5TcN
 FFZe5Tw2k5PWQV9D5K4l+zFF5J40+1U=
X-Proofpoint-ORIG-GUID: Kqb9tlGTXAzjgR14IvRU9IsLDWol3EHQ
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a478e15 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pIb2VplZuXs3id8JfLcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Kqb9tlGTXAzjgR14IvRU9IsLDWol3EHQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwMCBTYWx0ZWRfX7Pcws+btMT2h
 eZymXNRJiw1RbUAg18bELYxQYRdoDdtaqjf7dI+Yry7XS30ESoYTBcv/T3TYx1Gh32ptiQ3WR4g
 BLoDQVEJw78adbkm3WYsU/LvdXbavCbDHid2lCWms/1jJqA/2g/LQ7tgrrNRbFP/QPxWYSrEEoI
 YKUzJWwtRDCOTgBIBZErEyI6MrGIwZVIsI4Q7E8ZuaIOVEjQcJyAcx5uH76VG2Kb9MJagAKD7/Z
 H1EGcKJwoGlZZhJKJ6fgpw1D9uW1y0FMzf5Eb6pEDCXQXwH1MTDM4dXaDJldo6hAridEviVjUTy
 AmfFqXJlam/ZfBWWb5Q0arrdnUbE9bKxXBavHULltttvFCoerlfh50d5Pf8wE4zXyxpdnapcnj1
 SjGMCecZpg2u3sjscAXdr1HVokf61kA4EyBupstt2lac83rmAuzbP2JNjcQ/PIsXeUgaKLZTSMo
 EN2yPvOirEdd7qi7viQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_032526_972525_3BE2BB9E 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
> Drop all drivers from defconfig which have defaults in Kconfig.  Drop
> also MDM_LCC_9615 which is gone since commit bac4675a4d1b ("clk: qcom:
> drop lcc-mdm9615 in favour of lcc-msm8960").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

