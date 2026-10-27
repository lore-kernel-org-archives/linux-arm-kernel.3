Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D477606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uhveVnD8;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VLDgT09m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nHp1TENsueutwPVZ6BBxO5cqRx7uVSB0t4XvedskQ9Q=; b=uhveVnD8ow2By0SfdDIZtcRs2D
	tNwkCSQmA4e6bSWonq0ms2nv9hDGwrj/s0MNjWAsaFNjsi4yeNXakiEqBU+77hcFEhm4E/SWNXdDY
	RrXT8j5ZYrp2GaGIdx1aRohhaLhZhypsxvsVSDcK9F8il6H4YzSwmm0pQ6YFtGYIPMNOif2JGMCiE
	Zv4bisugPCZfoBO1dWnVc4fO9LZS32n9sWyBSlIy/w+q8zmbjaDQMENsDTSSqM5tO4St6sphtB2ox
	UmNW0zmYodoazTb5zOoFUz6hEgfPPGZ9XVXjYqo0C7CsY6MZpXw0mYbyvm0Jvr6ITdpK4dErihqlH
	quACNIgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjWI-00000005HdA-3cAe;
	Tue, 27 Oct 2026 15:55:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjWG-00000005HcL-0vkE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 15:55:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ea759cc9b6so16841375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793116523; x=1793721323; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHp1TENsueutwPVZ6BBxO5cqRx7uVSB0t4XvedskQ9Q=;
        b=VLDgT09mXtK/Cnh9hIYv0DHAKGERkQJq7bbUjrLIk4VNY5c9J6dH+xqdkI77RXWldL
         4GeyFzAAwQbLdo7eTOFkP4hvlmByUaqqiPDQGVmb4Br4DEEgtQhxMCzl9qnaOnrJfgHx
         8Ki1zZ8M+8wMNI6BUJ9aIbUaJepePenbNMvTGA+bCW9Er76hGVGYqqwf3keUNwtT8c64
         7r7r2ipYzFrppzzg6Mkmy38JRjUo/r2V+rdyDJpQSn/GB/xgb2+eRv7cLaKXS7Ph1P+S
         9OCHJL0RPQDQJ2B4h3IVieyhPgJJobaAnpnzMuumJef4kX3I1hjNhGe3oAmJVMX6uE2M
         vwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116523; x=1793721323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nHp1TENsueutwPVZ6BBxO5cqRx7uVSB0t4XvedskQ9Q=;
        b=hBarfxXzFHO8cAvkle1fKSPu08Q9EQccjNoR9BaSYOQ9NQcaZ2Qybv9qVcmWgtd2CQ
         CJa87I33mXu7SzLoy1zJVa5VtmS588ocji2OHT1jEmMHAwwaLHOPj0KvupR2CKZrWCzo
         plrm83EmxstIuToxDi4WCawescpta5SGq/MejblHRlkqY7AdOwddjGvQUH0EF5g93sRM
         qow8QrDta3lWvqQw/PBsJEKhDGG24pACF1Uo6tY6T8Hd2oGvvFelZFdHmlZIGmdy4PHF
         YGBFyZbDeXSQJ8ZNZ8S18NPqSOqo2X7wJkwdK8oXe/DXLkgBGCRiJuuUZ0zdMnRuYKI/
         swYw==
X-Forwarded-Encrypted: i=1; AKwUvBynItnP8LXnlkLGfX4gvVNHE1D9rU353ITfahvnpFlJSfbuGrbqcNVMSahxfdCql3jq65FD6Wu+VDwPcYh/ckV0@lists.infradead.org
X-Gm-Message-State: AFq9FYIFLXeBcODY5bd83Bd7FT1Z1D2CSY5QJ48virvkhVbi45tRS417
	GpOrOOiUeQslxChLBteNW6rAb9DBv3MA04bokguI/QpSbA5dFtkd5ocgvX53t/J/y2M=
