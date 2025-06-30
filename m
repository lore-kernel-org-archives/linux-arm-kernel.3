Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D53C83033
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 20:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qc+90tprg0y+vgJUk7gGeUz39prtDolc690nnHVfeHE=; b=jWCLN56hruze5EeeTtfGJOKiOa
	stNG3vpNfkI7w7uCT6DKUwl4kzm1Bp5/L2VNRy0pmmx5tN3N9J+ppFwTXKyX7VxynspUVB/lms6VV
	s0ccpYIP0A9cKNvXTfIrL5XKn7lyrkM69yvpho3NHAYgA8SVruiGVW0eRbBuSUdoF8rw6p0ltu3Sf
	rcjQsl2vv73HixjA6AS8R02B885tvfgATrrR2kgASejcjmrZ++AGtFP68+YqTiWg0qRoP1uuGAeZC
	wkbGv5saq7yEuuZ6FGuDqeB22Ys/Frls7bw5cm8vy1Wuhq5I4G8JcPnaDFFlOp/nryK/Khph+zwF1
	5udsfHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWL2J-00000003O0G-13XP;
	Mon, 30 Jun 2025 20:23:31 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKzg-00000003Nfw-2hOm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 20:20:50 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-8815049d0a8so584430241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 13:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751314846; x=1751919646; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc+90tprg0y+vgJUk7gGeUz39prtDolc690nnHVfeHE=;
        b=NyKq7w5RQIacEhZpcG2Fwatk4G/AVYTN5jj26yZwRxHIwGsDnkilo43W8e1riSSbul
         XNiS+tGyMfnAT+OsHRJdDRn0cpbeYupM4CKpAmfkD/BlSplwSlR2DVgX1CLCQrGFGdiS
         jmYegKsG4DWyTj9pdTTvzSk7u4Hsehr/thc0E4SuZi/5QeT6a2SM2xcNEX70Pq1nbz2n
         yicFItUE77WJdKn+xphB6ZzH47wU6evbRMCJqQVl9rtz+vompVKmoPOR1QogIjBOefTq
         RsZViKT6nkoRWnFK+mEssg5U9sidkwlz+kyIdrOWxZ6b9WWeOBKFhkufFycpj34eN/YI
         F/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751314846; x=1751919646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qc+90tprg0y+vgJUk7gGeUz39prtDolc690nnHVfeHE=;
        b=n3T2ANRxUTILu55diAXp9/NUEDfeW5+oYcV8KvtB+5A4Z5I/9Lvd8XXPYYIO0n0K/f
         mKlBvmwZ23LllEWxkwwpaAhzYHe3+prEOHI4ehqyfsGZm78Kj1KlTTxb3i4bbtr1kumq
         pEu8EKZxNfoRt8dfXIpos9E9EFs6a5G1+hilAtj1nMaUDEDBqNaR9VMxltKOwMJeXNHd
         HGnuBlTrEehuBzfwG2tbnThRdlMa75Eeoo3/1JReP0XuPtTtvbwLkRQDGu113p0ToY4P
         cBEXGY4pV3SWMFiZlXVqYtTD9IlGa4lbuluLcAgiZ8aAyAdwJHbzCvDPUjTmtwkFpF5p
         zI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNJsL/r5CanhyBy+po0h5CefmPiJ9z26PwvIenkmve9etXNxK+NmoaLGDnmJ1M60KJu+vsM0eaapCC/ckS/gMa@lists.infradead.org
X-Gm-Message-State: AOJu0YyxUeMpmLMZi1XMCGhFaFsIsW3MY6ljh4WbZanCemttHRiUUpLW
	KeaOWSQcGDqeqfEYu74AP5NSWo15LhWhkLdBqFzo+a/8ie1STbG1YPipCkJOYQ/dP15HwPm4RzJ
	z2KG6qQM4LKiwEKoMaUNe5z8eCIYm97Y=
X-Gm-Gg: ASbGncv1ZbKaMpscxyNsmelIBZI79Sa2aopCq8LMvZYIEDdw1a1B1bxbKBIOs2IgbeO
	EXXZ8sGXIppxCYjnbudNaWJFv33l2Exv/35UYaprRuHT+0GvpsTwDnRyCg2NNpPAPJ88OpbefNy
	sM1GeDm+uGeumVz5jAGSz0cIBLPIbBbIs5oyeHY5eP4f8/ALn2KoiXYxMVTnOo6gdW221ULDZ1R
	z2r
