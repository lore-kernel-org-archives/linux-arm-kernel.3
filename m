Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 07:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tz/yVAe6;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGpomh4J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aJcjvcW9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=655Fe3en6dDFz80mh4ru1OYuENsoLxaUXpha1ZLiiPE=; b=tz/yVAe6X0p8nz
	BhRti4NUIHNBazukOowJAWPs5FOYna/Pzke8/dulJlOKxMlP0kP3bViIM8bhI8kKGIHtx1zInE2vz
	kJtPAShIklQDlSpD1El7GEOF0Zq1FaF9bzNhkDKFsTrH4R4bNMJhWL62j+Q/uco6nnFdnxikoRgXC
	uXE+G9Z1OHPfR1QA3SVjpnCoHcUZexfeNvREokVUBqQUay4fJkwI9WUvNl1YFDQ/di0RcLOEe3/2A
	pWFCNjAyFGpj2cUh+SYyVZUmFmoMSaUJmptvtIqce9b3qR3Hf5WNBjtmkCS5t2501lhhJ9lsJfU2t
	dNU+u5Bc2U379TD8uFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgwP-0000000AzQh-2ymh;
	Fri, 30 Oct 2026 07:22:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgwN-0000000AzQI-0tQe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 07:22:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FLh33343588
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	655Fe3en6dDFz80mh4ru1OYuENsoLxaUXpha1ZLiiPE=; b=DGpomh4JVKipy/WP
	Ha8jyIi5+eRpWCt4iTZKWzkd04xdc/qr1JcoI46mA1m/ni90LyGAuVUeoc2E4B4k
	LUWqAVlZM7D9QAjwIQyEyrFYeUEPj4w4YwIUGiUHr6k4sbmW88/GQBfa43+SLNTY
	A/T0eUxcVzNqldZRl5x/ThWRUxdGnmN6JDzGSEsYyEhu5Oh5mHTK/ZMuIEyzxMhC
	xw5l/m3+9r+GVifK+Flt8yhRCTg5YVipfa0mC1O6JS76mYGVhT+gpgO+Qm5JqkFN
	3IQMo1eOIfyqAv8mkE+yWVK96laQBpLjct91XL0N31Q9dDKg/ZG2NcpNysA7bHAF
	FvhMhA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme751pv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:22:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso629562a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 00:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793344936; x=1793949736; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=655Fe3en6dDFz80mh4ru1OYuENsoLxaUXpha1ZLiiPE=;
        b=aJcjvcW9gBrCZd/kp4knfBqKHkH21+Jd0L3O0cWiV1zuvwTMphjLZb4zVTE+POoObH
         T6oS4QvlTClAK3MNIbFaicKqleskRQFErsohXrYKDoClZosQMFHcvvvXqMqiIYg4jaK3
         OvUiWkhzVoS9cKYx1Dzkkot2ICMHlD46RxSXPIkNcghWMfCnIk+wDQctAbbjS74qLC6q
         lO4cJRds11WyFHvj45QWRXUSt5sZX/uRj3cGK0chK+PSOERympr585cZ44nDBRh8t1rf
         a9Jbom1Fy3z6IuG0Wav49CiXG8nPf4nYUJOq44ffOHyg13RHGfdWk12Uu1w82A9oEumX
         SLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793344936; x=1793949736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=655Fe3en6dDFz80mh4ru1OYuENsoLxaUXpha1ZLiiPE=;
        b=DCIJJDl5VA0npWXMwjxDRyuNdmNzcvGxzZqDUzMhvp7TaKnRXBivnBoFKs3pq5QSIS
         iF8H4R1CHOJKb3egADzYHWqPXY0Z/5qwxfJFHUmFIfNNhc9YsVpEfwleSr2X8sp+FeFQ
         HdUpvrGp/52DcnQy/WqG6KNx8S0m2B0I3YUhBgyLLSTe5bZHG1DVZY34B0+ZODTWvQDE
         4z37fMf9aI78etnQkXN6JlhSrsO2DxgODs4/hE88zrNXt0qnyEY43qA2e1TxLFxipJNo
         Itr/YBpl1nG+q8LBUlKDW3muA9CZl5tPRpU69NcV6hUtcIHYo/ru9o67rOgaRiQNB11k
         QVIw==
