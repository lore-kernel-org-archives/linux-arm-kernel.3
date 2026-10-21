Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8129B606BF17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l5MjpdXp;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9+3PrHW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZIfvINI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hWqXEuq9iUvICKJmtCYJXRTGUsjg4czRSsoSn+YADM=; b=l5MjpdXplPRRHADrM4oE1BrmyO
	tFCoQJNbNvUq8cLmQgpyN/OK0Wx6j3vXpwi7TxxH7mVuy799oDTi5K/0cAjj3CKfwJjaF5g4Ic0mx
	+OumoS1eULTh3YZDaRHt3NDAVs7XHScU3WUhsQVme5YCISLNv+EROYpvP3RgSubisnIr2REYWukoj
	TQ0K3YVJih0eh9KydDEZFnz1C3HJXsC/yzAhf9fzZYBN/5zU3DwQzaSTWnTuoZQQxTa45jWljYvOz
	3rM7OW6n+4FInMHrIFtz+XRVP5+u0OCTRiZcmJPNv67+1Uzvox5SY6SkYnajpWjPxEcdc8m5h2HNo
	pSOMtOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYzU-0000000CODj-3aWf;
	Wed, 21 Oct 2026 16:16:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYzS-0000000COCu-2JoN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 16:16:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU99l3727462
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 16:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hWqXEuq9iUvICKJmtCYJXRTGUsjg4czRSsoSn+YADM=; b=i9+3PrHWHdY9KcEx
	Rkizp5TA6LO3x6JHCBfisbZ0xVIII/InNbBxuEouoj5Gl5TOhuvbQWrw8eL06u4X
	qiHRcvAhNmVYdbjfFVOwPWC3tQY0bR5kWrXLzQ6N++TpSf/0W4Z9TASh0cWZS0a4
	Xr9AZ/sJJsXeg1+6ffdBlzPEUJbhqfq/9wHvJh7xsRqxJSeMNgDYFH12igwOZIPc
	9Ae4kXTrb8SAFEmNoQRNByJbkPWjKBdcjRrRz6EVRgeBw92KcZMZBQC+kZVat+X1
	ZWlx2gub9lucHtn0mdnHsO852q/e0aPYuMDdx068yiGnUphUu4BvJDEy1BXUn9xg
	8ukbIQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy7a0q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 16:16:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd65070d3feso8887a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599393; x=1793204193; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9hWqXEuq9iUvICKJmtCYJXRTGUsjg4czRSsoSn+YADM=;
        b=WZIfvINISfWf6iXUcP0/+L3vNE6ncJQYU2EOPpyGvj6mFax3g/31Dd7/LtdxbGG6k6
         doy7HxTYRbbSlyrf/9XL8G7w7t7ehXeC6Kp5CXn8yvSzJYb/Hw+nAL+8f2jFJxABGLHO
         b8XtlQPZlAJXSHmbnVSgTedDpkyJcE2Jms2OVKmmrwFuoX6hCgXmFFS7fXOcdXZHoF6V
         DRFQe6UzmWavULBFOZkMOcoRKQDt0NYvt/wBgfbfIhFOVruwsgCEQ/4f5A0YMt01H6Yt
         i1VS6Tya9SWS4/nQqUsACOkOZMi4YOw8S+8GNh62g9OIcKc/8TrMd3KeMi8vFMXsMnao
         djYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599393; x=1793204193;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hWqXEuq9iUvICKJmtCYJXRTGUsjg4czRSsoSn+YADM=;
        b=qC7eHO6CXqFWDOZnvDEMZcAVIxAGU9KtIzkZdCVGhq5Bzq+UdJibxn6tjOFwRc5lCN
         vqDI9iGFwXy8JpD2/na59qD6iv3OlsDgouOYvPXea6d44MnPztroqrkTO7bekblYnBjy
         8gSAuLS3470MLpW1vw8MzTv5p6TQoHq8BjPUYk+idFMojiiCfDZfG/J4cDQLM8WJ+pJg
         yhwW4IuPzLyuWb+gEpCEX9PHhPyxHwBnHuhK5wlLhgaNG2sY9qu0OklVFRrTAUcq9I9i
         AwlbnrrN2gT8+pn1u5DcR0W7M/wRK+9fzeIilXcPHytYabbPvNRHrPdYZixuIzaJkLXf
         01qg==
