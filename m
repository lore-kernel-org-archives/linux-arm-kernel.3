Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C354CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=; b=bZGdMuA1Yy6+0k9I9cmH9s+7Cn
	b6WBiynhWKY7tMnbzcJQhP/UwFGgmLZ+VsXnTSmFTa0jmBPEaOlM3+6UW2Pzjk3IB4i5ztpkVeMMz
	tKT4sWVy54itMJ/BG4kR02qFVOW6S0hyxCwZ2vEXdMGBmsFAesaMNtDmEc+yXv5u5LZk/RDDA0s9E
	oZzNSfeGvJbdsEJeEYOBCpINq/kk5o1PAtpgjZn2fouhKKWei8/TEqCwGT+nF+54OcvhXKE7dxXaV
	qYqBG3yHN6P+vhLFjGMXliwwaL2qNdgezyT3F1c/38hwUt3Chw4XxIixQd/gcwPBwR0wtdiQSLOQP
	HACZFRAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNP1-0000000D1tc-0Qyi;
	Mon, 11 May 2026 09:58:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNOw-0000000D1sM-198Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:58:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6gWud775038
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=; b=AG85DNzf1OvYu/Xz
	qNT4MZs43mnEuVdTgVcpk84JGph9P/5IrY8IW3ivBpxlNgpVtxLBNvB+uBipq+sI
	iLSiYx1HYr4PN9wqNANjVyfCkiecE4u3QAkOKeCam9Zaas4LBRsH/0O0kxcPwBnn
	Oo55na+6o5ChNaqTgnbF7nQ1B1nkeJE2CVUgWYHFuCiZk9brgHZ5F9njR9MfKkhO
	R4ECNEE0Nt3QvLtSOqcGejyE5+/ORAn12kwgdVL+oPAJWgMR2cM0mR+bpUjKv5w+
	jS+DdzgYutH7ZdwSSnKkOnHwNsluD2avj4Dgcr6BoaFX3DWZG2yPo+sfORxc2qd1
	4WXJlg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3a32gpvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:58:13 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-575296be5b1so373868e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778493492; x=1779098292; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=;
        b=cqZxaT22vTNTQy2o3nVLTavJlHOSz//35fb7iIp6ux2+HeI5Go1cRaskEJcNGR0RqW
         A+Opc1N8UuTtkyU06uNOkk+Qy6ynw96Yb8/F495meW+5AZdwTLv7RqoHMGd89fKC1o1H
         gWjRLQxkJ0f1I8zvaDhVsCe8QikTKrNRhclwz7sdkuTBL4IPidXCXBysSkIzBljornQS
         xCCcaveXKKitiStqzs1C5qTz81cT1o1VUz6Tge47mi9akCRvDMEAlKpzvboUmFi0AMiq
         Xaz4zNsuw8OL3lAkX+B1aKtM8Cdp5EGXoZn52+nZvhMD3lGV8a30t/snI3yyE9DCnnOw
         i/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493492; x=1779098292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=;
        b=UDZ2nqdedg+oVT1FsIOCtF9d2xmGvwzuRuFZe7jFUaBqiJLn4Ay+SL3bzUNI5m4eRG
         GN70cCbDiuRcjgeNznCoNCoe0LuVBW3+CS5+4c6fr+fHdpsabbcgzB4N8180kvE7AH1v
         VafQkmTHHKSNUFHv0SoLwgMWOf3/loYK5aCBUE2nV5+r9HqZGl1R8IBzi5ebO9JuIT+D
         +c++Tv348KqFx47jynrfAXctdRTm8Co6ZhWK+TwFvQEYXqWCciX2Ah9T3pLLC9o+hI37
         GS0m3MkD9inM19zz6KnqTdzvwYv3g/KuE1jc2lw46qo9c9W/l7hKrQBoMPXT5H8/8RcL
         WaUA==
