Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D08606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3n1Xn9qJ;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yCxGQzmO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v85/dxSKl2fjZlg4NNDW7kCAXPImgdYEhqBglpB1Uzc=; b=3n1Xn9qJJ53JIH65DWW/sKpnYJ
	SVhLZSbzuTbOpeGscDZxyE0axFR4thicJWfKABK2ksap81pmHZsblQrWhb3bbRqkYLPFV9xRH9D4C
	mzk7PWcWSRY3A8WDgPANmj/GR4pX0wxB3o5WxNZRIR9B/hnipm6pxpdFUmuR2xK2jWdf7CwK/tqwD
	Yxi4l67TUuvf08LEv9CmphiClfN8APzw5D3LCVSdVHWSd+xnZw6XEMBuDA46sn2AvqwSOKW4IFlFr
	10Gb3pOTEiAwVKo8JZpBwBnjDaXBQjVLvfTKpBfq6kP8BFXtEf2rtYUvJc6Q9yiMoB710HZxyKRmh
	pFqYWC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe6H-00000006296-1xC8;
	Wed, 04 Nov 2026 16:44:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe6E-0000000627o-2Rod
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:44:35 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2e98798cbddso4946445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793810673; x=1794415473; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v85/dxSKl2fjZlg4NNDW7kCAXPImgdYEhqBglpB1Uzc=;
        b=yCxGQzmOnuicWW4KabWR5b3pxrSn1Z/9Ub3Si0aPOAhNqftHDYTdjLYw9gVqynQF5S
         ZvOaNRDoVZV3e8x8B/ewWab04hfZfs0jAtEW/g6EkP7LrH190AUox38dBJCZe4oSBkdl
         RkOJEPa/S56rcfxSLZaEFg5f6QKIx2RL1XajG0tNl0WXaMlPlnn10i6P+ZU2i8Y8w6b3
         JsAjQpcR4i3kbCNK9Hg6iYztcaOjp6BmHHfOqCkoD2CqcrtemHfq5bzI5gJhXef4gS7l
         hUBZRKBvOxuuAA+a8Wl4UTslqsvA/8H1IHp2KUPVODKnGARgYRjmZn22lLB+Orvf8nQH
         IMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810673; x=1794415473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v85/dxSKl2fjZlg4NNDW7kCAXPImgdYEhqBglpB1Uzc=;
        b=a5m2pqQC+wmO+FC071bYmhsQcQGA8wm4HkGfYwWRaWc6Xk1l4M3+kj6Zh2v6sF3UV2
         GjPqsgpqIo8ftYq5cQ5s4OxYkwSfyoVPzHvMTjFD2tNjAc9VbhvS+GP6GUQTJvfnIl/U
         a/QLB1m1Gt6+jrObBtkHBXfJ77oLT72ADm3IF5aaoVL0w+MW4Qx3JhIAfuMje6YjLyMc
         RQlXdAwFTEjVGeDJB9+TVf7Mp9TGcaI+KguXBAtW5/JqNnTZznhoMM4M7B/7/4vQc1ws
         dX7oCnaTQoROpUabd0H4VigBZDDAFq+vYqkKTTvTA2FrvwQw/AN1qAIXEb6Um0OGs5U2
         ngXw==
X-Forwarded-Encrypted: i=1; AKwUvBzw4qh9huCnO1wgZxGR5Ha3NktzIt28mPwNkSyxKLuLu295vyqss2C6EijeHXBjlsQxN6ePApcj7IDImp6HKSqC@lists.infradead.org
X-Gm-Message-State: APuU4Z+MPl0LhLzXdZhnv+4lZjZzoOGsnYD8GzKj0LHu31iZtHI9MXwE
	ELYXp0rRWSVyupi25L2RDDU9Bhsa4vDrVHogq7lCrFvKCXqb0Ven9v6wYUKNq3L63FI=
