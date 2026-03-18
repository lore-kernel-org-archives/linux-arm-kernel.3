Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3443FCD0A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 04:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6xrBMFAJXheTgn6LoOrZwCJL5Zk1iRQuzTFNEhCS0A=; b=vQuujkas6RCKYPB0+hax0Tmczh
	PENqEcTm8p23zDLPMuq3KEC/pSANUAW8yAQkVL4PclPAfzLQA3/gM8DUPHfafsnHmQ4YnGBFJLutM
	AT1OLjPzlolu5BZ7PvgsUyFt+JwY70H1OQSPpqppbncUqkI0CIqDlHuopsKxN7UohtUZ6+hCNm2/c
	IcslazEJb/72M6++25OC7k31CX9LtBYVNYokTM8IMKAZxbn/qmBMq1OKvKIc+DgiiPeS3tpaX02A5
	S/rftJQMiSN1G42QIpTzhhz9nhKOf6Q/dNU187JfbUhIj1vNIML6bf1Yevij49OyBhBKnAKl8lb4S
	eZ/xzW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2iCF-00000007kPm-2oMl;
	Wed, 18 Mar 2026 04:07:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2iCD-00000007kPR-1j58
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 04:07:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2xF8Y1145420
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6xrBMFAJXheTgn6LoOrZwCJL5Zk1iRQuzTFNEhCS0A=; b=FpkaCPTL7VmXJRfg
	22ZFXlq+veGuJU3gtf4FxKCG+OAIeYP4i1Ezhic7mlqA6gqnI2pg6UlVqenxCVz6
	mGoVJstu7Q2Q6fD1PcFGlvfQ4xKCxwOjLa04k+EoX+3WgyIqqDZEP0YL8KMu+2Ry
	E3RtY3uckWZzHFA+ardj1ci/q7iAbhlcwxB228jBwmELmmJKq90b2iw2igbVa80F
	zMrOXLov6aMt2q6zPMSvz4CHx5Tcgar6cWzPQ9O2n4wxWGm+/DKmZ0kCqeZWjwsN
	R5bLzHZQ5apD2LnPXwCTlYVKEEdOCFHt4kIN/kGqUinxb/F9qKoHT3KkmNlbeCz1
	HFamnw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3ta1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:07:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c74217894d9so226097a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 21:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806868; x=1774411668; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6xrBMFAJXheTgn6LoOrZwCJL5Zk1iRQuzTFNEhCS0A=;
        b=RkEDRzJ2Meu5jn3zGjVr95Qg+Dw7py7GQrK5QJfLGvDkYBq74y5ww3Ti7wzB/onu/E
         DBwRMVuDGNyflIFyAg1zhH6nF2zLZrKutGv106SKzuGHJhCBOXxEZTRUndh2FEYyB4yH
         s6huEwu0a4ylxjHYqe5afYKQ2BUSTGltJ93OjXJYSOxfcg58D7NY1dlhS2k0G30sZuvU
         olC0eiYxgsWvopOu4VtuSCYKD3l+YJdccWUwG0MFDMfj2dMm+WIKXPNnJjqDhejZzBAk
         BubpWlna9iVz8RjKawsll7Tzp0tGTPXTUENQBzoPdBKHWiftGCQ1/3he/BvI5emZboce
         Er4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806868; x=1774411668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6xrBMFAJXheTgn6LoOrZwCJL5Zk1iRQuzTFNEhCS0A=;
        b=XSdvo/sfFOvHmSW87MhDVwLz+xmWuHIOv8rhrPgBK02vpTkIA/mzqdHlY8vevYOQzF
         7a1m3HIg5jfDo6yQtehRAR9qqIuhHURIF4ZjHcySIYlODwxlGAxAGsMO273uV23QxNzB
         Hz7X82Thd/gZEyw/nqesoq8VfszS7P331Et71JYJTpos3cMDiy8mWSrK4+Z22OxhYUYR
         qtgXsjE1J8Qp3mLIsa38N122hBMNmoxag7PmKhQTxLFa/1yQY9eUA6qUw+fkigBJp315
         wSY3OxwSlTgxBYUBH+pSWTs/IyV6hu4Mtia+MiGYAtDaOlbWD/vV6AJXMb83XBo9lie6
         GvaA==
X-Forwarded-Encrypted: i=1; AJvYcCVkKwA/tFNyN0PzzWOrrbqsr2C9kQTSf4Ir9QqPC3bGFtRZVLpEPqU2fMDc0QEBXIyZmOwth6wG+ow/4KQRMw84@lists.infradead.org
X-Gm-Message-State: AOJu0YzGv2AT1uuyH8SDn1LTS7nNtj9/8hZYqtAPfVy9kBhhmyoKe2fP
	1YA8/JgeQYC2QexNQBVhanQY8C/7r+rGnQS2ZMBEQmnMj2kIeq6RXCFdHAURh2mYxYqhPu9k0yK
	kZtG2a+tV0QrtVXi6HMvI2p0sfjvaFNpd8eCg69+jThkC5m+In+qAhfEFarDJmKVQeG+aZ+6DOZ
	ZuUg==
