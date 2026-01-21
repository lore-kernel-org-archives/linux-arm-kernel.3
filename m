Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B070C44506
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 18:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNilkfoM7J+p+yzttmzKFaWCG1a6+F2xaeBA5IxOpx8=; b=Lx2slQG2UV6uX3cDGI6/8qoiO3
	a4AWqeAXoPURCkwvPFXc3lW7Yj/GYm8pQu4t2HWgAsxbOT+Kae0foarsRTzvMcO9uP0lZQX7OA4/6
	oi6mNtjNk2djIoLL/jtyIyXIyFUGX2kpCj0qX9SKYEB8ypnKntYjfPHh+X4yTPhcpbl1mpIi//p7d
	ZtxdAJmee57aQvd0LqGA6x4qnzByT9turvwnZk9uiS36dLCFnJWSuGrGN5rtPhG02f2GFaciyUWyz
	q/6FR5mbfgkykzU7Oj2qxjnXLZ94HNijCdukXOtXVBmfV5jdyRp5xgtgVxkaaq+Jgl8i/DldvJJ6F
	Pp9+vKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vid63-00000005w5i-3OtC;
	Wed, 21 Jan 2026 18:38:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vid61-00000005w5H-1WBq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 18:38:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LHkKxJ2452345;
	Wed, 21 Jan 2026 18:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zNilkfoM7J+p+yzttmzKFaWCG1a6+F2xaeBA5IxOpx8=; b=WPZakaZRs5DWDluu
	bzohTkdyjHGtyhSFVMtWH9wkO5kiJLsBiMOpQVkXTXmkZ8VIq93IL0zX0RpfZWAh
	pTf4VToic+hXi4tfzjl3FKd3BH2Bw2S/+AZc3g0sj9lT9G/qMqFEg7wUi/FWCEYR
	UUM58zsoXhsyh5OzspsL2VH8XjcfuVokQzX8cdgfyXK2LktVbuOrXtJQcKzac+uV
	hGCjzGtsNUzcHha7lhMKxq6Y/73pcBHDEC0IPNFDOK4g2jln/Oz3gAFd/B/o5eg3
	oaoCYQ2LtZRaw6bNFECWCYhpdVU7MlSwmMc3fqzP1X3Wr8YS8rFBsz+gpdxvAPkV
	TeoWDA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvhqhpup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 18:38:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 60LIcGuq015594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 18:38:16 GMT
Received: from [10.216.56.4] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 10:38:10 -0800
Message-ID: <fb56c6dc-acf0-4b35-add6-9557298570fe@quicinc.com>
Date: Thu, 22 Jan 2026 00:08:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
To: Bjorn Andersson <andersson@kernel.org>
CC: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>
References: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
 <20251222095914.1995041-2-quic_nihalkum@quicinc.com>
 <wfkjfoaqgn7lyhtiojodjcaxyzsi75zszoxpd3o47p5i6l2eb7@gxmozuc2wh47>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <wfkjfoaqgn7lyhtiojodjcaxyzsi75zszoxpd3o47p5i6l2eb7@gxmozuc2wh47>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE1NSBTYWx0ZWRfX6byNHwj/SSEP
 3YRUMT5M32FxjGzHEh+kvENcLfh2HoDr67rKflgqWws3yexxi1HaCHVthSebiHo654tZzCqmvMr
 O4AwNtM08I69W0pdu9uaYzRyX11cXZkkrnYh7Fit2Tn0mtnnChrXQBk8bP26biaiCCzIQ94Kq9T
 fTh6Lax3/ttWWdpQThXArnLiu1+Q2IVZSx8SJ6BX5cAVm7yj2i8JobhB5E+tN9VOOAjG7XR5hvx
 47I181CK499v2tWb8jkVJQ6CiVmv2Mm81wbrHNzCnPHF4ePBIVKhPTyUFu3n2nXrsajiLjUYC1T
 4P7Dk4TVOfgYd2Ub8+HDX9aMiaVEmeyyUFwBtL2R1ZQ1t4UYuamA71g3b1WqartURjadw6ZbFtr
 9BUqU1kXgt/1RI8qeWvNyFkQsPW6Ivux3eEpgxFRDO2J57xjtPJb6qAKIEFjkG02QsbWBhWtneF
 vo2FFw0xJrppUY4VsJA==
X-Authority-Analysis: v=2.4 cv=S5bUAYsP c=1 sm=1 tr=0 ts=69711d19 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EJUgQ-LtjB6CFHlFTh8A:9 a=QEXdDO2ut3YA:10
 a=Qzt0FRFQUfIA:10
X-Proofpoint-ORIG-GUID: zHPcGiwGKDoB8uZr95d2wKFmQibmxXs0
X-Proofpoint-GUID: zHPcGiwGKDoB8uZr95d2wKFmQibmxXs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_103825_537988_8B543AAC 
X-CRM114-Status: UNSURE (   9.59  )
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



On 21-01-2026 19:30, Bjorn Andersson wrote:
> Maybe I'm not seeing it, but you didn't include either i2c maintainers
> or the linux-i2c mailing list, so this is unlikely to move anywhere.
> 
> Please send this out again with the recipients that get_maintainers tell
> you do include. (and skip the ones that aren't relevant).
Apologies, and thanks for pointing this out.
Posted v9, rebased on tip, with the I2C maintainers and the linux-i2c mailing list included.
-- 
Regards,
Nihal Kumar Gupta


