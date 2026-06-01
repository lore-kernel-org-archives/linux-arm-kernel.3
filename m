Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00159CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 02:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcqZtjsqBd2JXLpNzi6znr2ZpkrmRp706amduVTuZws=; b=uZZOLqMC/0VFt0hKYYXgtMoR58
	3ElppFEJEsu4gigXUmx1WOB7kgf4ryYGMOiR3vXZz5BXAlB4/G+wO7rZby8SqYGEW+DskzWiltWJ4
	4UoQpnDqPSlpB7x3ebjqOSA+QbasLBSt38cf+b7nnjsVTu0MHmELFbySKEpKvySAC4uytzJ7otXcs
	dwMK6uTajlsRz6gsWGS8lsoRPXdwGS7HkVJBihuREpu3IYpqGy2cTSEa3JXoZAMgl/KwzAdE/sYfe
	jYByinHHGsdh8fgyVVdB8odrS1Qfx2F3Oa1QOBqGTpxuYrvT58O8w2YZSv38ZR5q1aiyaTFOAt1MW
	uGs1Y00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTs5W-0000000A2hD-0tfW;
	Mon, 01 Jun 2026 02:09:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTs5T-0000000A2gr-2rG8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 02:09:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VLuxtp4055885;
	Mon, 1 Jun 2026 02:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IcqZtjsqBd2JXLpNzi6znr2ZpkrmRp706amduVTuZws=; b=AvB0/9z2Y0YqQ7KC
	5qJqWH0AkFRn3/0Z4HA+iBUZAUc7Z7gOBy5PCNnEBvewNvtwt01mPXrs7+qVBDzT
	FkEG3rrDah5C0DdcOH4l5ATerV0Vwpa0O8IFKCoXkT/QE9+FmQCJs6mnoT4+NnCU
	fuOuq/eN2K6xP/XZoTZCkXutlIGgLTJUQ1YFA5thYYiZHQWyiaY/4MgNoZgAmNht
	RdzL6gvznnrnaUeKHEYHC/Fqt76R4Xl4aZp5WupXp8SKLJa0CjaAvOoJlGl3/zbg
	wFBmhxTS029UTtvND8sV+jF/rEVt/Unh/IK9sREaowd3GLl4FLupR3G9rhqgNIJK
	HUydsA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux54qrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 02:09:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 651290Gv014292
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jun 2026 02:09:00 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 31 May
 2026 19:08:57 -0700
Message-ID: <84614238-35dd-4b10-8267-488d840033c4@quicinc.com>
Date: Mon, 1 Jun 2026 10:08:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
To: Leo Yan <leo.yan@arm.com>, Yingchao Deng <yingchao.deng@oss.qualcomm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <jinlong.mao@oss.qualcomm.com>, <tingwei.zhang@oss.qualcomm.com>,
        <jie.gan@oss.qualcomm.com>, Yingchao Deng
	<quic_yingdeng@quicinc.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-4-d21f4f92c51e@oss.qualcomm.com>
 <20260529153200.GL101133@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260529153200.GL101133@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-GUID: YKilyvbD365EEUQ70G2bArYTkdf72Xrj
X-Proofpoint-ORIG-GUID: YKilyvbD365EEUQ70G2bArYTkdf72Xrj
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1ce9bd cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=cw98tnrXUE6m4gzgwxMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAxOSBTYWx0ZWRfX5V2ZBPorVHTS
 zPUSlBqthqRug0FO3lnXX/b2n/mUFtAWTVU2YskwdGTUs1dgTXAyJ5YQ5cgjFHXpbCKYYf8F5ro
 c6zspW83CZHFirj7NsbCLOmO8GRGK1rmSh/oihq1DuGIegLz/zqhQvza+HhgutdyLLT0P6tbzAD
 o3wVXOWt/QFuBjv4SBtLlIsiN+KOPArApNtv/AvgCB0t2xGqE2uSW7rJuZ6BN4mO/77v947J7l9
 Wx35sby8jKqpZ+Cr+2/HHZyhT8Oa4n6sIODinQPP6GFfpN8WbQKQutZmsuGKVPQtw2aL/MCQ/bt
 exjaK93SucU0j3jyBgMZZa51W7IFfn360GL0g9E3nmQzo2OzfLKQZ9jp5FjlaDKpRifgQ8iemJQ
 ljzQvx+i/r6DCTqIXtKUet1xg1p5GgOvJy7o7zFZW+GJ/nSLLnzuvzWA4nL6T9wxAANP7ugfclM
 3SruD+MFDbrD1BQdTQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_190907_746790_889B3CD9 
X-CRM114-Status: GOOD (  16.62  )
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


On 5/29/2026 11:32 PM, Leo Yan wrote:
> On Thu, May 21, 2026 at 08:16:30PM +0800, Yingchao Deng wrote:
>
> [...]
>
>> @@ -515,18 +543,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
>>   	&dev_attr_appclear.attr,
>>   	&dev_attr_apppulse.attr,
>>   	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
>> +	coresight_cti_reg_index(triginstatus1, CTITRIGINSTATUS, 1),
>> +	coresight_cti_reg_index(triginstatus2, CTITRIGINSTATUS, 2),
>> +	coresight_cti_reg_index(triginstatus3, CTITRIGINSTATUS, 3),
> For this patch:
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
>
> AI tool reminds to update
> Documentation/ABI/testing/sysfs-bus-coresight-devices-cti, you might
> need to add description with a new patch:
>
>    What:           /sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus[1-3]
>    Date:           May 2026
>    KernelVersion:  7.2
>    Contact:        coresight@lists.linaro.org
>    Description:    (Read) read current status of QCOM extended output trigger signals.
>
> And please add document for other new sysfs knobs.
>
> Thanks,
> Leo
   Thanks for the Reviewed-by.

   I noticed that among the new sysfs knobs in this series, the
   integration test registers (ittrigin[1-3], ittrigout[1-3],
   ittrigoutack[1-3], ittriginack[1-3]) have no existing documentation
   for their base (index-0) counterparts, which were added long before
   this series.

   Two options for patch 5/5:

     (a) Document only the knobs whose base versions are already
         documented (triginstatus[1-3] and trigoutstatus[1-3]).

     (b) Document everything in patch 5/5 — both the new indexed
         variants and the previously missing base IT register entries.

   I'm leaning toward (a) to keep the series focused, but happy to go
   with (b) if you prefer to get it all done at once. What do you think?


Thanks,
Yingchao

