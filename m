Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F41FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6AphpQSUPl78NvNF7EIueg+2EXYiFyQ8P0vhAjjh5U=; b=jVhmZg9BpKiEvwwOKUph8ve9+o
	nm8PNrWXE7cFbRhs+wPa2jeCRl7LSEh6RwKTB7I0NEPWEh+W/Tr7bbOPaL5PTr/4fFmT6kSIGIWC2
	TycfnN5ZaJtPYA9ae1zNSatK6t/+HfkXI99Ni8cuLyk6SspNXpcNmWC7V4lVc0hLZMtZmG6DqjBSX
	Z8yTQi49snHKtU2sU1VT1k1QfDDOuU5C3ay94ZP2lA7rKABKoStCOtyIPYXluki9g3DH/Bto9T21K
	THn02Ro8wC5NpvzsMRVftcDSM2Z2B+qlOpxWegO9WhfLV8YnyzrykpR3G0uFS2y/aicMA6UoPFdMR
	PIeYcVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrxz-0000000D6NJ-2xcX;
	Mon, 04 May 2026 12:00:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrxv-0000000D6MB-2qif;
	Mon, 04 May 2026 12:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFDEB43447;
	Mon,  4 May 2026 11:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5C4C2BCB8;
	Mon,  4 May 2026 11:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777895998;
	bh=FmmU1zdzb/NwHV/okkpMG5ffX1wADS5zh2r5zlKF9J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xU7lD3QMbhkmxDobaKClWo0Ll+gqvoaXSTlzZeHGZZ3iffFnzpMwX+5f1E3r/WFqd
	 L8lwnD76oZHMLGYxeePjOEDzIrJ83gLCqJQ6KFn2TFIn7fhgzcpsY+m+Mc+MNUrq3+
	 eMdHsGfftMnf1k3rFNS3asR73qnTjm1SBBGZQnf4=
Date: Mon, 4 May 2026 13:59:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Cc: neil.armstrong@linaro.org, mchehab@kernel.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hverkuil+cisco@kernel.org
Subject: Re: [PATCH] staging: media: meson: fix typo in codec files
Message-ID: <2026050442-rut-zipping-5de8@gregkh>
References: <20260504111219.7797-1-mahamaryamjavaid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504111219.7797-1-mahamaryamjavaid@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_045959_847930_413D44B4 
X-CRM114-Status: GOOD (  23.05  )
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

On Mon, May 04, 2026 at 07:12:19AM -0400, Maha Maryam Javaid wrote:
> Fix spelling mistake: substracted -> subtracted
> 
> Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
> index 89e0f8624e5b..a6074de15118 100644
> --- a/drivers/staging/media/meson/vdec/codec_h264.c
> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> @@ -16,7 +16,7 @@
>  #define SIZE_SEI	(8 * SZ_1K)
>  
>  /*
> - * Offset added by the firmware which must be substracted
> + * Offset added by the firmware which must be subtracted
>   * from the workspace phyaddr
>   */
>  #define WORKSPACE_BUF_OFFSET	0x1000000
> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> index 76e9ca7191ab..ab4374e3b2ef 100644
> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> @@ -12,7 +12,7 @@
>  #include "vdec_helpers.h"
>  
>  #define SIZE_WORKSPACE		SZ_128K
> -/* Offset substracted by the firmware from the workspace paddr */
> +/* Offset subtracted by the firmware from the workspace paddr */
>  #define WORKSPACE_OFFSET	(5 * SZ_1K)
>  
>  /* map firmware registers to known MPEG1/2 functions */
> -- 
> 2.34.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

