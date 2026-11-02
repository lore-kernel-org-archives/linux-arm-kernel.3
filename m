Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C06606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hHZs7En2;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lK1UUgMM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SQ2mxOMr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gs8th4SEozRoaQAfmCE6xTxW3o2poAMT5v1gu4UQZJE=; b=hHZs7En2VnapT5
	v3SXGYmhQ1Rx388q7O53u2VYsVwPqQxzqEf6RH7/nQtNzz3Xv/uF6IiLrWbhVPn4r1jGeAwlxsfTK
	+ZuOFIX+FkWLAB93MzDOENBUJJ4xrKD24AN7NemzK5HY0a2T/KxVxq3g6dzfXEmldP39/u6SPHvDQ
	rK1Ir9qPVxULYDHZHBb0z2dQctep4VAKhXoKi5vrsr/5CqY7NfsyDUonAFAEFfcFHhawPzQk2Mbul
	5tSw+nV/zEpaGwlJXJTbbQC/DBAcxjUI+Moyp7Q/bAmZ0iRNxEG0Bgh0q8mam6bUgroDuz/PMrPMr
	TTPhK28DELpkRh0w7qKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyAX-00000000FHu-36Yc;
	Mon, 02 Nov 2026 19:58:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyAU-00000000FGp-0kig
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:58:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2IuWHd558578
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 19:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gs8th4SEozRoaQAfmCE6xTxW3o2poAMT5v1gu4UQZJE=; b=lK1UUgMMQ4M+nSdm
	jUtNwcV5tUBSKR6VI2R4h7mhNBNlagdmdy+T5VFiGgfsxWwW9WmoEAi06aev/fp7
	DwlALsquMaMk+4vq0QEGuo4DovwMQcJ1vOTfzJDPuaeDoQJvZSe5yMiGDnygDQFm
	5wgXz77DMcZ+2/QP1iNQskQVWiSdE0xa8iktbl/N59BeMM4mETI/ieHpHjHzzTPT
	zGaR32W4qFzp11ouwiyk6C8xUCa+68anUg7SnvqT/wqjqiHlxcxmMHG4U5PVR5h0
	oDkbpKnLfSxwsCrEy88R0PEqhaGRQLOCokS7Bpvm2XjOlV6L0fXx0East22/lbKR
	sbYoLQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq087089q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 19:58:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so4691535eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793649486; x=1794254286; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gs8th4SEozRoaQAfmCE6xTxW3o2poAMT5v1gu4UQZJE=;
        b=SQ2mxOMrOGv9Q1ZKtta1GGNCJfSnW9lRQbl8QF3BTCI3fF7ISATe8/2Viq9OJnkLDL
         X44YAy9M+DSoyuKPfPKFjsbqbsHYxcUszpdKl/S+rK94WLs/mRCj17M+sYgLbrroLpk1
         16PcakP2K5AjDlTsaOWNtS4mlma4W8tHIaJm4NuHZGQmZAXLTm1mUAyoZ94uEZW6ZFz5
         6R0n7IbvVOknM4dIEsJIpSi+ebmIZawxQfjK4/4dU6oJ61KYWHX4YxYwMPFiIIVIuZdH
         PDb0wpJPtwOepGfBl/2bVkv0FyrX888Fy62r/z3DdIqhDRY6PgESFt5PFszSAR7GZ3YW
         eNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649486; x=1794254286;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gs8th4SEozRoaQAfmCE6xTxW3o2poAMT5v1gu4UQZJE=;
        b=NM1D8lnV8b2WBvn/XoraH0+T6WW74B8qMeiPzKNCYKDdRNE2nKDWOsiQp2BhkQC/hq
         rHmrvO1f6D6ANCVTd3DUTTxDE5OP6zdeKDzh1V7MVHJ7yQGovE+0CIGsfzaz7srCPaAC
         Rgp4vSFUOga7EcZ6rNJyw61NKnt/0gMJVMs+seXP2hT3g3+ZtymOQgs/w5uFVJ6zIgOr
         Z6D8FYd/I5eA3SPxqqvQ879tx7Gb3HysZD2f4gU8hPpqcc1RclfU+vJ4nIKEG4Z3qwbR
         zDonIXNgz/F9E7ffKFX97lGvy4oTCE99Kryk90N3I+kbUvL/3B0fdLnW/b9i7XyvEJAF
         uBkQ==
