Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECB1606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qZAXqych;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mtHnINnJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwu/5fjz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=; b=qZAXqychJB0D7k
	Y/y/oIXVr85o5fPrKTFCCkWW/AND57A9J5aqi5Ugmtog0baBx83ltXWDcAD9mXpTLYpeNR6H/h/mo
	QELgxCx4Dd9YmQ8JHNIWnc5WxKaQCJrs10Gu6NsJ0CQh2BCXs7PP8zmgFVKBTwhvvMuqbKe3ddvsJ
	gJxPjz3rtqJsV1eGZ0NHXammahvtpxM942huJpC1AWf+kubiXfTdwQLrk8PauFvob5YE3QyDB0RVq
	5pLE3MxLw0VR0c2fDb+2aMdYcxmXkdA0TyPFPj2Kmz/x5noiO9atusga5bVU6cO3EKHKuUC5LnGjl
	fNqERIbVUL1FeAdx2JRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2Md-00000006uz2-0SLq;
	Wed, 28 Oct 2026 12:02:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2Ma-00000006uyd-473G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 12:02:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe5Yp1053347
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 12:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=; b=mtHnINnJIejV7VQr
	7XTk20uGRV2y/3Te1QAhRDX2iZ5DlHcXVE1IPb/I5sk80IV03hjICUm0v+XdboOL
	b0+QbELzt0N1/AWIqSBWtUzaEi29PIkXKRsdiua9fHWiIZNZ9kvp/tddr33rdd9Q
	1jaZENQnCG2vsEFsy9F4G/MXv/wjKUgziSuDPbNzaZ+XEADcwV4ZvNdRohVzdHDz
	wPlBvpPQgtNpSTOF0y+QyE1CWRWIHdKD90E3tTmdck7jvapy8s2Svh+r2LGTxVhO
	TuhUegkuK5agRkpK7wKAmQTCfBxZcsC4qyupOf4Etfhq34joM52wkBcYcNwl3WRi
	D1IdtQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw98ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 12:02:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so585951a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 05:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188960; x=1793793760; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=;
        b=cwu/5fjz6fWKg2ex24d8jVfB4L5umb6SB0pC9xaDaJvIM5sz5RBbhpJWixj1FfrQoJ
         TZ+DaRQ86/blH2+rSWJUSBKbKwPo2PAidj2ZlgI5cvz+QujaGm9WbXNyNZyZfkvrKVcf
         iINyuNbzw+ac+AWQ7Js8+732rwRnaEYP56E0x2z8kYMljoDLqlah5CplnNnoRGhev+dk
         jNRngJunlPzR2it2o0Qid25dxw87uPDA8GUKtsyaM9magoL76XST9uInF0oBiImt1WKi
         KFDUQ7MiBw56YB6oCDR/fxT9+0MNCheql4sjYdle0NOoOcUIcAxAIiGHo0plwpb/ZzSj
         9bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188960; x=1793793760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=;
        b=YArCpXQmpfwtgseHyL8ElxJfqy7KLGVoVqwh3a73lRS9OZmTXI/JFgFhS7r8zvNC5R
         BHEIY6WpX2lKvfYG45NyGXQIDlIrqjkQEj/wvbcsMONiKhwud4j7OuWTp1PTIAlWGF/y
         4VKykc7mLlSD2A09XqwaR4D38GoJiby3FXPa9mI/gn/HhtpvJu+ht1NVuA5zjJtBny8k
         XzS0hvL1oKT4j18QWCB9y6Rcif9ZiVuT23KO0cUj86bLn5rnYX3if8XnaWku2OerfDlF
         8L9ssANGb9+EfmYgTitS8ZQP8NWRRxdAXcG+y9A2jmCSWQPcC81+lKAHEAAxLYcVy0qf
         bong==
X-Forwarded-Encrypted: i=1; AKwUvBxMYfx5og52EpvLJSYyMfRHAT3HfLO9oFjkvCFt0lyyxjPXeMU2G6NKG2av8g8wDRTnlAg9lshRNR4HEUpJJcwV@lists.infradead.org
X-Gm-Message-State: AFq9FYKS/70Ki8Y3XHYwJSv03bYK6Se44rCrqa0JuGVdDZfeDhpoj1Gc
	1EMf9VuFU+sHYFU8UBNaMT1Ueb7KTRisfizVdVCAQ9kp51J5yuUDSfcS1IoNNCyG8S7LEK8eI5r
	EIpmcSY7T0pPWMk1mo9CBDh6mmbHaX1nALQvrmnOeAtJUkd/CU/8/kmIFt+9rggpZlQ4iqoY/dh
	DJgQ==
X-Gm-Gg: AYBFou2YU1x0IfZhx3pwAhGTdZLuZhZCmU4Qh+uom0DdD6T+Gw9E6WyyKUGbmK/Zj77
	2qILaf7I3fXqHOxs0y93q8RbswI95aE7GCzxL+z+hk/VCpu9TKdAEsjlCnxxRsv9NPS/zhPirYf
	Vrwb7ANHPAPMbGHqrc2pPGZmj8m0rFLyvel9Z+Lnc5sxbWPG+9S2hv8Rn3H6vZLD7Yv/UyPcdvO
	gRo9tQoTLe/Xe5jw+2amzang4AzdSpnXwTo+/Cr8J9L0d4Vqx4RrLT8cviC+lH4+xhZzNtlmBGn
	pRxmMxeE4q3L4+aINsRu23zOz2rNNhn8Jj6xbCx5BGTAEprB3IN4I/sc1vm38+vVa+AISZPv2oi
	lDV1X+JNezg5N1h8UO9zctCBYequUeL769Fb2Q8fbB2WellNQmK3sCxootPlthIRQnY41i5FuH+
	rhfm9y7KjxCkDEaEuRgL+i3anGFx8stFmmWuzL