X-Forwarded-Encrypted: i=1; AKwUvBwQz+R1wmIv6vx9m8C6uAU+nIMDXx/1JEbktnIT9rmj/jxDFpyNE7xroGmPaaurhSevaoZA5xHjxJ4rJSrEP3WI@lists.infradead.org
X-Gm-Message-State: AFq9FYJjBW3cw4zXM8KYrKfwzHK53AgxrdnBpDaDm9mMOqNT3qVE3z42
	sNzo/N9tcYpyxHF8h5ls+8JEnSSBs/KPAk1VFDHPW0uXOC2LJ4zgsKninU3VWM/iu+R1skAtWyW
	ZuN/yIUbWbmZsPpndJz/oC9V7dQ+H2gcFQmWZX/XB44SCcuhNqb+pvGLHKhpS1fAFwzBxQVCiO+
	FfxQ==
X-Gm-Gg: AYBFou0UWQnCV2VcpTsAOAvlsN2Hp2uyDEqkqeeKBzUPivV6y5d3Odj+BTRvVJgA8lR
	nAnnYxTwqOQ2it4Q2BEicjrNsiTu+EeyREmp8zMedfwExIk354DooioNXYRX19HV4fC5mchrul9
	RlJZ06Emt9Ud6cLv2KK55R+45v0bxcfHnixAO5WaTAicdpf/n7W8T8t+2ZMkibgfyv0lKTxaXet
	y2FXSZw8ftZpymc+Q1M0SWTAjvVdgAtZvvqt0IZ3pYPtHgwARpnn09mHcgMsK+7afMiktbEgn3Z
	JCODuQLMpruqtIvcnarNPcq6szy+9RKmif5b9t/U1NI0GtQaOUNuyegu6Ck16WkvzECj1XnWf/k
	FFOUGuxTqIn+JOUTYiD1wTxVG5Sg+lClY2eWKTS/PaY2IRO/kKgYW6vtZI4cmF6hvzpLc20P5n3
	BuMiPNdOTckd0+R8oTM6KotY0JXCILjktM+XLq
X-Received: by 2002:a17:90b:5603:b0:3ac:9a03:20bf with SMTP id 98e67ed59e1d1-3ae8985b551mr1197478a91.55.1793344935838;
        Fri, 30 Oct 2026 00:22:15 -0700 (PDT)
X-Received: by 2002:a17:90b:5603:b0:3ac:9a03:20bf with SMTP id 98e67ed59e1d1-3ae8985b551mr1197433a91.55.1793344935225;
        Fri, 30 Oct 2026 00:22:15 -0700 (PDT)
Received: from [10.133.33.9] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8805ebc8sm1087089a91.3.2026.10.30.00.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 00:22:14 -0700 (PDT)
Message-ID: <86390538-2dce-42d5-80fe-7a3e6c887828@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:22:07 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 0/7] coresight: ctcu: Enable byte-cntr function for
 TMC ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xFVYkn8qwJeeff1n8xVmmgJFpei9rlks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyOSBTYWx0ZWRfXyCjviOHxM81Z
 J+GaG8oRHec+whkhsmr2ZYZ6TwzmfTLN3XVPGS2K1ygO4HPqiKZd2XAbU4MLPRKmJVEPJYpRmoH
 n0d9CWZc2DdlxP+AeHkK+xEJWHOqAUx+Kp+tjdpzbl4Zao4EZzPXMgnffKs9UG0zYgm0TSuES3k
 HDYYqMLXk6jyvXRYETbseSwBjAgtD2270+XHXD3YIpR0f76ba2Ru2FMIefCK+LTY5Sc60xgldMj
 /tRCQVLV8RCj4HVSPzs06dd26avX+7/1eX9RftzTmoY0ER24sGQai+VUOVoZ0z+LBGE3x4uAyA2
 KQUvKw+cW+UiNxMyCe9HJOiO8JGvD63FaV0VBrKQR2EQKhn4VMZcXAPs58upQQN+/kI1HaGfg2o
 Nlaosk9hIke7aMpy8LOjeLi8JGxQo6CiQDmrk44T/Uf+XObB9Mj4mcUMaR+bFX0qneoNEvMDdwZ
 4Uv1m+pMZfLda90TALA==
