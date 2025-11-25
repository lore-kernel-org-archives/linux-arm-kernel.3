Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB1DD10366
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 21:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oComeJJMG/n/pikooZKhX7dZBivNW0ENMs8Il87OfMo=; b=c7sHM0dNIRy3XYK8xGsEjD69a3
	PNEPuTAcHMolIVxFTlWBf9u5PJexE2YG1QZLt3Zvw4doeGADJxppJiUm6ABMV1DQstUHDdnacKFLU
	nW8VSRX6CgkboaPG8miJKkF5FzArL7pz1F/nwBaJ4HP9WgyAnUhDzlqNTJTWooeNolszX4CZGm7z/
	ETSuLdc5l4JvOQ+CCMvL8zb9QaBGehbfZZc4L/Oi1KJjVs64q5AtxKethORAVCuqoYwWNnIQxPCr1
	slVPqisHUlT2XobeFwtAV1xoxEnq4v7asd8Vjj01iiC3uktRnUpsXzTelnMXycApg1SUEB+C8N15h
	3VdXolEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO13M-0000000Dz36-22aA;
	Tue, 25 Nov 2025 21:58:28 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO13K-0000000Dz2B-1Gjy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 21:58:28 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b71397df721so260198366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 13:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764107903; x=1764712703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oComeJJMG/n/pikooZKhX7dZBivNW0ENMs8Il87OfMo=;
        b=lAN+KT3HzSEokpMBnAZwOBsyRfEDHQC54t1zRle0ghhJSTuzRuD191lw1tra53ImZ9
         B8a74764xjYgJwVX72vNMKIaYI8CVD9ogwjtscSx+4tpPyFO4EZwKcgD0qI0SCgbf0kU
         h7ywaE10zRGafETaOo0Xhr670Lyemgk2l4v1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764107904; x=1764712704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oComeJJMG/n/pikooZKhX7dZBivNW0ENMs8Il87OfMo=;
        b=qXL4zKhEteYV4ksyAKR1Q6812JQUvmWZyUoWJEbUgx3xyCjzO+C7N0eNl6f8GgPXO/
         qbAK0Jd3Go8m9g36Xa8S3zUS9AmIAzXpBJf4Hr2lUygtaLk1LxgD4Fmj+eGF42SYlZqu
         jTh0+ASmoK7r2dgfNUfeLuJn3rWjZuYBNQjOq/Zzqd8cTXI/LWjhIbCX2XEpCO+Vuo5j
         RTOWN33t8Bfk036weUj9fE2J8QOgRoNU1DuzQ8QfnxH0tzoxfXY2p+Xh9Y1W0r3igpWc
         YRDxh1XF63nuvn3lJPnTmiwxjM0JzlsS/c5LpOtvatOvX7tijpH1cIyUbdNMbnwXlrSI
         OWcg==
X-Gm-Message-State: AOJu0Yw8WsNyCR15Vp2m2j4l/LdxmrbbTgwz9VsUgk8YvvCSbl+DrnPO
	sxoKGNVIa5Uvh6NWEHnJW44Lg9u1DyjtWHvWORKoCnXoabimaHrfVEujIq92piXW3hAjHBe0WR4
	CmsuGZD/+o7GqePlLgo8cTTWACgJnjwA1ATGc2nTk
X-Gm-Gg: ASbGnctQf8UIxndymYYX0zLxXAyaRr5ZofR4994hvSASNMWo3y8DoZ8TuSDfRKZf8FN
	Zy2YWL4FubAj/BlnVuYosu0s39WLOzdwx7oY4sJjenN6qH6voOyi/kzQZ9HCUXoaDX64zgwuE0E
	7Lxu1ZgZLqtXFG16U2VangS/mPW8Bq5yJLep8ArYnSTca5LdfWemUBrSpWciYhLKhHhSyGRKwcj
	rnaE4wo4ycqiazvPGmHwFjtS/2CQJ5juq6/iftgZJm2+tZeQGD2miWsjQAF0CUYY/7OKQ==
