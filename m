Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9463CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaftIdo2uhNDCaG9uu7zjBXqmMAHeuUGIhOtZcbrTyE=; b=dTbWp5zUx2qVhLtwQymr8z44Yw
	FWku72zOAu32qwaRC8KR3StiQcAKGxMHamIfESRGDvkZeryrrK2s8tnSSlXpMNYPsaWFGt3uUW7GP
	Ty9nm5H3BoCaoVzk9OreeFpXFXt8/xlIayifw1Te/RpIZhyII8JCBJkGRySWi6dGo+DvmkluPzd1Z
	y7aLvKduulxv4z9YTSBJq1+o+slkCxGK+Jdo8GfJ6RosEQs0uwXws7G0Zt4hf509wbX07cGln3TBh
	0bR7hjMfMwKl9u8wIrcMZ6+TzsDftrr4elKASWkOq74H47Jq4VS/q95PyYmXim3S7J2NF8X+LzRfm
	Dq0kEx5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQO1r-00000005HsV-1dlH;
	Tue, 02 Dec 2025 10:54:43 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQO1o-00000005Hrw-0qzg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:54:41 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso4921180e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 02:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764672878; x=1765277678; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaftIdo2uhNDCaG9uu7zjBXqmMAHeuUGIhOtZcbrTyE=;
        b=GhHR42g7uXp03AgnkT6FIKKQtB6Bn4FLpHqf3iIuBUE6HQrY5eSnQVLFWuVSUCHYyA
         EWH9N6pb08dfRVaCTjSUDJ0yup1IdZY5T7Yb+BVZi+KvQ8R7FBL3c+8A2+YZ90kNPB8g
         q3tYOAxl6K6ujU83a5fjGmRk+L0wj5LMfCQMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764672878; x=1765277678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kaftIdo2uhNDCaG9uu7zjBXqmMAHeuUGIhOtZcbrTyE=;
        b=pBSYb0c+A7fJg/yqs0IQkgXO6Gt7cj8p3csx0HxdOnt7eP7g/vwu8DrsI01AxR5m6r
         u0bp1aZsR12jfzI/3uTcJOaNuIjCD5ZlWKEbhX8WwrrJdQvRP5EAa40G7pVquwLwdW3q
         3uSpQTlmm5nJK04i/GI37EMNcIyJSxqYmmtx83xoOfoAUGbRXJWYtW3vk9F09yGfYRuU
         r6PDd/28TgJkSXyPTrr/0ReqU8C77F3Xfe0j5+rbr5xZngPBRfPpQAYqUC8paxya4/DJ
         jVoJeBIhK9AvFq3aZvWOV0ju5XnPq3crrKvucjcMFRz+Vc+YS41C05J1XiAha/SiRN5K
         E12w==
X-Gm-Message-State: AOJu0YyO5yqnh8hrjd4VlCc5jsPHPOz+K1mgjFQFTju8wKQ4NInDMlPC
	VUOt3FJ11kWkEaAybAR2x+avr9usH243bndArHTEOWt810wtuOsYp7urr1/lPPbV0RP1oJ4+4wv
	WhtW0nCTwu2JqRXnc63oNRA0wcfLunIa/PnwxpQ/8
X-Gm-Gg: ASbGncvOUUwmqXv4Sq9cpZwv/a5ZizWN8iULN9R++kUolwLN1qsl3VUfhNjdJKVhPgj
	sALWatkuAl67OGo/jywwmQfw2mTbYvR9WSVO/G/qBdJ5ob/iN774M4WqA4R4bm4KvgkiVZNwKj8
	7gT8GWjPgEwUaUuA/ers0cqGpdVvHep4xsryPOj7HrAEBeY0sYoC7lQBsz01VBEZfpnHjc5XFtL
	IcU9Pzh3/lFuB9+toMjYjKFRmCcHZt3fc++qAP4A55Rll7NeZEw3qNzAqlZlXf9OIoBuG3gp/8V
	Zi2SEAYM3RO0jGCcepl6cQ2UEQ==
X-Google-Smtp-Source: AGHT+IGFk7FFpWTs8T9xGiYyzO70gqTta60RY+/ljHQkSpaK4XP5I2SrK+4xgqp0q1A6T39zUCYzxglfKVSmQFyobgk=
X-Received: by 2002:a05:6512:ad0:b0:57e:4245:114e with SMTP id
 2adb3069b0e04-596a3ec1554mr12563600e87.24.1764672878085; Tue, 02 Dec 2025
 02:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20251119181333.991099-1-sjg@chromium.org> <20251119181333.991099-4-sjg@chromium.org>
