Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E4EC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 20:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41s30YXXRbwXzRGFeyeJrCXKI9NiwCNsTttTjp35lHE=; b=qzyZcu+5fxTLo/hQAyk266P7pz
	G4wDiaJxiOU9uxu5sgaubi+oaAVSUiggiIuURhHSRRZYJ+BSA8gOFQtiaXilfPcHmRXqKgiO+ICXY
	uERZneEQic3cL6J4kwhs5m6b3hCXquQkrdsijnKIfeTLIslgR5GOqSMQQ3+yEPgiPwG7gXbftixQw
	oVNZZSZPJnGtY8DWObGvyxtjYwWT2r4HlpzeLZhsLUX0l6S9Ro2aBq9yPVqZ5bk/JvnfHUN3zwfdG
	PdtrJBxmSbhPVypG/TlIUEgLWvA7MeeBs5WEmG00lUklm2V+N6nrh9zYyp4fJOAFjNkDT89T4b7nn
	KZLgJldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txAYg-00000006wHe-1AQP;
	Tue, 25 Mar 2025 20:07:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txAWw-00000006w07-1RX4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 20:05:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B728343596;
	Tue, 25 Mar 2025 20:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA3EC4CEE4;
	Tue, 25 Mar 2025 20:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742933145;
	bh=X/72qEeKSYHb3elkSglf86VYveOfq9a0qmJcTUN5hDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahM6QEZcVCjW3BKr+TU9Xmp0YDSX/cu9MQRksROxL7aglAWOxiMyhridJgcTp/Se0
	 DzQEGs49sg9qFUNT5x+F2Dw4vxeHVxT9aQIegI3yp/n/FaTxw2ob08lZUhCYMWWaKV
	 cuNPOtVoJ4yRwLw3TN07ECkf9VSx6pOmK9q+zJlFH51al+3SJZBLKjRrKvzcSQp+av
	 HwKgZYLB/u4uCKrjcaoouEUAplD5yR1Z7C7XRT1tdHpDRBCNulkg2KWB1fdgEYUG6c
	 I9LPjoiDkBcOnhRX50d/fQRqcnyQlwRRYR37u/0Rzp/6Q8RaZ/NxRDoBMMTxjxaOW2
	 +Ca6+PmaKmydQ==
Date: Tue, 25 Mar 2025 15:05:44 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND] scripts/make_fit: Print DT name before libfdt
 errors
Message-ID: <20250325200544.GA2195874-robh@kernel.org>
References: <20250209-makefit-v1-1-bfe6151e8f0a@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250209-makefit-v1-1-bfe6151e8f0a@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_130546_404738_44963992 
X-CRM114-Status: GOOD (  12.08  )
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

On Sun, Feb 09, 2025 at 05:55:28PM +0100, J. Neuschäfer wrote:
> This makes it easier to pinpoint where the error happened. For example:
> 
>   FIT     arch/powerpc/boot/image.fit
> Error processing arch/powerpc/boot/dts/microwatt.dtb:
> Traceback (most recent call last):
>   File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 335, in <module>
>     sys.exit(run_make_fit())
>              ^^^^^^^^^^^^^^
>   File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 309, in run_make_fit
>     out_data, count, size = build_fit(args)
>                             ^^^^^^^^^^^^^^^
>   File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 286, in build_fit
>     raise e
>   File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 283, in build_fit
>     (model, compat, files) = process_dtb(fname, args)
>                              ^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 231, in process_dtb
>     model = fdt.getprop(0, 'model').as_str()
>             ^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3/dist-packages/libfdt.py", line 448, in getprop
>     pdata = check_err_null(fdt_getprop(self._fdt, nodeoffset, prop_name),
>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3/dist-packages/libfdt.py", line 153, in check_err_null
>     raise FdtException(val)
> libfdt.FdtException: pylibfdt error -1: FDT_ERR_NOTFOUND
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> The example is from a different series which I will release soon, which
> enables FIT on powerpc.
> ---
>  scripts/make_fit.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied, sorry for the delay.

Rob

