Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1782E606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Apx2KgPX;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ET/XeXA6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:In-Reply-To:from:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=; b=Apx2KgPXCGTuJVhZBLY/deULfO
	pm+rUihc5CpJTDeCb7bsf499P29D3r6WWl+mhMuoU5fUU8E92USFWr6TjGudC7CKAx+u0Xm9EW7XB
	50aiTpFbJ9EejlOFeREuScflXWNFGojYHr6mIsginmyERhufLHYBoFVAVwTeJBjR6M7tLfS8dVGNz
	wqGJ/eXc74EPB5Y6SFivleOmPnrUxzfNVVp6SOSjHBDcZKXjMkKHmHpONfxtPDV2F1uPQRd16NyC/
	BKTF6dHV3F+fYu4lZvOKhYce6C69HU9HAmsqiKwkXJA1zGPjs/2Zw4aHEfvOYWNJKyi1YxoayCVji
	+GIb5NQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbKU-0000000EpXL-3cA3;
	Sun, 01 Nov 2026 19:34:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbKS-0000000EpWx-3WZI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 19:34:58 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso3411174a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 11:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793561694; cv=none;
        d=google.com; s=arc-20260327;
        b=pJb2oWHi8QQvk+74XOcGnR01rly3mQM9vfxIsW+WNpZVI1xvMj5DUYeclT85bDIfBK
         2naNWcqzp8bQljAHzyTvtWa+fW27IPPeTPxnwENCqLkwjIMfC9fygieELaAuhkNxrWIe
         uzNxT5i5WXVYRwRUliGjU7QzbDT0KpDKvxCF/dZTyxBlHRBaXmZsAeJCgYezOqeYya68
         rMDRscPgXflM3hl3UbwKQ69CefPPauFH16kx/7UyzB8Rh4saCTYafJ6vjPZCYTXsjU0Q
         /4seILudERLmzALFgvj5iBuMdueCRE1zxXABaCsR7N0E4Q8dLruOW2kRxVUc+0ETk67G
         hBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        fh=nh95WtDvaQPtlEcacsgskm4SovOvKkJMNkLD1vCeoN0=;
        b=ckxR4gs+w0Kj3x/OQIEMoro5IWInQrPEwR3lamg4jX93hqE4W+uZbbM+J99237P8Dn
         EOdJVQfFziwzkxajRECBsFQx0QT0/6csI8VH2wvU4ZWJX1qdvkDff4/EQs/1514m+EUQ
         uiU7xsw40QzXiVXjhXOrFeIT/mRztKiu/w1IwaEsuk+MMEwnjaQJoMOQPvkzXOC9PMbQ
         KysoVrGCojGapILXt/YTbxHfA+RD+Xj3eEwC87CWvLSvgg/2F0KKygkv5r2xzxhjH5Mr
         BC0sCM935SKgdpcJfsx582AoKEaCF85ENsrQr8si5G7Wheg/f3kXbN/RKHJCwyA8LOF5
         +olw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793561694; x=1794166494; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=ET/XeXA6C5x20H7GZeAV/kFooyDsIvHphkHI69dspqy//6raCrnbqDiX8EPKCFiFfN
         jMfC7S32+XzcuhlB8Yu5C3m8mbTVSdqK9qT9oz/uY9SFyOIWdGXrIV7epOzMl88pJ6Gl
         38bJx7o0W1wD42c0h7wfHIslmXJ4WCzqwYZA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561694; x=1794166494;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=y/eJk4x7kmgf9eRdTX/UnP0/4RAQYkyQHBWLjl3Xf4zVKifTvWlxE5Rt58le2bhuPH
         d3pU+mhRGeguzrlyrij2MGwUe+bAMCX4W7zGGC7rfKKoQcDK7O33sswZXJ3Ge3OFmsvp
         czyg6xBD3qYGAB7EqCK3Kqs6y3wJeKKG8jCR/UYpgCDp3xO3h9HEqNGrV1dvTS3JMo/T
         SkXH05/puHkcTaXFozRHPQAPMNLSHK2i5ndRKuOCGn8AJqKvxhhBWhppWZQGsMTrpMly
         Fzvrg+Ee6zDyyjOlcng5sCIgPc6Ex0Emjtj1BVvez+47y1HNo2WCbGGHdl1iuC84rBKt
         mXLw==
