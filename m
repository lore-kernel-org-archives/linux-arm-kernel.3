Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92022606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k/43RVCd;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p456WRBa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VvGc4WsW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YkRpJaDqco6LEFQuZ/pvK2bkmZohErX1p+9QknBbkno=; b=k/43RVCdMtvPqe
	l3Z2X/8aznclsmv5PlKkwJlZcZDqIEnNyHLMlhl5yDLYoUUagyyxrjSoc8nkDiKdwEpYXJYO56bBV
	bAXSvrIzm++E5JWHpvL6PMca7MHlId9RfWLvzL3Rimpk4y+tR+FBCgj9wTr3BqyeWAQKn3jXEQ5Uz
	gWcdDXbNRBu8om8bLTflvbnZrZAEgOZ6mkAuwLdh7lgiUIFqo0vx+IJDK5whWL0ZHFH1OtlsevgMA
	V9CNmZeNyKOkLgQJw1fg9uF1wxUk6w9cAo3WS6IrJCM0M2AkuetddImMQrwASk3RS0LOHhhHruQUe
	R4FVjNDrcnrTRlUZPAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKC3y-0000000G6SJ-0yXH;
	Fri, 23 Oct 2026 09:59:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKC3v-0000000G6Rx-2QPS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:59:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FMdd3167941
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 09:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YkRpJaDqco6LEFQuZ/pvK2bkmZohErX1p+9QknBbkno=; b=p456WRBatilPuf4q
	Qk7dmM1hggU8GIPT3UdtqPgDeVAKsyEy7Boyd6T7XE4xTrPXliRMwZpRncIWzy4a
	miMYRtZ0bWuB0qmdwHxRxJso4p10Dq5aH53AAEgNg4Q7dxbqWSt1Bbpek5/4uFkW
	M0YT/VBvMKCd+Z1DWEeBGGPMxsy7ThcrrV4pbpCO2omD6J6gWehCH/P576F33gfy
	aV066oawhIAQzNPZ4mq0ULu5t5+bflI0tNb2jKsLUs2Q/g04+xxzAIsTE4x0Tx93
	pBkrb7XkRUfS4n33mgWSAEUWb6VLPeNj73WUJddBwUEE0mwXpAYNTTtFjLTcYMNZ
	WQzLWQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpb35q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 09:59:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-361c38aa269so88953eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 02:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792749585; x=1793354385; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkRpJaDqco6LEFQuZ/pvK2bkmZohErX1p+9QknBbkno=;
        b=VvGc4WsWqej+mOqX9cKhRHMXOUPB9XScg/fzEkRb8OSUTWM9ycmjpTTIjCaRBGc64m
         wWqKbusOX9iWVb1AWWRTAxSZDlYCDRGzqcSWHDG8JKng84RJJTIr8A1RYw5ite/1c5o4
         M2fn4w8i5fL5NHOMH7RiRHTYgLAoC1rlGYxfq+hFlSIQwnn3eK3Kz8pO2LtXbOxQClyh
         jPgepJepZQ0LeAdcOB3z8uqnif8CVcP3ZmhfYPmwaLGxoOmCyVUFUyvtGp2WBi/PVyZR
         FbEaHhlfsxDRFzja7XCdOvZ6Wd4CenOc+cJND3GxA8pVVco2yJpn2aHPLYDP43WU7rRi
         oB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749585; x=1793354385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkRpJaDqco6LEFQuZ/pvK2bkmZohErX1p+9QknBbkno=;
        b=Zrh5NJnNdbMPthSC9EI4lcukXO9PVfmu5DwkMtpZzpTKT5aAYsrdg6K6cbcFFKYweC
         08KZxFkW2A6hB4d15LUr0SZNg96hUSGpuQwH7l3Jj+F/tYB0ErG378MzrbGc+MOxhbvn
         bTxvIbCWX8xBy6OIoXJCU+9Hh8YxezWu8PmWQR0G0tmt0NF79TUO3cw90TaAbX07yyNx
         1D31jeY5mu6lfaAOhqSmVrGX9D7JphP+ay5coC3aqFmodZFEzamw7APvhsuYRwOjHz6u
         sTkcQpN8NxI0Ay2kXQN7X5TaqA/Uv1a2IqbLxN+mrMylTTEuZIiPtm+vsHYhDpWPgu3S
         D9MA==