In-Reply-To: <20251119181333.991099-4-sjg@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 2 Dec 2025 18:54:27 +0800
X-Gm-Features: AWmQ_bn4BLYyEIhexyQVEAKI0q1HybkXOCTMAS0KZlRym27d_EXwS1f9NAMy5cg
Message-ID: <CAGXv+5GnpoNBLP29i1eWCxu7p-V3+_s70U6H0f5nF89md2=_Eg@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] scripts/make_fit: Move dtb processing into a function
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_025440_298186_3E33FEC4 
X-CRM114-Status: GOOD (  21.25  )
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

On Thu, Nov 20, 2025 at 2:14=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Since build_fit() is getting quite long, move the dtb processing into a
> separate function.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> ---
>
> (no changes since v1)
>
>  scripts/make_fit.py | 67 +++++++++++++++++++++++++++++----------------
>  1 file changed, 44 insertions(+), 23 deletions(-)
>
> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> index 984371f505bc..1a74a9dcd85e 100755
> --- a/scripts/make_fit.py
> +++ b/scripts/make_fit.py
> @@ -277,6 +277,47 @@ def process_dtb(fname, args):
>
>      return (model, compat, files)
>
> +
> +def _process_dtbs(args, fsw, entries, fdts):
> +    """Process all DTB files and add them to the FIT
> +
> +    Args:
> +        args: Program arguments
> +        fsw: FIT writer object
> +        entries: List to append entries to
> +        fdts: Dictionary of processed DTBs
> +
> +    Returns:
> +        tuple:
> +            Number of files processed
> +            Total size of files processed
> +    """
> +    seq =3D 0
> +    size =3D 0
> +    for fname in args.dtbs:
> +        # Ignore non-DTB (*.dtb) files
> +        if os.path.splitext(fname)[1] !=3D '.dtb':
> +            continue
> +
> +        try:
> +            (model, compat, files) =3D process_dtb(fname, args)
> +        except Exception as e:
> +            sys.stderr.write(f'Error processing {fname}:\n')

`git diff --color-moved` revealed that this bit was changed from
f"" to f'', which I think is a bit unexpected for pure code movement.

> +            raise e
> +
> +        for fn in files:
> +            if fn not in fdts:
> +                seq +=3D 1
> +                size +=3D os.path.getsize(fn)
> +                output_dtb(fsw, seq, fn, args.arch, args.compress)
> +                fdts[fn] =3D seq
> +
> +        files_seq =3D [fdts[fn] for fn in files]
> +        entries.append([model, compat, files_seq])
> +
> +    return seq, size
> +
> +
>  def build_fit(args):
>      """Build the FIT from the provided files and arguments
>
> @@ -289,7 +330,6 @@ def build_fit(args):
>              int: Number of configurations generated
>              size: Total uncompressed size of data
>      """
> -    seq =3D 0
>      size =3D 0
>      fsw =3D libfdt.FdtSw()
>      setup_fit(fsw, args.name)
> @@ -310,34 +350,15 @@ def build_fit(args):
>          size +=3D len(data)
>          write_ramdisk(fsw, data, args)
>
> -    for fname in args.dtbs:
> -        # Ignore non-DTB (*.dtb) files
> -        if os.path.splitext(fname)[1] !=3D '.dtb':
> -            continue
> -
> -        try:
> -            (model, compat, files) =3D process_dtb(fname, args)
> -        except Exception as e:
> -            sys.stderr.write(f"Error processing {fname}:\n")
> -            raise e
> -
> -        for fn in files:
> -            if fn not in fdts:
> -                seq +=3D 1
> -                size +=3D os.path.getsize(fn)
> -                output_dtb(fsw, seq, fn, args.arch, args.compress)
> -                fdts[fn] =3D seq
> -
> -        files_seq =3D [fdts[fn] for fn in files]
> -
> -        entries.append([model, compat, files_seq])
> +    count, fdt_size =3D _process_dtbs(args, fsw, entries, fdts)
> +    size +=3D fdt_size
>
>      finish_fit(fsw, entries, bool(args.ramdisk))
>
>      # Include the kernel itself in the returned file count
>      fdt =3D fsw.as_fdt()
>      fdt.pack()
> -    return fdt.as_bytearray(), seq + 1 + bool(args.ramdisk), size
> +    return fdt.as_bytearray(), count + 1 + bool(args.ramdisk), size

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

>
>  def run_make_fit():
> --
> 2.43.0
>

