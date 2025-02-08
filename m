Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEDAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 09:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcF1EdGZJtNd4krhVz+tbWa2L82gSrZFZiutz4oIqDU=; b=nVriENGRl3jmT8ZTee30guhTcn
	TWCaSjSqaqUJ4eHd+M5qbGYLPE4JV16dIrpJ0G0mQIU9inKxyFUKf8lOIpuyjtqTqzpNM00PQlKci
	DODP8qtM0ExnQMIMyBbIcAWCPMRcpe1OwSTKE3T/ABaTr0sFFv+TSH7TqQXowAt4LS24DbmNG4Two
	XHSEH2wHJ11eTSKrHd9tVArqmU//dZkFzpknpmdeoKSrgPezoPmqMQcPovU1iLSMwrXBZiI+oKV9W
	I7iGkIFH51XWRjip/rqusV8mqJAVFPRbrbK/X6eelDKFE6UlVtwenwdBiTWMQYEmC1NQkIS4P9fpn
	MVdSD3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tghcZ-0000000Cgov-3xJc;
	Sat, 08 Feb 2025 09:59:31 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tghbA-0000000Cgdx-2x0J
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 09:58:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 5ED213FB5D;
	Sat,  8 Feb 2025 09:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1739008679; bh=Da5PceD4nSNuB1c7slA9pli6PCIvqpP7MItx3meXMT4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FX7FzS64oOVPoNnOVFB1wLz/NNDiVn3OnhUKSyiWURYyh8TxPQ18nRdzlJQQmyU+B
	 O4L6XRU0OWuNPXV5H4BymyPNXe+KWZKF3Zc+JylhFgHiCqwlzdDcy917Nr8x9X6WM6
	 Uv1HUtzJ1CnIz3u//H0qdAmSya/MxGuQhSH3pzCYZ7MTJfqdODd2zW9yLE6Wpq5CF5
	 Z817GuJlmx1NfzEJFtkDXLx/IK3Xjf2sAjZi1yur42q1Cn0npxSvkWRPp96ZYadzuV
	 hkD99gVstKN8mIu2wZKI98kAWKSfTh7ik/n3NnyYAoIC2kEEgtcf2n3i7FpKIGKzKH
	 WAV8YKPwrRKPA==
Message-ID: <cf367a36-88fb-4999-a5ab-d34c4ded718e@marcan.st>
Date: Sat, 8 Feb 2025 18:57:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: arm: apple: Add myself as maintainer
To: Janne Grunau <j@jannau.net>, Arnd Bergmann <arnd@arndb.de>,
 Sven Peter <sven@svenpeter.dev>
Cc: soc@lists.linux.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
Content-Language: en-US
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_015805_101044_003AE232 
X-CRM114-Status: GOOD (  12.87  )
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

On 2025/02/08 18:22, Janne Grunau wrote:
> Sven and I have agreed to share the maintainership for the ARM/APPLE
> platform after Marcan's step down. I'm handling the downstream Asahi
> Linux tree since April 2024 and worked on or wrote several drivers for
> the platform.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2594c2300f9b054a6d57ce069120df0bb451d88..9987cbc4d14b2d2be43f259688c7791ecfd10423 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2210,6 +2210,7 @@ F:	sound/soc/codecs/ssm3515.c
>  
>  ARM/APPLE MACHINE SUPPORT
>  M:	Sven Peter <sven@svenpeter.dev>
> +M:	Janne Grunau <j@jannau.net>
>  R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
>  L:	asahi@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> 
> ---
> base-commit: 7635a78a95dc3bff39e9c49b34108f81a9bb62db
> change-id: 20250208-maint-soc-apple-8d2498e75509
> 
> Best regards,

Acked-by: Hector Martin <marcan@marcan.st>

Janne's proactive leadership on the maintenance of the downstream tree
has been invaluable, especially as life got in my way last year and I
couldn't do it myself.

Thank you.

- Hector


