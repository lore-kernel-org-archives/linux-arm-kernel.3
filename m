Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93E1606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0oMSYcP7;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LHW2TQt9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EWOQO4/BUeLCAM60Oj14E4iA/D66uZxulDoNLysenrQ=; b=0oMSYcP7xaNX7jWQLVHFLc/30N
	JzMEhnjL8ZV/mnJzkzScy+rngkbpHmbH4kEdSkKr6/7Etm1C3c1uejRGkjLGsjMO7uuVkKCO6hNR/
	QmPE/pGe2zh0xSKNDy9fHCTWPgRGJeB10K3QmOdZUEvB0qiKAAgfuYlymqXP/+gpLQ7XP9RZqdNoQ
	/RiotlAUm8kMUuAy4BGCQjTntICI6gl0qFjYDOjvHbRiO84CULnh8oUhx/hDjZAzZrHBsp52/40jo
	ItnQwF/3j07a1l97TNAXreybufMZ3W5Pwiu3OWpMTwCCzZnWFbQCi55g+FMueVAtjyLAZm6bhUeQw
	XinVUCGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGcn-000000030AD-1eH6;
	Tue, 03 Nov 2026 15:40:37 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGcc-0000000308l-3zSd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:40:36 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so2543217b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 07:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793720426; x=1794325226; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWOQO4/BUeLCAM60Oj14E4iA/D66uZxulDoNLysenrQ=;
        b=LHW2TQt9uVNFiqdmBo8aNoHQsfGrNtsOvVw5T/kHT0j59sxDnizCfnxAbKFtWrynyj
         u58iTakLCv+ostZfKHP3LspzOP2aLILitoPJBSAqSm8N7CjiekBco0aNu+as9CW8eaC1
         Z/55K9FOREZX/2iNhQF2Sga0zcGdRqpJ7ObA7WQ397gWPz35DKSWS3VhH+yYysR/gGAe
         2ltzlLHRvHO7Ru7OQKgn2+1sLX6BJTvStJYAld55VDyIAJchfFlYDkYgW1gPTLVU/CfJ
         PsmaW9IUwi+WcNIwrRs9EcG54sv94nkqjUE+XNKz9KCHLdxPSu2mfg4EHkcCK1cMAi/d
         FRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720426; x=1794325226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EWOQO4/BUeLCAM60Oj14E4iA/D66uZxulDoNLysenrQ=;
        b=nyS1MMNCgtonqmWZoNMvVF2RkVMg624YXeQVoJT/UrA2zNYP0vqatKaiwRSASWJtaG
         wkmlh3uqTFV3DTZmyJUbEjEyQlVm2tGWG7UcgNauWgehKL/qfF2pTPnDRTh6SlRsI1XJ
         IqTUfzNm8BbXVuA8CfWnI9IZfLh06mMz7EkHl7DMkDaXbyvD2+oD0PLeWd46TL4hRLeS
         4MIm1REJdnk1klk6440kVc0Dx6QLvmNkyCR+Jtt1Tf6zVo9JXTM8XxjnaIC6/D6t5vpz
         C4nDX7j96rtYk65682W0FevYeZKUZPDqjXELbhJU1SoHD2j8WTEJUNCxpoBzB3fBKAIp
         N9FA==
X-Forwarded-Encrypted: i=1; AKwUvBysNz4KRBI32xoJYgzciq2bu7jAJ+KjkXgpzDyVy/WVNHhMsiwonKXGhCiD100CClAwr08RgL/RE17Uz09D2Nrs@lists.infradead.org
X-Gm-Message-State: APuU4Z/4nYB3Q6W5e6vN/qJwHsZxFK2ypo+y7tktpSpjHXIbAN6g6EWI
	bvD/abmDCnuK23QSBPm1db5v2IQuXNBChb9m9QRWAGEolM4HDpsKebNgoXU80Bep31U=
X-Gm-Gg: AYBFou2OQMN+zG2F1pXO4X6sIES/MAns3NLZbqNHFccuN05tygG6v0I8G2CMWHTJjkR
	dzyszDBfC3DA+slJGrlvaVG+TVjbvWwROTsjMK4ZkXSfKJKoxo7QT1NJ0XOfiRPlVQ4DYLkcyNT
	uHyUVRcl/VcHMuTBTpsRAlC7OoGFUpoN+Dcxg+rpB17+68UiaojLqJe9FZ6+M9GZZQ1BQVcxmuv
	0bdb3gjIINVXqTV1EIXYV71iKQ4RJah37nPd4cyYU/z+/lzdjdQP1yt0jzAShn/dvFwhN1bItVt
	t0ivc5JVwdQNDvyXGLstiR69fS9d12/bRtNwI/eL03bLgflT4kCtt0wP//8Yqvu6YzUKVpRoj1I
	0c7ChicjIzRd2koF85Ntz0kzvV9B72G4pD7rmaMhUkrzqenkfmGcPl4Ll6GdfZA470KOQsojENa
	Eys+3sofU4qGk73oWjBqQzjwdBmeI0HTgA1qkGYu/+SrDRcmp+kCfPsuDSFeKf1WYw7Vpkaig7g
	JUomGP9ym8pRdOnTwmWgxZgGOipZplNFlRSyYKVGGN7PIozybkTPsI8w6/M+CWdZAkQzsy1/H+T
	7NaEpMXrUcMvZSb6IElW/t6caxztdA==
