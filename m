Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0199C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zY41R75BtToe8Yp09lMS5d4lVXKY/PmgZc/Js0T22zQ=; b=d+NT7FQ28pJMi2/53pKSrfB6Jh
	1fa+r0SJKDGy18eabmqnk4HnIWUkVgoO0vVObYc+hyQIJiUbY7Ap6hcEOJ/iQUZR46OF1F5AagKa/
	vSXbVcKJEaR/Aza3i+tY64xtpa7uaqCxN+XFQMt2PYHbohQx9m0vH0SR2ZOhwMipb/b9AteBC4GBy
	h557X2WQy2EpE1lkBjdVBSYsdcfhWQOPKPXgdSjF10LAOXEc9PQsEewoQ/b/TNu+VwL6gxgWo2NQf
	ncyJH5G8JvWcfrucjBjF1TROk1PuReDiafvC77SBk3o9Qxz4eaF67YhuKF1BiqcwM5pGzaerpYihh
	Kp7mWqTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSwN-0000000HPCE-1CZ0;
	Mon, 10 Feb 2025 12:31:07 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thSuy-0000000HOts-0Hl0;
	Mon, 10 Feb 2025 12:29:41 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7c05f3dde21so106045885a.2;
        Mon, 10 Feb 2025 04:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739190578; x=1739795378; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zY41R75BtToe8Yp09lMS5d4lVXKY/PmgZc/Js0T22zQ=;
        b=Gp/UWLlN1E7U7bb45wwh5F/KGw95uufamQeaZJh080SnCxgw8mHfVmN0RjazANP6um
         sW4LVVoN5uH1U2lRjMfbSIHuYUMPT5lH1YuNNr1THyyJEArQr07xX/7Ger8/WCPTmOF7
         5jBVbqd4husSjsquNJNwh2cpezF/iNcekbLJyzSDb1ohC1qAZDi5NPro2wPG46CWnPnz
         ohMJUxlxW04Hyl1xYSBdNFixUPYQHBzcJC3LMqD15UitmpBkCyKwgPr0ASOIHL+m+v5w
         9aNXFeteCfhdo2DTjgOQAkW72CcUvHXHblVhsYGk3iEMvgBc/hz6fsuhZsCJjF69ztt3
         fCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739190578; x=1739795378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zY41R75BtToe8Yp09lMS5d4lVXKY/PmgZc/Js0T22zQ=;
        b=sx2S0bxHYOwQ9FzSHzXNGQClwaj2rJJj3NQo58M6P4dyojDJmBFW2BmDHDPedE5X6F
         T7RF3HR1DiR7A/1VhIchHA7/4xxX4j+8B+d6EVs1H00xeDtvyvElIWXtB/jXuo3BUzv5
         DAkMxvK47/BRVsP40D5UL2GFJDBhWHfWrreV1TZyGF4gbCyO26RJ/2ErMEBxC3hJUaIk
         Y2GqsHocD7+EG50Tw0eT/wEkw3ZH1354EwmJjRVeuSeEWGMi/RTmlb9zzArvtHek1GcM
         Kcigr+Yup7pC2NH+UoLErpBTu6I12Ksuww+8RPf6RYGTJnyEOP3srSydQ8q/vK4ibSOd
         UqHw==
X-Forwarded-Encrypted: i=1; AJvYcCWgAjG1rZJPIOVZzzWbiNL1NlWV0vQdaPIQ3XbAE9jUGrKbF3cjYl7xHlnoi2ssI9dQITXcFsFnVV+1e1MElZrw@lists.infradead.org, AJvYcCXR0OsVKezcbJX/ZONawOHwQ9IbX5UIuylrvBrGRVbfrWHiAEi2okDyHHOMYLpUe1jzWYPFL/Vhpu3uzAQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhDbQkZg7C4RDsw5LfpSOHRjPFroMFydiC11WdZzdRK3GBXeEd
	Uwk3fj6xXsc6NNjz97aI5IlYJzEmKOOJT0UBTn5oHuTpJXfolCGx
