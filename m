Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB00606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bu/yVrUc;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bg+Rm+NN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=foACqNTou6WaxjVswdP0rg9NJ/Jpun+aF/kRBHAU79E=; b=bu/yVrUcjSuwnd
	BNdf7tb3Q+V//Kqp/oujxiuzudjXuVONuHxFs4PsqOLQ4x2CN1I53ZRuGXqeXCsm0jEan8GrUAdl9
	MloybDTJ7oSwECfTTJerN1nApabdUyw/I9Clc0mfDLgzbsF8AEJfRgMyxJ43VzETcJyyuxwOBlrCO
	60cbODxjdsuGYXlzx0K6dy++W1XW2WRm4pDqzXb0fh2uhdcz12AiuUBjASrfMyATQwkMsckaF6xRl
	Na1CrbzYp1P/QNk29t0CpjiYw96aiJBHc5Dtg/X3bA/zjVs0AGrc1b7fTBIkILb69MbYVsqn1uWg1
	5SFjdWDj4UhY0QxVWPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNJ6-00000008ybf-0NV7;
	Thu, 29 Oct 2026 10:24:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNJ2-00000008ya2-07YZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793269462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=foACqNTou6WaxjVswdP0rg9NJ/Jpun+aF/kRBHAU79E=;
	b=Bg+Rm+NNid1PO0+KFrsaucIggPD2lzT7SXj3gO4TPF9V7wEl9cg7ibNG0MlECZdmXJqbhE
	mRSjwyI12ybIFOksM+J4B3864q98Fma572yFo4qXPS1cZYW4lXIzTlBD1lmO33DS+fLlg+
	TZSGQdA7dTDj1LLHjcbDmx0VN9MROl8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-Wonrn2_aP_OUuqqgpEILqg-1; Thu, 29 Oct 2026 06:24:21 -0400
X-MC-Unique: Wonrn2_aP_OUuqqgpEILqg-1
X-Mimecast-MFC-AGG-ID: Wonrn2_aP_OUuqqgpEILqg_1793269460
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c4445512dso1711016f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269460; x=1793874260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=foACqNTou6WaxjVswdP0rg9NJ/Jpun+aF/kRBHAU79E=;
        b=C/bsV+UVzfc0X6x7JO2CFOtV0mhw0m82lbTETnD+eWUTT7RQvvyQgvnPD1P+7MnEDB
         3sSH6hxA2V2ac/NlLNigy5+1WqZphnTci8nEZ1/aiuq/n3UyaVZRvXIB65zNozjeb5X1
         5aczFYGBgtGC54T3ygodOYtHsJ19Am/NbYLCYsAK9+B3e2MWSC/BhDz/s2acVibfTwP8
         dgzfhKIVg+uqyuZItWnmyLOwMpiDLuCfAaE8Zm1pe+R/aaoAR+cFOJyybRTTBcRGsXzA
         lLiordFwF1PibkV6BQJxzQktxGrfKGW0dc2hnTlGAjA0xnwjfGuTgDQGLRbq9nh4VCDn
         JTcw==
X-Forwarded-Encrypted: i=1; AKwUvByDXVHDiur7vryjehJPGQQ+P17EmEFnpN2hEbpHzll1cHN7smNyHePYlD/xn/oQxrnyLBuq5ktGXI2QORbvThcs@lists.infradead.org
X-Gm-Message-State: AFq9FYKsT9CvQ4eud72dfGWwF40ChGxuNDiVZzlUGor3L8U3wn4nxekg
	5l7dvHhsyZ7xpj1WJ6Buype1Hq7Um3++MOZKDphVP1Ik51WRQIJO9un1P9DfHNBWIwKXmVGaB0m
	oJaGjZSjEnPWKymA7E/geKBZYUJhUoqcjD5c3xf8S+Bz76s1WqsY5ovRoccNTp/3drruw3c7cJv
	JR
X-Gm-Gg: AYBFou2fC+Mv+egS1vQlfXtMsekcpWHx6uGgor4hNrRtVyhzQXxqWC5LhjKqshZaWJ+
	3v+gFYPAJydHuQWliUtNZ0F6eFUtnpKCp+MjBMnUGiCoArv1zWS1W0jk3HuZA1QbfHForfv3poz
	5aE5laVRcLB7/EgBsMa3PG/NjrKPXJL8rblUFVZhkY2ujFEXHQeccveD8sphGD31UAGiJRuIsv2
	T2F03gaaFrMKpbj3IMDDhPoeQJQqIfdDLt1Jr8N7luNdIe/JCbHa0N8ATwromNyX+ddI7jx7CC6
	DEl9YLRzU/qs7ukZxeqogG0NBK0snqOJX84bsqO10c1ZN9AxX9J9tccEgJXeLtrcfYKREbcfVp8
	xa2/70koOUKDDUmN1WKMvMRl3UJBt0riBnVH/D/947UewbpdQIsyzaHZxq1om2Q0K83/dYlhEDp
	JzyA0en9XdESyzEsSjkU7vWcYg72YLS86zc8NJLzvaDK3Q/Hs=
X-Received: by 2002:a5d:5e8d:0:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-48e5d45a4edmr11994831f8f.27.1793269459754;
        Thu, 29 Oct 2026 03:24:19 -0700 (PDT)
X-Received: by 2002:a5d:5e8d:0:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-48e5d45a4edmr11994775f8f.27.1793269459257;
        Thu, 29 Oct 2026 03:24:19 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm40661159f8f.45.2026.10.29.03.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:24:18 -0700 (PDT)
Message-ID: <3fdea60e-abe8-4ecc-bce2-672f4e3d6b47@redhat.com>
Date: Thu, 29 Oct 2026 11:24:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/4] net: stmmac: fix DMA descriptor ring
 cleanup issues
To: Ding Hui <dinghui1111@163.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com
References: <20261024071319.875921-1-dinghui1111@163.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261024071319.875921-1-dinghui1111@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dOVbLS9ZWE4fibetJqhtwsWcQsyFmIeDggTV9aAQ_XU_1793269460
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_032424_162078_D1695B3A 
X-CRM114-Status: GOOD (  12.67  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/24/26 09:13, Ding Hui wrote:
> From: Ding Hui <dinghui@lixiang.com>
> 
> Hello,
> 
> This series fixes the NULL pointer dereferences in the stmmac TX/RX
> DMA resource cleanup paths and the associated error path issues,
> found on a DWMAC platform whose descriptor ring allocation may fail
> under memory pressure.
> 
> Patch 1 adds NULL guards in the free helpers and makes them clear
> the pointers they free, so that a NULL pointer reliably means "not
> allocated" for the long-lived priv->dma_conf.
> 
> Patch 2 makes the per-queue allocation functions undo their own
> allocations on error, instead of leaving the cleanup to the outer
> error paths that would then walk partially-initialized queues.
> 
> Patch 3 releases the descriptor resources through priv->dma_conf
> when __stmmac_open() fails after copying the temporary dma_conf, so
> the long-lived configuration stays consistent with the resource
> cleanup.
> 
> Patch 4 holds RTNL around the descriptors_status debugfs reader and
> skips queues whose rings are not allocated.
## Form letter - net-next-closed

The merge window for Linux v7.4 has begun, and the net-next
tree is now closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens. There is some uncertainty
about how long this merge window will last, so please check
https://netdev.bots.linux.dev/net-next.html
before reposting. net-next _may_ reopen on Nov 2nd.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle


