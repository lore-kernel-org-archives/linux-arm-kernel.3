Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2210A606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 02:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uhTs0xgP;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hCt+KT9s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QCR6Fz/Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rWzTNqY15kY9Ycqy3ORJKlvSsbZyK/UqSUFvwFHrbr0=; b=uhTs0xgPDL27Nr
	hKnrp+HovouUn5eQ2N9IL2jqHknrprfy8w9zCqT1SsE/NilQDSg1Ls2Qmx/Wg9mtisHWtppDFsYHz
	JSF/mhJ+aXb3VHVRuOTXNllBopp6CEKyIIbj+PgbrI5I7b9EBs5QBdS6SRYIHok/1v8RaighZZukz
	8l3m6spHqDGhBYZuCabe9JlGFfPW/wkFHn7UaSa4eQ6OBBVI94JEYJQ96EOr5Ea2rIa+Zdgk2atp2
	lKlRVh+CD1evd7T4MV+4q/x0nshaDFwvBRoA9P9Z+d9ndxeed1xVfbTxc7n5ysyqIbQXj5mYWFRXe
	oA/t6VttDG9o1ZHjrSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAAk-0000000B86y-0XP2;
	Fri, 06 Nov 2026 02:59:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAAh-0000000B86c-20QA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 02:59:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NhWtA2885463
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Nov 2026 02:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rWzTNqY15kY9Ycqy3ORJKlvSsbZyK/UqSUFvwFHrbr0=; b=hCt+KT9szoPmBrXO
	7aWKsIr4E9ufS5X3KSJur9ekTkisEdoQLibRYufbcsQCL9ghPzS3V6edaZ2duuGq
	ztNGm6Lc+R8Or5CbeKhOn4aEXR7+Wl42n5T7Kjdbt3Oh8vRGVSpwRgVoedlnE5nN
	+APFXvvhdkLj5d95/kAfOk6RiE1T8oCMiXmrUuTchYt0tIANceC4HMemmsDnTfTT
	gzYLwkHzMK66EkAVCRNlndK9DsSKnnCW13VO30q9VEj81giWCvGdi3U3FA2D6lNE
	bR+2k20mnK/3UsSHyBgnyPJ5JJaW2JphZzI8hwFQQT4seRTJw78c+GgQeN1ao7bt
	g3dxVg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3parm1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 02:59:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so227658a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 18:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793933957; x=1794538757; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWzTNqY15kY9Ycqy3ORJKlvSsbZyK/UqSUFvwFHrbr0=;
        b=QCR6Fz/Yo9SU54MuYd+qdCrVlIjFIQeKmzFEj5YxldWTJgvW9la7gAF/blSs5sdeza
         gJ1lIMCRpzsZiiMxUlT/KjLlJfEVmLz3rmFPHlOpldFtsUnBaUzPLP6tZO8sWzv6wMU3
         Y5e4COitp9thPMg2CR587DahyqATx253rW6wXcU7lGWBd05v410IXj3a0TEkMwIdwcOo
         YuBz+CymxJ47ouho3CK9WclEc+mIZEro6BPjWuk8Qd3EpTMVSbjeCPK79vS8NyG4SJ+X
         skNE7guu7aiRzDA8Ci+Wk/ew9QtsG2BKGqy+uvrX3v6m5a6Ff5lfgSvlMNjEYuJ+k+vp
         kcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793933957; x=1794538757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWzTNqY15kY9Ycqy3ORJKlvSsbZyK/UqSUFvwFHrbr0=;
        b=QrOJoX6Dk7ZSqEzsFtM+JD3quEbAc1vCUWcmyWylmjBlZ0lp/b6JcRpkOhdsUYlJRl
         sP+qis9CcRmEpVRZLay8jS635RpYZjY13mId5+I/5ZiAYIeaOnaUoc27xwc0gfFfN56U
         e11qtGBUPnmoZHBYX+htuC8WZNuhruwR3MoXXzMoSnP0h6t73AE1SrsScOKztBlfe47r
         Tz8H8bUVRQv/wyi4BTMpbkB89CM1HUQKmObbHA8f7NEDeA1vvL8VBZ58W6QLwEDAcl6t
         VsYrbVFfGnuUpBfZagxkZzuUL7/OmUvVDuMicfcHilXhGW+AozukaKzBruMMgAaxLIyO
         b9PQ==
