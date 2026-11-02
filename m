Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073BB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3dpGw5OS;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RPWzfHtf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LEPWysxF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0dgvto+gtIB4dqOWraooa/QVMSNJoBJ+rpOpWN/Iitc=; b=3dpGw5OSfOjX7s
	pjeb98d9wgc0zK2RM88UPL5XKlWuCVkirx77PI2zYpzhmAZV+BjpqfUzHf2DR1v5w+kk7sh+rl7+a
	l/Z1ow61Cu4hH2Z47X69yrG98wW1Yp2eUFEu+YsNXzOD5x1Uo6OImZzrtpNiIFYKD/qNegHlusn81
	BcSbSqqRPpCq3c/wU24A88A7mbaKeWPMS3soR3Lj3PKin3LKSn+GMFWxYhIx6iZ+pf6LP8ZjMdyLa
	2H5Bn2mfwmshJx6dKP+khxCHc6WG97PcUYbDVqKAgmuUaFKlbNws1MVcCXhIv/0E1kVuOw//tQpkd
	oh/yUJoV4fTVZsWCUwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNylt-00000000Lm5-2Y3G;
	Mon, 02 Nov 2026 20:36:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNylr-00000000Ll5-3NvO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:36:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6CbG688572
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 20:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0dgvto+gtIB4dqOWraooa/QVMSNJoBJ+rpOpWN/Iitc=; b=RPWzfHtfJENBbipS
	LKoDxoWUi403tokUQ+xVyD3QL/EsGwcNzV9+ooEbJOzm1xDPrXrqXWFyO3y/ScQt
	M+mpoMePex/U6ctvHQpTymggJ37WQ3kDk2jOJBgHNMgQbvGcmuvPvfTcadxq6On5
	DpsDkUwdXMzx7VhUjt/G+u68pO+9bT5r9/dmiBdEx+MJDSPAup3QluduNNcJ0AIX
	7oWZPwftQBQnRzKDsuR1md4j9cGmWz/eXrnEMOXYLF/pD5/DhXGij/zr8TWKUIo9
	4LWDrHW/lduu0mR27HxLL/3fnQ4xxEWzr8fTjGW7ZG/sPHBLzgLPqZel/qslFpVu
	KfCTeA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfeb4mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:36:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-15c16792146so1874814c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793651807; x=1794256607; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0dgvto+gtIB4dqOWraooa/QVMSNJoBJ+rpOpWN/Iitc=;
        b=LEPWysxFXTunsjvDTLHdkMjPwcmiv2F+qxfj4agCIkbqNNqBbkWNo1ayD4cBYAFZUf
         q7aufqkc15HzOigOQzovS3J5rsOAMvbSpaplddYD7CiA2nnLDI6I9dGm14zGPwh7tKMa
         LDswEjHTB8Hznd4EAqicAq/kK6EuXAFN5kBJZUOQRaHwYVN1xks2iIyX2F80qGlAhk+X
         SHiqJm8U3a/g7lAqQRAQ23q2+AMfrV0nT1WgdwKy8ZJFBAOY/Z49gUqwWqyIeHjNu/q8
         naEv1siFoqPoUVUuaYmIkE8DpINwSFEgSzgEMKWn3PfK8Ez4B34asgePIQdyhf3yzpdE
         m2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651807; x=1794256607;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dgvto+gtIB4dqOWraooa/QVMSNJoBJ+rpOpWN/Iitc=;
        b=ljYTlOuwIMxNmiKfmQ0qZCs1XEb3I9Rcs8ooxIQTxhX1MoG5Tjcj89UWU1suWEoMk4
         agYkWQhtns/ZQ2fzMxekbYHmE9ljbXjlFVNOF7L9dEoKoTfRO2F9WppPpLPNjWRdzNuP
         EKaWW+h+Hqt+ipORy7hgeqnpV2zfvk9/G1+j3+7co8kkP1a0YLJTSK3z8gjUvGHOnPB+
         9pRaPUv6YCOfRO2kthJ8FrANahwbElZNLxXPrgdlaY8wcXJMgwWauQYIs5+1aLpvb516
         bimtr7PUquNPPTCGcSoCFuNsMmN/eWNKY1JrNgQ10kZDKtnn+a6MyYpdQuQFQS/H8iLB
         Yb2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZbOJiNwE6kk6kxi9TuicqngLBmTT2Mq0lpM2MBeuV+Rh2X/fp0tQDKYmcjjH8ATiF6R6RwmtXIvoy5KoKneKt@lists.infradead.org
