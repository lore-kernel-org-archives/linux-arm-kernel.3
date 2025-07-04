Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206CEC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYd1Y/aOqrQmhXBusd+shb/ZpX/EE96WqbgSK3mRMUQ=; b=mcJb5cJU25mRCkHF36cfNEXne5
	Xd/6DNuZuxs04EgcxZQ6Go6GmCLJwHXBoNByQPL6SB77Ti+Rq8te96PqFOuq0ThWWOlPvU1wYXYSA
	dxHvoPxpZGBtRmc69UyutKFoxeckzjCdrjlvTOt//F9v0IsOZt1T+BrTwEzXKxt+jhHoKf60rBbGO
	KvT56djrtCVp3q4SJHLJJKmxJ4SxNf22by6t9DKQP6yHHtJlzxzz3XDkQMO+y9KHQTA0yoygpFRh8
	RZd9t8/rP+a8QU59JO0jIBI8ZblR9130pQUFG6bf/MqzoLLRgcn2Gc/R53OgyRXYAQ8Pet8NL39XB
	mYOVgeNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkAe-0000000F5FO-1Fqq;
	Fri, 04 Jul 2025 17:25:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXk6H-0000000F52C-2sRP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:21:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648bmmJ025098
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Jul 2025 17:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DYd1Y/aOqrQmhXBusd+shb/Z
	pX/EE96WqbgSK3mRMUQ=; b=H7ukLfzEoG0pXiV5Q1DEnsuRB4aJ+wt8FqnWDcJu
	huGLhlMNlWi8HWvbovEsWZDplRGs/MCp1gGcy+Ev5wqKwzQXtnmT5AKjGY7v42k/
	HT9T/udHQWYW649HtPaSKRKaaURhlaUUO3GfOMZQ4qEuwcurYPHM4z3Ts1+re746
	43mvxnXr4doxv/0z+m3JArYiBu6bt9a29SWWm3LICfAfEnJpiENt5fjMYCVi92G1
	M5T2KwKeBcY2tVRkgtFcUaBJGd61nYebtr9W/zHHHR9lSRnApOZuB8mtR7uh/5KE
	ATk0rq8KqkgzoNP9KsAqldhjwsPnB5MlskJkMD/f7dUIrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802cabe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 17:21:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d15c975968so184967285a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 10:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751649682; x=1752254482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYd1Y/aOqrQmhXBusd+shb/ZpX/EE96WqbgSK3mRMUQ=;
        b=rxYXxU95LV3dBYG4D0spxr/S4csrASp2JjDPM2M1hBvuHcFiKrKBC3v85EC6705eDr
         qq1kuvAEMxSXOp+jP/xfDuARP1fyN3CXNhdZjU5pt3yg0Hp0kGmWBW/aQEtr4Udi6y1S
         Tp47mOuAfxlBv0sqKiVk7V1m182yb4ur+A3sPVEVchpg9H+iJGo1kYM8OpbowiFdSSnS
         RLYf/7EmaoKjHpNnG0Bu0yP5Nyfkgv3KechPX33ec+6THKaEBwvQHLC57LH+/ckNNGAO
         d1lX8OtqPWT2JvDvRUM3pFlRgvajVg8uX58SMTq4K+1ocwS9+f/8gkFsNRHFGLmkdWA3
         Q4oA==
X-Forwarded-Encrypted: i=1; AJvYcCVGQGj9KcNVrH1f72cxoUlEMCXxk+ErBzc2OCmTALVw3fW/ZWAY/DLzogaOaUfIEOI9aRb3LggafDqgCbuZRoBg@lists.infradead.org
X-Gm-Message-State: AOJu0YwMQhv2qmz+Wr4QQgqFyMmYDF4IYIxDvWnmsXKMhhOvhNVkKtQo
	TafjSMVRf1F9S5PzyF+yrdCAHk/mqKtLo22EVG5OOItyZ7YREq9GbRPv0C1XbJo0vXTy/O2Ij1f
	TnNhb3scQKufPWKpdJqaXyjUpGfU+ShGOc6kR1XtIrfsuHu+MkxxEEIFIhJaUjfEzFrEfVZJb/J
	VvVg==
