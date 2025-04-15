Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3273AC369C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlbC+gGsedKsWiYVjB0QYl928YSZP6eIRB7xhX10ooY=; b=Ojy++7Ul5jA0AuFkMHXFj0EYMf
	nxtHMd9dvOy12koT2cjCZKAZBwvVFg5Wki1Oq0q9UAml8hXirgxv1nYr+gbdzVmK9c5keWK21qWoB
	i/wclNvEws4HZ5OMpneDMWZ9m8jqgPA3s/lANaRIbL7U5UUcLoUQ1LZWDE8R61DF85YoulSySKP/5
	ohuWamIcLo6IYseJoN5Tx+mecQSK9uXq0VP8gVYgfsqVqbW086xeABc7nnZVIo5budtDN+gtamRf9
	UEwitU78YXne9n9OhriRUwhUZMeoKxW7bL/eoTa/jCSfQmBdtNyaD5yq4UkD6QHbPPNXzQ/TIKLF7
	wZpf990w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4k5p-00000006Z7B-0mEO;
	Tue, 15 Apr 2025 17:29:05 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4joY-00000006WTZ-0CWt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:11:15 +0000
Date: Tue, 15 Apr 2025 13:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744737071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OlbC+gGsedKsWiYVjB0QYl928YSZP6eIRB7xhX10ooY=;
	b=qn8lLfmOPA7UysVojoh0ZBXNQwgh4LGjjIaUhyWv9CJXRLvzsQWvTkJqxUZlKSPYfV9aMR
	X3L01sNDyguc/1kxeqojPT7rWxmMRe8erNDB9NLvpyMVJ3PiVvq8C2AfrpD2WagnrXAIOK
	eL6qf3/bDPVGncEVhbZdD8egszCaJyx6PiCp6k/R8rCCldUYBX9iIgdM1MQ2YOh0tMB+JY
	5OnLRhFz5CINve5TWHFfHHyyU3F25J9MJDHxrqgmUdGs4CfhPhPmZC9NU9RivSY2NSfORQ
	qUSYyCLKqqgjFw8z2nb3YU02YYCY6a9PjZAbO2CfoMZEbhwiXKOkz3vAQtbcgQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] i2c: pasemi: Sort includes alphabetically
Message-ID: <Z_6TK0WKxIK6_9-n@blossom>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-2-c543bf53151a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415-pasemi-fixes-v2-2-c543bf53151a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_101114_227530_7807CE84 
X-CRM114-Status: GOOD (  10.99  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Tue , Apr 15, 2025 at 03:36:56PM +0000, Sven Peter via B4 Relay a écrit :
> From: Sven Peter <sven@svenpeter.dev>
> 
> No functional changes.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/i2c/busses/i2c-pasemi-core.c | 10 +++++-----
>  drivers/i2c/busses/i2c-pasemi-pci.c  | 10 +++++-----
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
> index 71cc8cfc7c5cbf3924269f6217712d42008c03ff..df1b0087dcacb0a3b94196368137d5e20b0e6d7e 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -6,15 +6,15 @@
>   */
>  
>  #include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/kernel.h>
> -#include <linux/stddef.h>
>  #include <linux/sched.h>
> -#include <linux/i2c.h>
> -#include <linux/delay.h>
>  #include <linux/slab.h>
> -#include <linux/io.h>
> +#include <linux/stddef.h>
>  
>  #include "i2c-pasemi-core.h"
>  
> diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
> index 77f90c7436eda2df16afd7f1cac79355fb005bfd..b9ccb54ec77e22bb1b77848c858e2e0cc51db7e3 100644
> --- a/drivers/i2c/busses/i2c-pasemi-pci.c
> +++ b/drivers/i2c/busses/i2c-pasemi-pci.c
> @@ -5,15 +5,15 @@
>   * SMBus host driver for PA Semi PWRficient
>   */
>  
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/kernel.h>
> -#include <linux/stddef.h>
>  #include <linux/sched.h>
> -#include <linux/i2c.h>
> -#include <linux/delay.h>
>  #include <linux/slab.h>
> -#include <linux/io.h>
> +#include <linux/stddef.h>
>  
>  #include "i2c-pasemi-core.h"
>  
> 
> -- 
> 2.34.1
> 
> 

