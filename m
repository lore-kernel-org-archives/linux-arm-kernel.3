Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F978606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 00:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vptN38k0;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AAiMmWvz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjEladUM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m1CYVddtSAfgtkCDt6VccjVuQkJ2y3YjAFo+UlGYC+M=; b=vptN38k0hZZa7M
	8zZ8tvMFYK7HGlzjCTt4Vt7hVuhWuXLn4Sk8VfHYTn3pkEhHwJ3DyjKKehemwC/CIZKgx9NEaUjx7
	5lkduNxzA3cv0tUpn3In/D+VZAfstUOihemcxVa9OcboL5pLOnSIrRvaWN5/X9WDywyZ4vy7xEM82
	m47e4zFkejDI0/PX4OZ+kVtZWn/qLUyD8IppIz9HfffbrT+w43qU69q37nsu8Mk1/j9YDPoAlU6wW
	GrFmp+2ch9lvRnr7BrXhBHgT0CitTYuIQOqhHfjlmjCtIwy8OMfbGPGeUtOxySw4FWf9BaJLW+9CK
	OBngsc/CtJ7/tmKhO4jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2HO-00000000jSP-0x7y;
	Tue, 03 Nov 2026 00:21:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2HL-00000000jRx-2bpp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 00:21:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6J3x3842368
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 00:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1CYVddtSAfgtkCDt6VccjVuQkJ2y3YjAFo+UlGYC+M=; b=AAiMmWvzUkKHut6Q
	ulNXTMSVgicCv1fNnSxRvXiJ6t+aFn74HFgqhOfd7c0gYb8q5CYSFoxDogS7yQlZ
	dCnx7bq8U1H+Xf14+rKXEq6YZvw+5wgB+DWiVMNe7QJEhCPhDoHZLDHB/rlmDsEo
	RbJZAxp0WaOXPCXdx8RrtTpaPrvDRwIhDrK1Kf9BDxkRiW5WQQlyPWw2gIHl9qLD
	jdsxwWmMTA6am3+D6xjIr8JO8y9ycMeSJOSCW7MvcnXumccJvw8lMQ4vRxd/hHHz
	ikGuDdxT9WaqTK7a54Hd+BP0oZ1J3TniDgWpHHSYOlrwrrw/hts31hri9KFLEu0U
	Mvhu7w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavk33a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:21:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so8199387eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 16:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793665289; x=1794270089; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1CYVddtSAfgtkCDt6VccjVuQkJ2y3YjAFo+UlGYC+M=;
        b=CjEladUMwgcsLYpBh8VNcCoY9JPQuS1cj2VIUILs3omdT1Y9RwMfT5esKDgrHj2aOH
         lqYHW5TApL1YwebJ6KjPVG+uDStQhBOaMgeC3oKW4GZ57ad9x7epUJrKC1f3PI5kHLWf
         vkIvqbZRta90jIKW4cCvVbJKDb/UvjA2vgZrnS4No+p0WpHI8HoBV8wOCvPqNj+9zXGU
         +P0NHFksN96A5NSAIEWxyuA5bB96pLYZ7Iy79N2jEeT01JWICyzhAJhEHukdC1lmTkIh
         3gKjSVDK9+Wh9P4Bsgf4lhuFdGm1ISukGeuJ1VPuIzdRwl+HQbn7qW72OwgQKlaG3cbr
         1ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793665289; x=1794270089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1CYVddtSAfgtkCDt6VccjVuQkJ2y3YjAFo+UlGYC+M=;
        b=r8Y9tPdcCA+I/RBK7VSzbw7EacEkjWWlnz1HDYQD7MErRxUpSiAtcNT2S6Z0fdNFEv
         ENHgtMrJbSK4NmaH6sn6LU2P9MN3a9JfaAYd9+2CuM8BZjj5e/x7lh9A91cprIKt1z3L
         lnusIYvec5jActXG3TeiJRIlftvwsyvNDZTrclpQj4krUkb9ycdU16tTSI+tgT1LY3Y/
         xvz9gYCpbxKwy8EJHPOQhKkE7u4zm9wYXmf2a0sKu/GH3vIXqcHYHPF0XzXMjN+aenQH
         +Vb7bXViMUjsaizmwxGdB7z9TnKzovLwtnQ0izGZGNCB+3bOLe9V4DykReqs1lzoVwV8
         WzvA==
X-Forwarded-Encrypted: i=1; AKwUvBw5ZVDLXhP+F6kKiKVwW6TDfmrS74SgMe/TpgKwNIBfDjJB0iAAmVqbGzA0EQjqS34sJOYqe1LEpTo2BH0rkOdd@lists.infradead.org
X-Gm-Message-State: AFq9FYIrvmA1uYbWaU+71qWJUezvzIhBGvetDXcL+x0/CmarRU9Vx/PS
	e8qdHATy1D6EKTYL6IoeV2qdVkzIGQjhsOyZCWRibh/6RpS0oDTKOzTJkvzYrjBSzaSKQFaVUwK
	uVOydSCYKkXglDU/iJb0fSLG7vo3Tg0jblMX50fOF7rud7in2/KojbF3qZdcS5uQwbofnv0q9Nk
	Njjg==