X-Forwarded-Encrypted: i=1; AFNElJ8+KVDy3WV9Sr+pm0YIx9XCheHeJnxaYYSa/KnK05WL+rWf0y+N9LpPQCZ7bMX41VUWoAzs+YEKWXk5SqNayotA@lists.infradead.org
X-Gm-Message-State: AOJu0YxHS539YUNFXyVquqyCjhr91qw7q1dkvLUCDMCV3XCRuvbB0mLm
	JRgsq8kuSx5j4bf00q/HolOiiZyucBCofNydnasUD3kR/S7TpK8poySYT9Jtnop3wbrxTuqDBTV
	mSCKOGye2UZMF8wbX5Fgx2CZZkYUzWn4r1WHFtum15pNgaZxw/IOBo0BbaDXJq2Ytdp4Yv1ldXD
	Qkow==
X-Gm-Gg: Acq92OEbYMtbJKxJHHhsuSkyfuWkzmxda9PNA2zOuaTHsFeOwnLsID8IvIQbsQF/886
	IXCF10qtF2ypO0nyU1zjKSej2yzNFaonbsV44KDq0+GFmYviNw2uTIZWvQRIBsGbq46su33/Uy6
	RjNWIju92dJPHB6UAP1Lk0MAinkE9o63YOOJKXA6Hg27oRRD1zYPo3i770SslkfzfMJsSNS9Itz
	eWrGCp55O76UrSQZkSUtSmjfno5YAE8+14m4Tdhs4Bk1jBq02I/WZb3W2VS8PdK28hhWYwDzlkh
	gKAmGf5UDOiUw14LwT69NatMWiOvuRbJbgMvqtsSVKRlyNLrEiYMrQ17HFWfyyBh05tfrg6xW9C
	e0O4gA6zm/fLMeX9ASpFi3WgGaKdDyGGr1PqJdoSUShLRVkCgJ7+gzdWdm/QFhBiRK8tn6gXPls
	lWpa8=
X-Received: by 2002:a05:6122:510d:10b0:575:a13e:b33f with SMTP id 71dfb90a1353d-575a13eb799mr762060e0c.1.1778493492229;
        Mon, 11 May 2026 02:58:12 -0700 (PDT)
X-Received: by 2002:a05:6122:510d:10b0:575:a13e:b33f with SMTP id 71dfb90a1353d-575a13eb799mr762057e0c.1.1778493491857;
        Mon, 11 May 2026 02:58:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm468593866b.28.2026.05.11.02.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:58:11 -0700 (PDT)
Message-ID: <774aab58-0825-4acf-99db-dd88df0366a2@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:58:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YiipNxqduMB32ZjOnn8KtswIyIQxsbNx
X-Proofpoint-GUID: YiipNxqduMB32ZjOnn8KtswIyIQxsbNx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwOSBTYWx0ZWRfX4NlQEYEOXhpy
 itywyhyzai3eCgFGxdHX20Gla2RnR6iO1RhYRHsZfnLKah8WSzCv5SIEm2Z8K4xelTUYkXVl3LW
 You3dOVcXZAHS3+KC8C39ZTqaJlt87QA0DBzJH+EwAHUXnXD+bLzQWuhLy+72J/x/FQ14BGgPMp
 cv5f3ad+tZA3T+UKuy9e2GTzq7D0FXp2bM4WiKz/8iMGqTMhi+TOVnC8y2OaFcNAMbaIeqja8tp
 7HZtH3e3B5fdg5mrJ4zrLoSiy3IwIo8Qc/byhuTg3ByHJsA34wxadDhBF9v2g4eUP5y9yfgyxAf
 kIMar2cnlCKF6cd6xirTh6lsEqfKTKs/RwCE8NAwB5a9RovukWrmmut0gWTUQx5LI4s9iAjlyT1
 A17iNNhX/N0CT5edji5xlwZMeTV8Hzae6BlsYCGak4QlFdKNnO7ZLRV6vTKfSjDF748EWW06wAb
 GxmRnvZfIZEB9gb3Hnw==
X-Authority-Analysis: v=2.4 cv=SLVykuvH c=1 sm=1 tr=0 ts=6a01a835 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZkPnaNv3TD41VdVxMYYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_025814_329539_4904ECC2 
X-CRM114-Status: UNSURE (   9.97  )
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

On 5/8/26 1:40 PM, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on hamoa.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

