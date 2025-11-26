Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E55FD10386
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 07:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMPNPgQF7EFk8fZKuStuZmZpYxMUfWjshcS2iwRDj7E=; b=CaTU47h1GnqMUqRgBbI4GnBTdK
	4ouhHwuCUJ7UvNTwuwRuVWqUcIIElszPjPT7EzlXfpZSapetKeH0AE6rfjF6br/wPJGMq/2CcRBru
	f4B6E85rC68/fnxu/daFw7bPtsC79QBmNzacNp+lLiqGQtZvjuVxiGH/s8X1yBLvAI6RK4l4JGfY/
	nU+hCaHLNJGBpyEp1ua89Qh/vtC9mA/U2OuzeCpGIKcPHgwWhqFQP/FusZ/zGhHL2KJpphJXhMis9
	uXTI9OcfLbbxYqLKC8a/qtNpFLHSVggNUIzWzp/BMLF/kv38wEZrluGFldD0BBtZkSJKorsM2FAEj
	piQpipJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9lf-0000000EV4p-2pQL;
	Wed, 26 Nov 2025 07:16:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9lc-0000000EV38-1TVa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 07:16:45 +0000
Date: Wed, 26 Nov 2025 08:16:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764141398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMPNPgQF7EFk8fZKuStuZmZpYxMUfWjshcS2iwRDj7E=;
	b=e64wx9sdKMuAEOyk8Ro45BZ1y0o6TbClP2QFvNwkTubvJICUftVL00usk1GF5F1Ur9fhHb
	zDxvA8+xsqyAS6ACr7/lOV86yiO+gHdJp3H7MzAUARaRJg7FRpQqBLPN/kN0gvaV9Y5SuU
	/9T5JDzA3EvVsiN5/FirnXlmZ9Occf5VJp3erFgWe7xk6DgnelVhqCRKe8OwutoLPnaCkp
	Pd4XazZC/wBf7VVx/PgAnGcy8kSm2JPAr8Di8WAzIOaQUjrAZU7kSY9Ut1yFDeM5RtxURC
	C+b9zezBlueOwThohMlP1VqTdUlrb/qvXb14uxTZNXj4wD9uWLOd0u57BvpSlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764141398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMPNPgQF7EFk8fZKuStuZmZpYxMUfWjshcS2iwRDj7E=;
	b=1J7X0wYXyqqb80DXylWtfuTcneoc2Y16RiVLcGXa65CVSpk04p3MRtRZdh8t9N9Qu0TBc1
	LNcWmrqXea02cMDQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>, 
	Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>, Tamir Duberstein <tamird@gmail.com>, 
	Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <20251126080620-921e6880-cacf-44c5-bd8b-f380fbb8090a@linutronix.de>
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-7-sjg@chromium.org>
 <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
 <CAFLszTjsgkPV_-Si79RY5T_Fxd5+f-b1VbpG11uS3E9Lk4Ofmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLszTjsgkPV_-Si79RY5T_Fxd5+f-b1VbpG11uS3E9Lk4Ofmg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_231644_528064_49EB7ED3 
X-CRM114-Status: GOOD (  15.78  )
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

On Tue, Nov 25, 2025 at 02:58:12PM -0700, Simon Glass wrote:
> On Thu, 20 Nov 2025 at 00:49, Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > On Wed, Nov 19, 2025 at 11:13:27AM -0700, Simon Glass wrote:

(...)

> > >  quiet_cmd_fit = FIT     $@
> > >        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> > > -             --name '$(UIMAGE_NAME)' \
> > > +             --name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
> >
> > Remnant of a previous revision?
> 
> The flags are there to allow extra options to be passed if needed.

Are they necessary for the module functionality added here?
If not I'd put them into a dedicated commit.

> >
> > >               $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> > >               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> > > +             $(if $(FIT_MODULES),--modules @$(objtree)/modules.order) \
> >
> > I am wondering how module dependencies work without the depmod invocation
> > and modules.dep file.
> 
> We have a mechanism to place a pre-build initrd with the filesystem,
> etc. into the FIT. But for this particular feature (suggested by Ahmad
> Fatoum) we are just providing the raw modules. Presumably another
> initrd would be needed to provide the startup files?

modules.dep is more than optional and generic startup files but an integral
part of a module tree. Without it, any module depending on another module's
symbols will fail to load. Also the modules will be unsigned, potentially
making them unloadable. Ahmad's patch does produce a complete and fully
functional module tree by means of 'make headers_install'.

> > >               --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
> > >
> > >  # XZ
> > > --
> > > 2.43.0