X-Forwarded-Encrypted: i=1; AL+hErFOH/PXI0a+HQYpFWSlGx0d5jUoV2ukN9fQF42+zoM5RWVwHPOSYYP6mpJv7FjBUz/PfEGCNYIAz5SymPtbUVp5@lists.infradead.org
X-Gm-Message-State: APuU4Z8jLBt83Q/0fZRJ3hNRtzEoAEdUQz8loqCevALIYglp4FtWH3Qu
	EQIUxvuRZzYGkvAu5sw2zvYQQxqUxlFEBreL4IaLgQHZvW8M/5vmY88FvcG7i32kq+mLvGTPWR5
	JlNj0Aazezw1M6LLh4fjZTDVa56PxnxWHG2DZGF4aJ+30tbPG00pp7Ds8Q1xKUdbQ/DCaPltdOm
	meqA==
X-Gm-Gg: AYBFou0jyldfwTCMbUepu+2KGus3s+5eJhE1zZka1beiD8tVgK595eOvc4HtYuBu2Jv
	ioENg4BKTxyUynoZ53If79x1kZ+BpFIte7r3XYarBVf28EPBl7YzmlhpLELTYerRWlDxkfD4WYe
	Wx089uOuQ5MLvIMXrJW0PyqM9kF/HjVLlgrsdWirj5tcriislntg+o8PFKilRgh2v3A6NLfy4/p
	cLZsM4s9PepiK3IfVZZo3Gbbc9vXhfeMQ1own4WaDDfVsGNSHj9q5c6SnXezZAOsdouwU4LCMkA
	TjhsLWHbWDDk8Lyd9WlS2sVikfrR5D+mYKPXjGPXt3U4s6ouDWm6Vr3NzmKGnzMV62/+fr8CYWS
	tltNU4qqHr5j7WDuoW0tH9fUpfHH9u0VY1CiApoFB3xepfP2OKwHHMrkasp+Vwd1wwGG2tD9w45
	zySlLPKUSHVjr/BBjQ5+BnIb7HsAwf1MoMs1Rok0Zou6g=
X-Received: by 2002:a17:90b:4486:b0:3b0:9deb:d994 with SMTP id 98e67ed59e1d1-3b0db7251bamr994551a91.64.1793933957080;
        Thu, 05 Nov 2026 18:59:17 -0800 (PST)
X-Received: by 2002:a17:90b:4486:b0:3b0:9deb:d994 with SMTP id 98e67ed59e1d1-3b0db7251bamr994515a91.64.1793933956541;
        Thu, 05 Nov 2026 18:59:16 -0800 (PST)
Received: from [10.133.33.115] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b72d5asm4603741a91.4.2026.11.05.18.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:59:16 -0800 (PST)
Message-ID: <6cab89dc-04f0-4d54-a935-eee2254b054c@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:59:11 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 2/7] qcom-tgu: Add TGU driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-3-songwei.chai@oss.qualcomm.com>
 <55e1da04-1e8b-4783-a4db-0f154d8ec10e@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <55e1da04-1e8b-4783-a4db-0f154d8ec10e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX52frwOjBX5Yr
 UWVS6rwSjUU6khJH7BC4BFZlaMx1Yl87qXEf6P8yckEZz/n8A3q2DtsYQ7W94ShAAApgT6Hq0e/
 b2XLQg0T7jtdHp4hoIjO2y7ZuHIsBmIhynxEhKlJ+V6xLaQT1UCIPGrqOKFEF7eD9MchBudjQ1G
 /8E3lN9ORMcJabED5H8LJPYG9MsfA/lg2ofYQAEAqjelxFmdP4bIRLzL6mq8310uRunRhFXy81c
 /6TXh7ybBWYwuu/Atptgokm7uNLYohAFiE2aWQ4Nq49m9P1vZUsh0HelgOZX/MVtBX4Yp5TaKiB
 vinVA7LtbGn8c0bTsd2rKloVAyxZT6OKx1nfnd0eKKjSfMBrjCr9dBvk3EbAhdOimd7IlSYLrtL
 PEGHMeqGjtPvUHURT49vOy9qFsrbcuI7oy/2Kz6yeCz2FdHBh7c1Rpe6vQL9pdW/lZAG68+1VUV
 Yi1qBRL8npH6w2nf45Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfXz9MNYT1wD0xM
 yYMvv9QaF1mUOxGbN5XNvMR28f1dBubDkWPCz2Y5JXjkekgDWJycGbwV/gu18T+5ZxRrji/mH6V
 Mpkr5wYmV3kVSaFdfMnXSYeldw5RToI=
