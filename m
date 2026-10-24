Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74665606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 02:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=inZ9GS9y;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SzVUWBx9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4aeP3BkhskeN4vpePbdVXng4dknkyS1fsNJYB/+44kg=; b=inZ9GS9yKxG1Nz
	WbH/vuseqM7idhbYXwu59SQkVX5vIVvYrnnYTS71OPFzfKtuYytfCVGCpUsi5+PGwwO4PWmgQw5FG
	jZCYeYUawRUj5MycPxHX0MS9YSu75b+Yw/LEBFML4tOjK2UuPR9O5nSgxZS/oXD9Upb4h9mU6y3DQ
	QWcLRnWGrLCbW1XVZD7+G1ZMqEBShsur6rwH/SPA3RrRTRRwLZ3tSD91FNyA5GC7WvwhLLJj3BJTi
	ttkMUrGXNmOAb+HfYOSicC/3UwxcC1Oujpg4jd5OMErTrMT+rgfvSWt7Ab/JPtuz4+ADmPwjCkT4c
	hYCZsRqcfUg8ihK0LOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKRdy-0000000HM9J-42fF;
	Sat, 24 Oct 2026 02:38:02 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKRdw-0000000HM8x-3hnX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 02:38:02 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c413dea9ca6so230510366b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 19:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792809478; cv=none;
        d=google.com; s=arc-20260327;
        b=SywE02UKaXxEINVzH0fVHidiqY6RsUdAS4cnhOHxds2lifbdj+SUkILAm1tHk+YJzH
         6JJPxMXBiQWJGyhfuInmgmyn7NA9KEYbgV57WpOJOP5SGC7WSgYLa9kPUXq2xG+5Cmob
         WwHtgfJbtSdgzbwCyPowyX5cYmOa6dj3c5sYAsGESQv3DLS5yN+8eKvDmLp7DSUWdkGs
         TC0FK7/zus5dfuDK3iYu14uJp//8RbcPeRDPzyKeO9zTf7Q8m1GzM0LMvGOhjEJKZUrm
         mLDktEA7vXEq0/HYw27svk8ZbVX8g7N918sHDky18r7lrfA936/zZvLTp7MZsZN5NM44
         sI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4aeP3BkhskeN4vpePbdVXng4dknkyS1fsNJYB/+44kg=;
        fh=7goOBX+kKxM++7xBV5xnnpR5K5AidNrVzWGA/aiLjvc=;
        b=cgaD6DfaV/AaR3VPtpwqhYH/usWE3S3ifrgephyEyrlCLsDnTu98b09AHUhchAyD7P
         pWujWUhq6//tMKdc1zGzkdcpjby2Tl0COR+ZChhoJcbRROmEa83ITXECYt0LYspKOP8c
         C7FEKRu8BRD7f/ewWGKFfGfzgLs7Bjy5MFIagaXur8XTUpqY1/vi2M6pPDj7CyVATksP
         hQ7CXsdFno/lhzDixbBSDqyTj285JRCvSG0+8qnqjPs5PxHKE9e9yPgmgIkxX6nOOdEB
         /HV+Z/vqmnkRvEFdBu9Pnjd+bDo49MIZxg4p45vMy9RF9UWPBrArpP0GFuLcV3yhrFP5
         OMyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809478; x=1793414278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4aeP3BkhskeN4vpePbdVXng4dknkyS1fsNJYB/+44kg=;
        b=SzVUWBx9MbGrD/HE6xCJJ7YpqS5PzQKsIzr4G71SipIFR0t6HL1FVblEvb9QPwrC90
         M+QV5qrGMBiDUNGjXe08WWCRMr3nDWQbsgBNgWNOGqB//BBpOxCTdWGSA/9lrN/KjZNV
         wUCB5fmG6kB2NLI3kOlN0jK0CYqE5CteQWh+0Tcc7qzGrQixM4HeQJJVPN1tpnhPjnxZ
         Hv2Gi4eE2GYn8CsVA0Gpo/pyaw0T+nHBllBFVxNHOy/siVEq1VXTeW9ocU2wlsxSsQkU
         /lQHMGBuvo8VBjcxlx6CcapClccDa/xWlb+nRpdmhjioBuIi8P+QHfU8MdX6WaH2hWOZ
         X+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809478; x=1793414278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aeP3BkhskeN4vpePbdVXng4dknkyS1fsNJYB/+44kg=;
        b=ZDbSB44zsMEmy1MKdL3Jl9r4RosVFMC0KAErUBgHYhnvf0vOnAqZZ6cQwQoXLbqMGl
         cGk/1OElmtmmKVmIl/4Zr+gq8+gIYeVICpaMd67OBQkOqSD1pLIwK/iZqgB2N8lyIT/r
         f/gtQkfOW3iw9jGPIygUPpdp6lGIPkJAiVGqTyOe1ZSkptAP8MQWpApnn0+Yxl0fzaZZ
         tVWE5o71z4baHKCe+YZuLQtMjdApMduFwMuKa/mhbMZRXpV9eePJi4gJ6OhUnuZE87nC
         tw6gaLpw7Ci7pW4XgqIyvxA81TbEsRxRL/XPQJ88GbMVZwyPZ9n+sv63Qg4ktWaLMJrZ
         HXRA==