X-Gm-Gg: AYBFou13tcK8I8/G6ChNvBO/FnvdAi2W5G5ngZq368tARBMYCaQ4T5J9fAYfhHGnHfM
	RvLF00qcfXwQXWi4W4ar5J7C0X6lysSIg+FiqsG8QvOD/Xs4GnaxHDohuHHWHNBi4/UpVf/bgag
	oEJ7wt2oJ5xyXyW0lQ8wi79UL+BInI9bmxF8koxvneEuO1XiI25+hrL3no1+lLJSlxRlbkiTzmN
	h06Lp913YFXGVKLXnUZyLAgrGL9CtdQZnPsH0QnorDjIKdthonpY+uenIe/WtvMAtRK3I5ADtjO
	YveglZA0GqFtQNNr9ksXmpQOTl5LSSgEGqbHI7TiCw5ZcdS/89KkPugmexZON/Hs2wON1T5QlXd
	OnpBuhsjaTmKhDkRjEwGQVkhGKjOvR6IfHGHUHQhQisbQsMVlPUPEIupCsfvRD26HwqyuRYPDE2
	giUvUeTAQuqnVV3zZtxwaVjjz2yBLl0nK1IcKiBrjeTqTe3Kqu0MN/2raZGCpHktFAj4C3E/qam
	ij5tWfJXrSLsdNyKX+10B1W4wEz/rq/lKfb3jqTc1jG0a3/DNc+2JPthonYAn+WlfiDdtqyWHTi
	1xaevlLDB8W5CDy19givIKcVMXpIHgO1pzwhhvODLAcQKNnJI51w
X-Received: by 2002:a17:903:37c7:b0:2e9:cd03:b432 with SMTP id d9443c01a7336-2eb36501f0dmr158595375ad.60.1793810673005;
        Wed, 04 Nov 2026 08:44:33 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:bbc3:cdac:2cd9:7fc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0910faaasm10192365ad.47.2026.11.04.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:44:32 -0800 (PST)
Date: Wed, 4 Nov 2026 10:44:30 -0600
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
Message-ID: <autg7vGliR7-lH-V@p14s>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
 <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
 <auoAZs66RA5OYjJo@p14s>
 <auod0uYPow76TEb8@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auod0uYPow76TEb8@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_084434_629422_50DE2C00 
X-CRM114-Status: GOOD (  23.51  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 06:49:59PM +0100, Uwe Kleine-König wrote:
> Hello Mathieu,
> 
> On Tue, Nov 03, 2026 at 09:40:22AM -0600, Mathieu Poirier wrote:
> > On Tue, Oct 27, 2026 at 05:25:20PM +0100, Uwe Kleine-König wrote:
> > > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> > > index da3cddbe7d4c..3c749a39e5da 100644
> > > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > > @@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
> > >  			break;
> > >  		}
> > >  
> > > -		/* grab the kernel address for this device address */
> > > -		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> > > -		if (!ptr) {
> > > -			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> > > -				memsz);
> > > -			ret = -EINVAL;
> > > -			break;
> > > -		}
> > > +		if (rproc->ops->memcpy_tova) {
> > > +			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
> > > +			if (ret) {
> > > +				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
> > > +					i, da, ERR_PTR(ret));
> > > +				break;
> > > +			}
> > 
> > I really like your patch, but I'm wondering why you decided to move
> > rproc_da_to_va() in ops->memcpy_tova().  Right now it is called in both path,
> > i.e with and without ops->memcpy_tova().  Wouldn't it be better to
> > unconditionally leave rproc_da_to_va() in rproc_elf_load_segments()?
> 
> The reason is that on ADI's SC846 the memory for the remote processor
> isn't directly accessible by Linux. So there is no virtual address for
> the given device address and thus the implementation of .memcpy_tova()
> on that machine won't use rproc_da_to_va(). 

That is a valid use case - please add something to that effect in the
changelog.

> 
> Best regards
> Uwe



