Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600E6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qyAdTXXI;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OSlcL8cO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bg5NaBOp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KgtddslSOEOaN73E6Xh0kX0j9JGBALLWlHj4vZIcu8=; b=qyAdTXXIlTRDNzUtE3uzwijaCu
	mFYXfDAunR+NnXHZcmmPSQrXJY+M4JZAdcm8z7kNsYirRT8lgdPNe3Hr3b0TiiqBuHfbhC1Y+bnlg
	bZR2wlt5DR0eKdDRTJHpig5YQaQxhmqRPDp3CKKh6JU3Ingaibz9z+B1oIKYjRZWjih9iJvjqIWrE
	a5frV4ndQWjtInNUDbFRwBtolJA++SDKoL5fZnOvgMumGMgB2MJpRQzqY/q1aztic6/GhTrjGUuKQ
	NhncbkhRtYaqcDogvVDaGykAvXLZflqL27BMnXS7tMZLPR+hPJNo2IvIOPvo9Wk2mFX7g0d9ma4bL
	sD7x95Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZlp-0000000CVnm-0vuK;
	Wed, 21 Oct 2026 17:06:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZln-0000000CVnC-25H2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 17:06:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU6JL141642
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 17:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KgtddslSOEOaN73E6Xh0kX0j9JGBALLWlHj4vZIcu8=; b=OSlcL8cOU5zXbryB
	8fphfV9zo1XreQA4OpWxV/h7tO89Sx+6X2Zl5p6+0ULsUn90taN9eGxYH16jm+qk
	L0XZJ7Dn3v8XGxu9eL4AUwpW89Q08hqaGYjoQLd+s7IfocWo3yT9caDh8KNWlz5H
	s2wvu8IN32qEW3e4b+swbEmyIx4Sb7Bfs53jhsZpFAhMxFVFGH/lhgrGUhOIl9na
	ZHCzsoC6k5dyzggh321+7NzEQC0sx6z0Q589PxqQBdkJCqG9N/vTM/t84N6WLpwZ
	XNzQ4yeKMJxtggMzRJOTsDyC0PwIrehi/AU/krpfAg39mwEvzewP39PNMVc/Bg+a
	pxwNPQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex58924s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 17:06:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36696c9f55bso54387eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792602390; x=1793207190; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4KgtddslSOEOaN73E6Xh0kX0j9JGBALLWlHj4vZIcu8=;
        b=bg5NaBOpTc7/dDj6CRO6EJvpIwaYM9GeEMZoUHtZ8dfkPhd3qZysXP7sinBNDmhxqL
         puSMbxZ3SDjoQkEl4wCMp+W7Y+B8xIrFxQNWeuCYqdB+9YEHjDax0ZfFOVH3h5klFmSy
         WL3iiwMo3TMdumk8wcu9x9i6tJTedpsTgSgEoeDuAX5zGRwoK0gRGdkPC2YptDU9qbaQ
         yZWN8FdRciXzXziHEYp8ahRgBQY8GGMh5P1RntVMA0fdQ1U6/YmK5Q4c5MbBJlaJ8g1+
         BWYRXYdAkEJroIpLa+tKieAP4jiTeFyerpK2BjkT2MLVm3UBiZZkSC67zwrlXghIA5jR
         lPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602390; x=1793207190;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KgtddslSOEOaN73E6Xh0kX0j9JGBALLWlHj4vZIcu8=;
        b=j9hZ7UkezlUOmrvk+PXeq5AOSYb4tbvy597jy29HaL88RANWRfX2FOvEl4NSU3A0Gv
         VFeqN2kIBHcqRy219DeG8GqMaCb7KI1gkpYZT1I551ILpdeSXQC5cjVJ5pF5F4RRRrjQ
         pjdvE0bhbxhmqI8MiYsJYJEd5tuK4Q4emtKO9Dw/JHSZ9AebH/mi66yeF9XuRwf6XHkM
         s3MtxNsuLGJHow2MDUhGrkAueum1YoquDkW4/j4iLqa+ktC25kej3L3OZ0D8MoBidVK3
         g7ohLf/Wt7b3lnyAJ3Av5UnaTpz+Z6YjBW8b1LNxPv9Dx24AT6qgGw6jy5B4+t7lBdFs
         WVXw==