X-Forwarded-Encrypted: i=1; AKwUvByLanTQW0T8pdgHbYv0qFBsF0AcuJF+olc+DsMtOZskzT6pzlTO9tFWpoW2a7xtd+Ov73TKjSKhXISx9CZqu2Wr@lists.infradead.org
X-Gm-Message-State: AFq9FYLgApGlblyREqN872k2NwmzddtZa139+Ey3w+gc+H2WPqzVVFWd
	X43KmdXhSRm83ekoheVtysyFTCCF4+jOtYHwE93KF6V6FGQX82PNP//aVSR2ranvszwzd+HAucZ
	/kawAJuwjTKnhuVaJ3DJ30+R8648NYX59HcbkhIRjDxfpsX3EOqQIV5D2OfDKSHlAWxsw8YgTLg
	RADA==
X-Gm-Gg: AYBFou0mf/TVgCuBz/VMipAjknumgrLbaiq4gR60YPJxyaTh51QiKt90+mejiPYboMA
	vAKf1d6qYBS8X8mk5QxGYb8TJqV+iFzHEOhc4H+6sVrm2XxfoAP71+Zazd813d4ewVEMn8vJ4sN
	xHB/EDMJbhGYfBwUc/4oaACHhbRYHuIxsgw7Xga7QBP33ELOuuxPbcR2AUtQ3WcRt5By8miI7JN
	TFuKzXQSm8XmLdEHjeu0MrVkzF/vtFF7s3U5ex8N+hOSc/rVVESAxHYSBm65lDV99MP7V0BeNfg
	6Ii0Xali9LtCPa9+DDNW85NJDM+OiPOfk15s4orasFKS53TcYoVQZUvUVbCpc2fID7xZmt84L9B
	9G81QTdsaPUNfvOyyL7TTCQusAuBiakDGBppdjkdE9+vqdZJ5HfnJUFoJlrfAPkmMEtd1BfZmKd
	cdVeACwKRBQ8o5SB/3GMIncA5NDQ==
X-Received: by 2002:a05:7300:7a83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-36a42362460mr15804686eec.10.1793649485223;
        Mon, 02 Nov 2026 11:58:05 -0800 (PST)
X-Received: by 2002:a05:7300:7a83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-36a42362460mr15804647eec.10.1793649484607;
        Mon, 02 Nov 2026 11:58:04 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm46910086eec.25.2026.11.02.11.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:58:04 -0800 (PST)
Date: Mon, 2 Nov 2026 11:57:58 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "santino.wang" <santino.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
        <arnab.layek@mediatek.com>
Subject: Re: [RFC PATCH 03/11] soc: mediatek: dram-ecc: add tracepoints
Message-ID: <20261102115758.00005a16@oss.qualcomm.com>
In-Reply-To: <20261102092334.138759-4-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102092334.138759-4-santino.wang@mediatek.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3OSBTYWx0ZWRfX3k2bjkAFruIZ
 K+ArS5X1Xc0LanyVjDgDM3sPBYqfpw2UagPeCPiZUmVHCbK4vLF3YT7gilgJ/jRvFnLPXsv1c08
 7bN/4ZldAKeFGr0/Wx+YEr7GURXFqfA=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae8eb4e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=sXLBpHRKkfUpVznMtjYA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3OSBTYWx0ZWRfX221K+6S+Z/kP
 MfxpRfN+VXODbWqu1z/Paw76GwVFnBUpMxAdc9a6d4UJ2PcAAW8gH91H1tXvbz6rxDRk59tjS03
 GSJQn80+er9sXt6tnl7UkAlTUnYGDa4SLgyJ5TRfWu//S9hNIb7Qe2OmFYy9XKse5iZtuoe0jVt
 2QxdYAcqKQeeqxy4yraRmhxjyrU7l2DElid3eoqWfR3Hk8txFOI5/gIjoGW251VzrcdBzQco72/
 gvsNUisd/PGpPUeSw0hKEBU4N/qC35M3L959oKruwoviiRafxvSCQkGB+Ggr8PLofPRiC4ow2W5
 j/SBd1/N1yHaN/iWwZZIRTDiywrkmVIEOAaWbJ4J88GUXPzjx4p2NinzehWmLgREaHmAbT6ADCp
 wNMYJKLwf8f33X5l8rJmj4V61QOVQkqYYFra3MeXNHJKk+4vNFQpCQW9wOAqOzBXAIBeHA+Oce1
 bmUdRxi2hNKRShoMiEA==
