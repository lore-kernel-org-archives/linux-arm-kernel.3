Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDFFC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoARzbA2DxUDKFyYQNcEmf1O1r1hsrMQdeSsxiUJ8+Y=; b=oajs9ahkybuFOFQaWD4Nwi9xNf
	g5Y6xVf8vb17RKhjg1/toV/OL4y8puEtLLe/eIcY30q/nfJ7MRUKRK2FbEhewaOV9gcdNq8mgNyHl
	bvH5Nr3ELz0LD3yP6Zn/RP+kjob3UzZNkWhNapKC+nv3FmTcdakUMikbz2WP6FsmMSrnzOpqycIuO
	gUkLPYs4E0cHOc0DZPrQbCW7fayP2g4ORveeuA6NX/1AgEQ2Hmt6LMm/YrH77+W47RYNH9g736vJd
	vm3Ls1J1MwoJ4zyPtJh8U6ToywYDb98RPvakDCVT14vyeeXTg1cpqH0pPRkGEnEnuu3YcgMb+i7v6
	KGQ0o6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbVn-00000005c98-0To9;
	Tue, 01 Jul 2025 13:59:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaDy-00000005LOi-3x0t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:36:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619q5tJ032421;
	Tue, 1 Jul 2025 12:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoARzbA2DxUDKFyYQNcEmf1O1r1hsrMQdeSsxiUJ8+Y=; b=Tivybn3qFcPRcSpl
	amxACRcHpjj7qOoVJ1hQK7fK/Ag603Q4V3B3xI61jYBSZf01+PzDlMVKQWvVJppJ
	jMLTGK/WAGz4vQeuzEH/LNrEPYGJPUn6vELGquvpwJf/BdBOW80i/x0yDf/YMK+E
	xt/8Xjcx5XxgCd2vjrDYJSZdw+JreYZXMX7LGX8r6EjPGWAWMV3poEtTASQRySyB
	99lT1+1oKnvBycvrJkjzamgog56NUCXCDEM+BCCWWNvjgy9Dwi7eUoabmyAjr8i0
	ukDwgcbwTqrM0FE7CtNC0b1l/s0d968JmmTv9G4hMwz3HPLdKW6aAxAUIHQH37Wu
	xheuZQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k8ykb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 12:36:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561CaR4m032439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 12:36:27 GMT
Received: from [10.235.9.75] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Jul
 2025 05:36:21 -0700
Message-ID: <b1d88ceb-9021-4233-abaa-7d742e7a8f58@quicinc.com>
Date: Tue, 1 Jul 2025 20:36:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: ipq5424: Add NSS clock
 controller node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov
	<djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran
	<richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao
	<quic_anusha@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
 <20250627-qcom_ipq5424_nsscc-v2-7-8d392f65102a@quicinc.com>
 <cd6f018d-5653-47d8-abd2-a13f780eb38f@oss.qualcomm.com>
 <db1d07f4-f87d-403a-9ab3-bf8e5b9465b3@quicinc.com>
 <a873f197-1ad6-4a7a-ba66-5fef10f32c57@oss.qualcomm.com>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <a873f197-1ad6-4a7a-ba66-5fef10f32c57@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6863d64b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=wZv0aL5qe_EQj9OG14cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3OCBTYWx0ZWRfXxZa597Slz5L9
 AmdpGrCIOpOtlppRjkZRcFzAdwk3GYMOh5n5ejywGCXzNDOqiWc4XSTbX2KSfeEC+cJserz+OOG
 xE/4H9i4Yu7N68/WGQq+K9L97KsygEckzeREJUoLwTbJV7dDh8z4BoEeukYw7YU4TmfY1AXEp3l
 gM5rKuubfnO8fT8FBvyIU34pLpfX9rabQQIEVcDzTJiWpfU+ORqcmUej6dHME+lDCHaS8QtoKsw
 PiNew8V/KcczMterynlIh+JUy48cdv/TJwCd5oCIABZU/NZ6W3nf639+Tw6e3j9jqS4J+b98Qwr
 tEiuv4HZQOC/PyYIwY+GxHWXje8MkkvGmvOzrWDThI2oSmprzlhacNFN8f5wGjmR7DvOYasdD7O
 fDToPB8HvUM1sLnY1vfSr3tAJQ1E81Tjy3Sb8KTL/DSXYvp1+n+AvpdKy30+eSvVZh0pcNk8
X-Proofpoint-ORIG-GUID: n4wJd_yJgHq0Rsmgt5mIYaEvtlb0yQJq
X-Proofpoint-GUID: n4wJd_yJgHq0Rsmgt5mIYaEvtlb0yQJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_053634_986362_902EF4AB 
X-CRM114-Status: GOOD (  16.78  )
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



On 7/1/2025 8:10 PM, Konrad Dybcio wrote:
> 
> 
> On 01-Jul-25 14:08, Luo Jie wrote:
>>
>>
>> On 6/28/2025 12:27 AM, Konrad Dybcio wrote:
>>> On 6/27/25 2:09 PM, Luo Jie wrote:
>>>> NSS clock controller provides the clocks and resets to the networking
>>>> hardware blocks on the IPQ5424, such as PPE (Packet Process Engine) and
>>>> UNIPHY (PCS) blocks.
>>>>
>>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/ipq5424.dtsi | 30 ++++++++++++++++++++++++++++++
>>>>    1 file changed, 30 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>>> index 2eea8a078595..eb4aa778269c 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>>> @@ -730,6 +730,36 @@ frame@f42d000 {
>>>>                };
>>>>            };
>>>>    +        clock-controller@39b00000 {
>>>> +            compatible = "qcom,ipq5424-nsscc";
>>>> +            reg = <0 0x39b00000 0 0x800>;
>>>
>>> size = 0x100_000
>>>
>>> with that:
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Konrad
>>
>> I initially thought that a block size of 0x800 would be sufficient, as
>> it covers the maximum address range needed for the clock configurations.
>> However, the NSS clock controller block actually occupies an address
>> range of 0x80000. I will update this to 0x80000 in the next version.
>> Thank you for your feedback.
> 
> 0x80_000 excludes the wrapper region. Please mark it as the entire
> 0x100_000 that it occupies, no matter if there's anything in there
> 
> Konrad

I will update the register region to use the full 0x100_000 range to
cover the entire area, including the wrapper region, as suggested,
thanks.