X-Gm-Gg: ATEYQzzezP9fn6yuoSvaock5U8S+YeoFyBA6iXXXyEBj7ns34oUy5wJ3H7IYBpHiDox
	hceQXi090C8jPD8U7Z4nS3sJFk7S2mZ3292YWZjrA1AE/RP/Ed+iTigpJjNNGZKoJj4F9lEEG6U
	rh+SbBDw0AGyQ6XprwDW9r2IptZzZ3DUhcviqF91gQK8L98hxyYC49bvG6slMD+PgGNaC8LhnmE
	jNOSv6wICnvCGxM0jYkpj0Ec5A2suNyP4tJ8pcQPnkVujs0t+qYf0zil8qOmu9yeaF5RRS2vnR4
	B9Yq7czi/Z1qgw66RyzTSXnqVrrLV7myka2JrQuclnBSgM7mT3FVwCPXiSmEgs/8AJo5jpSulCO
	8S58OXuuNi/7ATwVVU7Dmyq0emBCHIvfK8id43vFDAzSv7cN8HA==
X-Received: by 2002:a05:6a00:915a:b0:82a:6b97:34a7 with SMTP id d2e1a72fcca58-82a6b9742e0mr1450313b3a.39.1773806868122;
        Tue, 17 Mar 2026 21:07:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:915a:b0:82a:6b97:34a7 with SMTP id d2e1a72fcca58-82a6b9742e0mr1450294b3a.39.1773806867620;
        Tue, 17 Mar 2026 21:07:47 -0700 (PDT)
Received: from [10.217.217.233] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bdd5569sm952839b3a.47.2026.03.17.21.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 21:07:47 -0700 (PDT)
Message-ID: <caabd5da-166e-4826-86b3-a1d80fe193d4@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 09:37:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: defconfig: Enable clock controllers on
 Qualcomm Eliza SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-7-4696eeda8cfb@oss.qualcomm.com>
 <1b28cd99-3a6c-442f-9668-23aca9b1fea8@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <1b28cd99-3a6c-442f-9668-23aca9b1fea8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba2514 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OaLB_a5L4ud7_QXzgQYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 0ATY8jCklSb9dNpENkAVdOGMCQr0WPbo
X-Proofpoint-ORIG-GUID: 0ATY8jCklSb9dNpENkAVdOGMCQr0WPbo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfX1hBfAFbM6xFc
 nTWusfJSYd8RPGg+GU712VfereouxJSzWGnyH9UdsFwsWjbE4MeDLAiyFM6MzHZv7vbl4dDf/vm
 4Y+F+MGIaoQ6t+/eovClbGQucB2AUmlORP822AeCrq6YEdICD2gTR78QRLAKUzPCZAXOpTOaRe9
 4DORMWt063RN6m2A4gHeAi3osSCXizDuH2Bc+eJQuCa+yHelPpUxJVezZd8iF1SEh1HNj+7cwP7
 bzQrSlHlW+7eBuOQb+CHtGLyX3QtS7TgdI/sfKCQMuiSCxgoJ5S0SAS/W6EWHAa7IxvxW/2tkeb
 0+JGcQXLi75RwMwpyZrIRIZuFy7o5UmKUJo2DEnE0dij16wM8Vr/bQiFsV7Cbbd2Jo+xEHfOl5i
 v3NwSEyS4wxE/p0rooBoXt4yE0uzwdzi9tGbExkQN0QNMiUcVHkSIwIqsTvDZx4Gm0ACOQO7FOi
 itT+7YHB7/3xoevIdHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_210749_477980_045ED162 
X-CRM114-Status: GOOD (  16.72  )
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



On 3/17/2026 10:56 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 18:14, Taniya Das wrote:
>> Enable the video, camera and gpu clock controllers for their respective
>> functionalities on the Qualcomm Eliza boards.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 18881bd239f9c53e74ad5caa492bace394e4fde7..dd45d275d30a32fd567432b5c324896518aa4ad8 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1458,6 +1458,11 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
>>  CONFIG_COMMON_CLK_MT8192_VDECSYS=y
>>  CONFIG_COMMON_CLK_MT8192_VENCSYS=y
>>  CONFIG_COMMON_CLK_QCOM=y
>> +CONFIG_CLK_ELIZA_CAMCC=m
>> +CONFIG_CLK_ELIZA_GCC=y
>> +CONFIG_CLK_ELIZA_GPUCC=m
>> +CONFIG_CLK_ELIZA_TCSRCC=m
> I told you already twice, don't send duplicated patches. Once when you
> sent sm8750 videocc, even though it was all ready and posted. Second
> today when you completely ignored one month of development of Eliza in
> Qualcomm tree (so your tree).
> 

The intention was never to enable TSCRCC, it was more of other Clock
controllers. It will be dropped in the next patch.

> Now this. You keep sending patches interfering with work which was
> already posted.
> 
> NAK
> 
> https://lore.kernel.org/all/20260316-arm64-defconfig-enable-eliza-basic-providers-v1-1-7ae581670aa8@oss.qualcomm.com/
> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das