X-Gm-Gg: ASbGncuBZcH7J/ujPPRedz8mwHM6tXaKGotQAbyDyqBOseH5Hv4K98B9CP9XwSAhojn
	nkrI5ryTakRvy7sfNGnIxnhfA3eIH2Gnhd67AADjHgbC7CXNUABkvNz3+Lg7lVEdT4+Og6/e0/c
	8Sv7Y+xI1CRYTSGITCq1Xz+qEzmTQdRDiNUbE5y2VmyW8OJj7c4UHBvLRiGG1vRb6Fn4++t1Ypz
	/SXknStfOyjZxL69vHLy15vYfqv56B9D6vV0doJKTLJcWcPqZVVah0swkmT7ZFl92yq1nXM5xzq
	7JAR8gz7CHccF3b4nMiG/Ldfoibu6g0Er4W5laYTOe8LRAV5G+tZL9KtXCCnw6ssZw026PP7Owb
	nDulNhR2pdhJrDQqTl27mHdVAlwrsWtlJroo=
X-Received: by 2002:a05:620a:1aa1:b0:7d0:69ff:385a with SMTP id af79cd13be357-7d5df181d6cmr340762885a.58.1751649682247;
        Fri, 04 Jul 2025 10:21:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpSHb1K1F6j7rtF41U6JYdzqqPCY5hlVllAFAv6HMtb8MQE1920mSMFj6b/sYXv0mfka0yuw==
X-Received: by 2002:a05:620a:1aa1:b0:7d0:69ff:385a with SMTP id af79cd13be357-7d5df181d6cmr340757685a.58.1751649681648;
        Fri, 04 Jul 2025 10:21:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384952e9sm301641e87.103.2025.07.04.10.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:21:20 -0700 (PDT)
Date: Fri, 4 Jul 2025 20:21:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
Message-ID: <s5fknuvs6w2bgyr65y7ajiyfk2ph5un6vofcxpcz4js6wcybbl@ab5vz4frdigi>
References: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
 <20250702-qcs615-mm-v10-clock-controllers-v11-1-9c216e1615ab@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-qcs615-mm-v10-clock-controllers-v11-1-9c216e1615ab@quicinc.com>
X-Proofpoint-GUID: WV5rNEAMllulOKMrdCCp9jHuq4D2fNss
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68680d93 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0A9y-nFg0dDz6qeF-BMA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WV5rNEAMllulOKMrdCCp9jHuq4D2fNss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEzMSBTYWx0ZWRfXzFWbG22pL/eu
 HziF1Q9feDYeAl5IPBIG6QCvNrrAi65rbm9EJ30uIUMu1dUdWQXhU5uAG1aHvlCAqbnZ8bVFuw3
 vp8/EjEckxwUIy7Tm4LWgOhO+PUDxJHKZKfdMUjbNbPWwokCkzjvNDuoYwU0NjhRrYkZxW7KR6O
 yZ6VtpskXksnMZ0WuqPcUpkTCZRModX4tSQ8G/55t295DwnuJAU7EwOYZK92+cKeJz/UU8jrqhl
 gp6AfXpIUxMNoWYqaWOhyrcz/YUxg4i3zd1TzL72GQ3n+DN86ojoaO2Tsq3PatOkPrxfemvj95t
 EU/+F3FZOyMBZHvBSlIU13zp6ZHmvjweD5qWj1tO3V5+68GpfLX/jUkJ0vRBxJdPP8MHqBvT0Ah
 czLf91mIiRJQjP5X/YMO3jp9oWF5qkLMizBdMKT7jvpSCnH8pzwhlV5OVrQsOtspE4QA1TJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_102125_845434_222BBA02 
X-CRM114-Status: GOOD (  15.61  )
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

On Wed, Jul 02, 2025 at 02:34:21PM +0530, Taniya Das wrote:
> The alpha PLLs which slew to a new frequency at runtime would require
> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
> which can support the slewing of the PLL to a new frequency.
> 
> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 192 +++++++++++++++++++++++++++++++++++----
>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>  2 files changed, 175 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

