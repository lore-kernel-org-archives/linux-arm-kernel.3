Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FA5C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ngufI78IFU7yCiFrUdhla7M+4msjXhssA/3I0fUkc8=; b=d6S485gADO4c/4+B342x95JgbO
	FxatzsxNbwycVO3+qPwXzhfRbNqHMNaf2N6VOGMn70Xx2zRm4Pe5hs/vEZUVfnFbUfdj9Qo1uUOkv
	V6BMczf4Ni3bZRXo7BUkFTVg5F981KlhP7968CFyki9DQVbHVMpx4g2s7EQKVTRdT0kHTPdQieKic
	MYsC49Jb3MpetQUzA92Pgb5KjU3Ta0xDdAZuU6tR8drV6mt1mRwKgtCJJJDEPtU3l1erOMKXNVPm9
	Q7MoNmJbJBdF1m7tTYyCFwkgbNtvEWBgTW04ytXzcjmKtMmJFaPDziv/g4qQlVmd1O24zNRCveBF3
	TrVTe3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twc1J-00000002QF1-169W;
	Mon, 24 Mar 2025 07:14:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbwt-00000002POk-2isg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:10:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6bxXH000457;
	Mon, 24 Mar 2025 07:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ngufI78IFU7yCiFrUdhla7M+4msjXhssA/3I0fUkc8=; b=RZCpy7icQiOHzGd6
	Ibaq8xuuzPN6Fs7QreXFLZ4h0gzrwj57c8ArPBxXq4cjLVwz5Z4a36W38LuiK0B0
	WrVqqoJxXyIR3ZcYlP28bWbPe89kxvSxdBaj8IosA5g1hMFbGp9d3F9qYMScd5mw
	gJrTydS3ijuzuYGI3LaiuNoOPvJBJWZBJFXkMYDuBXOerewvTJyEhsC8mWhsdnRV
	pWyPjhmfFn/A99fKyjEITU+pJK6wUPoYfvgfWHjr2ChILiS1qGa2Pq2cTgAJevfh
	W8TqVfBblFeujjR5VZcCKGoLstsuR4PCwO3FMq+te+WLNUXv/ETSKc1SXvsP29zA
	0g+Jag==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9wbcka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:10:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O7A16L028038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:10:01 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 00:09:57 -0700
Message-ID: <9ea8fe39-b818-403b-bd69-815e58eb2949@quicinc.com>
Date: Mon, 24 Mar 2025 15:09:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: defconfig: enable PCI Power Control for
 PCIe3
To: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <quic_qianyu@quicinc.com>, <sfr@canb.auug.org.au>,
        <linux-arm-kernel@lists.infradead.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <20250320055502.274849-2-quic_wenbyao@quicinc.com>
 <694b6638-92b2-4ac0-a175-bd29aea6cba9@kernel.org>
 <CAMRc=MfZrRp=VuEOLuMY_04JdyRrD+joGL56LwRFQ-+D-8Z_6w@mail.gmail.com>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <CAMRc=MfZrRp=VuEOLuMY_04JdyRrD+joGL56LwRFQ-+D-8Z_6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W5rVTvp_6yXf7rqNN-IOLx3unxZyMuqQ
X-Proofpoint-ORIG-GUID: W5rVTvp_6yXf7rqNN-IOLx3unxZyMuqQ
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e1054b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=5vY_lBfp_abUPGzNiLoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=892
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_001015_813201_F15B2FF8 
X-CRM114-Status: GOOD (  16.37  )
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

On 3/21/2025 5:43 PM, Bartosz Golaszewski wrote:
> On Fri, Mar 21, 2025 at 8:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 20/03/2025 06:55, Wenbin Yao wrote:
>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>
>>> Enable the pwrctrl driver, which is utilized to manage the power supplies
>>> of the devices connected to the PCI slots. This ensures that the voltage
>>> rails of the x8 PCI slots on the X1E80100 - QCP can be correctly turned
>>> on/off if they are described under PCIe port device tree node.
>>>
>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>> ---
>>>   arch/arm64/configs/defconfig | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index 85ec2fba1..de86d1121 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>>>   CONFIG_PCI_ENDPOINT=y
>>>   CONFIG_PCI_ENDPOINT_CONFIGFS=y
>>>   CONFIG_PCI_EPF_TEST=m
>>> +CONFIG_PCI_PWRCTL_SLOT=y
>> Bartosz,
>>
>> Wasn't the intention to select it the same way as PCI_PWRCTL_PWRSEQ is
>> selected?
>>
>> Best regards,
>> Krzysztof
>>
> For sure. I would expect there to be something like:
>
> select PCI_PWRCTL_SLOT if ARCH_QCOM
>
> in Kconfig and nothing in defconfig.
>
> Bartosz

IIUC, pci slot power driver is a common driver that could be used by all DT
based platform.

-- 
With best wishes
Wenbin