X-Forwarded-Encrypted: i=1; AKwUvBxRvs+G+0ngNdAsozdWKfxJVFlJVV3q2X4zzcY4YkuiElG9hESs0RQJGW5IL9DPRLxa8wExdjLV+3u0AhOP/lcC@lists.infradead.org
X-Gm-Message-State: AFq9FYK8I/3zTorl+lRQCSlNU4tMjBLBn2UCffEs74Z7zM/+AmA/QAoD
	hDYluJHNS0SmOD8h/WKl1cIYrkMQLyO6y9fFhITcbwX64tOW7FSjDbQV/mcT4bZhsWgpajKpj2x
	5rLnGAINb1ER/jBDTOkdwxF2vnrfYphqgbCmOYx+Y
X-Gm-Gg: AYBFou1x9UVGFhh0cQsCl7rqXtR0UuuQTSWqfWFjhqjmkqrnBexBcuhcT3UlktqMKQ5
	h68KQptAbLV01hAJZzzUZOl/vW1yWJrAnC7Se/5gR/cPjgC6EhYbVo4JmfeR46H86fSIzXHp/3x
	Al3qmVsuRIdlRZUegQCQRDtzV86Gxo/7w7D74QbvpWrxDv60BFZiKLIysJX874OzthRdTpZqsdU
	qynweS4ZXSL3wUsMRqYjaywIqO9spMovRTaKRhkH3A9rhBfcaZmEwkPXNo9sSXxNXBXs/E8LXUW
	Z5dyIZp8b2GpJvbWeGq7GqUyhmZr1aS22hEloPMNUCV+8maIo11nqpBfH30sNC/e5d05dIdiZx4
	qL8ZXfK+DLF/FBzBZKq/OncKkDt0sbFXUMQ4Ccx31M3YhHEgzukPVNA/jZIQ1LdD3V1F6PKPQYc
	/YQc7ujeliZbF3rLLifLHXWehsdV652RWvCeVfTCnnfGAAodAamA==
X-Received: by 2002:a17:906:9fd0:b0:c2a:b1cc:158d with SMTP id
 a640c23a62f3a-c46bde97dbbmr85486066b.32.1792809478280; Fri, 23 Oct 2026
 19:37:58 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016013918.3492835-1-mhun512@gmail.com> <atXYWrNAI5pmyMHD@solitude>