X-Gm-Gg: ASbGnctxV37StJz/gUD5IXlgz+31UNpro2FrXWY+V8SaRBKhxAsyhfxZG6SzRgG7d6B
	FgqsCvJ0J8rQdvwsIyh9eKge8FyD1P0QOXJHjiZgbneFupatedADG1DWoIEMT0rCjOsqIbMlB2I
	nKAmKpQzV9TksWAsXYEXZosxA48bodqlcchgfDR6pMJf/nnrsR0LrWfp+H5HawVGgJtMBU18H5Z
	/l6evWmsld2/eWsFYcP/RrRMoXFwFkM7i3XFewdNrXU1o5xQ1PGcD/35XtmrvwuZA8=
X-Google-Smtp-Source: AGHT+IHxp1/RlBBU1ek47PdaAYXfy4dhK7yLqQmOezqp2bSrFyZup9k7QBohFKb20v0D2hY4RciUgA==
X-Received: by 2002:a05:620a:319d:b0:7a9:c129:5da7 with SMTP id af79cd13be357-7c047c355c8mr1853489885a.29.1739190577686;
        Mon, 10 Feb 2025 04:29:37 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c05dffd3bbsm137289185a.45.2025.02.10.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:29:37 -0800 (PST)
Date: Mon, 10 Feb 2025 20:29:31 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>, 
	linux-arm-kernel@lists.infradead.org, Sebastian Reichel <sre@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 08/10] riscv/arm64: dts: cv18xx: Add sysctl and reset
 nodes
Message-ID: <mcixunylnco2obzrvqn4emaq3vey2zvkdggybymrm276bcgrsi@ck3nta7w576s>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-9-alexander.sverdlin@gmail.com>
 <h73zitljaig7nrccd3f23i655imswv54tf667dhq3dord7rxsr@unqncqlorvc6>
 <e17ef70f7536bd1bf0b4d0f7258f91cffac76a20.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e17ef70f7536bd1bf0b4d0f7258f91cffac76a20.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_042940_105995_E9AC313B 
X-CRM114-Status: GOOD (  23.12  )
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

On Mon, Feb 10, 2025 at 12:47:59PM +0100, Alexander Sverdlin wrote:
> Thanks for quick feedback Inochi!
> 
> On Mon, 2025-02-10 at 13:13 +0800, Inochi Amaoto wrote:
> > On Sun, Feb 09, 2025 at 11:06:33PM +0100, Alexander Sverdlin wrote:
> > > Add reset controller node and required sysctl nodes.
> > > 
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > ---
> > >   arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > > index 53834b0658b2..d793b6db4ed1 100644
> > > --- a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > > @@ -309,5 +309,21 @@ dmac: dma-controller@4330000 {
> > >   			snps,data-width = <4>;
> > >   			status = "disabled";
> > >   		};
> > > +
> > 
> > > +		rtcsys_ctrl: syscon@5025000 {
> > > +			compatible = "sophgo,cv1800-rtcsys-ctrl", "syscon";
> > > +			reg = <0x05025000 0x1000>;
> > > +		};
> > > +
> > > +		rtcsys_core: syscon@5026000 {
> > > +			compatible = "sophgo,cv1800-rtcsys-core", "syscon";
> > > +			reg = <0x05026000 0x1000>;
> > > +		};
> > > +
> > > +		soc-reset {
> > > +			compatible = "sophgo,cv1800-reset";
> > > +			sophgo,rtcsys-ctrl = <&rtcsys_ctrl>;
> > > +			sophgo,rtcsys-core = <&rtcsys_core>;
> > > +		};
> > 
> > I think these node is not suitable for riscv. It should use SBI SRST
> > extension to restart.
> 
> Independent from the particular form, or its correctness, this is still HW
> description, right? It would be a "policy" for the kernel configuration, if
> the particular build would rely on the FW or a kernel driver to reboot.
> 
> In other words, the HW block remains in place, no matter if it's controlled
> by a kernel module or a FW. What the point in hiding it from the RiscV part
> of DT, keeping on ARM64 side only?
> 

Yeah, I have make a mistake, the device is needed. SBI need these
device definition to handle some power event.

Regards,
Inochi