X-Forwarded-Encrypted: i=1; AKwUvByD72lQchr6b5dMvwhfrts84NZkJUXJaUYr6WU5+Gy7yf8F0FR+yTW7TTA/GbOmnKAe8Z3iRgjuvfhV/wufntfn@lists.infradead.org
X-Gm-Message-State: AFq9FYJLT9/SJZDw9vIUkgxz6+6wMM3vNODCiIY2Ag/OI64YJUuc+/wY
	fQs5hI7YmvpNZQlmEYgiOZ6yFBTAGBQir+PAs2smn0gkSlh7ckPeII6f7xnOSsdyORfUPW8SAt3
	8TkaaPrB8/bweD3quPQOOsZq9s307PvP/aZYTeTEpi9Js+/WMky1oPNPTIVjn8gBzUuaEIMo5Xy
	nUYxN+8g8I9w==
X-Gm-Gg: AYBFou2wEX/tNkjwEoeaaVfDgn6Ugl85mPaJqPLQ/qf6EOikziaKXm3ytdQXtCd2tZT
	QqvbqDvipYF4Kq12FK51CL5GSNfeWVVfqugCEG1fAWlYB28RJ/CU9bipdxLYZg1fGuH2ilFpz9g
	GbDNBKci1185oei8hr7ompmg3BvQngluMEuMasEicGc+xA24Db4wYUV/v7YiVJMFWwqF8umCQAy
	4fk3DZUQh8h5Oa2KUqLUitfQOHFjUPXdvv2hOUGFwGaf5HcqNX3MKy9nzUPzFdWDZX1CS4XHFk5
	JaAVz+Dgrr4H+Y+DK3rBQG8CZKIN9rCCLfitxcTx7hMTAtBJmNbNx7g0JF19uuLY1/GgD/dGAS5
	Ntz3ozf3HPw0An8KxBZfXVqhDv5raFg==
X-Received: by 2002:a05:693c:829b:20b0:351:7883:bf47 with SMTP id 5a478bee46e88-369d8faf9a5mr4566198eec.0.1792749584958;
        Fri, 23 Oct 2026 02:59:44 -0700 (PDT)
X-Received: by 2002:a05:693c:829b:20b0:351:7883:bf47 with SMTP id 5a478bee46e88-369d8faf9a5mr4566138eec.0.1792749584342;
        Fri, 23 Oct 2026 02:59:44 -0700 (PDT)
Received: from [10.217.217.64] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea64sm7499288eec.5.2026.10.23.02.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:59:43 -0700 (PDT)
Message-ID: <01b1b1bd-2848-482e-af8b-8fab037c7a04@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 15:29:35 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/16] arm64: ras: Add probe/remove for arm64_ras
 driver
To: Ruidong Tian <tianruidong@linux.alibaba.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        zhuo.song@linux.alibaba.com, oliver.yang@linux.alibaba.com
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
 <20260602071540.3711528-3-tianruidong@linux.alibaba.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260602071540.3711528-3-tianruidong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX2PGRTlvr2J9R
 q3ez9FXrI0nEnk04ynSxxaU2HUKAHLkXSTyiHsb1OoOr8Ol3us2ZMKxpOwoRrOMtuCnuiuaFeTu
 aqtT6MK1wLw9+rxGckD/buDv+vbg2WY=
X-Proofpoint-GUID: QgWIi9b7t06qvpScgyfk2DyZHUSVRe_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX/+pzyDb4vMXw
 8erFA4HHQSKVRHvJLY+OAtjrkp5l9DHDhbSm1uIkng+Jd22dvytvFczo8qLUaPKbbqaOxZpyCc+
 FFBJaGuASApDDtLI8Vl6/Cw8mLVdDoYKf8cKEhjNoFENDcZKon0pZ1vQfKWjWBXRrJvncjdUXk0
 Rx9TRRWzRuyiEqvzGLknKuHi/j5DVrF5R+BUEQErUpwxNsWOipP58Z/mI1YK3S3bC8t0ToiumRL
 HkioeiyEOe90BCHKHYkFoizBOmZ5Am4zvbps1oGEbwLzq2bDNJeKe+N7P6VlmT1aPhwQ8ovilj8
 KK6HOIds9dcGF5/F5HInx0/yNfTwXvv/h+EdlfWzQr0HZSrRWlvTZsC+4sDPrwkg43jrBH/i6N9
 XjTiWwJnePrkYJv46gl/WvhjJGbWe9Y6+kmufKzFwOHUEo/wxxi0ZFtKhDduaMo9Jksx3gP/XBG
 2P0jyYkniOcGmZunH2A==