X-Received: by 2002:a05:6a00:3992:b0:8a0:1acb:677a with SMTP id d2e1a72fcca58-8a9bffd381dmr11899872b3a.57.1793720425872;
        Tue, 03 Nov 2026 07:40:25 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9b3e:1037:bf8:ee7d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d3603sm3345314b3a.37.2026.11.03.07.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:40:25 -0800 (PST)
Date: Tue, 3 Nov 2026 09:40:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <auoAZs66RA5OYjJo@p14s>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
 <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074029_017838_E4BF3EAC 
X-CRM114-Status: GOOD (  29.99  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Uwe,

On Tue, Oct 27, 2026 at 05:25:20PM +0100, Uwe Kleine-König wrote:
> Some devices have special needs about how an Elf segment is copied to
> the remote cpu's memory space where the default implementation using
> memcpy_toio/memcpy and memset_io/memset isn't suitable. An affected
> mainline driver is imx-dsp-rproc which includes a near-copy of
> rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
> accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
> directly accessible at all and DMA must be used to copy the data.
> 
> The new callback can be used to implement just the driver specific
> memcpy + memset to increase code reuse.
> 
> The patch only appears big because of indentation changes.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 64 +++++++++++++---------
>  include/linux/remoteproc.h                 |  4 ++
>  2 files changed, 41 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index da3cddbe7d4c..3c749a39e5da 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  			break;
>  		}
>  
> -		/* grab the kernel address for this device address */
> -		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> -		if (!ptr) {
> -			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> -				memsz);
> -			ret = -EINVAL;
> -			break;
> -		}
> +		if (rproc->ops->memcpy_tova) {
> +			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
> +			if (ret) {
> +				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
> +					i, da, ERR_PTR(ret));
> +				break;
> +			}

I really like your patch, but I'm wondering why you decided to move
rproc_da_to_va() in ops->memcpy_tova().  Right now it is called in both path,
i.e with and without ops->memcpy_tova().  Wouldn't it be better to
unconditionally leave rproc_da_to_va() in rproc_elf_load_segments()?

Thanks,
Mathieu

> +		} else {
> +			/* grab the kernel address for this device address */
> +			ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> +			if (!ptr) {
> +				dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> +					memsz);
> +				ret = -EINVAL;
> +				break;
> +			}
>  
> -		/* put the segment where the remote processor expects it */
> -		if (filesz) {
> -			if (is_iomem)
> -				memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
> -			else
> -				memcpy(ptr, elf_data + offset, filesz);
> -		}
> +			/* put the segment where the remote processor expects it */
> +			if (filesz) {
> +				if (is_iomem)
> +					memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
> +				else
> +					memcpy(ptr, elf_data + offset, filesz);
> +			}
>  
> -		/*
> -		 * Zero out remaining memory for this segment.
> -		 *
> -		 * This isn't strictly required since dma_alloc_coherent already
> -		 * did this for us. albeit harmless, we may consider removing
> -		 * this.
> -		 */
> -		if (memsz > filesz) {
> -			if (is_iomem)
> -				memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
> -			else
> -				memset(ptr + filesz, 0, memsz - filesz);
> +			/*
> +			 * Zero out remaining memory for this segment.
> +			 *
> +			 * This isn't strictly required since dma_alloc_coherent already
> +			 * did this for us. albeit harmless, we may consider removing
> +			 * this.
> +			 */
> +			if (memsz > filesz) {
> +				if (is_iomem)
> +					memset_io((void __iomem *)(ptr + filesz),
> +						  0, memsz - filesz);
> +				else
> +					memset(ptr + filesz, 0, memsz - filesz);
> +			}
>  		}
>  	}
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 00019b1895e6..e750a127cbc4 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -75,6 +75,7 @@ enum rsc_handling_status {
>   * @detach:	detach from a device, leaving it powered up
>   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
>   * @da_to_va:	optional platform hook to perform address translations
> + * @memcpy_tova:optional platform hook to copy data into remote memory range
>   * @parse_fw:	parse firmware to extract information (e.g. resource table)
>   * @handle_rsc:	optional platform hook to handle vendor resources. Should return
>   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> @@ -99,6 +100,9 @@ struct rproc_ops {
>  	int (*detach)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
>  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
> +	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
> +			   size_t filesz, size_t memsz);
> +
>  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>  	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
>  			  int offset, int avail);
> -- 
> 2.47.3
> 