X-Received: by 2002:a17:902:fdac:b0:2e9:5714:6072 with SMTP id d9443c01a7336-2eb003ecf3bmr21396805ad.44.1793188959511;
        Wed, 28 Oct 2026 05:02:39 -0700 (PDT)
X-Received: by 2002:a17:902:fdac:b0:2e9:5714:6072 with SMTP id d9443c01a7336-2eb003ecf3bmr21396155ad.44.1793188958907;
        Wed, 28 Oct 2026 05:02:38 -0700 (PDT)
Received: from [10.133.33.208] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae64564b5sm21513925ad.5.2026.10.28.05.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:02:38 -0700 (PDT)
Message-ID: <6c74dab3-f00d-4567-b9c8-c8164867e8b0@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 20:02:29 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
 <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
 <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
 <1feb10d8-75f3-4dbf-9fae-807dc5a22c25@oss.qualcomm.com>
 <20261026122300.GA3598537-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261026122300.GA3598537-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Gc-cXph8XYIwuP4mGywL_7KX6RHbKW5s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX6B36l2OT2+/Y
 z8N8bI06/7xon/9gU8O17reLaJv614StAJ9HFYw1NadyhFLABrfxGbGKceiJ/t+C80UsEBqCrok
 eDTDVMIGPjKDGS7HfmylJsobyN03izU=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1e460 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JqYqai5FAWh4DW1MJkEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Gc-cXph8XYIwuP4mGywL_7KX6RHbKW5s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfXwgnHMEPq7LFD
 XtHhp1y5I78L76g1H2gM5Cr3KsWASu8Gpmq6CuF/v5qcrCENeqB7uK0GtG+KCIozoWSQ+0i5Orw
 42NrMf/9TUwD925szv3ZZ8dm3xcR6I52qLmkLPYKDL1NfDFiX4KP7mbp2c/Lf2K+XHT5Y8l7qkl
 KJDcvvfPEXvi7WqLogXWNZ8MFt1hdgjCGT34n2dDcy+q+tCGShRB2f11Sgc0XUrFclqs9a63LtE
 SmpisOfSdrbWXAbncS2tIgfhKzkPmrd3Tsp74XlBEIWm5mQcOIfacmRj0D4BaCAEp1UWA1eJg5Z
 6rlId8DuHP94f3tWvedWf/9bmRjNBjLsyRmaqFfLoOQhX9bYFAjFQlvpVqm8zS9SO0C+iVmCdLf
 7r/png+ZcbrtKutezVR27rF6A2XGQ2FQbukB+IduA/GtOF//5EN/sq9rylCORCCbtPOJQCS2Aie
 pYRbGITBZGwJLMb+GTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_050241_021402_45F6BC28 
X-CRM114-Status: GOOD (  20.40  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/26/2026 8:23 PM, Rob Herring wrote:
> On Fri, Oct 23, 2026 at 02:03:57PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 9:09 AM, Yin Li wrote:
>>>
>>>
>>> On 10/13/2026 6:37 PM, Ben Horgan wrote:
>>>> Hi Yin,
>>
>> [...]
>>
>>> Hi Ben, Konrad,
>>>
>>> The original 0x10000 reflects the per-MSC register block size as
>>> allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
>>> use "how much register space is allocated for this block" rather than
>>> "what the last used register ends" to avoid holes.
>>>
>>> We'd like to update it to 0x321c to give other platform authors a more useful reference, without exposing KNP-internal details such as address holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, and — as you noted — the registers from 0x3000 onward are domain-specific; since we have no domains, those aren't used either. So the actual footprint we need is smaller than 0x321c, but showing the full 0x321c gives other authors a complete picture of the allocated register space.
>>>
>>> That said, this patch is marked DNM and is intended as a local
>>> verification example only, not for merging.
>>
>> If you don't intend it to get merged, you can even put 0x12345
>> in there. But for future submissions that will have the intent to
>> be merged, please stick to the 0x10000 size
> 
> Why? That just wastes virtual memory space. I know it is "infinite" on
> 64-bit and *only* 96 bytes of PTEs, but still.
> 

Hi Rob, Konrad,

In v4 we settled on 0x2000 for the Kaanapali DTS. This reflects the
actual register footprint: the platform does not implement
MPAMCFG_MBW_PBM, so per the MPAM specification the feature page is
permitted to end at 0x1FFF. The remaining space up to 0x10000 is
reserved for this MSC on the Kaanapali hardware. Compared to 0x10000
(the full block size as allocated in the KNP hardware), 0x2000 avoids
mapping unused space as Rob noted. Compared to 0x321c (the full MPAM
feature page per the spec), 0x2000 more accurately reflects the
platform's actual implementation, while still being grounded in the
specification rather than an arbitrary value.

We have now posted v4, which also reduces the binding and driver to the
minimal set actually used on the platform: aside from Kaanapali, there
are no other concrete platform users, so memory controller MSC support,
RIS child node support, and related properties (arm,mpam-device, cpus,
interrupt-names) have all been dropped.

https://lore.kernel.org/all/20261028-mpam-resctrl-dt-knp-support-v4-6-bdda1e445cba@oss.qualcomm.com/

Thanks,
Yin

> Rob
> 

-- 
Thx and BRs,
Yin


