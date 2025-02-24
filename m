Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353EBC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6+xl7S1QnQ4/NXjxzIqhVRz4yodGyeJpNrUChW2/P0=; b=CYALtWLmrfItZvDog/glOouCw9
	raAapYvCTWRg9kFyteeWgO1kdZfp5IKs9IB9vsYYTJbEZ59Axlcf25REf3KwlR55p4GPyJOMyBP1E
	IKyQ1l2rd/Fg2Jz693N7GvY7y9jqH6XVYyCjg06XkxHxwk4OK4Plw5Du3vXCvCv3RGHN1JmM9KUbD
	cPrryDqTiSBjSkogN3QlPAUWZq4pVUZ6cpBmicZ4j8hwroYvueUnnksFVi4HeBMPPX870ZEAYOoIW
	cmeVlOo7/mJf5CYiStp+LYtS6kYFyjlUmxtX1NkgnYbhv0q+qux5OkQObWqVxiixFgSakJN0O640N
	s9cwTV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVHF-0000000D1aq-1Ob1;
	Mon, 24 Feb 2025 10:01:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVAf-0000000CzsK-1is4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 09:54:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O9N6Js007249;
	Mon, 24 Feb 2025 09:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m6+xl7S1QnQ4/NXjxzIqhVRz4yodGyeJpNrUChW2/P0=; b=Cz4ZzWXGO6rpRiEe
	7atB8K8CIWSy24bxFVaLayJ69T0EjUyxYvZpnoxf0kYQyjGvvSJ+DRsd1u2PPZVr
	tCilzMJ2Dm4LLbzic1sTNhi63cliv49v8cgrnncdHh01vITy5XZny1cAnvxrxyF/
	YliTfrg+S/FwYEfm10r9ILLoN87t1Sp7CgIjs+NMb92/GTCQPyI6AH/TH1IqRoRx
	gzNQ1Mo456diNl1hlc5lh/MDqXOHrpS7A1U5ituoPDcMDw+PyZt6AOhoC/wd1FLj
	hJXE5r0aC/LU4BqzifYSBER0T+FA6skrJw6mIdRXnVSdqJy7XgA3ecRFWVRHIH/Q
	1Hhlvg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5k64kpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:54:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O9sMVH003185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:54:22 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Feb
 2025 01:54:13 -0800
Message-ID: <03157f06-8e80-470c-bdee-ffbb31627a9c@quicinc.com>
Date: Mon, 24 Feb 2025 15:24:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <p.zabel@pengutronix.de>,
        <richardcochran@gmail.com>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <biju.das.jz@bp.renesas.com>, <elinor.montmasson@savoirfairelinux.com>,
        <ross.burton@arm.com>, <javier.carrasco@wolfvision.net>,
        <quic_anusha@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20250221101426.776377-1-quic_mmanikan@quicinc.com>
 <20250221101426.776377-4-quic_mmanikan@quicinc.com>
 <8936f8a7-5bc0-417b-a719-806f1ce0904b@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <8936f8a7-5bc0-417b-a719-806f1ce0904b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: d1Q0_KyU36FTHuO0yJLUPVpNbMt8b9Fg
X-Proofpoint-GUID: d1Q0_KyU36FTHuO0yJLUPVpNbMt8b9Fg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_04,2025-02-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=935 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_015441_570992_7AF9F02C 
X-CRM114-Status: GOOD (  13.31  )
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



On 2/21/2025 5:19 PM, Konrad Dybcio wrote:
> On 21.02.2025 11:14 AM, Manikanta Mylavarapu wrote:
>> From: Devi Priya <quic_devipriy@quicinc.com>
>>
>> Add NSSCC clock and reset definitions for ipq9574.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
> 
> [...]
> 
>> +  - |
>> +    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
>> +    #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
>> +    clock-controller@39b00000 {
>> +      compatible = "qcom,ipq9574-nsscc";
>> +      reg = <0x39b00000 0x80000>;
>> +      clocks = <&xo_board_clk>,
>> +               <&cmn_pll NSS_1200MHZ_CLK>,
>> +               <&cmn_pll PPE_353MHZ_CLK>,
>> +               <&gcc GPLL0_OUT_AUX>,
>> +               <&uniphy 0>,
>> +               <&uniphy 1>,
>> +               <&uniphy 2>,
>> +               <&uniphy 3>,
>> +               <&uniphy 4>,
>> +               <&uniphy 5>,
>> +               <&gcc GCC_NSSCC_CLK>;
>> +      clock-names = "xo",
>> +                    "nss_1200",
>> +                    "ppe_353",
>> +                    "gpll0_out",
>> +                    "uniphy0_rx",
>> +                    "uniphy0_tx",
>> +                    "uniphy1_rx",
>> +                    "uniphy1_tx",
>> +                    "uniphy2_rx",
>> +                    "uniphy2_tx",
>> +                    "nsscc";
> 
> I see that the input clock is named rather non-descriptively, but maybe
> we should call it something like "bus" so that it has more meaning to
> the reader

Hi Konrad,

Thank you for reviewing the patch.
I will rename the 'nsscc' clock to 'bus' in the next version.

Thanks & Regards,
Manikanta.