X-Gm-Message-State: AFq9FYIQM5XNT9ct8xGy7/94IbNFaaoALgLRhzp4TdtOVcdnNvgSN4h3
	bzdZEqDewrZ8xRlNKEfMjITqOp8ltZaV0lCWH44lIhUTu1CIDYROJhb0ezcHDGVaucS2Oteygtb
	X7VqiXKq2IuaCtObBOkafFn9iEJfd01KcZz+zkOw1yf1c5Qu73TtJMyAAtmWDgzKJ5KJNYoFFH5
	bnNA==
X-Gm-Gg: AYBFou0w3fey9cOwVsuTyy64JnG7ebg4ZlDa5/Mm0uxg1SOom+nyHZExDqSxcXuYHtO
	tFcLavjCxJarA5qB7H8Pj5+FH9RODsBX7P/gf5q7x/blUkexwHZEbuypU2sbD5xMIvB6FFUXKMP
	24pL9aQ/rjPCZ4OeawRflHqfvzpu3mxjKuWbyu1ZsjrK2EC8wTiSJtbpCB5xUJDApxbXOnLlnbI
	nlei3SSyCUPZ1DqzpQ2FHJnfUmpNfZTkPTF5/Jw2/0FTzhIG6MizJxvjnfTG2qPT7MPnqJ+GM+Q
	QUcLnirF+GKKkUeXpbHRhEz1mqcbFbcrj1xujE3DV05yo+oqwCGBbgRWxOlk3j3xgji7C48PoED
	Wmxdymnc3c5DlWe5B/6vbF3tErxLyuSRP6Qixb2cO63VIsq6jEgjIVa+pRgr+444osVAVao8xvI
	GSgX+VvV9W/XwpWSnepwCeX8lU5Q==
X-Received: by 2002:a05:7022:7f13:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1ad106817d8mr15772333c88.3.1793651806359;
        Mon, 02 Nov 2026 12:36:46 -0800 (PST)
X-Received: by 2002:a05:7022:7f13:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1ad106817d8mr15772281c88.3.1793651805604;
        Mon, 02 Nov 2026 12:36:45 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm61679802c88.10.2026.11.02.12.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:36:45 -0800 (PST)
Date: Mon, 2 Nov 2026 12:36:42 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "santino.wang" <santino.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
        <arnab.layek@mediatek.com>, Tony Luck <tony.luck@intel.com>,
        Borislav
 Petkov <bp@alien8.de>, linux-edac@vger.kernel.org
Subject: Re: [RFC PATCH 00/11] soc: mediatek: add a DRAM ECC error handling
 driver
Message-ID: <20261102123642.000044cf@oss.qualcomm.com>
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8f45f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=mpaa-ttXAAAA:8 a=m260jWFFa7gU3xnM47oA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MiBTYWx0ZWRfX3f29iCalrvIg
 rMc/QlUI9Xk2JnV4uPysbx5p0b1BrPpjLrBoTtO1RfNgJqD0a8nQaHQM6Ke/cDdbUqA3AifFx/p
 WKWk+eSQebBsnblGEf+2HPyE2s7ZgxyHjEG+dVKSbXu8qsSlKOlztVZrzmprdWJg005KEAXQQWm
 ihTVCzL9OcRxoNL7OnSyWiYHbVqaWH4STmmB/opvOhzk2M0xIeQ/HnRR9MI3M5IacSeDNZVNHWo
 FZ06Mpv3KvOWTPmrTzOQcYO2dH0S/LRuEdJylOEHHDp321cMFl6XU/hsz76vwhdzsKDOZR1o8gl
 G/iLUuO7ExHyz3AHt+AVfp6UT4qydleIixRtqL2JRI9fHzkLAZSQAb9kPMkJqAOHnCvm+HXGXDD
 QAhtQPUOAjxhvUYWmnOwUe0m4kHUqGwoIvick7MPmV9THNzxhxRpX+DM35J5phEa1J4F7mrZI8l
 ElHeghv3GUn0RASzX6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MiBTYWx0ZWRfX8M4p77irlLkr
 eHVfVSoNcCWUjamAddgX7kfL45nSpDtwCp3i+xzCNzH+A88etd4lFCovTCZzGqFsZ/2HfxoSZ7M
 U+lvSvUcioOiuQtzbgHwb/K54oBAlQA=
