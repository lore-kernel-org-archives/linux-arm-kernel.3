Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8E8606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fUV0SD5z;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hfpCRj+j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2pK5e4s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kD15e1tCEFZb0oDM+2xTBELmNwYQTz7QW2OQ3oM2K7k=; b=fUV0SD5z8enxK9/EdW1Br0xw2T
	o993TKOuFwtnrwQHLnWL6Rx2BKPHLrhmCDCjyIK0ZxqHjX9bbO6h0FTPGVLVdt9o7xLhUy3jmq7fE
	QVQN+/6RLYqNSbAN9th9yxtua4sGYxsNptNFRg3nHgxYQvk/5oXRZuxvmq81KwWXVub8tG69oWUY2
	uyD8+ifD63eMuHo1viL8tI4iXFtONT0l+E+xHNzK3eOF0uTjGelQg7jx1VQEoWIXi9/vog+OxfCms
	w6O99jEXLzADUR8SOkUsRI7nUJRawsB1PpsWpuiZsNkgbszEukCvNvvAYRpXIvuZGgXYoq2I+RZDK
	rOibGK6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaPY-0000000CaNU-3dzP;
	Wed, 21 Oct 2026 17:47:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaPV-0000000CaMe-3R2K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 17:47:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFoFvg524244
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 17:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD15e1tCEFZb0oDM+2xTBELmNwYQTz7QW2OQ3oM2K7k=; b=hfpCRj+j2KxWdKAB
	AHRIXbKs8512TkOfMBg7uAuf4pQwBrgHnCXqjXGBqRwBoq/H7P7OrFgZF0Zfi+tR
	vu+VfuJDugBApslvid6veWNBEZZcyRXJAke9i6292jK0t0YZGi9NrNaWSpT8tY+V
	s0gVcVKmPr81HHIdp7X7HflfO6HpD/K1SRGxm3CFbfoBQBPSdCsoYQ7ODmPPoU7T
	R3UtMzJ9hljMDpG1WZQeQQuRgdzWHC+h+yxC/BvbZHBOb3CssvTUbrb7Z5UqBp16
	83IkxTQ0zg67ak7mU7qRBBySHW1fHCbjzIGN0Kp3HDrdNz9pEeOQETK0hUBs98qx
	h9bHVQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0cv0hns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 17:47:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso1643636c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604853; x=1793209653; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kD15e1tCEFZb0oDM+2xTBELmNwYQTz7QW2OQ3oM2K7k=;
        b=f2pK5e4szX9LsC2c8DKWexMphcXbKa85oJJjMk5eMo56x+pv2sVN6C7cNjCvkIPw77
         6Af2PsxpASm3f0KfDGkPwxznHdz/5qajVHkLTaWAkOMOyDmvMy5XXiXceJ6RcMVPkPIo
         S/yUM4TYRexr+Ogp2AdCcP6Ozfcu8c+P2hOOMhxrfMZeFc3TPTVEo0SQ1vWMkUCnpncy
         WSSyGYCLcZ2R9w2+6UXITGiADkxYKBaa1SlJ3XYlxA7dc1uD7ovXo/qPMR/C8ChIeEUR
         wlgxOCxDXCaVko9r/kiajOK8c5I2jUzONeUBrUCh9ojbaO2DJSpUxpIxw8N8fbLLXDLn
         cr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604853; x=1793209653;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kD15e1tCEFZb0oDM+2xTBELmNwYQTz7QW2OQ3oM2K7k=;
        b=q1/1OG5M3CKtxv1bf5JsgEszFK50am7oJXWyMYYlBkK/yWs6HkP8Nr9eDdvuV13MDk
         TCZrIXloM16dHJTlhEkxX6jb1jDYcjWKAnhi0MHPvz6pvvoR6/Pw1K6lqFD2v0bvJ2+P
         L8XZiIpa5iQj+vQRGDIY1Pv3CaNNTX6CKVJcRQy72+4hG8PWGRuF4Isb8/DdvTtHqUIz
         qlGIL6bM9TUuaI7bE9YBYLUdMtcH3qx9fDUnH9Cm3pujDuEA4DDANpm3pmvMbUqKKkU5
         Ta4pynhsbyshIVJtZkFuKgisfq38key0Y7XMBvcCDvI+dCt8RN+glaHi1HSCwQFl0nHr
         /Jmw==
