Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F47606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ATYEJiP;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C9Sb+gxV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AFs2NMAE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/iC7HNXDJ6lBSX5huz5H2PlCJddX7rIa1Dt4IIRe1TE=; b=4ATYEJiP6RFhEG
	Rvl/TuYQcWvN9lUwop0z4EbFx6oz8C0yo1Zrb8LQI5LpzaJSkwquBW1kV+f1ouub4bNIvKiXkSihm
	vS9UjJMqVpoynX0WfCio15NhZzPPNsuhlNNvI4re8SBFq+cXpSazLdsFIlU44CJfJbHeF9ia8Y9s7
	Yc7KZOuSD4fv5x3L2jFMX+cmlUYQfIEbbyMGUj1VqAVEIe6hgzQsOevAjM6zHwqoWKNfxmAftyjAE
	Bkn6gbXaOSdgnl60icMw8lQbjhPrIG7FbtdC6T3RiOlaaWYBWWmYg+N6yDZoJIlq4tabUwkREwK22
	8hVae4TaV5f566Fcsfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNytW-00000000N9N-3Gx4;
	Mon, 02 Nov 2026 20:44:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNytU-00000000N8O-209J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:44:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K65nn3842169
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 20:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iC7HNXDJ6lBSX5huz5H2PlCJddX7rIa1Dt4IIRe1TE=; b=C9Sb+gxVY/iVMo8D
	ZF50x6C/8yMC+bcuPpOZ18Fymp7G0CKhYYTNTfZ2E9pV40tXstymOuKENSfrSLWO
	ApbCTJ+LTFJWJ6mnPXz9W9qhE5ugNH9xaRnhajnTYQlGYR7qAVZUOJvP4rwxhnv0
	mHuno9ve3Jee8REFu+mAbU21Amq3zObCB8usq0CB3dxKas8KfUrXk8ES6cD4Uq3A
	QLL6qlXkPRsOd6Lv6yr8V9PJC1LVHf0DldhQk6eUokBoBmHitL534E9TqIudwq5X
	q0K61PujbUbzGvQknZf/IDJk/KJkp7SkSFLsl37pxmGbwX2UYh+TlxMo/BxtzC+b
	+WItDw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavjd4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:44:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so14783885eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793652278; x=1794257078; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/iC7HNXDJ6lBSX5huz5H2PlCJddX7rIa1Dt4IIRe1TE=;
        b=AFs2NMAEFpP4wDejhOzX/mE4xtPtp9Mh3OyBUAiaWGJAnKtuB2ZTmdT9GLt9ldekpn
         KoD2x7uxfmLHfWkVcJ2M8soYdUNLADB9npIQvUmoowbAzSEt/myC4n6Y1Sgw+5xXq5mf
         3m0mLOTaFm/VZ+CkziNpKJoFYv1qaUUAz6HgkNP9JW4xCPQaAcRoTmSDd0Ef0XtYuNBU
         06RFGjk1FGGdbj0fd3pNQ1kZVq6u6b0/WlL5ZPofn82dkgPYZzrbx2VPEnRTQ1oswsWx
         iv3LGVZD9LfCrPgOKVi5XjneolEulLnvjVSNDB6LaDUuhYb9V9K+YJySLlU7GSBLGp8N
         Sgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652278; x=1794257078;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iC7HNXDJ6lBSX5huz5H2PlCJddX7rIa1Dt4IIRe1TE=;
        b=0G0MxcvJIYVEstzyUAus8ZrlMyRA/BTGf7bKIkaWEljTbtjjc8kI5tj8CiPCAGEe9H
         kbJYz8sohwyeU7Jr0yPOxaKNaQPILcyyVHnS5stk7yqN/jj/uJK0wZlYvvuHYnb8ReF6
         IsAafKhuXo2uPLiBgf2RDJtq3wIorp0MNavi6qjTvt+69Xv7EA5kuKPCqyhNkeRzgrmU
         7PzobY6otHOaRQurZN4vTYmfy/RcIMZ7yql8FO94fsb1RvyCBOnENQC1chppViU92AJw
         q57UE349jU14X/koBAmDfe/EkOlQstHdKVyQA5BFqeHRZbTVcE029WYucUDTnm+h+9u+
         Nq4g==
