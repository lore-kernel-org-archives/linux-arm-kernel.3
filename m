Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C8EC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCoEPgVWWmROpC/8ZHSi7yFayVm0nvDeONlNkk5TNQo=; b=dB3S/gFFrgeSCkq7b2JCzxCT51
	461YV23ehKmNgw4Ff+MbCkGLUzZprA2Tzgu1DuPhWK59JrkEreGUfngOqH9pi19obGFm795r3jJnC
	yI5Z7hW1N4CFaat203isJEg6FcRPkZaJBJ5gscfGXtUThHlCrDchQSkE77xJJG9NbYjdlszDnmcQk
	aIm9/zp9/V+rPe96PADBFt8M+4j1WZzGDFDHEY8EP8/I1z03C7DJTXWSdIL0xnMHxjtY2VZLSB6m6
	4PR5A9OAvDjw07WCdY8Rb7Bv1TCbZHWrDMmXUjJFWoyHFWj/Tr7iTr0i2ymi2ZnJoiGfbVtUF5O14
	H/A+WCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twc6R-00000002Qxx-2cLr;
	Mon, 24 Mar 2025 07:20:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbyv-00000002PmB-1ofC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:12:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6bw5C023569;
	Mon, 24 Mar 2025 07:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCoEPgVWWmROpC/8ZHSi7yFayVm0nvDeONlNkk5TNQo=; b=YMRaR+ENlVsVl2FG
	xx758fy9wFrMbfsArkmmyR48jbQwlUYHH0/ju1KaWz9vi3H3qEvbGjVjV1mUyXfs
	pjPRuL/MrnniQRzsr7/GbCnLoEKUSbn2TGNHV0CGhyLrT1mj47gCh7sOc4kQ7s1u
	owSXxFkXILmAxYgRmOBbLAn6gZzpNu3CarK5Er3p87WQmbdT8jafOs5pUNPpLWIb
	RMPEwKRg9i2CPVoaRyC43N3labbxwqmA7nS3llvGvXUO1eUnIUekLzmrdhddC8JS
	z4q3wfDbMI89CMqQxpqN+9IGOOFIvU9WbAnJO38bocXS05wyNEnzBQq4d6UECxvU
	toHN9A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hnk8kcut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:12:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O7C5un000913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:12:05 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 00:12:01 -0700
Message-ID: <0df07b23-4821-4b7d-85d8-dfaa7516fbc4@quicinc.com>
Date: Mon, 24 Mar 2025 15:11:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <quic_qianyu@quicinc.com>, <sfr@canb.auug.org.au>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <20250320055502.274849-3-quic_wenbyao@quicinc.com>
 <hgvfxxjvquh3tn543ae44o3lie3pwld5snbewy2lxcrtgd4raa@eyfm57omt3ge>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <hgvfxxjvquh3tn543ae44o3lie3pwld5snbewy2lxcrtgd4raa@eyfm57omt3ge>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3koRAH8YsByUL07B3Jlo9VpzD65cjxU7
X-Authority-Analysis: v=2.4 cv=KMlaDEFo c=1 sm=1 tr=0 ts=67e105c6 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Upqwyp-cVDBhw83K_eoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3koRAH8YsByUL07B3Jlo9VpzD65cjxU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_001221_601914_E330C03B 
X-CRM114-Status: GOOD (  13.40  )
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

On 3/22/2025 1:19 AM, Dmitry Baryshkov wrote:
> On Thu, Mar 20, 2025 at 01:55:01PM +0800, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
>> voltage rails can be described under this node in the board's dts.
>>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> index 46b79fce9..32e8d400a 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> @@ -3287,6 +3287,16 @@ opp-128000000 {
>>   					opp-peak-kBps = <15753000 1>;
>>   				};
>>   			};
>> +			pcie3port: pcie@0 {
> Empty line between nodes, please.

Will fix in the next version.

>
>> +				device_type = "pci";
>> +				compatible = "pciclass,0604";
>> +				reg = <0x0 0x0 0x0 0x0 0x0>;
>> +				bus-range = <0x01 0xff>;
>> +
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				ranges;
>> +			};
>>   		};
>>   
>>   		pcie3_phy: phy@1be0000 {
>> -- 
>> 2.34.1
>>
-- 
With best wishes
Wenbin