X-Gm-Gg: AYBFou2rpeGtr6GNowO5vYIeMiybYV6jAIDjfqdBqPY5oPecxoWK1Y3BAVis6SEiJ2P
	K8Dd9dbvqymxi62Sj78i5DzNNiZg1I6w9uEmY2jx4EEynCzwTsUscqwi9LUbaBn9vEdpu6rhKL9
	fbQ1FP+QysqidJsp4G5xNjfCjrHLDwUnF7izLQZHadIq172qyFYtbY4lwjH8msYF5E+CG/PM+LQ
	73Qgd0yMiKWWREooBdNPwBRC/s5JRekxwBkEyyFm/XIrju+1D7mL1REK37xUHCkgIQvRoP8inoo
	/hcoa6TJEnKhNc/vwU5RJcYs8aRjnWFq8INrSlfGZG3sndYxcm6+wMvScBlPSzty/Yfy9pXD9V9
	UVweBI0XVDhf8u0hPUqseQsgu0d/bobVeMmlXwksanyOUrMMfs8e0rEZUioNQl7rY2k4XZRqtHS
	tAd1nB+I3aK+jbrKdw9u9eZP7unHIjI6iHz/sZq3mNJHnT36CQngcorz3fEEeDrUj19BOHr6uJL
	YUgZy1FDcpX/SrXFqPHuplYECCvci1cparMMqVfSDPHWk9fu07CviTDheI=
X-Received: by 2002:a17:902:ce0d:b0:2e9:851a:7188 with SMTP id d9443c01a7336-2ea9c7f6e25mr84880745ad.23.1793116523155;
        Tue, 27 Oct 2026 08:55:23 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c0a5:5d28:58c5:eac9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eaeeda3f66sm9720725ad.8.2026.10.27.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:55:22 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:55:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: elf_loader: Make
 rproc_elf_load_segments() more generic
Message-ID: <auDJaIHqoBSOxGHK@p14s>
References: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_085524_282604_542E0280 
X-CRM114-Status: GOOD (  19.34  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 11:09:29AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> I'm currently working on remoteproc for ADI's ADSP SoC family (SC598 +
> SC846 and others). On at least SC846 the memory of the remote processor
> isn't directly accessible by the main cpu. (The memory is mapped into
> the cpu's memory space, but cannot be accessed directly from non-secure
> EL2.)
> 
> Instead of creating another near-copy of rproc_elf_load_segments() that
> just differs by the memory access functions, generalize this function
> and make the driver that already has such a copy benefit from it.
> 
> This is only compile tested.
> 
> Uwe Kleine-König (2):
>   remoteproc: elf_loader: Create new callback for copying segments to
>     remote cpu
>   remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
> 
>  drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
>  drivers/remoteproc/remoteproc_elf_loader.c |  63 ++++++-----
>  include/linux/remoteproc.h                 |   3 +
>  3 files changed, 69 insertions(+), 117 deletions(-)
>

$ ./scripts/checkpatch.pl *.patch
----------------------------------------------------------------------------
_PATCH_1-2_remoteproc_elf_loader_Create_new_callback_for_copying_segme.patch
----------------------------------------------------------------------------
WARNING: 'addres' may be misspelled - perhaps 'address'?
#56: FILE: drivers/remoteproc/remoteproc_elf_loader.c:233:
+                               dev_err(dev, "Failed to copy segment %d to device addres 0x%llx: %pe\n",
                                                                                  ^^^^^^

WARNING: line length of 101 exceeds 100 columns
#106: FILE: drivers/remoteproc/remoteproc_elf_loader.c:264:
+                                       memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);

WARNING: line length of 102 exceeds 100 columns
#129: FILE: include/linux/remoteproc.h:103:
+       int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src, size_t filesz, size_t memsz);

total: 0 errors, 3 warnings, 86 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

_PATCH_1-2_remoteproc_elf_loader_Create_new_callback_for_copying_segme.patch has style problems, please review.
-----------------------------------------------------------------
_PATCH_2-2_remoteproc_imx_dsp_rproc_Implement_.memcpy_tova_.patch
-----------------------------------------------------------------
total: 0 errors, 0 warnings, 151 lines checked

_PATCH_2-2_remoteproc_imx_dsp_rproc_Implement_.memcpy_tova_.patch has no obvious style problems and is ready for submission.

> 
> base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
> -- 
> 2.47.3
> 