X-Forwarded-Encrypted: i=1; AKwUvByMO6fbrUdT0cFfEOklPJbhBE+jcn63MnvJ+GazCmo3b9WpklPAttt6UDknmWf1aSTRFQTP8mp1yy/XxC1ADgXW@lists.infradead.org
X-Gm-Message-State: APuU4Z/N1FIE5njs1fHjSXgPIf9D13+ChXSxfvTAefDXl/wMaL5KGm/8
	uAiXJWzT3EPgQKb/GLRdMpEKsiNvsrO+vlrZKbCWjO039yToe0aImRbiWqFeAYEaf8O/cA5KOoK
	bGcAruGIb11laxYrvoAK1YAUYOypvwn/V3eZiP6Wv6s5RnAnqmIUvK/DE8FFeHyJzblfN3rZx3T
	/0VkuMGhwoOA==
X-Gm-Gg: AYBFou1p9yXFqCvhcz3pjNItNDxDCI3Gf+tSiKrkxmCMXrKEE5uaLf9QE1nUOHLpKZc
	Eew43+HPXsFAS/sPnrkKWd4BbE7EV0ULAS4wFnCLo35gTX49TFehlFvDWbvnfkZ0lO2m4Butxw/
	+fNqUQ3ALUJ+GkUJBJZj22w0r4/PJlWL9N7LqJZTXnPRWpOk2f2DFpzvfsX74ZbRi+lQpWI6PnF
	aYq4VU0rLFHH+oAgnblrtIqOWjEO5d+CwgxDUuhho26HOQBkBfUGBwrHZl8rJX8Bi8X2frFp0ph
	zekA340sFTiRtI3cDTNELOOP/OhQNACHzLHWEREwzX+heasig5r3j2LZwKGdBK4QGiYf40AJxU1
	J1u4lXmDQwvVA3cPgkA0UvOSDQN8hNEl2AzNa2RhXJvxj7vMEcBVx20L8sM24l7yho3XJK5kE67
	1fLIvGvYea7KXSYN+DMb3OUzdfXBg=
X-Received: by 2002:a05:7300:e9d6:20b0:369:d779:bcb8 with SMTP id 5a478bee46e88-36a42059aa6mr17926271eec.0.1793652278030;
        Mon, 02 Nov 2026 12:44:38 -0800 (PST)
X-Received: by 2002:a05:7300:e9d6:20b0:369:d779:bcb8 with SMTP id 5a478bee46e88-36a42059aa6mr17926227eec.0.1793652277204;
        Mon, 02 Nov 2026 12:44:37 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm46230218eec.15.2026.11.02.12.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:44:36 -0800 (PST)
Date: Mon, 2 Nov 2026 12:44:34 -0800
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
 Petkov <bp@alien8.de>, linux-edac@vger.kernel.org,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: [RFC PATCH 00/11] soc: mediatek: add a DRAM ECC error handling
 driver
Message-ID: <20261102124434.00007741@oss.qualcomm.com>
In-Reply-To: <20261102123642.000044cf@oss.qualcomm.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102123642.000044cf@oss.qualcomm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MiBTYWx0ZWRfX2vFFb1+QNeyo
 GY0rnH/5MXK5EQMjNTthQBJ8rfVtI1OsciD4kOabWo4rBZd9SLGDz92OgaRgbvj/Dp3yo7B4GvR
 skaZ/tQiuiMSJv2UF+mefGA0tik/o5xn56SzBCSpE/ovwEfbkTsHnZ+2KaiJ6AJE8vP3fKnIDIE
 qntts0dfGzmq9ZahJmt9D/UHBk0U+4kkLzfjO8iffKpzEmQt+6sPNqIyn4sTLHquIWiyFOhRIly
 7LGOy94eNvPmrGxnO/Y7f8u4wg8AjqBIM1OnOqAttBuOw1cxXsBS9HRuJCOTAZQ7B7CIKZflx8x
 LjP58b1FYPxBA8QnmuPz0UUrUE3btvnCtzuTcvJYKLrnp/XIqm4MFLSozsmc7HetbIZECAtmaFB
 gVfPUdj9dnq7UE+arhB35PVoeLr758QEu4IFlfEyEQxMQxXk1sUYTrNaCr2UBJ+BXtzvfL7rmGN
 PzscJzEpnszFgShftBw==
X-Proofpoint-GUID: Li0IOv-ayhyi81p85PByL2Isa7jGqREW
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8f637 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mpaa-ttXAAAA:8 a=7wfBugC_ttQFeL10uWsA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MiBTYWx0ZWRfX56vBojew64gb
 hcKJVyN7T/lmIjHCOOaqN8TEykPQWzvdM+e2CuwEQ0L/Q3xi/L3v9DOKO67NVhIgtXA5ys/oYzx
 JHXQC8TbZZ9wcXDNaa8pucefLGA3Gd0=
