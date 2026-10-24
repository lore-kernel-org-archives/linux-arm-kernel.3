Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C5C606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 08:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rDMmchTQ;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gmdZVtmQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=; b=rDMmchTQB9hddKLYnwh5g7g3kb
	Eva0Fxkze/3f9r5VT9ZHjxCPxUC398A0o2tXaQ5qz9UuObvl4bKZmlk2BWIv7FNF/5+2NTa5rVKZw
	ExWKuzLY8xOKYRt29gdCvDWCzf7a5DGiiXBRG5+1hHTG5s97kCJu89m5qvid+oKKUxy+t3xef9lZz
	BsixI24trvkz9G19PY4puta6ax7YhWUj/bx+rKg8R2P3DrMhtLWASG7A9Y5mEs4+hsM6SzdWWUx3V
	ePsc0/35ucXDyR4SScozLUuK802ULaBt5o00LynM5gLkRjOyeqO1er4HDijxXPexVjlDs9f32j/Pb
	rf7p7zVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWw0-0000000HaHj-2Tou;
	Sat, 24 Oct 2026 08:17:00 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWvy-0000000HaH5-0Fmk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 08:16:59 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso232791266b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 01:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829816; cv=none;
        d=google.com; s=arc-20260327;
        b=Zv6/ssnPGNU67ux5q6BqHPvZKYvymIk6HcV54+Nb18FQNU781e05hwlwAnVoxNPEDv
         miLQnrDKAWQPFcIquWWD4wyKWdBqFgBuLPdMfPXXgOuKCCQwtwsgA/mbWfM196fhvH7x
         qj0AeY4UukSvGP1hzvvpFVmgq8+z15l2WhG77U53GmZiRVZ9zib/BmAuJCQOxAPOsUX1
         p/vmyOJauVUbKKN/fiMWCCBK7IIWMqfJSl+bS7lbYw0Eok5Js0mcMkbyGN/KDZBk5ZVp
         7XZfmuJrn8TcnKRnWtim/4tMnUjOJ2tsmyNVSBck6lusRcLgz+YXLw49CLIJb5Xjyd9p
         KNfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        fh=Q0OlV94DlNxiM8xbORn+1URIvo1+xWCNKWkYji5umnU=;
        b=cNE8kYHXDYmuIUZFeFBWt2Io1iCHz2HAtlLhOsULNVrtE92Cqp3KWbKn/8ODie7DHV
         lMCEr135xXNnXEnAmyo2P2nW9Rec/YbSd7/RYEREJe1OydqX3KGJjK33bkPl0+olU2ek
         SXe9VC/Xs070aFOQpwQFXMOO5CwYdgROTOL1g9u2MDLosh6pZuDWTx2CK6gpMLfRFpuf
         NQUFfyQESKKzuBQ8YcjNETSiG89ftqiZNU7+E8nJzCwacuK4wxA5D6HT9/E4ckm1K7GC
         hT9X7HfdKpNqae//KypTIKtydLssSCZi5QX+YnDI2xNoeEBDygKh7710xwMnVgI5HxoP
         3sRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829816; x=1793434616; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=gmdZVtmQd4RM9aEUUxg6AvEj3ZnnrLyWG63usxnLJOiWp7rZ19ntqZPQgHT2hCnLV1
         0RldON2R7T5Hp0lldGJFPbi5MzUXUpgEfp9SUmeqK3r7PEGLerTZ0AgZs719ffJtYylA
         raw+qZhLWPLJZ4wxf0wQaaNvfEweGK5jiqH+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829816; x=1793434616;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=f++r/aqTmDp4OKnah5tg0EajgReH/6QIAZ73OOz4gYroQ6Lk6T9PwnB56hwLaAwSMK
         /N4NrEuOUk+etT+OqunFWn16pDo0CLvUtGO/QDb8kNlKLJ48aMQEFgrzDcYBIX1FqdUP
         rbIm/a2MpLpNNz4odnN+hODRcm9CHHndi44G/4wGvUwjm9TIIidntdCCp5zT0146W7oA
         OXPCA5BkzxnKdwBeVaPAQf6POKSWu3IALLK0Zx5l/Kj/PhRArDIC3+6kiw0Uvq0V0OsQ
         82ekC+PfOuAB0Wffx8+yG3IQjD6vkvbi4nTUrt0qaJNutMgNst3gAxFj2A98jS3//ddV
         tKhw==