X-Gm-Gg: AYBFou2/EHSnM+jbfccXbeWkX+2U17fs1CncQa35Zn7l+Xc1jIAty+lw84jmupE9/+T
	gMYfxaSSB9+HcxSFcOLp/4krysFMAzmS7tDCAjPqJSkA0p+1zqfMiSS5PAAna/eh7aXQ+/zi3nD
	kSKpDoJ8YFygTmfhg/m6aGaDzUToroHdMwATNQHDdCDhIXG0ehvg7iDdpAgv/nfkbDcpHBIT5qM
	LFWJKh/KVsMCRLWGTrjIjj7rw/+l0dc1JUEj7RCP283vvyUEo+PELF45tHu96FPkKtqu5UT9oSu
	c7DIHi3ytIPrmgLWfV6BS+BIfjuSKCu2CHqDw7+jw8AaHddTAYYtRqZIQMs1xlBKPZuCBSWIed1
	4EPUBRr487T7CTTd77EUmDjD18Oi0tw5/WvkHKoRfCkKJugZNw+UVVAhbvFFj03Dp7MHBgWpAUL
	XQcxjzCSyt+oc=
X-Received: by 2002:a05:7022:ed09:b0:159:aa67:28c1 with SMTP id a92af1059eb24-1ac5c92da58mr16984817c88.20.1793665288344;
        Mon, 02 Nov 2026 16:21:28 -0800 (PST)
X-Received: by 2002:a05:7022:ed09:b0:159:aa67:28c1 with SMTP id a92af1059eb24-1ac5c92da58mr16984780c88.20.1793665287605;
        Mon, 02 Nov 2026 16:21:27 -0800 (PST)
Received: from [192.168.1.148] ([68.248.129.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm40121421eec.6.2026.11.02.16.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 16:21:27 -0800 (PST)
Message-ID: <7005e138-6d5a-4c39-aef0-7200cf3bf911@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:21:26 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net/stmmac/dwxgmac: Extend MTL/DMA support to 16
 queues
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, k.domagalski@samsung.com,
        k.tegowski@samsung.com, cs0617.lee@samsung.com,
        abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com
References: <CGME20261016193835eucas1p128cb1712afce0314b1ecb65b0c0fc841@eucas1p1.samsung.com>
 <20261016193823.2711773-1-sagar.cheluvegowda@oss.qualcomm.com>
 <atXhR0sgdW84YxcQ@AMDC4622.eu.corp.samsungelectronics.net>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <atXhR0sgdW84YxcQ@AMDC4622.eu.corp.samsungelectronics.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfX5FiT+Bn2vEEj
 MRxkzE2ygaMsbo4HsANiRqzYs9FuQdVJSkXrp4FjNuYLPmoqls8nRWbyiRyYImn5ES/jWXy3HVq
 j9L2f/Fl2H0EKDmJMCifCAlzd8NCtNnhKEReieZO+Eke/4mnNti9imcdyXBoWXOfMwsO9iLsm+F
 0DIV9o96eGw4925m1hhlhBSi5AXQrz9f292aAMddVjp6S2wCH3Dc0zqYlwu4AkWS5KgAdoe3q+7
 cYVaZh+4L+kuJi0OEKO6Cp/9lojlcW9QsD8l2T0bOKlTebrtNwL/mNNVybwZketZiJQsp/GV6sk
 WJN54FiYAyu/KLK82yxV1hl40nCzsqHfX3l0PCsJnT7QxHLl9oI0ncHXumakAqYrCp4J6KcySOE
 1+pglaYeRuGc/yPM+NS6m2BWwNitdugp+6oLRKHvfzePktkaMMuM/OK4nTSgWCqZAxOcYNGaYgh
 J9SEzJ6n4hCRR1gRkDQ==
X-Proofpoint-GUID: WAh7C_TIeUYUIY0S6jG1scyY4vmZmJBS
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae92909 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=djYDpCgIitZxdph7ACYjJA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=XF986EujfQmVbk2RL3gA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfX9VA08n8OCPh6
 HgF8XOQ5appU+uT6sYoiDHj/cRLmdCczyGSBzCMHsCEwsfwCRBRHE0PpPmHRjG947R/qJKFINNa
 L0bcTMEkY8TAHldR+HZ9pzaCOjDMl1Q=
X-Proofpoint-ORIG-GUID: WAh7C_TIeUYUIY0S6jG1scyY4vmZmJBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_162131_806059_87D73128 
X-CRM114-Status: GOOD (  17.92  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jakub,

Apologies for the late reply, and thanks for the review.

> - Does it work if macro MTL_MAX_{TX/RX}_QUEUES is not increased?

No. With the macros at 8, the DT parser clamps snps,{rx,tx}-queues-to-use
to 8 and ignores the extra queue nodes, so queues 8-11 are never set up or
mapped. The patch has no effect until the macros are raised. Our 12-queue
testing was on a tree that also raises them, and my note under the "---"
should have said so. You are right that it should not go out on its own.

>   How does it look like in your hardware? 12 DMA and (8 or 12) TC's?

The Nord hardware supports 16 queues, but only 12 are enabled in our SoC.
It has 8 TCs, so DMA != TC here too.

>
>   I agree with comment by Jakub Kicinski on my patchset 1/3 that I should have
>   implemented it better, but never finally did. Issue is, stmmac driver
>   assumes number of DMA = TC and uses {tx/rx}_queues_to_use everywhere.
>   So proper implementation would be spliting DMA count and TC count,
>   where both can be verified by stmmac_get_hw_features().

Agreed. I went through your 1/3 against the databook. One point on flow
control: XGMAC_Qx_TX_FLOW_CTRL(i) and the PSRQ(i) fields exist only for
i = 0..7, since PFC is per 802.1Q priority, and 0x90..0x98 is RX_FLOW_CTRL /
MAC_RxQ_Ctrl4/5. Bounding dwxgmac2_flow_ctrl() by numtc is therefore not the
right limit: it happens to be correct for 8 TCs, but wrong where numtc < 8,
and it should be a fixed 8 (the PSRQ window; MAC_RxQ_Ctrl5.PRQSO can shift
that window).
I will review the whole series thoroughly and pick it up after testing it
internally on Nord. I will keep your authorship and sign-offs on the parts
that come from your patches.

Thanks,
Sagar


