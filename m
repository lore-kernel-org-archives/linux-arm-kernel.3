Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9927FCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 06:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUI1Kvy8G4UZN8XVWU9+FHDr0P4yKt9TWkL45QXTVdc=; b=hrmrd+En68uiD+nUdxV2m3Jzpu
	hCRPl4lnU+9fc86f5E45xGRdcQcxY/Tda91GHes//eT0Lpua8ggrntl0f4l5oDiacQWJfnb4bQYh7
	ge40dvp0FLTJKA2zbPZWzzyNK0afKjgP0cc5OV+O1qEe4b1ggscHvwJi1K7D9sNmVvWe+DtRhaJrJ
	cS8v130KJejIjRHCaLmJsrgh8q7E24vx9OUxtKEGQ6qnErUuCpLY/oad9HRiBUHz4+bL0Zp8PfSVv
	N9ARZyg7EttxXL/Sar/mHb88Kr6mEJDiTp9IZcXs+k3FyqVYzdxmy3rhgFUBtwvnFLYZSJbhwglqU
	Gam29A8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOUqp-0000000CCu2-1VCz;
	Sun, 17 May 2026 06:19:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOUql-0000000CCtW-2n3S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 06:19:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso7351095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 23:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1778998781; x=1779603581; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qUI1Kvy8G4UZN8XVWU9+FHDr0P4yKt9TWkL45QXTVdc=;
        b=enM8j9P4ULEXAjs+U1VLjKGucJ9tZ9arzRWGdxQvG0G56cbxkI3uCj3vVSkEaw3/Md
         cAoXTJ9YAbbe5INv81+m1npf75X7oopiyQJW5ZgNqBN/qYut9q0dsq/+5Q2l/EMFAjRv
         acpkoR3GZ9STsQshc/eCKzZBd2j8ZeQu5+H8/csnUFjjXmfc2ucX9e4oWU5Yvtw+AqDw
         bqi5GsbuEMPddMcRHRTOKQ5dFh2Uo8WKvWAoucNtl9ROFmYH4kTYPoY3C3sX05sBoxd2
         8qtIJ+OSUbVySoejO24xtKgrXLfNkUzCsvi3MjCE6Q5Ag3aiSJa0k9IxSs+iPWMivCBr
         XYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778998781; x=1779603581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUI1Kvy8G4UZN8XVWU9+FHDr0P4yKt9TWkL45QXTVdc=;
        b=czkTU9nNAYbTS2YE9i2Z2LVgX0ocAXmwtB3LfmhwtwCUVE4DMFz+LClENUq5+4JB4H
         fNxTliMIkehD1rdCzoxWQkprBhdF3GM6B7opuWxlSNnK+XKz7o9fZ7vyx2J1etGr1ejk
         1xzeEjggFK1M9epi/DiCa2s1bhgN9jF6D8rRn2U80FSxW+ydoD4PBciP41t7jD4hjhOv
         Knd7ihGbqA/mGBU9ZjkDgjvBeQ1P/Ig4NFCITr0kg2K6JJFp3X+1FQll21WBJk3ZWKIW
         3U6avEIldCMRUG0nvHg8zw3+cp6MgDV4cGSL/fXFKTglwfG9aQULYOp+ykUrF+ipxzfE
         +fAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YmqY+7qAuyvIeLi6idRe4FsuAk8Jr1Tud4Hd2Ew0+7vR3SMHZo9VNF8xCgS1GTtHQiOWnlouBS/WNeF2odwgC@lists.infradead.org
X-Gm-Message-State: AOJu0YyFGAWDWukCnN0v/YaO45WPo4+Sbwy8VvvZONtDiVSxNivBtfzc
	E1LA8lsCbwmIcgKetf4OUE+IyX7KgF0jLQUchW3nXNvZRLth+1+LOu01fGI3wWxIlFQ=
X-Gm-Gg: Acq92OFsJUT182y5q+rgf/G39OvXqpZ4EcfBQOB7R1Yy4ji0h1W3yPUbkVP7Z7MC0k8
	dqKxLSz7Qpky44fDoXIRWTyIQpVKXJaW10unzc9HQHHc0bRRoBOklB5TPtTag+gylKpYWB6rj/9
	l/yfBoL+dgrpJZTzK6TihoLW6BfCbrx2qcwPRvoBt5WuRj9lF42ga47dab39LUeHOPFmpfIWMMV
	fgbyS9pd3TYiQe+KSuP/MQiLz6UGHU3yVQYTWiPktGYTJepPElkROdUFhCgkUEPbGKXSWiFbnqZ
	VEKLyhUTprP5em8nbPemOPGjJijjrrP+dhVH5f4lwEZTUy/4ZBytiu1+gU9yyZZjdwXWF+B4CeG
	r3G9geEfF9/uzkMbiB7p1lS78SSHU7xrTGNILtSHPkxVg5sInjQuWpdPF9/8OpgT+BSLlT8ub6s
	1tGznQrN3p69MK+UcKtgJbzw5TwLjX3Nvx6ekBjw4fcQpyPQ==
X-Received: by 2002:a05:600c:a30a:b0:48a:568f:ae8a with SMTP id 5b1f17b1804b1-48fe5fda35fmr111967805e9.8.1778998781051;
        Sat, 16 May 2026 23:19:41 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537c788sm163535945e9.12.2026.05.16.23.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 23:19:39 -0700 (PDT)
Date: Sun, 17 May 2026 08:19:34 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Mostafa Saleh <smostafa@google.com>, Petr Tesarik <ptesarik@suse.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 00/13] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <agldl4XQLKAtyLty@FV6GYCPJ69>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512090408.794195-1-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_231943_724014_84AC66F1 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Tue, May 12, 2026 at 11:03:55AM +0200, aneesh.kumar@kernel.org wrote:
>This series propagates DMA_ATTR_CC_SHARED through the dma-direct,
>dma-pool, and swiotlb paths so that encrypted and decrypted DMA buffers
>are handled consistently.
>
>Today, the direct DMA path mostly relies on force_dma_unencrypted() for
>shared/decrypted buffer handling. This series consolidates the
>force_dma_unencrypted() checks in the top-level functions and ensures
>that the remaining DMA interfaces use DMA attributes to make the correct
>decisions.

FWIW, the patchset in general looks good to me. I tested this with my
system_cc_shared dmabuf flow, works flawlessly.

Thanks!