X-Proofpoint-ORIG-GUID: yNdOV2YEGtOJN272XpqwZYnFxLHDr6vt
X-Proofpoint-GUID: yNdOV2YEGtOJN272XpqwZYnFxLHDr6vt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115810_345229_BEF9BD74 
X-CRM114-Status: GOOD (  17.22  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.c b/drivers/soc/mediatek/dram-ecc/core/trace.c
> new file mode 100644
> index 000000000000..9a8b20e48069
> --- /dev/null
> +++ b/drivers/soc/mediatek/dram-ecc/core/trace.c
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + */
> +#define CREATE_TRACE_POINTS
> +#include "trace.h"
> diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.h b/drivers/soc/mediatek/dram-ecc/core/trace.h
> new file mode 100644
> index 000000000000..d603fc38f0a7
> --- /dev/null
> +++ b/drivers/soc/mediatek/dram-ecc/core/trace.h
> @@ -0,0 +1,119 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026 MediaTek Inc.
> + */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM mtk_dram_ecc
> +
> +#if !defined(_TRACE_MTK_DRAM_ECC_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_MTK_DRAM_ECC_H
> +
> +#include <linux/tracepoint.h>
> +
> +/* driver lifecycle - state: 0=init, 1=exit */
> +
> +TRACE_EVENT(mtk_dram_ecc_lifecycle,
> +	TP_PROTO(int state),
> +	TP_ARGS(state),
> +	TP_STRUCT__entry(
> +		__field(int, state)
> +	),
> +	TP_fast_assign(
> +		__entry->state = state;
> +	),
> +	TP_printk("%s", __entry->state ? "driver removed" : "driver initialized")
> +);
> +
> +/*
> + * ECC events - spa/channel/subchannel/rank/bank/row/column decoded from the
> + * ECCERR_INFO0/1 entry that determined severity (see ghes_notifier.c),
> + * mirroring ATF dram_ecc/mt8992/fiq.c's decode. No agent/master ID: ATF's
> + * GHES vendor section doesn't compute them (see mtk_dram_ecc_event.h).
> + */
> +
> +TRACE_EVENT(mtk_dram_ecc_ce,

Why push these through a custom tracepoint?  This look very similar to what
is in the Memory Error Section 2 CPER.

> +	TP_PROTO(u64 spa, u8 channel, u8 subch, u16 rank, u16 bank, u32 row,
> +		 u16 column),
> +	TP_ARGS(spa, channel, subch, rank, bank, row, column),
> +	TP_STRUCT__entry(
> +		__field(u64, spa)
> +		__field(u8, channel)
> +		__field(u8, subch)
> +		__field(u16, rank)
> +		__field(u16, bank)
> +		__field(u32, row)
> +		__field(u16, column)
> +	),
> +	TP_fast_assign(
> +		__entry->spa     = spa;
> +		__entry->channel = channel;
> +		__entry->subch   = subch;
> +		__entry->rank    = rank;
> +		__entry->bank    = bank;
> +		__entry->row     = row;
> +		__entry->column  = column;
> +	),
> +	TP_printk("spa=0x%016llx ch=%u subch=%u rank=%u bank=%u row=%u column=%u",
> +		  __entry->spa, __entry->channel, __entry->subch,
> +		  __entry->rank, __entry->bank, __entry->row,
> +		  __entry->column)
> +);
> +
> +TRACE_EVENT(mtk_dram_ecc_uce,
> +	TP_PROTO(u64 spa, u8 channel, u8 subch, u16 rank, u16 bank, u32 row,
> +		 u16 column),
> +	TP_ARGS(spa, channel, subch, rank, bank, row, column),
> +	TP_STRUCT__entry(
> +		__field(u64, spa)
> +		__field(u8, channel)
> +		__field(u8, subch)
> +		__field(u16, rank)
> +		__field(u16, bank)
> +		__field(u32, row)
> +		__field(u16, column)
> +	),
> +	TP_fast_assign(
> +		__entry->spa     = spa;
> +		__entry->channel = channel;
> +		__entry->subch   = subch;
> +		__entry->rank    = rank;
> +		__entry->bank    = bank;
> +		__entry->row     = row;
> +		__entry->column  = column;
> +	),
> +	TP_printk("spa=0x%016llx ch=%u subch=%u rank=%u bank=%u row=%u column=%u",
> +		  __entry->spa, __entry->channel, __entry->subch,
> +		  __entry->rank, __entry->bank, __entry->row,
> +		  __entry->column)
> +);