X-Proofpoint-GUID: Ri-ujedafpLOY6SPWpgzEus6cccO9EwM
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed4286 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=p-U3weD7bCxB8QOMAjgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Ri-ujedafpLOY6SPWpgzEus6cccO9EwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_185919_681436_AB81240B 
X-CRM114-Status: GOOD (  23.60  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/5/2026 8:32 PM, Suzuki K Poulose wrote:
> On 30/07/2026 09:06, Songwei Chai wrote:
>> Add driver to support device TGU (Trigger Generation Unit).
>> TGU is a Data Engine which can be utilized to sense a plurality of
>> signals and create a trigger into the CTI or generate interrupts to
>> processors. Add probe/enable/disable functions for tgu.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>>   MAINTAINERS                                   |  11 +
>>   drivers/Makefile                              |   1 +
>>   drivers/hwtracing/Kconfig                     |   2 +
>>   drivers/hwtracing/qcom/Kconfig                |  20 ++
>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>   drivers/hwtracing/qcom/tgu.c                  | 192 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>>   8 files changed, 289 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>> b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> new file mode 100644
>> index 000000000000..36ab64f1e301
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -0,0 +1,9 @@
>> +What:        /sys/bus/amba/devices/<tgu-name>/enable_tgu
>> +Date:        August 2026
>> +KernelVersion:    7.2
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the enable/disable status of TGU
>> +        Accepts only one of the 2 values -  0 or 1.
>> +        0 : disable TGU.
>> +        1 : enable TGU.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ce5c5185c773..4789321cca6d 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22360,6 +22360,17 @@ S:    Maintained
>>   F:    Documentation/tee/qtee.rst
>>   F:    drivers/tee/qcomtee/
>>   +QUALCOMM HARDWARETRACING DRIVER
>> +M:    Songwei Chai <songwei.chai@oss.qualcomm.com>
>> +M:    Jie Gan <jie.gan@oss.qualcomm.com>
>> +M:    Suzuki K Poulose <suzuki.poulose@arm.com>
>> +L:    linux-arm-msm@vger.kernel.org
>> +S:    Maintained
>> +T:    git 
>> git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
>> +F:    Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +F:    Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>> +F:    drivers/hwtracing/qcom/
>> +
>>   QUALCOMM TRUST ZONE MEMORY ALLOCATOR
>>   M:    Bartosz Golaszewski <brgl@kernel.org>
>>   L:    linux-arm-msm@vger.kernel.org
>> diff --git a/drivers/Makefile b/drivers/Makefile
>> index 0841ea851847..6a2cbe5b340f 100644
>> --- a/drivers/Makefile
>> +++ b/drivers/Makefile
>> @@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)        += ras/
>>   obj-$(CONFIG_USB4)        += thunderbolt/
>>   obj-$(CONFIG_CORESIGHT)        += hwtracing/coresight/
>>   obj-y                += hwtracing/intel_th/
>> +obj-y                += hwtracing/qcom/
>>   obj-$(CONFIG_STM)        += hwtracing/stm/
>>   obj-$(CONFIG_HISI_PTT)        += hwtracing/ptt/
>>   obj-y                += android/
>> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
>> index 911ee977103c..8a640218eed8 100644
>> --- a/drivers/hwtracing/Kconfig
>> +++ b/drivers/hwtracing/Kconfig
>> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>>     source "drivers/hwtracing/ptt/Kconfig"
>>   +source "drivers/hwtracing/qcom/Kconfig"
>> +
>>   endmenu
>> diff --git a/drivers/hwtracing/qcom/Kconfig 
>> b/drivers/hwtracing/qcom/Kconfig
>> new file mode 100644
>> index 000000000000..5c94c75ffa39
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Kconfig
>> @@ -0,0 +1,20 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# QCOM specific hwtracing drivers
>> +#
>> +menu "Qualcomm specific hwtracing drivers"
>> +
>> +config QCOM_TGU
>> +    tristate "QCOM Trigger Generation Unit driver"
>> +    depends on ARCH_QCOM || COMPILE_TEST
>> +    depends on ARM_AMBA
>> +    help
>> +      This driver provides support for Trigger Generation Unit that is
>> +      used to detect patterns or sequences on a given set of signals.
>> +      TGU is used to monitor a particular bus within a given region to
>> +      detect illegal transaction sequences or slave responses. It is 
>> also
>> +      used to monitor a data stream to detect protocol violations 
>> and to
>> +      provide a trigger point for centering data around a specific 
>> event
>> +      within the trace data buffer.
>> +
>> +endmenu
>> diff --git a/drivers/hwtracing/qcom/Makefile 
>> b/drivers/hwtracing/qcom/Makefile
>> new file mode 100644
>> index 000000000000..5a0a868c1ea0
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_QCOM_TGU) += tgu.o
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> new file mode 100644
>> index 000000000000..9c7dd4a09f02
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -0,0 +1,192 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/amba/bus.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "tgu.h"
>> +
>> +static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    /* Enable TGU to program the triggers */
>> +    writel(1, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +}
>> +
>> +static void tgu_enable(struct tgu_drvdata *drvdata)
>> +{
>> +    tgu_write_all_hw_regs(drvdata);
>> +    drvdata->enabled = true;
>> +}
>> +
>> +static void tgu_disable(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    writel(0, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +
>> +    drvdata->enabled = false;
>> +}
>> +
>> +static ssize_t enable_tgu_show(struct device *dev,
>> +                   struct device_attribute *attr, char *buf)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    bool enabled;
>> +
>> +    scoped_guard(mutex, &drvdata->lock)
>> +        enabled = drvdata->enabled;
>> +
>> +    return sysfs_emit(buf, "%d\n", enabled);
>> +}
>> +
>> +/* enable_tgu_store - Enable or disable the Trigger Generation Unit 
>> (TGU). */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +                struct device_attribute *attr,
>> +                const char *buf,
>> +                size_t size)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    unsigned long val;
>> +    int ret;
>> +
>> +    ret = kstrtoul(buf, 0, &val);
>> +    if (ret || val > 1)
>> +        return -EINVAL;
>> +
>> +    /*
>> +     * Hold the mutex across the whole check-and-act sequence: the 
>> check of
>> +     * drvdata->enabled, the PM runtime reference counting and the 
>> state
>> +     * update must be atomic, otherwise concurrent writers could each
>> +     * imbalance the PM runtime usage counter.
>> +     */
>> +    guard(mutex)(&drvdata->lock);
>> +
>> +    if (val) {
>> +        if (drvdata->enabled)
>> +            return -EBUSY;
>> +
>> +        ret = pm_runtime_resume_and_get(dev);
>> +        if (ret)
>> +            return ret;
>> +
>> +        tgu_enable(drvdata);
>> +    } else {
>> +        if (!drvdata->enabled)
>> +            return -EINVAL;
>> +
>> +        tgu_disable(drvdata);
>> +        pm_runtime_put(dev);
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(enable_tgu);
>> +
>> +static struct attribute *tgu_common_attrs[] = {
>> +    &dev_attr_enable_tgu.attr,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group tgu_common_grp = {
>> +    .attrs = tgu_common_attrs,
>> +};
>> +
>> +static const struct attribute_group *tgu_attr_groups[] = {
>> +    &tgu_common_grp,
>> +    NULL,
>> +};
>> +
>> +static int tgu_probe(struct amba_device *adev, const struct amba_id 
>> *id)
>> +{
>> +    struct device *dev = &adev->dev;
>> +    struct tgu_drvdata *drvdata;
>> +    int ret;
>> +
>> +    drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +    if (!drvdata)
>> +        return -ENOMEM;
>> +
>> +    drvdata->dev = &adev->dev;
>> +    dev_set_drvdata(dev, drvdata);
>> +
>> +    drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +    if (IS_ERR(drvdata->base))
>> +        return PTR_ERR(drvdata->base);
>> +
>> +    ret = devm_mutex_init(dev, &drvdata->lock);
>> +    if (ret)
>> +        return ret;
>> +
>> +    drvdata->enabled = false;
>> +
>> +    ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>> +    if (ret) {
>> +        dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    pm_runtime_put(&adev->dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static void tgu_remove(struct amba_device *adev)
>> +{
>> +    struct device *dev = &adev->dev;
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +    sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
>> +
>> +    /*
>> +     * If the device is still enabled through sysfs, disable the 
>> hardware
>> +     * and drop the PM runtime reference taken in enable_tgu_store() 
>> so the
>> +     * usage counter stays balanced. Use the synchronous put: the 
>> driver core
>> +     * disables runtime PM right after ->remove() returns, and the 
>> barrier in
>> +     * pm_runtime_disable() would cancel a still-queued async 
>> idle/suspend,
>> +     * leaving the runtime-PM state inconsistent.
>> +     */
>> +    scoped_guard(mutex, &drvdata->lock) {
>> +        if (drvdata->enabled) {
>> +            tgu_disable(drvdata);
>> +            pm_runtime_put_sync(dev);
>> +        }
>> +    }
>> +}
>> +
>> +static const struct amba_id tgu_ids[] = {
>> +    {
>> +        .id = 0x000f0e00,
>> +        .mask = 0x000fffff,
>> +    },
>> +    { 0, 0, NULL },
>> +};
>> +
>> +MODULE_DEVICE_TABLE(amba, tgu_ids);
>> +
>> +static struct amba_driver tgu_driver = {
>> +    .drv = {
>> +        .name = "qcom-tgu",
>> +        .suppress_bind_attrs = true,
>> +    },
>> +    .probe = tgu_probe,
>> +    .remove = tgu_remove,
>> +    .id_table = tgu_ids,
>> +};
>> +
>> +module_amba_driver(tgu_driver);
>> +
>> +MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
>> +MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
>> +MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> new file mode 100644
>> index 000000000000..ebba49402a20
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _QCOM_TGU_H
>> +#define _QCOM_TGU_H
>> +
>> +/* Register addresses */
>> +#define TGU_CONTROL        0x0000
>> +#define TGU_LAR        0xfb0
>> +#define TGU_UNLOCK_OFFSET    0xc5acce55
>> +
>> +static inline void TGU_LOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        /* Wait for things to settle */
>> +        mb();
>> +        writel_relaxed(0x0, addr + TGU_LAR);
>> +    } while (0);
>> +}
>
> This is simply replicating the CS_LOCK/CS_UNLOCK.
> I don't mind those (and relevant definitions) to be moved into 
> include/linux/coresight.h and reused for your driver.
>
> The rest looks fine by me.

Thanks Suzuki.

I will add a separate CoreSight API cleanuppatch to this series to move 
common definitions such as CS_LOCK/CS_UNLOCKfrom coresight-priv.hto 
include/linux/coresight.h, allowing them to be reused by the TGU driver.


>
> Suzuki
>
>
>> +
>> +static inline void TGU_UNLOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
>> +        /* Make sure everyone has seen this */
>> +        mb();
>> +    } while (0);
>> +}
>> +
>> +/**
>> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generation 
>> Unit)
>> + * @base: Memory-mapped base address of the TGU device
>> + * @dev: Pointer to the associated device structure
>> + * @lock: Mutex serialising enable/disable and the associated PM 
>> runtime
>> + *        reference counting against concurrent sysfs access
>> + * @enabled: Flag indicating whether the TGU device is enabled
>> + *
>> + * This structure defines the data associated with a TGU device,
>> + * including its base address, device pointer, the lock serialising
>> + * enable/disable, and the enable status.
>> + */
>> +struct tgu_drvdata {
>> +    void __iomem *base;
>> +    struct device *dev;
>> +    struct mutex lock;
>> +    bool enabled;
>> +};
>> +
>> +#endif
>

