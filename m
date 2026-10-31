Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FF0606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aywnkeTV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mD3zAA5h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ydiuw2JFoGviRXfS/1qoEyS58uTjOZNZXXzHRdS4SA8=; b=aywnkeTV4+7LA1
	F+uajxQigt735Eqp8XNt/FJhB8r5dLfsLO+xzr+r+Z8o/rZplZG0gT+JgsQeKwE7Vu0xsu0/vInFZ
	c9FlrX2gMx27BpS8+UtLMW2zYrZXIHWcgh3+CKmnPz2DYYxre3wHnxfxoU7OI463K5iT3Yii8rVsS
	BtLUuasXL75O7qPtkmqbCzD2pMR3d8CSdkH5zZAMSskr/p3xwRf71Usmvy+gHHEB/cxVhVtDzUUJE
	2fUJvKzI784iurFZ8kd10YcYCZULLPRPf5fzlGjZhehbk4LKfURm6pSeRU8n7F17EQDWhD3X1RklZ
	Kg3eht+bu84nZF2EPXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN9OT-0000000DNJl-3LIj;
	Sat, 31 Oct 2026 13:45:13 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN9OR-0000000DNJ5-3GSe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 13:45:13 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so2398164a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 06:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793454310; cv=none;
        d=google.com; s=arc-20260327;
        b=oY8E4wQMTmOefGEqBD6HRxIRVGsNSyq8GDixM7a4uNnU1l10nJaZRmM2kcoLuZ7TJt
         /PQHeeapMtLAvzIg4nz/sH3noyvmWekR/uqUfqAzPSXN7p1rA0KCXtdd1dchMuTyZgN1
         Pd9cuyZmPQswqet3CNhjUKmzx/VBJSwU6Q2qQOj2BKdH3Ht33K39KxEIF+ydKxLqsXnS
         W26WH1HG8rVupiPY62E1VkDFTf88FLTWSHEngYLJmyDdoBfZqs7nCV8hysxlydDaYqXY
         BdbX77+GM1PU/LMit0TGC2tCHm7XaPMAUr5UISjAV1XfofpvXx0kwEFxNL+idyIim1kL
         AB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ydiuw2JFoGviRXfS/1qoEyS58uTjOZNZXXzHRdS4SA8=;
        fh=kgbEChi+aa1k5G5Ha+UBvQKWYwKWLiwj0JBtwTzo0+8=;
        b=YPjBUnJbeUQR7Ba2wW1BtB0VKMUiTnJjckYIX/nDAt5UiHMNiuuZlfEKs7w8OV0JtL
         sv6RMGfMiHJV8rb5l33OhMzhf6McMlIFE8VqfWBKXkXpwpupK+3jmYnFoDJLK+mViCaS
         nIaBiBBEuNMtkPXL78ePnUQMeldgUdVyTbE1IyA/C9L4ydcnyr0jA3e08FNbtEH/AWrd
         ORUshAzsL+elovPvhaFXzAigM+DgoOmsZhK+0fFAKXdeXhq2p7x8Z9HpanNh0k85XqM9
         uCTKCYEto+/uYqqSdpl1u2+0fCTtbTxCXvcl+yQjUsm/J92IPeqO/fy+OfxTZHQPjpU7
         XOaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793454310; x=1794059110; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ydiuw2JFoGviRXfS/1qoEyS58uTjOZNZXXzHRdS4SA8=;
        b=mD3zAA5hBOdKcbLab2a18Ark4VgKrgwluCwhp6j4+lvc+1mFxHnLenmtklfJN+iVCs
         16jr1SQiAYaJjJN0D8lltDX4LskqJk8ycxe1h4UEfwIw09FYuTozKH4LNdzCyb1Fu4FJ
         6IZWV45N525Mb1/tG+uLEyJsdZ4/Tm1ELVrWLDG+GCebG4H/UQnwwDVL2kqa8yjTCKXa
         Rl2+6lRSV24p/8qnPqysoar6a6tagcyLukl1HQknKY+5N5nMTxC9KSsf1H5fCJcwurVf
         lEquwlc8rRjmyK5ULEA9jGYVM4Zw2C/auhPR1rep6201r/p7jIQRa5mY1tncw0n/74tE
         IcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793454310; x=1794059110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ydiuw2JFoGviRXfS/1qoEyS58uTjOZNZXXzHRdS4SA8=;
        b=QvObIrBa7cOt9xvE8wV/I2KLClRxPxIXv8cK4gVzG0uWAfat6Vc9QIaMxIf8S8OTgl
         G7seQ5q5Gci0WaOEnGdXfyM5jBDtgxcHOpu+8FrTDg0+pOATfuNGKQ4dNzfzzh/db76X
         PjnjFnXDq6R7s77BwRm7792oJbp/dmvBgOQrm31/k+/rKBCbLg70FDmDYO7L9qy9sIuB
         iJYh7+uRpkuhO/bSefW4faPSvsQYZ/Cq07wF35doCL4zZ5TtqIjWCB2uec5VfJKyskl3
         K3t/9U3TNSz3CpLssMOESrlMZjWIoYCYuKJWgBJuiGf5co1kwVKWDLPscJ0h5ij1Jr1l
         ACtw==
