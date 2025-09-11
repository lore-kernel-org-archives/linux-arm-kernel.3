Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02FBCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3jPGouR0+yQHCgvvvSgKQSzVqyFCvemgzbRuRdMNJ0=; b=jwf/YPg0O71Nb7a8NOjJVWoRv5
	nANIfhuC8Ze8v/7KJ8fZWPIry0GLHnQw8XEB9CjN37A2jgLyCWChGOgqpZpTv+5XL1PApYBdYiVB8
	legjV6+9xclYEpzoCWKazJyeamG7SwrNFJUgaSvWauv+T52D1zgli06ChrIugydfRqZzl80P3LaFD
	7d1Gkx6H36SG33gOIom61jdkWyL0GhjJuDtQc5HekeJQwf3UHTffNimSrHifUBgqPOZV6m5e7+gMz
	6g/tLBEfhfk9m7jrtL4H++oxuAUzYR41IAa/UTiKEdcxwjjWoj90awQCaxRsEwo6AGjz9jWHjBnRg
	KxVdbxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhZ8-00000003J8W-3Rvr;
	Thu, 11 Sep 2025 13:42:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhZ6-00000003J7x-1MJA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:42:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBvgn0015855;
	Thu, 11 Sep 2025 13:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3jPGouR0+yQHCgvvvSgKQSzVqyFCvemgzbRuRdMNJ0=; b=GQ44euK92AjhEOSF
	FPHEaOnkRxTh5ztWg12N3PKdA1WbqAdJqCOnxQlaYTb2mjw94lmX4dTb6m48zM8K
	hKeR3JEES5FtDKN973itgUdaj/ywAe4noxuwUZti2axpSa++Zpk9cEQPqEQaKVsh
	1Py7XZY8AIWHNanQacNalYEAVy7uETieSUa/w0dixTX5QM5LnL4TQRUI0qS/ULLV
	TsywEnQS4TCE2MLIQug5fEwArASL5bPfe2VpOBw1LZ2xwWeGX9jjsXliY7sVC/Xo
	AKEDxDdaWdeExdsFmOc6T9+Em74E9jDUZ1JP1Q3IoT4tPMWtrgHn2tGwVc7J/mHr
	3Mx35Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m7qdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 13:42:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58BDgADM012972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 13:42:10 GMT
Received: from [10.204.66.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 11 Sep
 2025 06:42:04 -0700
Message-ID: <ba4b1276-90cc-4cff-b80b-d4d096fc7bc2@quicinc.com>
Date: Thu, 11 Sep 2025 19:11:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nihal Kumar Gupta
	<quic_nihalkum@quicinc.com>
CC: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
 <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
 <3d26b554-727a-44cb-a1a9-56f49775ba3a@quicinc.com>
 <j475dpcflsibhrim44wjmtbfcfht5jzvptlzrj354oyjee5mit@wmfc6zmrkbfs>
 <0ca4f6bb-b2a2-4f98-a494-bb0507bafcd5@quicinc.com>
 <gd7allvjkgbmqgc6pazq5o5u62tdkrogpf2r43vfkqfsptzybk@66i2def6aumf>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <gd7allvjkgbmqgc6pazq5o5u62tdkrogpf2r43vfkqfsptzybk@66i2def6aumf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX2Zgis9YBTTFt
 K1t67YnkPjTDaVV39suEDSNu1pNU9qYLe+lYVHXkjh6+MYu0bRX+HXVzDCTSPc9/njomtedLsKB
 LFpAzJ2sCH+hQf2eTjnw5zYdNJ0wEI2NacEIGp4NXVJiXJ+xYGB8No0U+YLkfpRmBkWugs04yUc
 KyNuQmAovsJVVMDLqik3TLWGIEacBJrPDaTh80F94WlcVxujUPwV4pgclL78Ex6TjHKc8NAgvOB
 MwoarqkMshoRzv0uz9/qplIimclH5XopqDtResdbrSWqgQozX1z9h0nvP/Ql9eFLIoXI07PN964
 8BvVaMLp8R7RMfnh25584HPodGMbounrbs0tPyEp0nXN4gz8W6zuWfkdRJf3He6T2CUil51YjNP
 Lf2a1Keb
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2d1b2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=Rr1lq44fawr2T7s8aF8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 65Tj0PzSGlbc8boSvUM7i5cMzg7hzD4N
X-Proofpoint-ORIG-GUID: 65Tj0PzSGlbc8boSvUM7i5cMzg7hzD4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064220_364956_D2D4B0DB 
X-CRM114-Status: GOOD (  18.48  )
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



On 9/11/2025 6:33 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 06:19:02PM +0530, Nihal Kumar Gupta wrote:
>>
>>
>> On 11-09-2025 15:38, Dmitry Baryshkov wrote:
>>> On Thu, Sep 11, 2025 at 02:49:59PM +0530, Nihal Kumar Gupta wrote:
>>>>
>>>> On 10-09-2025 12:33, Vikram Sharma wrote:
>>>>> On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
>>>>>>> From: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
>>>>>>>
>>>>>>> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
>>>>>>> Camera reset is controlled through an I2C expander,
>>>>>>> and power supply is managed via tlmm GPIO74.
>>>>>> Why is done as an overlay? Is it a seprate mezzanine?
>>>>> It’s not a separate mezzanine; monaco-evk does not come with an attached camera
>>>>> sensor by default.
>>>>> The overlay simply reflects an optional camera sensor attachment (e.g., IMX577
>>>>> on CSIPHY1)
>>>>> That is why camera sensor is configured in monaco-evk-camera.dtso instead of
>>>>> modifying the base monaco-evk.dts.
>>>>> Please suggest and alternative approach if you feel this is not correct
>>>> Dmitry, Do you agree with this justification or you have a follow-up comment?
>>>> Can we post v2 with the same change addressing other comments.
>>> The previous email didn't land to the mailing list, I'm not sure why.
>>>
>>> Anyway:
>>> - What are other options that we might support? Having a single
>>>    monaco-evk-camera overlay means that this is the only configuration
>>>    that we plan to support.
>>>
>>> - It all should have been described in the commit message. Please update
>>>    it for the next revision.
>>
>> Yes, We have planned to support device tree overlay of the IMX577 sensor via CSIPHY1 only.
>> I'll update the commit message in v2
> 
> I'd still suggest monaco-evk-camera-imx577.dtso

ACK, Will address this in next version.

> 

Best Regards,
Vikram


