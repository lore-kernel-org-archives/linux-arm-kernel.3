Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F21C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 22:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHiuZMzfMwC6+R9h6OiCUTROtFSvuO1j8HDLI3Uql14=; b=LHMQ/STc24OKysEsUBujBHzkwT
	+lL3zUv2yTZTT78HRij6vXs8D/R/BEUniGmXLvkgPo2Pstb1sTXCpQfGjs1jBoqhSlpbvAf5qBz7r
	dmPzMTBiH+54IoFYQGj7Pz5DfHmz+VVrAHMoyb4I2a4U8N68S8VuPowl3j28PPocoQHPowDNjbdZG
	qOQtSU0ro477FvOSb+IT26jvqqOcYF8+gk+EhLTv4IiCo2GCxLyIWz0XxaScY0rNh/UB/X0VQzpnC
	7fSvAOcW/dw/2Y39uZ5ONL97yZGlwppsIRTIN4v7gw2yIz5HHDxSUBnEPaCTpr53QrV02sMLoQ9FH
	51S3KA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMtS-00000003aKH-3SYX;
	Mon, 30 Jun 2025 22:22:30 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMr8-00000003Zxg-1Vaw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 22:20:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-23649faf69fso22423195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751322006; x=1751926806; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NHiuZMzfMwC6+R9h6OiCUTROtFSvuO1j8HDLI3Uql14=;
        b=einU/LRWIsoyBjno7dXUoIUVFEFwux9Gpz7jmTGwvl2E5Ivl4SRL7P/jzG1B239k/+
         V6VAz77IX5P4VtVkT5Xpj+zBSwBhrPBr7PpXqqhfGAcLwnVt2xDamKB6zQUzh1IgwijG
         Q2MX9wj53CnfcgdosoDjr3d+l4oqzkmMFcsTfuTLlrwc/TdxrSK6fYTC0IIv1pxuY6Q7
         OPlrlm/ewt+tMq9NJgEP67CgyYaht3cwhuPsaDBFDEfG+6T5OkMxS2IBtCIzbtfIG175
         vWLS1Ss1yjt1KwOImU9ZNdgxrFLyM4o3P4wz/RCWsYrQBSzT6S+bjuX3Zx+SrLFNKkhE
         3IfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751322006; x=1751926806;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHiuZMzfMwC6+R9h6OiCUTROtFSvuO1j8HDLI3Uql14=;
        b=IdifBfXAsVvCGMldThHpS2klkVtm3U3LnJCaMjZBJ/TcQI2IIgsi8hHGj2Txs1HGZk
         CPIajDMJC2pqf49QLeXXKLBzgK6m5xZNrn3grV5Kzjjj9VFTQeQpc3nhh65MaUuQJZ1H
         bK8XXdTdvIsuAt9ZRnTsLm2vrwq7Lj4pn5S342avj+CcsQ1Oh1boRDXn5ar7GG7lvvXZ
         bGb3UyMQUNqG8gHPoE9FLOD/cxXgZ64Lieo+aQ37NA4GxmzSwMXI2ONWL/xrIgxOKbKH
         KsxbNpagiPC53quro/1z81J9dU3/9aiYTrQa1GhEDekOZyCI5j3HXVcA9rT3bsayGYMe
         436g==
X-Forwarded-Encrypted: i=1; AJvYcCXuHLSPOVMeiVs3s8+4bKBt/YcbHcwoU8yWq0X9zbcdf1Dv8mOzHl6qpIOTuqyO8Np7IUruLd16B3NPzanjWPxk@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhi8zsJWlXWDiaJbceYH9Fz+fVkZAdEgyYHjmeXetF3KdNscbR
	ToMT8NPcrwMVJkdRA5olDshGcA11XXatNjnfqgnskzB2bHnIHuNLY4HP
X-Gm-Gg: ASbGncuwvrs2TSrNw/cdcYqWkNSgXxhOl+pODrgbLUogrOdUDpHagGhScsuVMWYU5Io
	mVdd2YhDAYeVSWX9t8SMSrF5EwywL6LqbtqhUu2v1WPJlS1ieG23dZjqC1eWCF+8QUuQAKp9mKK
	p28845CZLoSzRYzYm/iNip4jbRntSc0F+q7HlDryNjoLXsSN9fP5+wVqar6RPFfIrqljOwx2pq9
	Mx0zB1vDLJYrD4NYUb4aHMgOy3tQS/iEwoyWyvHbHBh6qx3L5fnxqtkpYSm+aaNEfGtpfArEQ2E
	KwkNrerhKU5flNNFsciSA8mhdB7XuU627ggqu/ce2fLVEceDwcpMPzmp/hbgOw==
X-Google-Smtp-Source: AGHT+IGBsxbNKvaAB+y/2y328Um5BPe7Wjg0g4g9kDG4VOXg1/QRqgyAXH7egABiIMDNmkwj7hYcHg==
X-Received: by 2002:a17:903:32c1:b0:235:e71e:a37b with SMTP id d9443c01a7336-23ac4633ccbmr244404305ad.34.1751322005549;
        Mon, 30 Jun 2025 15:20:05 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7d97sm90566615ad.172.2025.06.30.15.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 15:20:04 -0700 (PDT)
Date: Mon, 30 Jun 2025 18:20:02 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Laight <David.Laight@aculab.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/3] bits: Split asm and non-asm GENMASK*() and unify
 definitions
Message-ID: <aGMNhk0FrcQGcC5P@yury>
References: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
 <0e5988e2-eb98-4931-86b8-dcbb8b4cb605@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e5988e2-eb98-4931-86b8-dcbb8b4cb605@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_152006_400025_75C55D65 
X-CRM114-Status: GOOD (  16.35  )
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

On Mon, Jun 30, 2025 at 11:07:43PM +0900, Vincent Mailhol wrote:
> Hi Yury,

... 

> I didn't hear back from you on this series. Are you still interested in this
> cleanup or should I just abandon it?
> 
> Note that now that the GENMASK_U*() are upstream, I am done. I think that it
> will be better with this clean-up, but I do not mind if we keep it as it.
> 
> Just let me know what you think.

Hi Vincent,

Sorry for delay and thank you for pinging me on it.
I'll take a look on it at the weekend.

Thanks,
Yury