X-Proofpoint-ORIG-GUID: Li0IOv-ayhyi81p85PByL2Isa7jGqREW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124440_640503_0FE6339D 
X-CRM114-Status: GOOD (  56.52  )
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

On Mon, 2 Nov 2026 12:36:42 -0800
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> wrote:

> On Mon, 2 Nov 2026 17:23:22 +0800
> santino.wang <santino.wang@mediatek.com> wrote:
> 

+CC Mauro as well as I realized I asked about userspace part and
he may have input on that as well as on the kernel side of things.

> > From: Santino Wang <santino.wang@mediatek.com>
> > 
> > On the MediaTek mt8992 SoC the DRAM controller (DRAMC) raises an interrupt for
> > every corrected (CE) and uncorrectable (UCE) ECC error. The interrupt is
> > owned by the secure firmware (Arm Trusted Firmware at EL3). It reads the
> > DRAMC error registers, applies the error containment policy and the CE
> > storm protection, and hands the error to the OS firmware-first as an ACPI
> > GHES record in a buffer that UEFI describes in the HEST. The OS is
> > notified with an edge interrupt that the DSDT delivers through a Generic
> > Event Device and a Hardware Error Device (GSIV notification).  
> 
> So far this all sounds standard for asynchronous error reporting.
> I'm assuming you have a something else for synchronous consumption.
> From a Linux side of things we just care that error record shows up
> and is signaled via GSIV (with normal Generic Event Device and Hardware
> Error Device in the DSDT I guess)
> 
> > 
> > The record carries a standard Platform Memory Error section and a
> > MediaTek vendor section with the raw DRAMC error registers.  
> 
> I'd like some details here on what those raw registers are bringing
> to the OS wrt to handling these errors. 
> 
> What extra info?  I see you have a subchannel in there, but Memory
> Error Section 2 brings that.  So why isn't this being reported
> as a standard CPER?
> 
> > This series
> > adds the driver that consumes the vendor section through the existing
> > ghes_register_vendor_record_notifier() interface. No change to the GHES
> > core or to arm64 code is needed.  
> 
> Given a lot here doesn't sound mediatek specific it feels like it
> shouldn't necessarily be in the vendor defined path.  More discussion
> of why you have gone that way would be help.
> 
> > 
> > The driver
> >  - decodes the most severe error of a record and keeps counters, also
> >    across boots in EFI variables,  
> 
> Interesting.  How does this compare with just making it a userspace problem?
> Perhaps you can't do that for some reason but it would take a lot to
> convince me that it makes sense to have an upstream solution that relies
> on custom EFI variable path.
> 
> >  - isolates pages with memory_failure(): immediately for a recoverable
> >    UCE on memory that Linux manages, and for a page whose corrected
> >    error count reaches a threshold (leaky bucket); memory owned by a
> >    device is only reported to its owner,  
> 
> This sounds standard, so I'm missing why you need a vendor driver for it.
> Please provides some more info.
> 
> >  - lets in-kernel clients and user space (generic netlink, tracepoints)
> >    follow the events,  
> 
> Why your own netlink for this?  These are memory errors so I'd expect
> existing paths to be sufficient, or perhaps there to be a need to
> extend those as Pierre is doing with the Memory Error Section 2 series.
> 
> >  - exposes the containment policy, the storm protection and per range
> >    severity overrides in sysfs and pushes them to the secure firmware
> >    through a vendor SMC call,  
> 
> The pushing of policy down to firmware is possibly something that needs
> a custom driver.  I need to think a bit more on that and check a few things.
> Input from Borislav or Tony might help here.
> 
> >  - after a fatal UCE (GHES panic and reset), finds the error in the BERT
> >    of the next boot and reports it through the mc_event tracepoint.  
> 
> If this were using the standard records that should just work. What
> is missing that you need?
> 
> > 
> > The driver depends on firmware that is not part of this series: the
> > secure firmware provides the SMC interface used by patch 2 and writes the
> > vendor section decoded by patch 4. The firmware side (the TF-A and
> > edk2-platforms changes for the mt8992 SoC, plus the preloader that keeps
> > the error across the reset) is being developed in the vendor's BSP trees
> > and is not published yet.
> > 
> > Open question for this RFC: is drivers/soc/mediatek the right place for a
> > driver that is built on GHES vendor records and a vendor SMC interface, or
> > would the maintainers prefer another location?  
> 
> You already got a reply on that. Almost nothing should ever go in drivers/soc
> and definitely not something RAS related. +CC linux-edac, Borislav and Tony.
> 
> Anyhow, always interesting to discuss expanding what we do for
> memory error handling, so I'll be interested to see what other feedback
> this series gets.
> 
> Thanks,
> 
> Jonathan
> 
> > 
> > Testing: each patch builds with the arm64 defconfig plus
> > CONFIG_MTK_DRAM_ECC=m on linux-next 20261030 (W=1, no warnings).
> > The series has been tested pre-silicon on a Palladium emulation platform.
> > 
> > Santino Wang (11):
> >   soc: mediatek: dram-ecc: add the DRAM ECC driver skeleton
> >   soc: mediatek: dram-ecc: add the SMC interface to the secure firmware
> >   soc: mediatek: dram-ecc: add tracepoints
> >   soc: mediatek: dram-ecc: handle GHES vendor records from the firmware
> >   soc: mediatek: dram-ecc: add error counters and the address lists
> >   soc: mediatek: dram-ecc: keep error counters across boots
> >   soc: mediatek: dram-ecc: add containment policy and storm protection
> >   soc: mediatek: dram-ecc: add the corrected error leaky bucket
> >   soc: mediatek: dram-ecc: add a generic netlink event interface
> >   soc: mediatek: dram-ecc: report an uncorrectable error of the previous
> >     boot
> >   Documentation: ABI: add the sysfs attributes of the MediaTek DRAM ECC
> >     driver
> > 
> >  .../ABI/testing/sysfs-class-mtk-dram-ecc      | 182 +++++++++
> >  MAINTAINERS                                   |  10 +
> >  drivers/soc/mediatek/Kconfig                  |   2 +
> >  drivers/soc/mediatek/Makefile                 |   1 +
> >  drivers/soc/mediatek/dram-ecc/Kconfig         |  19 +
> >  drivers/soc/mediatek/dram-ecc/Makefile        |   3 +
> >  drivers/soc/mediatek/dram-ecc/core/Makefile   |  20 +
> >  .../soc/mediatek/dram-ecc/core/addresses.c    |  88 ++++
> >  .../soc/mediatek/dram-ecc/core/addresses.h    |  13 +
> >  .../soc/mediatek/dram-ecc/core/bert_check.c   | 240 +++++++++++
> >  .../soc/mediatek/dram-ecc/core/bert_check.h   |  12 +
> >  drivers/soc/mediatek/dram-ecc/core/counters.c | 336 ++++++++++++++++
> >  drivers/soc/mediatek/dram-ecc/core/counters.h |  29 ++
> >  .../mediatek/dram-ecc/core/ghes_notifier.c    | 377 ++++++++++++++++++
> >  .../mediatek/dram-ecc/core/ghes_notifier.h    |  22 +
> >  drivers/soc/mediatek/dram-ecc/core/main.c     | 113 ++++++
> >  .../soc/mediatek/dram-ecc/core/mtk_dram_ecc.h |  27 ++
> >  .../dram-ecc/core/mtk_dram_ecc_event.h        |  47 +++
> >  drivers/soc/mediatek/dram-ecc/core/netlink.c  |  83 ++++
> >  drivers/soc/mediatek/dram-ecc/core/netlink.h  |  14 +
> >  .../dram-ecc/core/policy/address_range.c      | 120 ++++++
> >  .../dram-ecc/core/policy/containment.c        | 107 +++++
> >  .../dram-ecc/core/policy/leaky_bucket.c       | 277 +++++++++++++
> >  .../mediatek/dram-ecc/core/policy/policy.c    |  57 +++
> >  .../mediatek/dram-ecc/core/policy/policy.h    |  23 ++
> >  .../dram-ecc/core/policy/storm_protection.c   | 137 +++++++
> >  drivers/soc/mediatek/dram-ecc/core/smc.c      | 137 +++++++
> >  drivers/soc/mediatek/dram-ecc/core/smc.h      |  55 +++
> >  drivers/soc/mediatek/dram-ecc/core/trace.c    |   6 +
> >  drivers/soc/mediatek/dram-ecc/core/trace.h    | 119 ++++++
> >  include/uapi/linux/mtk_dram_ecc_netlink.h     |  44 ++
> >  31 files changed, 2720 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-class-mtk-dram-ecc
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/Kconfig
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/Makefile
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/Makefile
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/addresses.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/addresses.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/counters.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/counters.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/ghes_notifier.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/main.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc_event.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/address_range.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/containment.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/policy.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/policy.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/storm_protection.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/smc.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/smc.h
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.c
> >  create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.h
> >  create mode 100644 include/uapi/linux/mtk_dram_ecc_netlink.h
> >   
> 


