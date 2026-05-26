Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10243CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbKjzg9bSmm9vRJLbDtl4q72jw2NHj5tbX6e2y5JU5I=; b=eYWTzX6hNIUGBxP1UxWqXAKMWw
	cmWrN0EtEHaJbIHgJ7ZRViXyIFamb7ZFQ2sLuQ27QIuM0p5iY6MKT4QNaeY3lniG/N5zK8Hmnlpw7
	WRg2qDtqOQkR38wFJoZCPEIqQm0XrgK+ojrxlbeb8g4qJvhbJj8Rj6d3Du4v43r5Pn3+DCaZAHRo0
	AUe9bfehkK11C2c/9l5TLOmpvckz5SjGNHUQWFRepHqX+zvv5nAZIRN8hdpT1vdzryFSJfq9YUewj
	ec32xK2HY8z6bCmiljrTPqvECS1XVkqYzKtzqn8i4sRk2YIJIu2aBu9QLwP6JUz0YbUEWjEElUy4i
	hSRExRtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvPK-00000002h6k-3JTe;
	Tue, 26 May 2026 17:17:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvPH-00000002h4s-2uSt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779815849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kbKjzg9bSmm9vRJLbDtl4q72jw2NHj5tbX6e2y5JU5I=;
	b=R6AVUtDrOHvciJ3n+l1MO3qtVn6V6ekeJI80E+Q1j6JUi+itNH5zMzBQLr8RCfRfr4wITo
	dYZmW4c+RDuXdQm0WhsDeutOYPnxQ0ULgP/dPKZfXz4UbB+0J8/AwGO9ZScOVJBUSzo/d9
	WUvLL41yQTi++/bnhfsTJSg1zaXx/oA=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-OMMXJv7MMDqZ6w0GrtUImw-1; Tue, 26 May 2026 13:16:03 -0400
X-MC-Unique: OMMXJv7MMDqZ6w0GrtUImw-1
X-Mimecast-MFC-AGG-ID: OMMXJv7MMDqZ6w0GrtUImw_1779815762
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-43b6f928e2eso3761157fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815762; x=1780420562;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbKjzg9bSmm9vRJLbDtl4q72jw2NHj5tbX6e2y5JU5I=;
        b=Lymid2uoovBo41b2KyF7Sw8ceiXalaCOcDmtxxnxx6slMypcKfpQYkPz7Z7sLFJ8dF
         9Rgw8G7Zc8YMYxAAv7lghQuzoK+c9PQyKTBMCUfuAe9A26m6eR9/qyqtoDpAZ5mOLE2U
         hr0xp4fWwqHlKRC+N4bsGMGcIqpM0wmp9ByDODpRo2uVXeedKrtBmePBDRxRrIgNExEA
         Wnuki3ys3vb7SpEvzhOj3zpBGhG3fEx1FGK3NJrhcezMRxGBjLGlSUi5yNiKDQOYDnHn
         a7Y7XL5WLEIxxBnQisBz4OAwxsMpDy9P2qIeETylajHGHUPFKeWQkLxl1Q2gunv30Ca0
         TFlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GjsTGxgH8ROUcpWZMajS+a6/dfN3cOhVu6IxVRQ6olzNNcWbu+SBbRH5gd4lZ1LRumZ/yiDIva9F3+c0VxFra@lists.infradead.org
X-Gm-Message-State: AOJu0YyG2pa3IyOlqG7+/fnz6D0DRfknhzI4+Yi0MfRykoBNCd2Axefk
	HZQRCqhDs73ntagk/YPDaP2Hq3mKh5RhvsnFZR9vv6wviHmCbvLIHmKW2ibGPyNrHiWH4/D4HvP
	GvVuHyeALjZT6jk5HGRddVxTSCYcqeVAMfGpvtWgoO9UOjJNh2WZ1TO0TWbsoW2hWXgDvxTm5lH
	uA
X-Gm-Gg: Acq92OGf8d/aNOJS1ePby2AKZlz7P/LGwIv0WHwUwYk5Quo6RN3VIkc/O2TxDqzdJ64
	RG1KLxtMrscpSEKQIZxYh0B86UZjS29b0yjQusgBHvXd8uvxOjBfmPUbZCMfHSMdocLioDymPaM
	dNYxUSypWZ5HGorqsDjUXir2SKrAKuMpVUNCdxMXavMwos7Z04STuYVmh5prZEsbuNnvfYQeRyt
	a+hl49Zm+lDlRJtn77nVNvVTrIQCX/7Bm2r/+FkolIduU3tOG/HJJPA53E3Tg1/zk+Tgimrld6w
	DmDSAlOkpOVCGlnfQkHHMaVdaoZQV19ueI/7ZExNHo4ZNJ5JvYxjAuXVeDUmFNmL+12dFK0VS3t
	PemaA2bnC6J2QLvZFGgrp/dj8YpmePQ/JvX4FCNuX2SAPa0IxRfLFgj+zGT7tYOm7eFY=
X-Received: by 2002:a05:6820:4b14:b0:69d:d9c5:9308 with SMTP id 006d021491bc7-69dd9c5938emr1142391eaf.16.1779815762421;
        Tue, 26 May 2026 10:16:02 -0700 (PDT)
X-Received: by 2002:a05:6820:4b14:b0:69d:d9c5:9308 with SMTP id 006d021491bc7-69dd9c5938emr1142352eaf.16.1779815761931;
        Tue, 26 May 2026 10:16:01 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc812e2018sm148514636d6.28.2026.05.26.10.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:16:00 -0700 (PDT)
Date: Tue, 26 May 2026 13:15:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, wenst@chromium.org,
	laura.nao@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: mt8196: Select REGMAP_MMIO for vlpckgen
Message-ID: <ahXVT62JUZmliXfy@redhat.com>
References: <20260522133023.355404-1-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260522133023.355404-1-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S_5SpCRZSsL5TcnQI0bUUp4A02-A2w9G7mBC1NFlams_1779815762
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_101731_803308_2F9E8992 
X-CRM114-Status: GOOD (  11.66  )
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

On Fri, May 22, 2026 at 10:30:23PM +0900, Akari Tsuyukusa wrote:
> The MediaTek MT8196 vlpckgen clock driver uses
> __devm_regmap_init_mmio_clk() by devm_regmap_init_mmio(),
> which is defined in drivers/base/regmap/regmap-mmio.c.
> However, the driver's Kconfig entry does not select REGMAP_MMIO.
> This causes a linker error when REGMAP_MMIO is not enabled.
> 
> Fix this by selecting REGMAP_MMIO in the Kconfig entry.
> 
> Fixes: 2f8b3ae6f0cb ("clk: mediatek: Add MT8196 vlpckgen clock support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