X-Forwarded-Encrypted: i=1; AKwUvBwsZE217MBv1jreKz6UInmWrqOqMWFS+Xfx9AsPvXw/EVfbTrYPTaUFAoAvYwiNRJFc9RsQVVlibTUQgqY3iIqD@lists.infradead.org
X-Gm-Message-State: AFq9FYJSEY6wfoAPPXqASjk9Zamt8wC6HW1W0fqyPzvwJ+IYJuywbJnG
	y4z+baFr8OyztDWBhTZeu/6sIzse6dud33O2FthZsHeNzamuHCVAXO+xeUdoSVQTxalqOL8v7gr
	gVujpBFw6YszoHlxEMxFQ9Gbxh2cyS823PFUMGuYlAK2n0xtiuKrNy7BdaO1e/N3p+AdlBZdWhX
	JI+Q==
X-Gm-Gg: AYBFou3sc/ym1B+zZYpSYARt3Y4KYn3MUa8xOyPZOrR0KOAC4vH3Br4T1lV+g6sS2Qy
	3em0pxrjZ5VUUObSkrYQW8GOwsHe+smYOkweaT4jj5SK7k7fRXb7oNUOH9HJd7pVIg2S/CsaZBG
	8ipW5Z5bUduPQGH0oDEnLQqA3SrcjAcdbe8LGBjPduM88aEfj3Hfy1dVlHkU2BFZ19WgDmcgCIV
	Q25C1hD+1gfu39UCaWrEAfEe4ui4CAuLK7SLqhIHtg9arwwWvEhPN0roVLlZ6yQ3ROk6K5qL2zC
	wYuJgJUNPgwuGzBEXLfIFJextg0WfwK+TUoAdO647B42GkB1BUjj/GnxTgokzJAJmvUtZCBmCn/
	QzMumEMQa5DOzlwRxxFRCeTuWDjYek+IRbjiHaMsxOA==
X-Received: by 2002:a05:693c:20cf:20b0:363:a45d:10b1 with SMTP id 5a478bee46e88-365fa49061dmr6847151eec.5.1792602390114;
        Wed, 21 Oct 2026 10:06:30 -0700 (PDT)
X-Received: by 2002:a05:693c:20cf:20b0:363:a45d:10b1 with SMTP id 5a478bee46e88-365fa49061dmr6847104eec.5.1792602389510;
        Wed, 21 Oct 2026 10:06:29 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367f52ce166sm5334511eec.29.2026.10.21.10.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:06:29 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:06:22 -0700
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
Subject: Re: [PATCH v2 08/15] efi/libstub: Have efi_kaslr_relocate_kernel()
 handle extra_size
Message-ID: <20261021100622.00007ae5@oss.qualcomm.com>
In-Reply-To: <8-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<8-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2OCBTYWx0ZWRfX5RNE3TOTZxpr
 ooEoUudEUmT+gyccByctzskc3KjlvmVYJmqSnAaAobbtv67pCVeUEz/oY8VhCLHc6GW9ntxO271
 M4nmIlDXr0yEJ+3j0HgZgpcv2ylV7ws=