X-Proofpoint-ORIG-GUID: QgWIi9b7t06qvpScgyfk2DyZHUSVRe_I
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb3012 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SRrdq9N9AAAA:8 a=49fVXzMj59YXLoLGRmgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_025947_632304_753B9410 
X-CRM114-Status: GOOD (  20.96  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Ruidong,

On 6/2/2026 12:45 PM, Ruidong Tian wrote:
> Introduce the back-end platform driver that binds to the devices
> created by the AEST front-end. Driver input is taken exclusively from
> fwnode properties, so the same probe path serves any future front-end
> (DT, hand-rolled) without conditional code.
> 
> The probe builds two layers of state:
> 
>   - struct ras_node:   one AEST error source
>   - struct ras_record: one error record inside a node
> 
> This split mirrors the hardware: a node owns the shared MMIO/ERRGSR
> window and policy, while records are the unit at which errors are
> reported, masked and polled. Later patches plug interrupts, decoding,
> storm mitigation and userspace ABI onto these two objects without
> touching the front-end.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
> ---
[...]

> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_ARM64_RAS_DRIVER) 	+= arm64_ras.o
> +
> +arm64_ras-y		:= ras-core.o
> diff --git a/drivers/ras/arm64/ras-core.c b/drivers/ras/arm64/ras-core.c
> new file mode 100644
> index 000000000000..b5448f4a841f
> --- /dev/null
> +++ b/drivers/ras/arm64/ras-core.c
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ARM Error Source Table Support
> + *
> + * Copyright (c) 2025, Alibaba Group.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/ras.h>
> +
> +#include "ras.h"
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt) "arm64_ras: " fmt
> +
> +static const char *const ras_node_name[] = {
> +	[ACPI_AEST_PROCESSOR_ERROR_NODE] = "processor",
> +	[ACPI_AEST_MEMORY_ERROR_NODE] = "memory",
> +	[ACPI_AEST_SMMU_ERROR_NODE] = "smmu",
> +	[ACPI_AEST_VENDOR_ERROR_NODE] = "vendor",
> +	[ACPI_AEST_GIC_ERROR_NODE] = "gic",
> +	[ACPI_AEST_PCIE_ERROR_NODE] = "pcie",
> +	[ACPI_AEST_PROXY_ERROR_NODE] = "proxy",
> +};

Now that the ARM RAS core framework is shared by both ACPI and DT
platforms, should we consider dropping the "ACPI_AEST" naming in the
common code and replacing it with a more generic prefix maybe something
like "ARM_RAS" ?

[...]
> +
> +const struct ras_group ras_group_config[] = {
> +	[ACPI_AEST_NODE_GROUP_FORMAT_4K] = {
> +		.errgsr_num = ERXGROUP_4K_ERRGSR_NUM,
> +		.size = ERXGROUP_4K_SIZE,
> +		.errgsr_offset = ERXGROUP_4K_OFFSET,
> +	},
> +	[ACPI_AEST_NODE_GROUP_FORMAT_16K] = {
> +		.errgsr_num = ERXGROUP_16K_ERRGSR_NUM,
> +		.size = ERXGROUP_16K_SIZE,
> +		.errgsr_offset = ERXGROUP_16K_OFFSET,
> +	},
> +	[ACPI_AEST_NODE_GROUP_FORMAT_64K] = {
> +		.errgsr_num = ERXGROUP_64K_ERRGSR_NUM,
> +		.size = ERXGROUP_64K_SIZE,
> +		.errgsr_offset = ERXGROUP_64K_OFFSET,
> +	},
> +};
> +
Thanks,
Umang