X-Forwarded-Encrypted: i=1; AKwUvBydSJ8JZobwV8eJS0R4KS+nVRrDS6HMVSwUazXn7FCGpUK3f2lL44o7YKISaxeS5Qf+OaPJk/FeeVEwHAbEjne2@lists.infradead.org
X-Gm-Message-State: AFq9FYLck2qDNKoHq0bbB9+z0IYFDY6a6wi/ZerG2nhIilT5V/dehv0s
	dVGWBy/ar9TAxkJlhywGtw5Nqjb1y3lIMeU4FwFRC3Nelo8At2hKq+CQK0WMPJK9ReKNTzUZvQV
	Xtp1u6R8wYWYYMrCbevTaanu6vuun1ipE5LrcY/6Ibzpv+6ZHNBx4TP1JUDTfAh8oAeIJEdrbqe
	5xbg==
X-Gm-Gg: AYBFou1Wfnas0AdXj/dpdPKMbzIjOFkvN3ZF56AkjmFW5CPo5txF8jd/uHzWlzhVNOx
	ww98IepXbZ29r08CDNMUAYRglfIrS5RC6Zfh6s/E8X8aXUQlQyg1Rdgub1zYDayvijvBC9XsfkG
	7Hb+F2KJXkZjNhvvYRrs72bBy15CAqmQKqxcIFD1cgMIw1THZ7vzNABl4afvtAy9z/0hWQVl3de
	7PqSZWtDCJWeQqc9nfYT4HQ4KMAYN4RIgk1napp7hwTUBt2dvhwlRHkuEu/3Qj4Luo/EySbUire
	S406X2DXTP0VvgYltBcFLFJ+kNjqVt5Qq+7x9V+yjLEfKXREQhWqFDcQGclymsj0MoHxWXYC405
	XU0wffTRUj6lKucuhFII0Se07gEQtN4dRPUtwOy3KSA==
X-Received: by 2002:a05:6a20:2f98:b0:3e2:6653:149c with SMTP id adf61e73a8af0-3e26fc04d39mr3512954637.10.1792599392824;
        Wed, 21 Oct 2026 09:16:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:2f98:b0:3e2:6653:149c with SMTP id adf61e73a8af0-3e26fc04d39mr3512915637.10.1792599392315;
        Wed, 21 Oct 2026 09:16:32 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b84b6b17sm205866a12.13.2026.10.21.09.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:16:31 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:16:25 -0700
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
Subject: Re: [PATCH v2 04/15] efi/libstub: Add a general way to get symbols
 from the vmlinux into zboot
Message-ID: <20261021091625.0000515e@oss.qualcomm.com>
In-Reply-To: <4-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<4-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z1HIicn9QXo_6QaPb7TnVTOUo7QtHxT5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfXzrGIgy3bNXAc
 j6zTqFAmPfjg3cWH3Q8JdpgH60I31g6+2Q3MH0aC16XE406sNLHpu2krAZr2IlUq8zfoH2bpnHB
 IHHB0kBEypGN3t5uNybIHuEzc8DnCdRk/F3K/RS1ZPQV3Pib2DKZTbLkAu0UvEEGKi/j+/yjSO6
 IBqKwNCAY76HQZsw4AqYxzQdOFBESzaEwSYBYWgekXYInU9xOjRGXfgPuJ+SnUVfJ9IR5GC/HZx
 rKYIMV7954B7WrLDBKPfhZ5rlfvAhp5w6ktxFNCc9rISYQc6iwjuH6xFjohNjl9Z9a86ihDiHRv
 9htZUPJb+Bup49dhcS24F6r1lqJ3BAJ4bvHh16dPcUIPvxE6KEkKXywPSVcenkCIXUbicCHRub5
 K9nVa/C5FOkUW9LqU7v8LEm08TMgSAKecBdV9sE6IpzEA+fyCStaVZ133ybQU+tlAXHoWEznyU5
 WeXYbqMYF7dIaLg85uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX9Nhv515zTjCE
 p4Str4+KToR5kPxnV5WWAl7eA8bWLeE2RquN8m+VlgSCcnC02u+EfwmTIHwG9JGz5g2kuIEms/R
 xTnUzMIrEp3Cpvi+CySz9b2BeoHXfsY=
X-Proofpoint-ORIG-GUID: z1HIicn9QXo_6QaPb7TnVTOUo7QtHxT5
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8e561 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=ah4THgOBrJhmsRMU:21 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Ikd4Dj_1AAAA:8 a=_GvItbcUg7J-DuPKX2oA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_091634_590414_50F22C8D 
X-CRM114-Status: GOOD (  41.57  )
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

On Fri,  2 Oct 2026 20:31:41 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Currently the zboot stub has no access to symbols in the vmlinux. In
> contrast x86 has a voffsets.h header that allows the stub to know whatever
> symbols it wants for the decompressed image. ARM DRTM needs another 4
> symbol locations to work, and it also wants to compile the DRTM libstub
> code once and have it work in both zboot and embedded.
> 
> The current solution in arm is "code_size" from commit 45dd403da851
> ("efi/zboot: arm64: Inject kernel code size symbol into the zboot
> payload"). This is neat, but it makes the zboot and embedded cases
> work differently.

Not a real review as linker fun is not my forte.  So just some
trivial formatting comments.


> 
> The x86 voffsets.h approach is also nice, but it can only work in zboot
> since it relies on 'nm vmlinux' to extract the locations. That's a
> circular dependency for the embedded stub.
> 
> One idea that meets the requirements is to embed a struct of offsets
> inside the vmlinux and then have both stubs know its offset from the start
> of the image.
> 
> First, each arch defines what information it wants the stub to have in a
> struct:
> 
>        struct efi_image_info {
> 	       __le64 code_size;
>        };
> 
> Second, it populates the struct with the linker:
> 
>        EFI_IMAGE_INFO(
> 	       /* code_size */
> 	       EFI_IMAGE_INFO_OFFSET(__inittext_end)
>        )
> 
> This approach with the linker is guaranteed to emit a value and not a
> relocation. I looked at writing the struct initializer in C, but that can
> result in relocations inside the struct. That seemed sketchy so I stuck
> with a linker script approach.
> 
> Finally, any stub code, either in zboot or embedded can access the struct
> through:
> 
>   const struct efi_image_info *efi_get_image_info(unsigned long image_base);
> 
> The makefiles arrange that both links have a "u64 __efi_image_info_offset"
> symbol that contains the value. For vmlinux this links to a symbol created
> by the EFI_IMAGE_INFO() macro, for zboot it uses the same technique as
> code_size through the zboot.lds.
> 
> Since this needs arch changes, protect it under
> CONFIG_EFI_STUB_IMAGE_INFO. The arch should define the struct and use the

Odd line wrap as moving the CONFIG up a line is still shorter than some of
the lines above.

> linker macro before enabling that config.
> 
> Since everything is linked together, and the actual location of the struct
> is not fixed, this is all private within the kernel build and can't become
> ABI to any bootloader.
> 
> As some follow-up work, it seems interesting to standardize on this
> mechanism and remove the PROVIDE() and voffset.h alternatives. This would
> also avoid needing to pass sysfb_primary_display through EFI from zboot,
> for example.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>


> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index b2988aa12f6645..4dd52ddb148401 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -83,6 +83,44 @@
>  #define RO_EXCEPTION_TABLE
>  #endif
>  
> +/*
> + * Architecture specific information made available to the EFI stub, see
> + * CONFIG_EFI_STUB_IMAGE_INFO. The architecture describes the data with a
> + * struct efi_image_info in its asm/image.h and emits the matching bytes here
> + * through contents, using linker expressions the compiler cannot compute.
> + *
> + * Place in the same section as INIT_DATA.
> + *
> + * The architecture must also define EFI_IMAGE_INFO_SIZE to sizeof(struct
> + * efi_image_info), and that definition has to be visible to the linker script

I'd wrap this to have the whole sizeof() on one line line.

> + * before this macro is used. Keeping the two in sync is checked by a
> + * static_assert() next to the struct and by the ASSERT() below.
> + *
> + * The struct's offset from _text is emitted as a u64 at
> + * __efi_image_info_offset. The architecture aliases this location to
> + * __efistub_efi_image_info_offset for the embedded stub. The absolute
> + * _efi_image_info_offset_value contains the offset itself; Makefile.zboot
> + * extracts it with nm and zboot.lds emits it for the compressed image.
> + */

>  