X-Forwarded-Encrypted: i=1; AKwUvBwFCyP6CmOZ7JLB28FRNi3gMDDDeBzILGb3GqhwkJ6V3a8M6SVXJ/K27pEk0eDDht5J5IqI+scgUd+1wGCMiN3e@lists.infradead.org
X-Gm-Message-State: AFq9FYKw/yPXmz3d7bzTflhgZZ7pM5+5Iq4+yMPu21KJNQ9wRro+Eo0/
	PnR4bbIMINC11nSCLqdo+dsA+EtyLqC7/Zk/BFR7fZRlx6Bzdg58x2C9EtCdAroqFHvUJGGkbq/
	5z1d/rn47uVV8Ahgn8EX7Ydr+tXGznVC+JOG72HrHw0kgYOWykDLhoP2RzFA9wVFmbGcMQc0IDB
	A74Q==
X-Gm-Gg: AYBFou3QTZ5p0ccUcPT5IAaI9UjDrNWwx8t1oizw6jDA14QGjMlkVrmX8An9FrBwpUG
	SOdpoYglbBScwWeTzP3r3GNPE9MrMw8h9JKXf5mZn7BoDX/27ztI6dBfbmbZ1aERhO5jE0GkESw
	oT+LuSh70ajAlYsee0m2ONYEoYOa7QFAAGkQM8bwzFGoeaMNx4wcPFwRmSkoJuWKoWlXXUQTtbN
	i1kR/H8S82zeWfZxG+sAGCGGrQ2mySY1Ig3LTyrCEFx+lZoH+90qT6yebf3jPfv64TKpiMKP0Yi
	LVK8JA45RpnsN3VpRdgaEX881+XvUsxCPHbipjRuj8y7FfbPwk9qEPceo6ABGwqZiDT8G2bOy+k
	IVS28z+ECjFf+kHba9V+HD2vHCJzcxQIGsiKmF7qyBw==
X-Received: by 2002:a05:701b:4214:20b0:143:297c:276c with SMTP id a92af1059eb24-190a5d6f349mr3478008c88.33.1792604852518;
        Wed, 21 Oct 2026 10:47:32 -0700 (PDT)
X-Received: by 2002:a05:701b:4214:20b0:143:297c:276c with SMTP id a92af1059eb24-190a5d6f349mr3477983c88.33.1792604851896;
        Wed, 21 Oct 2026 10:47:31 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc848fsm8915123eec.13.2026.10.21.10.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:47:31 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:47:26 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, David
 Sterba <dsterba@suse.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Randy
 Dunlap <rdunlap@infradead.org>, Simon Glass <sjg@chromium.org>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Nick Terrell <terrelln@fb.com>, Will Deacon
 <will@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        linux-integrity@vger.kernel.org, Palmer
 Dabbelt <palmer@rivosinc.com>,
        patches@lists.linux.dev,
        Piotr
 =?ISO-8859-1?Q?Kr=F3l?= <piotr.krol@3mdeb.com>,
        Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH v2 14/15] arm64: drtm: Call UNPROTECT_MEMORY
Message-ID: <20261021104726.00002640@oss.qualcomm.com>
In-Reply-To: <14-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<14-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NrRE4MdJ c=1 sm=1 tr=0 ts=6ad8fab5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ikd4Dj_1AAAA:8 a=4lc54p1sSd76nvOad-kA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 0N8YsuCfYxJRowgt9qETyxwakEH_a5LF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX5Qqikgkxqofu
 akSNtizeQfcI0VGLt3geGwpQKO2nIj4iESTzUIQRnFsIbIDszCg5wZTcOMUMSU3CkB4+VR/pb/k
 myCifGWvJercwKbxjZJDo10bbFOZuD0=
