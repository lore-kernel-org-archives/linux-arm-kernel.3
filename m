Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B419606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UUvawARk;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IATU1RQ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=; b=UUvawARkMHOYRl
	zST11HO0O133TErGRTsf9pNDzWfod+GPYD0cy0WP4m6nKNupo9LOXc2+8QDHkdjBIrLAnJ81h/LHh
	yKwGUWbqf1ZqWL2Y2MOpKz6ovRMoi380jKGgC2SmLMrBTjZRwcQGc+QsxTkot1gKwvB1TkRmT4Dm/
	l+g/g49bfDDXLdurpca8mofJmYVuKQ6jbZzhzc9qbvHo4VywB6T0ZkCufjEoRSYvPa8KOO06OQjQx
	Ywu9ZEIORp+O6hFx0tXE7H8+re1+D1tOJ6E+yH/zF79exqBlDDtPIjy0521X8UG4s3/KeLWRSb29+
	AB6pY6+8bL2/pUAlYt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdEd-0000000EvU2-1OHM;
	Sun, 01 Nov 2026 21:37:03 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdEZ-0000000EvTb-08HX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 21:37:01 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so378406766b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 13:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793569017; x=1794173817; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
        b=IATU1RQ7cilz1bVPiWXtiBs+v2CKRiupd5l/QMsX7OG/rAAUIKInh5nPZz+eOXKTrU
         K6ljGzY4CIf2FFyMWc+38G4z8yf8ds4SrgkPvzTzBOi+aZV42XyLD1XehVf3o2FRl1P9
         ZvKqMAL4u9PnVT7oJgyK3xTYyWua+emf1ReLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793569017; x=1794173817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
        b=S/mFdnIAfmnsIZ7YxEYhmYjECcNq02lohRT0tZkpBgX5S98io9a/2xZoCdsHWcXsNV
         4O+tm/s5vTB9Jxa2yZ9xyp3tmOF53HWhfLfWhWf+kX2zYZUsFz3e5xWTro2j5QZNHxjp
         Xk9WZKMntKbF9ysrHyXsIihyrCt1RoUMDIZmarsaziMjRgPuMogJuD2I9wX3N6GUXDxG
         RA4tnFiyZwIumZfcyXjlOfP2JC5znfOp4BsOME2v+jeJJTB8z+bnzEikD8P0wLUEe5v1
         eonJDji9Nl13/ZSAoQ0C59NnhXWdMeQbhXHMLBr13bYI2+DLiplNuxdxSlI2/QMquo+i
         jHkw==
X-Forwarded-Encrypted: i=1; AKwUvByoGyLxHtFaPodNarclr1pOTfEVYgad8W++3yr+Gre7geQ3NYD3/Z0i5ucgdSCjhRLDqG4c6DCmY0XSFEoFEPGn@lists.infradead.org
X-Gm-Message-State: AFq9FYLoBTmOtWxCiEhOqx0G5HaeuEq6dk2TUVop1V6hoDXg7pVoq7ae
	BJRIqUxPBhi2zf3WU1Oltxxgo1Xrd/8NnlhPWo3NeJlTOygtfgYUCsELxYd6Wb2+zAVUc5zhd85
	sMR3GDA==
X-Gm-Gg: AYBFou0pqQm9zG4UgZfpIIgnfZLIPANLFnOwT8dJCC07GQ+9fwZZVHuohpD1OxPWEh0
	GTCsQVsSNeHau4ZorfnRXyWiER4sKRJAAwDNivRZTTS5+SpF1COmcUiSys8BNqgGturU2wkz7U8
	ELA6lkwo9UEMmMUIfMGgwZNz4+rZq2BJ0VL2FcYAJaNNnXTL/hD12AaFV3IwH+7b9dUEmbUgLP/
	PuoCBkapY9HiYmMXNcDJ0KrQQgROaiGbvrsWozP8ZLhJcKJBeVcLD/t+3aO0uXnJXglp5xF+idW
	N1nMqUdmBeEBMCaOwMGCgYkOiF8N/qSQZXQcEy4PmUgahczB3gDMm7PW84x/7gWswrgyQYZyi+1
	sqYlJrqnErhbEgL8Kz/c3D1ZQDtcW/wd1JfsK4i1DXyOSSKi67cUPxvfzCZ+UTba5ye4PxCXOqY
	PmQhVVpjPhRfEZQ+CGch+rsrQa7a/u6bBOVuXMIFciQfX7b7C4aRPsqVkWgZ1CRRh50vnlUI5Oy
	4j1HnktKcdMm+PhnRzsPZYaoCdmhVcSadTL1dx7peJqbwNU5MnhiMbx+YtbPGoUqFBcQOcXUQzZ
	dnN8n4pNIVNrbLHxqENHewiUCWjj7f4aGcLXYoPqXcZtYa1atOKdUhPDoc/OWEJ5O3k=