X-Forwarded-Encrypted: i=1; AKwUvBzUaJealuJu/QkgUFeW0n6Zqcgr+Falv7yoxfVaM23k4SdaCvlXhKboN1kA9vqIDWokIOPbKqJLNo21IsupkHLW@lists.infradead.org
X-Gm-Message-State: AFq9FYJEG6wpScZhg7HaXvNwaZaLH6CFxfVx5jOazI29kIxuin5NRtz5
	6ztTnPLweACc5MVi/8W4iHXShQGnI1DzfZvT9NJpGBhLogp3OlB/4/tfT0MhBuFZ7ubSSxH3zMv
	N7Jy58RqsJE+bKO7C3V9bbJ5o+ynVtsY=
X-Gm-Gg: AYBFou1FQl6qfDdQlAQUIsB+9mn9ugv+q7uioEk6so9V8rQAIwJWUu4pXX+Wzzs+NpH
	JRxX0rqZmV2CSdIZH3FECdX2IdUsrYavfZ5NUuDRZkba+Gx1rsA5ion7cgiJCNSAYIa8blkJhFn
	KJW8SayodOY5HneXiGC9M9URNcXXRVN9JuNroUxusw2znJyuPbnUmxOWu5pBOZysJld1Eahok/C
	D/+HjmO6shhmZ+zfaIS4KMk0AyjMtx4/LMdeUrhPR6qrpfCxO9KkHGC3w8X4tUCPmHvyzz2zzjr
	xS//E0+ZsbFIXGU+bLNjfq6DRi06N+CXkyHJ3AuEl2vFiP4G+Fh+Lo6yxu7ZdVc+3ZbLjzuqslj
	X11vlLZ5yvikcxQ/r2d5dQLkrV4huOrJ1Jg8obWrS5k4RfZzYiHIMGTmId4zgwKdmVi2S90A=
X-Received: by 2002:a05:6402:1ecc:b0:6b3:d0e9:2e87 with SMTP id
 4fb4d7f45d1cf-6b4ee0e1f24mr1392387a12.5.1793454309714; Sat, 31 Oct 2026
 06:45:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031005425.3351240-1-samarth.colleges@gmail.com>
 <20261031123749.3783352-1-samarth.colleges@gmail.com> <2026103143-alienate-subduing-50f6@gregkh>
In-Reply-To: <2026103143-alienate-subduing-50f6@gregkh>
From: Samarth Narang <samarth.colleges@gmail.com>
Date: Sat, 31 Oct 2026 09:44:58 -0400
X-Gm-Features: AclHuK_UZoL4ALbG8OiocStKAY43wgTppT1vPowuPmaCkqxwveQ1ulzoHGIddAk
Message-ID: <CAAbz3fR3DxTL66-0MJVsoWq5-FhypwdDn6=A5iyLUKY_LyOD0A@mail.gmail.com>
Subject: Re: [PATCH 0/2] serial: keep the flushed TX buffer mapped until DMA
 has stopped
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_064511_865693_95FCDCB5 
X-CRM114-Status: GOOD (  21.74  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks Greg, I will address the findings Sashiko found, would
appreciate someone with hardware giving a stamp of approval!

On Sat, Oct 31, 2026 at 9:00=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Oct 31, 2026 at 12:37:47PM +0000, Samarth Narang wrote:
> > This series addresses the DMA buffer lifetime issues in amba-pl011 and
> > fsl_lpuart reported in the parent thread, where flush_buffer() unmaps
> > the TX buffer before the terminated DMA transfer is guaranteed to have
> > stopped accessing it. In fsl_lpuart, the buffer is unmapped even before
> > termination is requested.
> >
> > Since flush_buffer() runs under the port lock and cannot wait for DMA
> > termination, both patches request termination while holding the lock an=
d
> > defer unmapping to a work item that first calls dmaengine_synchronize()=
.
> > The TX completion callback leaves the cleanup of flushed transfers to
> > this work item, while shutdown, and suspend in the case of fsl_lpuart,
> > waits for the work to finish before releasing the TX DMA state.
> >
> > Both patches have only been compile-tested with arm64 defconfig, the
> > relevant drivers enabled, and W=3D1, with no new warnings. I do not hav=
e
> > access to PL011 or LPUART hardware with DMA support, so testing by
> > someone with suitable hardware would be appreciated.
> >
> > The imx driver also needs a fix for the issue reported in the same
> > thread, but requires a different approach because its TX completion
> > callback unmaps the scatterlist unconditionally. I will send that patch
> > separately.
>
> Again, these need to be tested on real hardware.  Not to mention the
> bugs that sashiko just found in the changes as well.
>
> thanks,
>
> greg k-h