X-Proofpoint-GUID: 0N8YsuCfYxJRowgt9qETyxwakEH_a5LF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX1VzeH5O/vZDR
 3cauZn+KIugsmR2fqF1bv+eGyWhe7ZAbyNLPI1hYXzJsDl9S//O44zeMx+g6FfoKtnCqzggUFtO
 Baqa87l/iJpRgKzKGqTJhobkw9Eo4W9ZetO21tLMyLtaQkPJC5Jgi4GfLFiiYJvj7Jyoho04Hin
 cdAcksiA4eYQLGVH5RKxmFughwxRlxKZX38Fy20tNevbg+L8X/giBW5P2W++7cAzWod79KeMAUh
 H3zmufSliiKFIpdvUVyGrZ3zAttcu8B4oUNCun15YsgR/wg9rOozPTU3CdBJDMKQoqC6YfU6YyH
 NxUO2u1Dfp8l3BI0bdCauocGVu8OOPSon7Qll+fyODmorBGw9HSDnehGfD3NoKWQEnlH0Gj27SW
 c00xk99FuLaDOUjsmM3IXfJIeYYVOdx0atzYQDqwkub9vMtmzY+Nnr2hNI3GWc7Yj3LSR5Ip00V
 zJjT13mk/lAGyT/p+fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_104733_868931_92089905 
X-CRM114-Status: GOOD (  36.91  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri,  2 Oct 2026 20:31:51 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> The stub always requests ARM_DRTM_LAUNCH_DMA_COMPLETE. On a system
> with an SMMU the COMPLETE option is sanely implemented using the SMMU
> global abort register. DMA_COMPLETE should be mostly a no-op. It
> seems to be designed for the region protection mode that Linux does
> not use.
> 
> However, the FW can still do something interesting under it and we
> should call it. Choose late_initcall as we know the SMMU drivers are
> loaded by then. If some platform does actually block DMA beyond the
> SMMU, then this would result in a noisy failure of built-in driver
> DMA, not a silent security gap.
> 
> The platforms I'm aware of are OK with this placement, and it is a
> reasonable place to start.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/arm64/kernel/drtm.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/kernel/drtm.c b/arch/arm64/kernel/drtm.c
> index 14493948a27f0d..6062980a5d9e53 100644
> --- a/arch/arm64/kernel/drtm.c
> +++ b/arch/arm64/kernel/drtm.c
> @@ -3,8 +3,47 @@
>   *
>   * Support functions for ARM DEN 0113 "DRTM Architecture for Arm"
>   */
> +#include <linux/bug.h>
>  #include <linux/efi.h>
> +#include <linux/init.h>
> +#include <linux/printk.h>
>  
>  #include <asm/drtm.h>
>  
>  struct arm64_drtm_handoff arm64_drtm_handoff __efi_data_handoff;
> +
> +static int __init arm64_drtm_unprotect_memory(void)
> +{
> +	s64 status;
> +
> +	if (!arm64_drtm_handoff.drtm_enabled)
> +		return 0;
> +
> +	/*
> +	 * Currently Linux can only fully support a DRTM implementation that
> +	 * relies only the SMMU.

That sentence doesn't parse.  relies on maybe?

> This should be called directly after attaching
> +	 * a driver to every SMMU but before binding any drivers that want to
> +	 * use devices attached to the SMMU. Our boot flow does not have a way
> +	 * to do that, so for now call it here.
> +	 *
> +	 * For SMMU based implementations their UNPROTECT_MEMORY is probably a
> +	 * NOP since touching the SMMU here is forbidden, but they may still do
> +	 * something interesting so be sure to call it at least.
> +	 *
> +	 * The stub excludes the most likely case of non-SMMU by only using
> +	 * ARM_DRTM_DMA_PROTECTION_COMPLETE, which is defined as:
> +	 *    Complete DMA protection is hardware-based enforcement at the SMMU
> +	 *    that blocks all DMA from Non- secure devices."
> +	 *
> +	 * For now if people have such systems they cannot include built-in
> +	 * drivers for any DMA devices, those have to be modules to be ordered
> +	 * after this.
> +	 */
> +	status = arm_drtm_unprotect_memory();
> +	WARN(status != ARM_DRTM_SUCCESS,
> +	     "DRTM: failed to unprotect memory (x0=%lld)", status);
> +	if (status == ARM_DRTM_SUCCESS)
> +		pr_info("DRTM: launch completed\n");
> +	return 0;
> +}
> +late_initcall_sync(arm64_drtm_unprotect_memory);