X-Received: by 2002:a17:906:9f87:b0:c33:9fab:5f61 with SMTP id a640c23a62f3a-c4ca7a80dfcmr709691166b.29.1793569016728;
        Sun, 01 Nov 2026 13:36:56 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd260sm310981066b.22.2026.11.01.13.36.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 13:36:55 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1029972f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 13:36:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxioxiFVL0LnnWe+55GFnWSurcbnbaSGbOvSOgMInJ0/GrwtZ/D+ULysYwfDbGoH/UM21Vjz0f+LxmAL6EejaW9@lists.infradead.org
X-Received: by 2002:a05:6000:41d9:b0:48e:646e:fb61 with SMTP id
 ffacd0b85a97d-48e6e305b9emr20425341f8f.34.1793569013833; Sun, 01 Nov 2026
 13:36:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
 <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com> <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
In-Reply-To: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 13:36:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WGtmBxQhc+ujm3qtVgftfKupqtp9sUpg_ubeQ=-_QG-A@mail.gmail.com>
X-Gm-Features: AclHuK83p4a2Vbxf-q7Oyea7vApFkqc_qnBlge2O9IlGicuQhVVmFjLkwyEXh7A
Message-ID: <CAD=FV=WGtmBxQhc+ujm3qtVgftfKupqtp9sUpg_ubeQ=-_QG-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_133659_138582_A2CF487D 
X-CRM114-Status: GOOD (  33.15  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sun, Nov 1, 2026 at 11:34=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> Doug Anderson <dianders@chromium.org> wrote:
>
> > Putting the metadata in the configuration's `description` property came
> > out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> > already uses configuration descriptions for similar board matching).
>
> Thanks for the background. The Xilinx case is a bit different, though:
> the same project writes the string (the binman .dts) and parses it
> (board.c), so it can change both sides together. Here the kernel would
> write the string and the Pixel bootloader and outside packaging tools
> would parse it. That makes it a cross-project ABI, and I'd rather that
> ABI were typed properties than an unwritten string format.

OK, fair enough.


> > The proposal I've tried to push a few times is that it's OK that
> > different loaders have different types of information available
> > to them, but people don't like that. They want a universal standard,
> > which nobody can come up with.
>
> I agree with you here. We don't need a universal set. I've sent a
> proposed spec change [1] which lets a configuration node hold one or
> more match sub-nodes. Each one names its scheme with a vendor-prefixed
> compatible string and carries the properties that scheme defines, for
> example:
>
>     conf-1 {
>         compatible =3D "google,lga-...";
>         ...
>         match-1 {
>             compatible =3D "google,board-id";
>             board-id =3D <...>;
>             board-rev =3D <...>;
>             soc-id =3D <...>;
>             soc-rev =3D <...>;
>         };
>     };
>
> Trogdor would use its own scheme (board name as a string, rev and SKU
> as u32),

Sure. For now I might just leave the "match-" out for Trogdor and
simply have the config file simply be a list of DTBs. Trogdor
currently boots OK with the "compatible" strings. Maybe Chen-Yu will
want to propose something for a newer Chromebook where he can take
full advantage of it. :-)


> and Michal's loader could do the same. Each loader still gets
> what it needs, the types are explicit, and nobody has to parse
> 'description'. Please can you take a look and comment there? If it
> works for you, you can point to it in v2.

That looks reasonable to me. Do I need to respond directly to the
github proposal, or is my response here OK?

Yeah, I can point to it in v2.


> > Should I give it a shot for v2?
>
> Yes please. The DTB list already reaches make_fit.py from the Makefile
> through the @file argument, so the new file only has to say which DTBs
> to include and what metadata each one gets.

FWIW, I still liked the idea of limiting the DTBs that were actually
compiled based on the list of DTBs included in the FIT image. My
current v2 draft still has that feature. It adds an argument to
make_fit.py where we can give it the "fitconfig" file and it can spit
out the list of dtbs. Then the kernel Makefiles use this to limit
things. If you don't like that idea, though, it wouldn't be the end of
the world to (slightly wastefully) compile a bunch of DTBs that we
don't need.


> We'll need a simple
> per-platform file next to the .dts files, passed with a new option
> through FIT_EXTRA_ARGS

At the moment my v2 draft doesn't just use the FIT_EXTRA_ARGS but uses
something like this (which will be documented).

FIT_CONFIG=3Dgoogle/lga.fitconfig

Hopefully that looks good.


> Running fdtfactor can then be another make_fit.py option, like --decompos=
e-dtbs
>
> [1] https://github.com/open-source-firmware/flat-image-tree/pull/66

I don't think it buys us anything to have make_fit call fdtfactor
directly, does it? The kernel build can just call it. That also makes
it easier for people to pass non-standard options into fdtfactor if
they want (via FDTFACTOR_ARGS)

-Doug

