Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8FEC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+ItDRvc2CgbELkYEQjQqulbuQxz4MyRUQS30G+nsPs=; b=rSRW532e7Vy9dFA9ZGl5XSIxae
	Bk2b+KHuMET2B/m/aUT9GbVXYNq0VLz7k54pcbVZFOL+I8stjFsWVqb/oFPJQGXkMkHZfWZnahQKW
	Fhejr5ovaehpdSfDN880dxdv0RY2BCwmAuV8DaV7MeFteBtJhr3PCdmtlwL+NN97NEN2Yv6wFfHx0
	hj4Pv9G79okoK7TnAvYjrnx9F7a6w6mYcVt+dF1q+420KEGjCg2kgCG11CxPczEquLIgELER4y7s/
	NLAPTTPETa9JWHagL/KTRrOu2fAfILtYyx4Czur4DKpp8DirhILAGAY9zLwQek8S3xHHCIi7hibDP
	SeMI5TSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4k42-00000006YsZ-1Vd5;
	Tue, 15 Apr 2025 17:27:14 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4joA-00000006WPh-4BW7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:10:52 +0000
Date: Tue, 15 Apr 2025 13:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744737045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l+ItDRvc2CgbELkYEQjQqulbuQxz4MyRUQS30G+nsPs=;
	b=c6y3umwuPNz+nEZojVdyszn3dB7XfYQ6DeOGO0pEcfZYHJZFEQC6gO5ZQENAnnJouRPvUL
	rUhnMlvqolEh+vEcC1cc4b7bgSH+GUDph2yh1qNZiao/yEgJp2XvIMepfstsT6bFB3+QhS
	MTA46PVnNK36GsCw0NqCSieU1jNsHRBqqc5MzIT0iNRcm+g82GQ5gFMqSCdeHlvU+gxypA
	+6oHbfKbxam8Qcqns2H0PlmeebG6aZQgmz8onhwLASMlbmXaTFSwxes+N5HMdDIjybb9od
	lPFK9bY9pBc4bVRjV+60lkAcZp0K9HG0rVT3Jd3emgWqSPifN2Dw0OL4SM8mBQ==
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
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/6] i2c: pasemi: Use correct bits.h include
Message-ID: <Z_6TENulj4zwBzfm@blossom>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-1-c543bf53151a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415-pasemi-fixes-v2-1-c543bf53151a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_101051_503757_711503AC 
X-CRM114-Status: GOOD (  13.72  )
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

Le Tue , Apr 15, 2025 at 03:36:55PM +0000, Sven Peter via B4 Relay a écrit :
> From: Sven Peter <sven@svenpeter.dev>
> 
> When changing the #defines to use BIT and GENMASK the bitfield.h include
> was added instead of the correct bits.h include.
> 
> Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Closes: https://lore.kernel.org/asahi/Z965tVhC5jxy1kqZ@surfacebook.localdomain/
> Fixes: 8b4da3ef9206 ("i2c: pasemi: Add registers bits and switch to BIT()")
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
> index bd128ab2e2ebb64929f2f6a3525835a880c3114d..71cc8cfc7c5cbf3924269f6217712d42008c03ff 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -5,7 +5,7 @@
>   * SMBus host driver for PA Semi PWRficient
>   */
>  
> -#include <linux/bitfield.h>
> +#include <linux/bits.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/kernel.h>
> 
> -- 
> 2.34.1
> 
> 

