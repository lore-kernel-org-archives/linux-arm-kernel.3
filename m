Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1066C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7CqxF0+GwBDk0QErrVq07WxoIRpHZmPETdvZNGiMkI=; b=v2egmcW29XnuUDosk9wfNQ4Akx
	WIy/+u/CxAMKHMEWnA6T1qiKDZ+U604eTF0nic/NiHuB3uCZyrFHDoJhJ1Nrqk5+uDj8/SrXIuoXD
	dNRK+a9ownox6Bns3qI2HoqsPMBj2Z0qw7cwi5CDHS0p3VyvYZyQTUSP11RrvRAe1Dn+yjIFbq61P
	1MBf8Os5WMEWS3SH2O+RWPXoZQNrjC8S57UFEGxOwP5Foe338IlVUnIGiT2RUfm/FVdTuOURJkHDz
	GqfbCK4Bu6BqAZOV8MnH4ZwIbxhFx3jqLKruG+zcneXM5ngv4mLNynsQ0hYVHH8PGbbRRRhT2CJIk
	Sksd8FpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD34o-000000017N5-1snG;
	Thu, 08 May 2025 15:22:22 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2WQ-00000000yyS-3Bmu;
	Thu, 08 May 2025 14:46:51 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5fbf534f8dbso1515749a12.3;
        Thu, 08 May 2025 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746715609; x=1747320409; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7CqxF0+GwBDk0QErrVq07WxoIRpHZmPETdvZNGiMkI=;
        b=j4X6mHSHXYRhTjVxsZ5i/mnvTBjiCBl5IXZpH90Qu6iiUPYLnqNYc1dOHCZk33Rd2n
         8XmW+Z0SlgeR82xa4CLMDeYfiMYFaaaiP5qfo1jQXWdQc12EY7HebWg5J4R/9t/vwRH3
         fA0QZpA7tmSP82gfwQfqUSoQYtQqGPDtyYNaSrHD16FZo+yaoVbdmOO/odvqA/Fp5/Jg
         He29LMTgr27tv86ujpzlZKfaJdHMCarENRRJeFoWm0xXtKAIfvuwnGXcJeh3V0/pWNSD
         zF7ow4jPZz2KQLDe9BXGPepum1W8BY4EMC2TKp377fd60Ghv5y0PH64fawbsNiQR/gr0
         9UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715609; x=1747320409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7CqxF0+GwBDk0QErrVq07WxoIRpHZmPETdvZNGiMkI=;
        b=Xi1HBBDwQWCoBDb+5n79cdaFgQbR2nwVbxbd8Amo6wMXMmY4WJontPWmuf1QJSvpo+
         87H07ur0BDMnJu+EZ0P0PwT+XSap11OE5t4jIqE867OrpG5Z+MSkjYCt4xv9BeI10iVn
         dxlz92+RBzKCth9gVun2PCiSaiBG1oyFOjcv3QgXpb28BcxGcJbo2vkTYFK7ib+lp6l7
         SgUQEswD4cbkibZ//Ina2od+Id2z69oBK2lk2pSr9lkm1XWTcdakXkipY0RIfobrHtoX
         dc/2WpyWGw0f//8GdWkfnaX8/oXo/97jOvsde1UP5vkhoBktTzrI92qrVUbNVDU/1LJ2
         7MVg==
X-Forwarded-Encrypted: i=1; AJvYcCVRLq33pZPHrJnGWzdfssAU8w78dUigz4ntDVpkSzi4lfQ1CRKdDXT+8QP8s1gmDcN9nC2c2WH/hqUZx+GTt74azA==@lists.infradead.org, AJvYcCWA7ng17sVkKtAexqy9aiYG2t5TnAXLOdQo1RWCUWzZQcTnigk833q0QoXVTJkxVuDA2YVZffTgZpUaYgH0RCBm@lists.infradead.org
X-Gm-Message-State: AOJu0YydBooObCVRByCpHpheEyfbxYxDvWxiQJU8/5R9FozNUttWa65V
	McwzoA/oBPUXyHJEj/ptRnf1knsvig8q1z/qtxu7iPlOwUsGJ6Bf3E72kzaSkAAm8i43Bt+IPq9
	kuzGBBvPPtxfFbde8vR3sJZOnBa4=
X-Gm-Gg: ASbGncujQbaqUxyo40DeD3RtJUFXTLADBk43DWzvtUgwdOOj3lORrzss4VNrysbaAAP
	j0EcfSoz2iFgf8257Lil24K4zElS+LwR25HXuK1paCfISUfdhFEDhEJsXSTkZsig95vNqZwmRV+
	7yxxqtQdUsxJILu6epNWGfF0xq
X-Google-Smtp-Source: AGHT+IHapRMpC96e4Ns9HKMbhCfMvfj8uYQA8zoVUmMq2SPt/wmu7Z6r+RtaYaL1UsQCz8HCNdpeCTNKH7q/g7lJNDs=
X-Received: by 2002:a17:907:9814:b0:ac3:8988:deda with SMTP id
 a640c23a62f3a-ad1e8d0559cmr789193566b.40.1746715608789; Thu, 08 May 2025
 07:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250508132659.GL3865826@google.com> <20250508142648.7978-1-trannamatk@gmail.com>
In-Reply-To: <20250508142648.7978-1-trannamatk@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 17:46:12 +0300
X-Gm-Features: ATxdqUHiaH8PbqWfBsEndtwr5BsJ3rjivWkNSVwxx1yUeo4wbB-GYsM_ezNcRas
Message-ID: <CAHp75VcquXy11+mXW8eKgE0ndg3k0y6i=yKQ9_3N2Uh0viZKQg@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, andy@kernel.org, geert@linux-m68k.org, pavel@ucw.cz, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	christophe.jaillet@wanadoo.fr, corbet@lwn.net, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_074650_798577_D14452BF 
X-CRM114-Status: GOOD (  18.81  )
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

On Thu, May 8, 2025 at 5:27=E2=80=AFPM Nam Tran <trannamatk@gmail.com> wrot=
e:
> On Thu, 8 May 2025 Lee Jones wrote:
> > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > On Wed, May 7, 2025 at 7:42=E2=80=AFPM Nam Tran <trannamatk@gmail.com=
> wrote:

...

> > > At least, based on the above it's my formal NAK from an auxdisplay pe=
rspective.
> >
> > This is fine.
> >
> > Just be aware, before you submit to LEDs again, that you need to use
> > what is available in the LEDs subsystem to it's fullest, before
> > hand-rolling all of your own APIs.  The first submission didn't use a
> > single LED API.  This, as before, would be a big NACK also.
>
> Thanks for the clarification.
>
> Just to confirm =E2=80=94 the current version of the driver is customized=
 to allow
> user space to directly manipulate LP5812 registers and to support the
> device=E2=80=99s full feature set. Because of this, it doesn=E2=80=99t fo=
llow the standard
> LED interfaces.

But why? What's wrong with the LED ABI? (see also below question
before answering to this one)

> Given that, would it be acceptable to submit this driver under the misc s=
ubsystem instead?

But these are LEDs in the hardware and you can access them as 4
individual LEDs, right?


--=20
With Best Regards,
Andy Shevchenko