X-Proofpoint-ORIG-GUID: 4E8bEviZm3FEY46GSRzLN16_oIlz_z61
X-Proofpoint-GUID: 4E8bEviZm3FEY46GSRzLN16_oIlz_z61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_123647_850135_FF6CF802 
X-CRM114-Status: GOOD (  40.56  )
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

On Mon, 2 Nov 2026 17:23:22 +0800
santino.wang <santino.wang@mediatek.com> wrote:

> From: Santino Wang <santino.wang@mediatek.com>
>=20
> On the MediaTek mt8992 SoC the DRAM controller (DRAMC) raises an interrup=
t for
> every corrected (CE) and uncorrectable (UCE) ECC error. The interrupt is
> owned by the secure firmware (Arm Trusted Firmware at EL3). It reads the
> DRAMC error registers, applies the error containment policy and the CE
> storm protection, and hands the error to the OS firmware-first as an ACPI
> GHES record in a buffer that UEFI describes in the HEST. The OS is
> notified with an edge interrupt that the DSDT delivers through a Generic
> Event Device and a Hardware Error Device (GSIV notification).

So far this all sounds standard for asynchronous error reporting.
I'm assuming you have a something else for synchronous consumption.
=46rom a Linux side of things we just care that error record shows up
and is signaled via GSIV (with normal Generic Event Device and Hardware
Error Device in the DSDT I guess)

>=20
> The record carries a standard Platform Memory Error section and a
> MediaTek vendor section with the raw DRAMC error registers.

I'd like some details here on what those raw registers are bringing
to the OS wrt to handling these errors.=20

What extra info?  I see you have a subchannel in there, but Memory
Error Section 2 brings that.  So why isn't this being reported
as a standard CPER?

> This series
> adds the driver that consumes the vendor section through the existing
> ghes_register_vendor_record_notifier() interface. No change to the GHES
> core or to arm64 code is needed.

Given a lot here doesn't sound mediatek specific it feels like it
shouldn't necessarily be in the vendor defined path.  More discussion
of why you have gone that way would be help.

>=20
> The driver
>  - decodes the most severe error of a record and keeps counters, also
>    across boots in EFI variables,

Interesting.  How does this compare with just making it a userspace problem?
Perhaps you can't do that for some reason but it would take a lot to
convince me that it makes sense to have an upstream solution that relies
on custom EFI variable path.

>  - isolates pages with memory_failure(): immediately for a recoverable
>    UCE on memory that Linux manages, and for a page whose corrected
>    error count reaches a threshold (leaky bucket); memory owned by a
>    device is only reported to its owner,

This sounds standard, so I'm missing why you need a vendor driver for it.
Please provides some more info.

>  - lets in-kernel clients and user space (generic netlink, tracepoints)
>    follow the events,

Why your own netlink for this?  These are memory errors so I'd expect
existing paths to be sufficient, or perhaps there to be a need to
extend those as Pierre is doing with the Memory Error Section 2 series.

>  - exposes the containment policy, the storm protection and per range
>    severity overrides in sysfs and pushes them to the secure firmware
>    through a vendor SMC call,

The pushing of policy down to firmware is possibly something that needs
a custom driver.  I need to think a bit more on that and check a few things.
Input from Borislav or Tony might help here.

>  - after a fatal UCE (GHES panic and reset), finds the error in the BERT
>    of the next boot and reports it through the mc_event tracepoint.

If this were using the standard records that should just work. What
is missing that you need?

>=20
> The driver depends on firmware that is not part of this series: the
> secure firmware provides the SMC interface used by patch 2 and writes the
> vendor section decoded by patch 4. The firmware side (the TF-A and
> edk2-platforms changes for the mt8992 SoC, plus the preloader that keeps
> the error across the reset) is being developed in the vendor's BSP trees
> and is not published yet.
>=20
> Open question for this RFC: is drivers/soc/mediatek the right place for a
> driver that is built on GHES vendor records and a vendor SMC interface, or
> would the maintainers prefer another location?

You already got a reply on that. Almost nothing should ever go in drivers/s=
oc
and definitely not something RAS related. +CC linux-edac, Borislav and Tony.

Anyhow, always interesting to discuss expanding what we do for
memory error handling, so I'll be interested to see what other feedback
this series gets.

Thanks,

Jonathan