X-Forwarded-Encrypted: i=1; AKwUvBzyESGgiVA/0nfncrZJmi5hsu0ms4lMMA4m4DYLFbHYJ/ugIZjyBSdtUkJx9+7cnDsD1rbdrfeb5rWuzlzWo0by@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZCgHYt7kKMxrBctvb6soqEWCAyV0ih/L5ftLDBMMJNLS7LYX7
	Rz6nS23UluGTMJflNsBWRE00m8qzU2nvO/TGWoEL4X0o0gZX4BhaIIQCHZUSOnXtW5DaUSVf1hI
	4+pdZ/aPxepCmoR22g+Fm1B8afGjZbqRhlfXTHiBx
X-Gm-Gg: AYBFou0uw1Jvf4d9xaI8eQZE+8SdD/UtMVBfe4fLXICi8zpRoHkq/xAdTAmizwCNDJB
	4400Kr7upC5hf9x3T1U7iD/BlRflcGybNHbwLi8EHAnrbpb9rLQ0j2xngpJQeNvD6xzPHPIi4qX
	tWUygo2UtZEcT4P7Xiu5Q2l5cALcieGYw7uq28SQuxV7YGkpJKm7SCeuImkAs2Y6kjP3luqCcD6
	pvtSyuk+AoHLeeWVKkJUMwD9v2tCx+EHMFHRn0YtU1FZTEpwvWHxbfTftMh+BDOgGoUuwjwdLT2
	dVNGJKTHr7LE4OYUYlSRB7w5ZJ2w1DEQq2RUvlgyLxV15X+ZMEaSbI3aXkSOItnf4Ujl7orhQpC
	wQF0yWhoEI4+/ep7PnB6kZKNPXrHo4mpeOWiTfXTWJxH5iHU3XWklLtrM4ftIyGpQ8w0h6Ba6
X-Received: by 2002:aa7:da45:0:b0:6b3:e89b:128f with SMTP id
 4fb4d7f45d1cf-6b4d4d6d938mr4052419a12.9.1793561694122; Sun, 01 Nov 2026
 11:34:54 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:51 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:38 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
Date: Sun, 1 Nov 2026 11:34:51 -0800
X-Gm-Features: AclHuK-OENc2MfogrHTK6nr_VXdYPKQaHTgRVjZY6Us3vAfjaHxM1Qejmm0CbCs
Message-ID: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Doug Anderson <dianders@chromium.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_113456_944314_90DADD7F 
X-CRM114-Status: GOOD (  14.91  )
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

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:

> Putting the metadata in the configuration's `description` property came
> out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> already uses configuration descriptions for similar board matching).

Thanks for the background. The Xilinx case is a bit different, though:
the same project writes the string (the binman .dts) and parses it
(board.c), so it can change both sides together. Here the kernel would
write the string and the Pixel bootloader and outside packaging tools
would parse it. That makes it a cross-project ABI, and I'd rather that
ABI were typed properties than an unwritten string format.

> The proposal I've tried to push a few times is that it's OK that
> different loaders have different types of information available
> to them, but people don't like that. They want a universal standard,
> which nobody can come up with.

I agree with you here. We don't need a universal set. I've sent a
proposed spec change [1] which lets a configuration node hold one or
more match sub-nodes. Each one names its scheme with a vendor-prefixed
compatible string and carries the properties that scheme defines, for
example:

    conf-1 {
        compatible = "google,lga-...";
        ...
        match-1 {
            compatible = "google,board-id";
            board-id = <...>;
            board-rev = <...>;
            soc-id = <...>;
            soc-rev = <...>;
        };
    };

Trogdor would use its own scheme (board name as a string, rev and SKU
as u32), and Michal's loader could do the same. Each loader still gets
what it needs, the types are explicit, and nobody has to parse
'description'. Please can you take a look and comment there? If it
works for you, you can point to it in v2.

> Should I give it a shot for v2?

Yes please. The DTB list already reaches make_fit.py from the Makefile
through the @file argument, so the new file only has to say which DTBs
to include and what metadata each one gets. We'll need a simple
per-platform file next to the .dts files, passed with a new option
through FIT_EXTRA_ARGS

Running fdtfactor can then be another make_fit.py option, like --decompose-dtbs

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Regards,
Simon