X-Proofpoint-GUID: 81tYKS5g01_J0STramRNgi3TqMVi4V--
X-Proofpoint-ORIG-GUID: 81tYKS5g01_J0STramRNgi3TqMVi4V--
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8f116 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=z1Vexnt6jiiBlSUV7TIA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2OCBTYWx0ZWRfXx9szU7pCrzQb
 F7GYUhNjQ3p0PS9XZ4dSjbuhuwY2xDx4qtPM3YD2LOUI3pYESTJvie7NCC9wyQRStSNqcNXhpAP
 by24MA9YDvRw2apeX8On9/mTUs84vOSeWcntwtmJ52Y5bH+S2+KhdYZmF5X7ZmLW1Ib5kNVXuDG
 rkGiqGHXkt3kYFVY+2vzC3BpSfaQrf0yBWAbdKLc9wflugtFcLaoqn4LrSlyXNZ7yr8TTDAesQi
 k9BDCvdPoe9/tsxYHDNlwlym2yHiQ2Uw7KuNNIBb2wyopdCFtQGJ5qyOoqrCaeRnvqUF079JFDI
 7tJTRuX8NLFrEY0N1vCAzjF50lAM9ftoJooTf/R+CJMxSmcZWEfq63IbrxZv5nsc66yQXyIE++r
 Nz6h3hmbKMfPY8mgiumqA8Yx+GMcgApX0W2A1Ky7A5dFeMxIefjdbznZDB/7C7/taL/GODtSydx
 VvBHtXpywQLAaVV/Oow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_100631_569166_D34914FA 
X-CRM114-Status: GOOD (  25.80  )
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

On Fri,  2 Oct 2026 20:31:45 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> There are three possibilities here, each a little different:
> - relocating for kaslr, just request extra_size like the zboot flow does
>   when allocating from EFI
> - in place, attempt to allocate from EFI precisely after Image to
>   confirm nothing weird is there, failing that
> - like any other error with the in place EFI location allocate
>   non-randomly with extra_size included
> 
> Remove the callers' assignments of reserve_size since
> efi_kaslr_relocate_kernel() now does it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
A couple of trivial comments.  Otherwise looks good to me.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
> index 4bc963e999eb97..e419f3800af517 100644
> --- a/drivers/firmware/efi/libstub/kaslr.c
> +++ b/drivers/firmware/efi/libstub/kaslr.c

> @@ -125,16 +164,29 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
>  	}
>  
>  	if (status != EFI_SUCCESS) {
> -		if (!check_image_region(*image_addr, kernel_memsize)) {
> +		bool image_region_ok =
> +			check_image_region(*image_addr, kernel_memsize);
> +
> +		if (!image_region_ok) {

Why this change?  I don't particularly mind but seems to be churn that isn't
necessarily needed.

>  			efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
>  		} else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
> -			   (unsigned long)_end < EFI_ALLOC_LIMIT) {
> -			/*
> -			 * Just execute from wherever we were loaded by the
> -			 * UEFI PE/COFF loader if the placement is suitable.
> -			 */
> -			*reserve_size = 0;
> -			return EFI_SUCCESS;
> +			   (unsigned long)_end + extra_size < EFI_ALLOC_LIMIT) {
> +			if (!extra_size) {
> +				/*
> +				 * Just execute from wherever we were loaded by
> +				 * the UEFI PE/COFF loader if the placement is
> +				 * suitable.
> +				 */
> +				*reserve_size = 0;
> +				return EFI_SUCCESS;
> +			}
> +
> +			status = allocate_image_tail(*image_addr,
> +						     kernel_memsize, extra_size,
> +						     reserve_addr,
> +						     reserve_size);

I'd move reserve_size up a line to group it with reserve_addr.


> +			if (status == EFI_SUCCESS)
> +				return EFI_SUCCESS;
>  		}
>  
>  		status = efi_allocate_pages_aligned(*reserve_size, reserve_addr,
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 725b634c517919..a88b2d275e5bb0 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -37,7 +37,6 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
>  	kernel_codesize = __init_text_end - _start;
>  	kernel_memsize = kernel_size + (_end - _edata);
>  	*image_addr = (unsigned long)_start;
> -	*reserve_size = kernel_memsize;
>  
>  	status = efi_kaslr_relocate_kernel(image_addr,
>  					   reserve_addr, reserve_size,


