Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24A9CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4OYmliaBkD/qjOt/nryp2XmifjuIV55DUJ3GRAThwI=; b=4fFPbQWHy8HQJCnHiCvjO80CDD
	+HU5+Yl8KQ33FOTNHmEIVFX5bOoVN/HY2SQ6rW8LO2juUFd6DoC2uYjJWdb6Ud64mCeh9RwGrPDGT
	tJOaAs1qmW32EoTRkr+kBNUTejy0qukSG+LErfeqgZw6ZKimDJco3PsV7is2cvDJGvtzz0H1IPQ+y
	BKKHkK+zmFQOZgsx7Yx6K3a1XHXXtahVTVPXLSJSwMHZiAow5UJjGcr6xfEd4bPcsygreX3Vv9Ef6
	pnhWHFF9yL61iP7VKIrqPHXqFjhTKpinK0J3zuOFEcBfs2MSIVzkPQegNwZi0Ex0n7DhUu+jhIRV0
	l7cl9atg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULoz-0000000Ci7y-1MLQ;
	Tue, 02 Jun 2026 09:54:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULow-0000000Ci7I-0z6U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:54:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tdp24012505;
	Tue, 2 Jun 2026 09:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4OYmliaBkD/qjOt/nryp2XmifjuIV55DUJ3GRAThwI=; b=RjHcfTVhjwYIryg9
	okBs/QieipCbvGLfnTMrArpfNy2k/nklxQSmMzycA2ECrXsg1Ke6ommgvntYh+yi
	QtdKXmfvLwACsHuyPkmRHbWYA0NyS8FAlpZETPTv47C+56DQZbkkmdT83BGTVhvi
	jGnCu5OYe8wcpDU3srnKYwnRq9PNloKlChKkBnAccaLV2pBluvYofR8UZwijSbMq
	xtbm9q8KeCF2eq5tj60yPkLFo+4DSl+XlItlcnCdO8IXrW2ca0mr7gjmN7F6xm2h
	GFioe/FzbgArD47JvEqx5zsSjMnWJsRIn6YI7Ez57/Cpus3r40oVvXlxoD2jWIQm
	Cbying==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4h08r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 09:53:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 6529rsA5007667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jun 2026 09:53:54 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Jun
 2026 02:53:51 -0700
Message-ID: <30ed489e-13a3-41fa-980b-5a6bcf451760@quicinc.com>
Date: Tue, 2 Jun 2026 17:53:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
To: Leo Yan <leo.yan@arm.com>
CC: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <jinlong.mao@oss.qualcomm.com>, <tingwei.zhang@oss.qualcomm.com>,
        <jie.gan@oss.qualcomm.com>, Yingchao Deng
	<quic_yingdeng@quicinc.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-4-d21f4f92c51e@oss.qualcomm.com>
 <20260529153200.GL101133@e132581.arm.com>
 <84614238-35dd-4b10-8267-488d840033c4@quicinc.com>
 <20260601104821.GM101133@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260601104821.GM101133@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5MyBTYWx0ZWRfXwzIeITQjr+M1
 CkQMBlWitvxMLOzMRUb/MWdlMMSjcVbde71wh7SexWvJRIjzW10kmlsB9ZVP3xCCyCHn8Fl46p1
 9s5kv5ItW8zLZnYB3m1wt0bUP/NdUcuOLOTksYwBsi+7cTP6ebfeSa/lNglo95dUNXPxoBW2ogq
 UuO+VhT/cnot2zp3ebY7ksfGJzACM/v9NOG1i40DN1XKHFOdoa8qhd3OqHr6TFvhQD+6wxaTz7x
 db1franp7gMrPO2s+yiCnBR7s9gI3Q8AHpp7D4aR1MXZYmHaMOt/A2ACtluRXalmvmz87xYoqjD
 rWx07TEfrsLm4vEdb/aZwf8H37Tbd6uswG/hIsXOiPpWGtX0TcFM0myAa4MBhbCTC3AG3yAM0Mo
 uIHNxVZTQtIQahQRh5GbjD3ohKXPCzj5uB2EE1rrhrTFYsDJ4qw9Q+lg1p1wH6xTewgEWc3TCR+
 4cU3YKxpv5Wogz3PfLg==
X-Proofpoint-GUID: qYS2sn88fHFt5Byo79fyREI9l8Ddb-lB
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1ea833 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=PKDSVDeBmbQ8FXe6RhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qYS2sn88fHFt5Byo79fyREI9l8Ddb-lB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_025402_316359_4E727472 
X-CRM114-Status: GOOD (  18.86  )
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


On 6/1/2026 6:48 PM, Leo Yan wrote:
> On Mon, Jun 01, 2026 at 10:08:55AM +0800, Yingchao Deng (Consultant) wrote:
>
> [...]
>
>>    I noticed that among the new sysfs knobs in this series, the
>>    integration test registers (ittrigin[1-3], ittrigout[1-3],
>>    ittrigoutack[1-3], ittriginack[1-3]) have no existing documentation
>>    for their base (index-0) counterparts, which were added long before
>>    this series.
> Ah, thanks for pointing out the missed piece!
>
>>    Two options for patch 5/5:
>>
>>      (a) Document only the knobs whose base versions are already
>>          documented (triginstatus[1-3] and trigoutstatus[1-3]).
>>
>>      (b) Document everything in patch 5/5 — both the new indexed
>>          variants and the previously missing base IT register entries.
> Please use option (b). Could you fold the code piece below into patch 5?
>
> Note, we cannot merge ittrigin and ittrigin[1-3] into a single entry
> because they were introduced in different kernel versions.
Will update accordingly.

Thanks,
Yingchao
> @Mike, if any chance you could give a review on this?
>
> ---8<---
>
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> @@ -134,6 +134,60 @@ KernelVersion:	5.7
>   Contact:	Mike Leach or Mathieu Poirier
>   Description:	(Read) read current status of output trigger signals.
>   
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itctrl
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(RW) Control integration mode.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itchin
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Read) Read the values of the CTCHIN inputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itchinack
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Write) Write the value of the CTCHINACK input.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigin
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Read) Read the values of the CTTRIGIN inputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittriginack
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Write) Write the value of the CTTRIGINACK input.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itchout
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(RW) Read or write the value of the CTCHOUT outputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itchoutack
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Read) Read the value of the CTCHOUTACK input.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigout
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(RW) Read or write the value of the CTTRIGOUT outputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigoutack
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Read) Read the value of the CTTRIGOUTACK input.
> +
>   What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_attach
>   Date:		March 2020
>   KernelVersion:	5.7

