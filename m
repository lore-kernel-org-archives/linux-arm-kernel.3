Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88F1C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXs+2X22CNIfmNCVhg97ldAwTjAoi/RHfs7pocm68rY=; b=0HQOf74jak2kZDNTaVF0BEToQr
	UQPiywADKCRjZ9Jt8guHPJLFWWlPUb3Y1rL9z6M0U7uirHg7ewTVPY74weEszxHzsqsyT3zUjWdYW
	DwtgpY4j5gMk8vCpF8Ukvm32tiKItyFOK4THLcM0lWxj//C+m/ZjPHFg+SKqSbYtxW3T+8qbhw26z
	WfKZTyuyAN2/fx4DaNUmjbl5RmVUlL6pGtQljSZIWA9DQiUiLn++15dljmIkA/AMonLxxL4aZAsb4
	VhwGXhYiD4YxVJr5WeAArDykSmDAtJc6vhexflBYqk7cflsW/dNRbYfZ6NDj2fMLSw6r46y8SOUKF
	X9rR7Piw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UGc-00000009SjX-2om2;
	Wed, 23 Apr 2025 07:11:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UAI-00000009Rf7-2uAI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:05:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iLmg022331;
	Wed, 23 Apr 2025 07:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DXs+2X22CNIfmNCVhg97ldAwTjAoi/RHfs7pocm68rY=; b=HPpFHJbssP7T5kYH
	BNxsx8ElUHeCg7E62rJt1P52xqRL1fOs1txhXZGRK3K9voYk5BZnkJBCpafq7F/9
	8LB/aIhFnATHzf3AUjEWwqdrO4WtAD2bh7OEkCS1yQju2REvk1s+oo0x/pUQPaNy
	QFk6hK1NEVWslrzOMrN5kdBK7BEvhR+KVq7SrFc4LonLqkqKB3vga5AOCJGra+ya
	evLm+J6hRnBvmrgt9AsKQ2uEJnaL9CgVi1Eb1P37KV+FgX10lqVsMs5mYKBc+1vN
	o5HJhUo4iokMBDSEvBGHu9sRChKo1A2brmEXUdyms17PbA7zKLl4rWOMmQ/SPN+f
	mm07CA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1164v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 07:04:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N74cSZ016287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 07:04:38 GMT
Received: from [10.110.52.190] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 00:04:37 -0700
Message-ID: <c75d2cc2-e7f7-4de4-8d3d-81c3cf8ff973@quicinc.com>
Date: Wed, 23 Apr 2025 00:04:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/14] introduce kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>
CC: <linux-doc@vger.kernel.org>, <corbet@lwn.net>, <tglx@linutronix.de>,
        <mingo@redhat.com>, <rostedt@goodmis.org>, <john.ogness@linutronix.de>,
        <senozhatsky@chromium.org>, <pmladek@suse.com>, <peterz@infradead.org>,
        <mojha@qti.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
        <vincent.guittot@linaro.org>, <konradybcio@kernel.org>,
        <dietmar.eggemann@arm.com>, <juri.lelli@redhat.com>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WG7qYevMhuvSAnvTpD6mvm3ky2sWWyNl
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=68089107 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=oZ8wWTcPSBrqPQfBPqMA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WG7qYevMhuvSAnvTpD6mvm3ky2sWWyNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0NiBTYWx0ZWRfX0TwZpL0SAicz oF4+evXSmwb+4LqxonlhNM/2Pc0LZLhrfKbOUZFe88P71mC4iyFnITKZSulYzUwJEld+jDIUeUJ THtFecDN/No+OXk5RiG7AMgR7aNDRbupscYOxnQFxR+pyrX78qy5u/XmRy9s91zgoZT2TDYQdBF
 cZliSTsNqg4xWCq4u1o8jwcLDjR4mSpVn5PP5AP5R1UN/28ARiNsdBIAsyrPddyzH/ExDx2ZUNZ 5BN3OMmJGm6jyzFJHngqIl47sD8q67ovCjvzvqCGDKxwd8m+tUeHBOeSh+vzh44JrwaorO7Kc4z /t4jFPSm0x1f7Ag98UOGqE/8Nnli8QfvFmjxTgYQGSH6pKORYcFnNFLcrKPK7o5rZZ2MTdw3YQl
 +lXeRaEf2NtKnxdn5XNByYsixOSYMx+r8rtcqhxFn45H5ewVVMm1lu0RtzO6BPpvPf221yJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=797 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_000502_852428_B70D903D 
X-CRM114-Status: GOOD (  23.84  )
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

On 4/22/2025 4:31 AM, Eugen Hristev wrote:
> kmemdump is a mechanism which allows the kernel to mark specific memory
> areas for dumping or specific backend usage.
> Once regions are marked, kmemdump keeps an internal list with the regions
> and registers them in the backend.
> Further, depending on the backend driver, these regions can be dumped using
> firmware or different hardware block.
> Regions being marked beforehand, when the system is up and running, there
> is no need nor dependency on a panic handler, or a working kernel that can
> dump the debug information.
> The kmemdump approach works when pstore, kdump, or another mechanism do not.
> Pstore relies on persistent storage, a dedicated RAM area or flash, which
> has the disadvantage of having the memory reserved all the time, or another
> specific non volatile memory. Some devices cannot keep the RAM contents on
> reboot so ramoops does not work. Some devices do not allow kexec to run
> another kernel to debug the crashed one.
> For such devices, that have another mechanism to help debugging, like
> firmware, kmemdump is a viable solution.
> 
> kmemdump can create a core image, similar with /proc/vmcore, with only
> the registered regions included. This can be loaded into crash tool/gdb and
> analyzed.
> To have this working, specific information from the kernel is registered,
> and this is done at kmemdump init time, no need for the kmemdump user to
> do anything.
> 
> The implementation is based on the initial Pstore/directly mapped zones
> published as an RFC here:
> https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/
> 
> The back-end implementation for qcom_smem is based on the minidump
> patch series and driver written by Mukesh Ojha, thanks:
> https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/
> 
> I appreciate the feedback on this series, I know it is a longshot, and there
> is a lot to improve, but I hope I am on the right track.


Is there any way to demonstrate this framework on non-Qualcomm device? Like any
other ARM device from TI, NXP etc; x86/RISC-V based device is also fine.

-- 
---Trilok Soni