>=20
> Testing: each patch builds with the arm64 defconfig plus
> CONFIG_MTK_DRAM_ECC=3Dm on linux-next 20261030 (W=3D1, no warnings).
> The series has been tested pre-silicon on a Palladium emulation platform.
>=20
> Santino Wang (11):
>   soc: mediatek: dram-ecc: add the DRAM ECC driver skeleton
>   soc: mediatek: dram-ecc: add the SMC interface to the secure firmware
>   soc: mediatek: dram-ecc: add tracepoints
>   soc: mediatek: dram-ecc: handle GHES vendor records from the firmware
>   soc: mediatek: dram-ecc: add error counters and the address lists
>   soc: mediatek: dram-ecc: keep error counters across boots
>   soc: mediatek: dram-ecc: add containment policy and storm protection
>   soc: mediatek: dram-ecc: add the corrected error leaky bucket
>   soc: mediatek: dram-ecc: add a generic netlink event interface
>   soc: mediatek: dram-ecc: report an uncorrectable error of the previous
>     boot
>   Documentation: ABI: add the sysfs attributes of the MediaTek DRAM ECC
>     driver
>=20
>  .../ABI/testing/sysfs-class-mtk-dram-ecc      | 182 +++++++++
>  MAINTAINERS                                   |  10 +
>  drivers/soc/mediatek/Kconfig                  |   2 +
>  drivers/soc/mediatek/Makefile                 |   1 +
>  drivers/soc/mediatek/dram-ecc/Kconfig         |  19 +
>  drivers/soc/mediatek/dram-ecc/Makefile        |   3 +
>  drivers/soc/mediatek/dram-ecc/core/Makefile   |  20 +
>  .../soc/mediatek/dram-ecc/core/addresses.c    |  88 ++++
>  .../soc/mediatek/dram-ecc/core/addresses.h    |  13 +
>  .../soc/mediatek/dram-ecc/core/bert_check.c   | 240 +++++++++++
>  .../soc/mediatek/dram-ecc/core/bert_check.h   |  12 +
>  drivers/soc/mediatek/dram-ecc/core/counters.c | 336 ++++++++++++++++
>  drivers/soc/mediatek/dram-ecc/core/counters.h |  29 ++
>  .../mediatek/dram-ecc/core/ghes_notifier.c    | 377 ++++++++++++++++++
>  .../mediatek/dram-ecc/core/ghes_notifier.h    |  22 +
>  drivers/soc/mediatek/dram-ecc/core/main.c     | 113 ++++++
>  .../soc/mediatek/dram-ecc/core/mtk_dram_ecc.h |  27 ++
>  .../dram-ecc/core/mtk_dram_ecc_event.h        |  47 +++
>  drivers/soc/mediatek/dram-ecc/core/netlink.c  |  83 ++++
>  drivers/soc/mediatek/dram-ecc/core/netlink.h  |  14 +
>  .../dram-ecc/core/policy/address_range.c      | 120 ++++++
>  .../dram-ecc/core/policy/containment.c        | 107 +++++
>  .../dram-ecc/core/policy/leaky_bucket.c       | 277 +++++++++++++
>  .../mediatek/dram-ecc/core/policy/policy.c    |  57 +++
>  .../mediatek/dram-ecc/core/policy/policy.h    |  23 ++
>  .../dram-ecc/core/policy/storm_protection.c   | 137 +++++++
>  drivers/soc/mediatek/dram-ecc/core/smc.c      | 137 +++++++
>  drivers/soc/mediatek/dram-ecc/core/smc.h      |  55 +++
>  drivers/soc/mediatek/dram-ecc/core/trace.c    |   6 +
>  drivers/soc/mediatek/dram-ecc/core/trace.h    | 119 ++++++
>  include/uapi/linux/mtk_dram_ecc_netlink.h     |  44 ++
>  31 files changed, 2720 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-mtk-dram-ecc
>  create mode 100644 drivers/soc/mediatek/dram-ecc/Kconfig
>  create mode 100644 drivers/soc/mediatek/dram-ecc/Makefile
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/Makefile
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/addresses.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/addresses.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/counters.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/counters.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/ghes_notifier.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/main.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc_event=
.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/address_ran=
ge.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/containment=
.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucke=
t.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/policy.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/policy.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/storm_prote=
ction.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/smc.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/smc.h
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.c
>  create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.h
>  create mode 100644 include/uapi/linux/mtk_dram_ecc_netlink.h
>=20