In-Reply-To: <atXYWrNAI5pmyMHD@solitude>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 23 Oct 2026 22:37:46 -0400
X-Gm-Features: AclHuK8ISi6y0PGRQ1melezhjTDPOEdeAo6Lz8Ja0WFr0Na_5A0mSRW3u1OesuA
Message-ID: <CAGEsz8F1x+nDPe4tAuQENFWfqRCwkSKif_Jn1w3iaqmYJEu8vQ@mail.gmail.com>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: stop button emulation producers
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_193800_974202_491C2C34 
X-CRM114-Status: GOOD (  32.26  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks for the Ack.

Agreed that an autodisable helper would be useful. I=E2=80=99ll look into a
separate follow-up, including the impact on existing callers.

2026=EB=85=84 10=EC=9B=94 19=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 5:48, =
Marek Beh=C3=BAn <kabel@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Acked-by: Marek Beh=C3=BAn <kabel@kernel.org>
>
> This makes sense.
>
> But I wonder whether the devm_delayed_work_drop() from devm-helpers.h
> should not be changed to use disable_delayed_work_sync() instead of
> cancel_delayed_work_sync().
>
> In this case the initialization function in devm-helpers should be called
> devm_delayed_work_autodisable() instead of devm_delayed_work_autocancel()=
,
> though.
>
> On Thu, Oct 15, 2026 at 09:39:18PM -0400, Myeonghun Pak wrote:
> > The legacy MCU IRQ thread can requeue button-release emulation work
> > after its managed cleanup has canceled it. Since the IRQ is still activ=
e
> > at that point, the newly queued work can outlive device teardown and
> > access freed MCU state.
> >
> > Use disable_delayed_work_sync() to prevent further queueing and drain
> > the worker before the IRQ action is released. Keep the parent IRQ activ=
e
> > while the worker completes. devm_add_action_or_reset() also drains the
> > work if action registration fails.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support fo=
r MCU connected GPIOs")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  .../platform/cznic/turris-omnia-mcu-gpio.c    | 31 +++++++++----------
> >  1 file changed, 15 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/p=
latform/cznic/turris-omnia-mcu-gpio.c
> > index 4e430d6c3fc4..8f43bfa92373 100644
> > --- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> > +++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> > @@ -11,7 +11,6 @@
> >  #include <linux/bug.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/device.h>
> > -#include <linux/devm-helpers.h>
> >  #include <linux/errno.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/gpio/driver.h>
> > @@ -841,6 +840,18 @@ static void button_release_emul_fn(struct work_str=
uct *work)
> >       generic_handle_irq_safe(mcu->client->irq);
> >  }
> >
> > +static void omnia_disable_button_release_work(void *data)
> > +{
> > +     struct delayed_work *work =3D data;
> > +
> > +     /*
> > +      * The IRQ thread may requeue this work while the IRQ remains act=
ive.
> > +      * Disable and drain it before releasing the IRQ action and the M=
CU
> > +      * state used by the worker.
> > +      */
> > +     disable_delayed_work_sync(work);
> > +}
> > +
> >  static void
> >  fill_int_from_sts(unsigned long *rising, unsigned long *falling,
> >                 unsigned long rising_sts, unsigned long falling_sts,
> > @@ -1082,21 +1093,9 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu=
 *mcu)
> >               return dev_err_probe(dev, err, "Cannot request IRQ\n");
> >
> >       if (!new_api) {
> > -             /*
> > -              * The button_release_emul_work has to be initialized bef=
ore the
> > -              * thread is requested, and on driver remove it needs to =
be
> > -              * canceled before the thread is freed. Therefore we can'=
t use
> > -              * devm_delayed_work_autocancel() directly, because the o=
rder
> > -              *   devm_delayed_work_autocancel();
> > -              *   devm_request_threaded_irq();
> > -              * would cause improper release order:
> > -              *   free_irq();
> > -              *   cancel_delayed_work_sync();
> > -              * Instead we first initialize the work above, and only n=
ow
> > -              * after IRQ is requested we add the work devm action.
> > -              */
> > -             err =3D devm_add_action(dev, devm_delayed_work_drop,
> > -                                   &mcu->button_release_emul_work);
> > +             err =3D devm_add_action_or_reset(dev,
> > +                                            omnia_disable_button_relea=
se_work,
> > +                                            &mcu->button_release_emul_=
work);
> >               if (err)
> >                       return err;
> >       }