X-Forwarded-Encrypted: i=1; AKwUvBzz/W74d7daLAvJMuPr5sDDviKSjNNnRgSH8zI5PGIesXeHvtHFhSY9Rmp+GOhGUUy5Yq3qwQy1X8LJPjYYTj6C@lists.infradead.org
X-Gm-Message-State: AFq9FYIFo499kpcL/+lD9HkfS/lbXUmQZJDwooDJvtyCMvwiuFDLL66F
	HSjUuUhK01ZANEGZvZb1a9NUWqweDt6YkZ0pscnBgg91fadGIsYw0ZRx+d156qVrmbRQj3xYiJA
	NzzVSFn7h1NutQMXWZ3++zlyPX6JmgESxGNzMxtxo
X-Gm-Gg: AYBFou1uMZ2p56wQVAxP2bVtTdh3u5X/1+fBsUpDKx+cnEvbzuzR/wfHl3XHOg0pXnn
	uO9Dgbfxtp0tdcuEsM/1y47FDov848s6ISaJzsh7V0OYclSh2OffOwBdHDdaQKu4nag+xmb+4pR
	tmiAbZaR6mqzC59/qUuFmN7o1gz/m3+xZnZ5ErpoShOE/jKjh1fW7zUvVmXDnvuUp1EWSy/ObtV
	5tfNoO3zPQbKtAXZbrR8A70KFGjIsSmSbSb/vCAsNL6wGVdz+FQAoH4V8mi/bU1ZqIgFO9lNP9V
	g36WSmitQySPB7/y9S5EiFeHkQcV0rCYi0Ht4+pEDGpg8XSbtLWBpD02h8UEetjdt69S6+Li3gt
	VIc795RXEccdeceFKLP1y0tn65WullUEGin8=
X-Received: by 2002:a17:906:9f84:b0:c44:494:692b with SMTP id
 a640c23a62f3a-c46bde198e0mr151110066b.22.1792829815874; Sat, 24 Oct 2026
 01:16:55 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:54 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:49 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:54 -0700
X-Gm-Features: AclHuK_VJyuusU7nyQWEvJVdBRj5rBge31M7RaY0GTXZjSe04p7xrEJjqvNNRK4
Message-ID: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_011658_267481_9BF300FE 
X-CRM114-Status: GOOD (  12.33  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Doug!

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:

> 1. It uses a checked-in .its script to associate metadata with each
>    board's devicetree. Other tools can parse this metadata in order to
>    craft a package that the Pixel bootloader can understand.

One thing I'd like to check before this goes further. In lga.its the
metadata is a string packed into the configuration description
(board_id=...,board_rev=...,soc_id=...,soc_rev=...). The FIT spec
treats 'description' as human-readable text, so this turns a
free-form, undocumented string into an ABI that bootloaders and
packaging tools must parse. I'd much prefer proper properties in the
configuration node, defined in the FIT spec [1], so that every tool
can rely on the same names and types. I'm happy to help get that into
the spec. What do you think?

> How does this series help us?

The FIT_ITS path is a second way to build image.fit alongside
make_fit.py, and much of it repeats what make_fit.py already does: it
puts the root compatible from each DTB into the configuration and
compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
/incbin/ paths and a shell loop in Makefile.lib to do the same for a
hand-written .its file, and the .its files repeat the DTB lists from
the Makefiles. Have you thought about extending make_fit.py to take
the per-board metadata (e.g. from a small file next to the DTs, or via
FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
logic, and trogdor would come almost for free.

The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
documented anywhere, including the image.fit entry in the arm64 'make
help' output. Please can you add something, perhaps alongside wherever
FIT_DECOMPOSE_DTBS ends up being described.

[1] https://github.com/open-source-firmware/flat-image-tree

Regards,
Simon