X-Proofpoint-ORIG-GUID: xFVYkn8qwJeeff1n8xVmmgJFpei9rlks
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyOSBTYWx0ZWRfX+YfL4Uy6M8bH
 a2ltattcNeob/1yNpx05rC5dZ4doK59BsXLfebWd5p4ZTIbgT23JBNKhNiK1RV7xx88b+uBTgq9
 sWfwiipjthGmtTlkEGqNRm/tr8zySUE=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae445a8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=cSfbk8EiCPcTUylnvA8A:9
 a=wk96cw1iHSLFEnBj:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_002219_302707_1465E3F9 
X-CRM114-Status: GOOD (  43.83  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/30/2026 2:00 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 
> Based on this concept, the irq_cnt can be used to determine whether
> the etr_buf is full. The ETR device will be disabled when the active
> etr_buf is nearly full or a timeout occurs. The nearly full buffer will
> be switched to background after synced. A new buffer will be picked from
> the etr_buf_list, then restart the ETR device.
> 
> The byte-cntr reading functions can access data from the synced and
> deactivated buffer, transferring trace data from the etr_buf to userspace
> without stopping the ETR device.
> 
> The byte-cntr read operation has integrated with the file node tmc_etr,
> for example:
> /dev/tmc_etr0
> /dev/tmc_etr1
> 
> There are two scenarios for the tmc_etr file node with byte-cntr function:
> 1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
> 2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior
> 
> Shell commands to enable byte-cntr reading for etr0:
> echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
> 

Sashiko reported a lot of the potential issues on the series. I am 
checking all comments and will send V21 to address these comments.

https://lore.kernel.org/all/sashiko-outbox-190593@kernel.org/
https://lore.kernel.org/all/sashiko-outbox-190601@kernel.org/

Thanks,
Jie

> ---
> Changes in v20:
> 1. coresight: core: refactor ctcu_get_active_port and make it generic:
>     - Check the port number returned by coresight_get_in_port() against
>       ETR_MAX_NUM in ctcu_set_etr_traceid() to avoid an out-of-bounds
>       access of the per-port arrays with a bad DT port number.
> 2. coresight: tmc: add create/clean functions for etr_buf_list:
>     - Take drvdata->sysfs_buf and add the first node to etr_buf_list in
>       one critical section, and do all etr_buf_list updates (add and
>       delete) with drvdata->spinlock held.
>     - Return -EBUSY from tmc_etr_get_sysfs_buffer() while etr_buf_list is
>       not empty, so the ETR sink enable path cannot free or replace a
>       buffer that is still owned by the list during a byte-cntr session.
> 3. coresight: ctcu: enable byte-cntr for TMC ETR devices:
>     - Fixed a NULL pointer dereference in ctcu_get_byte_cntr() when the
>       opened ETR is not connected to a CTCU device, since the byte-cntr
>       sysfs ops are global to all the TMC ETRs.
>     - Fixed the sysfs read fallback: tmc_byte_cntr_get_data() now returns
>       -EINVAL unless a byte-cntr read session is active, and
>       tmc_etr_get_sysfs_trace() falls back to the generic read only for
>       -EINVAL. Errors and EOF of the byte-cntr read are returned as-is
>       instead of reading the live buffer.
>     - Fixed a race between the buffer switch and the sink disable path:
>       tmc_etr_enable_disable_hw() now checks the sink mode with
>       drvdata->spinlock held, so the ETR is not restarted after the sink
>       has been disabled.
>     - tmc_read_prepare_byte_cntr(): check irq_enabled with the
>       byte_cntr_data->spin_lock held, and clear reading under the lock
>       and wake up the waiter on the buffer list allocation failure path.
>     - Pin the module with try_module_get() for the duration of a byte-cntr
>       read session, so unloading the module fails with -EBUSY instead of
>       blocking in ctcu_platform_remove(). Documented that a manual unbind
>       still waits for the tmc_etr file to be closed.
>     - Dropped IRQF_SHARED from the byte-cntr interrupt: the handler does
>       not check the interrupt source.
>     - Read curr_buf with drvdata->spinlock held and handle a missing
>       current node in ctcu_byte_cntr_switch_buffer().
>     - Initialize the lock and waitqueue of every port before requesting
>       its interrupt, skip the ports without a registered IRQ in
>       ctcu_platform_remove(), and only expose irq_enabled for the ports
>       with a registered IRQ.
>     - Refcount the byte-cntr sysfs ops registration across CTCU devices
>       with a devm action, so removing one CTCU no longer disables
>       byte-cntr for the others. Replaced the single-CTCU-instance comment
>       on byte_cntr_sysfs_ops accordingly.
> - Link to v19: https://lore.kernel.org/r/20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com
> 
> Changes in v19:
> 1. coresight: tmc: add create/clean functions for etr_buf_list:
>     - Simplified the kernel-doc "Locking:" note on tmc_create_etr_buf_list()
>       and tmc_clean_etr_buf_list() to state only the required contract
>       (caller must guarantee exclusive access to drvdata->etr_buf_list),
>       dropping the over-specific call-path details.
>     - Lock the required code block in create/clean functions.
> 2. coresight: ctcu: enable byte-cntr for TMC ETR devices:
>     - Fixed a stale reading-state / double-free when irq_enabled was
>       cleared between prepare and unprepare: the byte-cntr read_unprepare
>       would return an error and tmc_read_unprepare_etr() would fall back
>       to the normal unprepare path, freeing drvdata->sysfs_buf while it
>       was still owned by the byte-cntr buffer list. irq_enabled_store()
>       now returns -EBUSY while byte_cntr_data->reading is set, so the flag
>       can no longer change mid-session, and tmc_read_unprepare_byte_cntr()
>       additionally guards on byte_cntr_data->reading.
>     - Moved enable_irq_wake()/disable_irq_wake() out of the
>       byte_cntr_data->spin_lock critical section in
>       tmc_read_prepare_byte_cntr()/tmc_read_unprepare_byte_cntr().
>       irq_set_irq_wake() may sleep on slow-bus irqchips, so it must not
>       be called under a raw spinlock. The threshold IRQ is already
>       disabled by the in-lock register write before disable_irq_wake() on
>       the unprepare path, so no wake event can race in the gap.
>     - Added a comment on the byte_cntr_sysfs_ops pointer documenting the
>       single-CTCU-instance-per-system assumption.
> - Link to v18: https://lore.kernel.org/r/20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com
> 
> Changes in v18:
> 1. add a NULL check for the in_conns instance in patch 1.
> 2. fix a bug in patch 2: the tmc_alloc_etr_buf never return NULL and the
>     previous check for the return value is incorrect.
> 3. add more kernel_doc description for tmc_clean_etr_buf_list function
>     in patch 2
> - Link to v17: https://lore.kernel.org/r/20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com
> 
> Changes in v17:
> 1. fix race issue during allocat buffer.
> 2. fix user after free issue observed when remove module.
> - Link to v16: https://lore.kernel.org/r/20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com
> 
> Changes in v16:
> 1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
>     functions for etr_buf_list" because we are allocating/freeing memory.
> - Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com
> 
> Changes in v15:
> 1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
>     functions for etr_buf_list"
> 2. optimize tmc_clean_etr_buf_list function
> 3. optimize the patch "enable byte-cntr for TMC ETR devices" according
>     to Suzuki's comments
>     - call byte_cntr_sysfs_ops from etr_sysfs_ops
>     - optimize the lock usage in all functions
>     - remove the buf_node parameter in etr_drvdata, move it to
>       byte_cntr_data
>     - move the tmc_reset_sysfs_buf function to tmc-etr.c
>     - add a read flag to struct etr_buf_node to allow updating pos while
>       traversing etr_buf_list during data reads.
> Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com
> 
> Changes in V14:
> 1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
> 2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
>     function and restore etr_sysfs_ops in byte_cntr_unprepare function.
> 3. Remove redundant checks in byte‑cntr functions.
> Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/
> 
> Changes in v13:
> 1. initilize the byte_cntr_data->raw_spin_lock before using.
> 2. replace kzalloc with kzalloc_obj.
> Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/
> 
> Changes in v12:
> 1. Add a new function for retrieving the CTCU's coresight_dev instead of
>     refactor the existing function.
> Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com
> 
> Changes in v11:
> 1. Correct the description in patch1 for the function coresight_get_in_port.
> 2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
> Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com
> 
> Changes in v10:
> 1. fix a free memory issue that is reported by robot for patch 2.
> Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com
> 
> Changes in v9:
> 1. Drop the patch: add a new API to retrieve the helper device
> 2. Add a new patch to refactor the tmc_etr_get_catu_device function,
>     making it generic to support all types of helper devices associated with ETR.
> 3. Optimizing the code for creating irq_threshold sysfs node.
> 4. Remove interrupt-name property and obtain the IRQ based on the
>     in-port number.
> Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com
> 
> Changes in V8:
> 1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
> 2. Combine the patch 3 and patch 4 together.
> 3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
> Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/
> 
> Changes in V7:
> 1. rebased on tag next-20251010
> 2. updated info for sysfs node document
> Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/
> 
> Changes in V6:
> 1. rebased on next-20250905.
> 2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
>     lemans.dtsi.
> 3. fixed some minor issues about comments.
> Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V5:
> 1. Add Mike's reviewed-by tag for patchset 1,2,5.
> 2. Remove the function pointer added to helper_ops according to Mike's
>     comment, it also results the patchset has been removed.
> 3. Optimizing the paired create/clean functions for etr_buf_list.
> 4. Remove the unneeded parameter "reading" from the etr_buf_node.
> Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V4:
> 1. Rename the function to coresight_get_in_port_dest regarding to Mike's
> comment (patch 1/10).
> 2. Add lock to protect the connections regarding to Mike's comment
> (patch 2/10).
> 3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
> 4. Add tmc_read_ops to wrap all read operations for TMC device.
> 5. Add a function in helper_ops to check whether the byte-cntr is
> enabkled.
> 6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
> from the sysfs node.
> Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3 resend:
> 1. rebased on next-20250711.
> Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3:
> 1. The previous solution has been deprecated.
> 2. Add a etr_buf_list to manage allcated etr buffers.
> 3. Add a logic to switch buffer for ETR.
> 4. Add read functions to read trace data from synced etr buffer.
> Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Removed the independent file node /dev/byte_cntr.
> 2. Integrated the byte-cntr's file operations with current ETR file
>     node.
> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
> 5. Optimized the way to read the rwp_offset according to Mike's
>     suggestion.
> 6. Removed the dependency of the dts patch.
> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> ---
> Jie Gan (7):
>        coresight: core: refactor ctcu_get_active_port and make it generic
>        coresight: tmc: add create/clean functions for etr_buf_list
>        coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
>        coresight: etr: add a new function to retrieve the CTCU device
>        dt-bindings: arm: add an interrupt property for Coresight CTCU
>        coresight: ctcu: enable byte-cntr for TMC ETR devices
>        arm64: dts: qcom: lemans: add interrupts to CTCU device
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
>   arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c       |  27 ++
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 392 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 158 +++++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  81 ++++-
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++-
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 289 ++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
>   12 files changed, 995 insertions(+), 75 deletions(-)
> ---
> base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
> change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f
> 
> Best regards,


