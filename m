Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7679AE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 03:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tDBwUOTx9mIzdLxexBmtjcjcefKgdF/rlLWlMfugCE=; b=Ljx7jEJokrClqXWztxfdaI8Bl7
	5yOHUnHKvSDAJ41GZT/gTc19MhCW7KtGWRwGKut7cyz1q+v8bC55fjtyzEWDDEOwPZVUbUnxcCUHJ
	QdhyX2Kxi1Z1ZRWbVyCGN5hv9ZF0RerCqj10p3RJy/vLE2mHXe29locQMtpSUK/y91g4hPE9mciJa
	jwza/xUHilBWY88nacXlcAN6pZ6CxsgzpnxMUUYcqrdiq65VkRnBj2nzOIMSBGe84fM1uYu4coBYl
	zlMklrhPY7xeq+mX4vEBSTSzXpfcjVRqYObnlfz6fi+zmBGiq+J/c/dFFWZBLvq0ApXmGo4xtyIWZ
	DWFMgbAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLD6W-0000000DauT-2Lxa;
	Wed, 11 Dec 2024 03:09:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLD5S-0000000Dalj-3sr8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 03:08:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADaaof019597;
	Wed, 11 Dec 2024 03:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/tDBwUOTx9mIzdLxexBmtjcjcefKgdF/rlLWlMfugCE=; b=QI+OvhANY3JLOga6
	m5cYZnTTRYZKfztVtvn/Ge2IKu/mbKxpGL81QVIaH0WyiyI25z7SBBNILlcnxvrF
	f6wA05hOuPC0hqEEjbLF+H8+4UDysLcIjm7IY2RINkFKW0CSEqTGMMYv5k5ZABui
	f3z0U3UldPpnsllfVKqcq8CsXyR8dvNWL4H+XxY/I1VaCq91LjwTEl1SGuAqY/oo
	Vu42GVvLp3oKwW6x5Ns0nomVBupGYp7cm0dugjFyxnJrZYfGX66PqG3tVASDuY4w
	0Q55MftoGXCsDAwOAkrZdPyqXWUoiROj3cgMSp9J7cYleDgPIMcii6z3Jz+YVy06
	FaP3Bg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e341da11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 03:08:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB38NcM021221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 03:08:23 GMT
Received: from [10.216.62.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 19:08:18 -0800
Message-ID: <1219b46d-2aea-4377-a8ca-024039ee1499@quicinc.com>
Date: Wed, 11 Dec 2024 08:38:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Bjorn Andersson <andersson@kernel.org>
CC: Rob Clark <robdclark@gmail.com>,
        Pavan Kondeti
	<quic_pkondeti@quicinc.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Elliot Berman <quic_eberman@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
 <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
 <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0m9eFUcuyq9Ye7zYc1eZ8aC2lb1PuFwm
X-Proofpoint-ORIG-GUID: 0m9eFUcuyq9Ye7zYc1eZ8aC2lb1PuFwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_190830_987289_764D1EF8 
X-CRM114-Status: GOOD (  17.97  )
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

On 12/11/2024 6:43 AM, Bjorn Andersson wrote:
> On Tue, Dec 10, 2024 at 02:22:27AM +0530, Akhil P Oommen wrote:
>> On 12/10/2024 1:24 AM, Rob Clark wrote:
>>> On Mon, Dec 9, 2024 at 12:20 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> When kernel is booted in EL2, SECVID registers are accessible to the
>>>> KMD. So we can use that to switch GPU's secure mode to avoid dependency
>>>> on Zap firmware. Also, we can't load a secure firmware without a
>>>> hypervisor that supports it.
>>>
>>> Shouldn't we do this based on whether zap node is in dtb (and not disabled)?
>>
>> This is better, isn't it? Otherwise, multiple overlays should be
>> maintained for each soc/board since EL2 can be toggled from bootloader.
>> And this feature is likely going to be more widely available.
>>
> 
> The DeviceTree passed to the OS needs to describe the world that said OS
> is going to operate in. If you change the world you need to change the
> description.
> There are several other examples where this would be necessary
> (remoteproc and watchdog to name two examples from the Qualcomm upstream
> world).

But basic things work without those changes, right? For eg: Desktop UI

> 
> So, if we can cover this by zap-shader being enabled or disabled, that
> sounds like a clean and scaleable solution.

I think we are focusing too much on zap shader. If the driver can
determine itself about access to its register, shouldn't it be allowed
to use that?

-Akhil

> 
> Regards,
> Bjorn