X-Google-Smtp-Source: AGHT+IEayYG4e2wKK0bX3ynrI0zopvwL0MJfOacs5i7fxmnOeVKHly04X/sXF4JVSfDE7ZGNHZeIp502W+AvgkQfZBU=
X-Received: by 2002:a05:6102:5a94:b0:4e7:7787:1cf8 with SMTP id
 ada2fe7eead31-4ee4f51fd28mr9511558137.7.1751314846544; Mon, 30 Jun 2025
 13:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250627060125.176663-1-sperezglz@gmail.com> <2025062834-botanist-crop-4aec@gregkh>
In-Reply-To: <2025062834-botanist-crop-4aec@gregkh>
From: =?UTF-8?Q?Sergio_P=C3=A9rez?= <sperezglz@gmail.com>
Date: Mon, 30 Jun 2025 14:20:35 -0600
X-Gm-Features: Ac12FXwAra0T6lIhtYOGlZlss7cI2Oo40Q8m5vxGWM0YoR60ugXuZAhBDQsLrpA
Message-ID: <CAMCbnubpfO0y9oMnJnYHQ3ALTPmF1W80sPhbNPzaR59hy+cDQQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc-xilinx: validate ep number before
 indexing rambase[]
To: Greg KH <gregkh@linuxfoundation.org>
Cc: michal.simek@amd.com, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_132048_686157_B73D85BA 
X-CRM114-Status: GOOD (  25.28  )
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

> On Fri, Jun 27, 2025 at 12:01:22AM -0600, Sergio Perez Gonzalez wrote:
> > Issue flagged by coverity. The size of the rambase array is 8,
> > usb_enpoint_num() can return 0 to 15, prevent out of bounds reads.
>
> But how can that happen with this hardware?  As the array states, this
> hardware only has that many endpoints availble to it, so how can it ever
> be larger?
>

Hardware will likely behave and not report more endpoints than it
supports, but I thought that there is still a possibility that this
can be exploited, taking into account this patch:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7f14c7227f342d9932f9b918893c8814f86d2a0d

and this CVE:
https://www.cvedetails.com/cve/CVE-2022-27223/

However, looking more closely the above patch, the endpoint number is
extracted from a struct different than the "usb_endpoint_descriptor":
"epnum = udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;"
in contrast with the code that I'm touching. The CVE does not add more
details to understand if the part of the code that I'm changing is not
subject to the vulnerability.


> > Link: https://scan7.scan.coverity.com/#/project-view/53936/11354?selectedIssue=1644635
> > Signed-off-by: Sergio Perez Gonzalez <sperezglz@gmail.com>
>
> What commit id does this fix?

The last commit that touches this code is : fd2f928a5f7bc2f9588 ("usb:
gadget: udc-xilinx: Use USB API functions rather than constants") ,
although, I think the previous code gives functionally the same
behavior.

>
>
> > ---
> >  drivers/usb/gadget/udc/udc-xilinx.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
> > index 8d803a612bb1..0c3714de2e3b 100644
> > --- a/drivers/usb/gadget/udc/udc-xilinx.c
> > +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> > @@ -814,6 +814,12 @@ static int __xudc_ep_enable(struct xusb_ep *ep,
> >       ep->is_in = ((desc->bEndpointAddress & USB_DIR_IN) != 0);
> >       /* Bit 3...0:endpoint number */
> >       ep->epnumber = usb_endpoint_num(desc);
> > +     if (ep->epnumber >= XUSB_MAX_ENDPOINTS) {
> > +             dev_dbg(udc->dev, "bad endpoint index %d: only 0 to %d supported\n",
> > +                             ep->epnumber, (XUSB_MAX_ENDPOINTS - 1));
> > +             return -EINVAL;
>
> Any hints as to how this was tested?

I don't have access to such xilinx hardware, given that it was marked
as a high severity defect in coverity and it is basically extending a
validation that was already added in other parts of the code, I
decided to propose the patch without runtime testing.


Thanks,
Sergio
>
> thanks,
>
> greg k-h

