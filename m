Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15F5D60CE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 22:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcH3+IZuZK1qnngzkreQNJY7FjEkRWjei4AjNFCS8Jo=; b=xlghvj64o3zc7EQUQRoCaefsph
	TeOmUYi9hfvFmbMQPrRsRDI6kUJtZqEs619+GYF3Dy1EsUTOA0Tm7TUoyxjExRF8800VS3s5oZIc/
	8StkpNKN0DnA1Dt4HPpiq/WdLx5GOFA2k37jg31L0oxIRO9R/0Xfq10i7rCNEWKR3YpZ8Xg32oQ0X
	bsc50vXz6CkeuJnVV5amVSicYXEsCBYkKGQpqHEChMWUrgMXJDkVZTreyBBmhYi0wr82YOY9A05SH
	U/R8siBCPh8DAnJPWLIko9i5TbVyVM7eWiOInVgY2pQfA+qChRhcfl9S9761NkL3QDwMsUm8sE9ZH
	EZNeK1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD9zW-0000000AjcU-39ad;
	Mon, 18 Nov 2024 22:13:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD9yZ-0000000AjVi-3RFA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 22:12:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGm0l005668;
	Mon, 18 Nov 2024 22:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kcH3+IZuZK1qnngzkreQNJY7FjEkRWjei4AjNFCS8Jo=; b=UrUerMNSZUNJN22F
	OGTIt9T+199Vab3qGGz8wBxz7pcd8UlNfyegfBqfJxoyhtC1pTrwQXvpQe4GpTSY
	lW/7AoDvaCVeRidT2bGrv1gIpSxsvjeZY73Aiaz+4umY8H7MHaCb4CtbE5DPaeNT
	R7YZPxRarq+l4ycC+vokQVjCWSULivIS2ttsL7lMLtPvXtUC4DCmHe0cB3Gz9VQM
	Su3elaj0aVT82w5zM75D82NFgQtcmRRlEi0Yj+XLvzAe7XZf5dwqxng0dYMyVVn3
	qCQO+tz2qmBUQkyerI1uV0dj+YVNclQCNkzAJKLUNWbDlK9dW98ddPDIXONSPVxD
	0q8CEQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y8grbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 22:11:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AIMBj1K029882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 22:11:46 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 14:08:00 -0800
Message-ID: <f919974e-b98b-48a5-88a4-dd42798542a5@quicinc.com>
Date: Mon, 18 Nov 2024 14:08:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: qcom: Document sm8750 SoC and
 boards
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Arnd
 Bergmann" <arnd@arndb.de>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
	<nfraprado@collabora.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241112004936.2810509-1-quic_molvera@quicinc.com>
 <20241112004936.2810509-2-quic_molvera@quicinc.com>
 <6xz7tuzxxkda4h5se4wep4krja2pq63lyq2uh6f5m2ywtnumgc@dctwjxngrkzp>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <6xz7tuzxxkda4h5se4wep4krja2pq63lyq2uh6f5m2ywtnumgc@dctwjxngrkzp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FEhTYpTw9KXL2nRnUkpigRGN85lwik7-
X-Proofpoint-GUID: FEhTYpTw9KXL2nRnUkpigRGN85lwik7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_141207_871660_3DF79FB6 
X-CRM114-Status: GOOD (  14.80  )
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



On 11/15/2024 6:49 AM, Dmitry Baryshkov wrote:
> On Mon, Nov 11, 2024 at 04:49:31PM -0800, Melody Olvera wrote:
>> Document the SM8750 SoC binding and the boards which use it.
> Nit: In subject you have 'sm8750'. Please use single style for all SoC
> names (I think it's preferred to use uppercase).

Sure thing. Will use upper case.

Thanks,
Melody

>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 7c8c3a97506a..f4e8f8821405 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -86,6 +86,7 @@ description: |
>>           sm8450
>>           sm8550
>>           sm8650
>> +        sm8750
>>           x1e80100
>>   
>>     There are many devices in the list below that run the standard ChromeOS
>> @@ -1077,6 +1078,12 @@ properties:
>>                 - qcom,sm8650-qrd
>>             - const: qcom,sm8650
>>   
>> +      - items:
>> +          - enum:
>> +              - qcom,sm8750-mtp
>> +              - qcom,sm8750-qrd
>> +          - const: qcom,sm8750
>> +
>>         - items:
>>             - enum:
>>                 - qcom,x1e001de-devkit
>> -- 
>> 2.46.1
>>