X-Google-Smtp-Source: AGHT+IEsUyxPvJxd6x+5fzsOBlSU482PAc4Q0juUe71cJWKZiW/Qz9aeuQzjZG9OKhi5GBdJoXFxvsMW6mB204rlNBg=
X-Received: by 2002:a17:907:968f:b0:b73:59b0:34d6 with SMTP id
 a640c23a62f3a-b76c5515041mr521154666b.33.1764107903584; Tue, 25 Nov 2025
 13:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20251119181333.991099-1-sjg@chromium.org> <20251119181333.991099-7-sjg@chromium.org>
 <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
In-Reply-To: <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 25 Nov 2025 14:58:12 -0700
X-Gm-Features: AWmQ_bkAW-iBU3bFIz9dAYOV2fR21yuiXq1XlKKvPkqNxz_z03RLquyhMtItjw0
Message-ID: <CAFLszTjsgkPV_-Si79RY5T_Fxd5+f-b1VbpG11uS3E9Lk4Ofmg@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>, 
	"Reviewed-by : Nicolas Schier" <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>, 
	Tamir Duberstein <tamird@gmail.com>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_135826_410311_6BAF02E1 
X-CRM114-Status: GOOD (  29.39  )
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

Hi Thomas,

On Thu, 20 Nov 2025 at 00:49, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Wed, Nov 19, 2025 at 11:13:27AM -0700, Simon Glass wrote:
> > Support 'make image.fit FIT_MODULES=3D1' to put all the modules into a
> > ramdisk image within the FIT.
> >
> > Add image.fit as a target which requires modules, so that modules will
> > built automatically when using FIT_MODULES is not empty.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Suggested-by: Reviewed-by: Nicolas Schier <nsc@kernel.org>
> > Acked-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >
> > Changes in v6:
> > - Mention that FIT_MODULES just needs to be non-empty
> > - Make use of modules.order instead of using 'find'
> >
> > Changes in v5:
> > - Build modules automatically if needed (fix from Nicolas Schier)
> >
> > Changes in v4:
> > - Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
> > - Use an empty FIT_MODULES to disable the feature, instead of '0'
> > - Make use of the 'modules' dependency to ensure modules are built
> > - Pass the list of modules to the script
> >
> >  Makefile             | 1 +
> >  arch/arm64/Makefile  | 1 +
> >  scripts/Makefile.lib | 6 +++++-
> >  3 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 8cd46222fc48..4eccaef95826 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -773,6 +773,7 @@ endif
> >  # Just "make" or "make all" shall build modules as well
> >
> >  modules-targets :=3D all
> > +modules-targets +=3D $(if $(FIT_MODULES),image.fit)
> >  modules-targets +=3D modules
> >  modules-targets +=3D nsdeps
> >  modules-targets +=3D compile_commands.json
> > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > index 73a10f65ce8b..7036f251ab40 100644
> > --- a/arch/arm64/Makefile
> > +++ b/arch/arm64/Makefile
> > @@ -174,6 +174,7 @@ endif
> >  all: $(notdir $(KBUILD_IMAGE))
> >
> >  image.fit: dtbs
> > +image.fit: $(if $(FIT_MODULES),modules)
> >
> >  vmlinuz.efi image.fit: Image
> >  $(BOOT_TARGETS): vmlinux
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 1d581ba5df66..28e0cc0865b1 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -398,11 +398,15 @@ MAKE_FIT :=3D $(srctree)/scripts/make_fit.py
> >  # Use this to override the compression algorithm
> >  FIT_COMPRESSION ?=3D gzip
> >
> > +# Set this to non-empty to include an initrd with all the kernel modul=
es
> > +FIT_MODULES ?=3D
> > +
> >  quiet_cmd_fit =3D FIT     $@
> >        cmd_fit =3D $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> > -             --name '$(UIMAGE_NAME)' \
> > +             --name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
>
> Remnant of a previous revision?

The flags are there to allow extra options to be passed if needed.

>
> >               $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> >               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> > +             $(if $(FIT_MODULES),--modules @$(objtree)/modules.order) =
\
>
> I am wondering how module dependencies work without the depmod invocation
> and modules.dep file.

We have a mechanism to place a pre-build initrd with the filesystem,
etc. into the FIT. But for this particular feature (suggested by Ahmad
Fatoum) we are just providing the raw modules. Presumably another
initrd would be needed to provide the startup files?

>
> >               --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
> >
> >  # XZ
> > --
> > 2.43.0
> >

Regards,
Simon

