Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5919E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 08:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XyCOI3Nb;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OxUxrhJ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=; b=XyCOI3NbOVHmtuw+FS2cVWaaSL
	byrUME4wOtm6uf2qVpFDa4DPIZPiVNUc/1LyH6QKqmGiwLOnFpbilVmXPhb+PJpUZaqxbH7SckhWj
	DT59dr19OzUp9TNcKnxvYjkCICEj85m1Z7HY6VWnq7TgT0+sihXycSYBkyCWXilME3iyXFW0e41Yu
	vDoz1DFk6BsMIzExLL1nEFAnM/UKBbxh/b7UHagAVs8qimf3gSJ7dsnSmzl7FRvL+kDCp73+U7OsZ
	H3YYXATsPwU7fQk0wu9b+MLeB6QK0jO9+iyu4PgY4ly/d0Cb8fpypbYgycEhhznYKsYtMKQQeYDus
	6zU8TOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWwG-0000000HaML-3Ld9;
	Sat, 24 Oct 2026 08:17:16 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWw7-0000000HaIm-3VPB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 08:17:09 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso2290596a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 01:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829826; cv=none;
        d=google.com; s=arc-20260327;
        b=eVORMW/ItjwDRxm0zUJg5qWKp1bJmIjKzESU7Rp9ZX9N2RUI0ftRajOrZhw3Z/m0H4
         xCI4Nq/21XOwIhvuTbZkoibMEpdoc73idoUq+M8ghdM+lQWhNpw03jDEFDXtbuwOS8b3
         XN7xFV4I7Fe9OBnPyHwaJqXob8hEXiYGqTTWcBWe6EaCrjpwO8qBqL+hMt370wfuD6OF
         gGB+qb9kpD6TMFIFjyxWGzNHeKDcGiOYRFp1YhaazEqQaub0rvcmeu9DeN9IVxiYu3+X
         Jn/I9PgBK3JQAc8zKFEEaDhHJYD8ZV+mfjSeNmvznVrQJ7kzcqhaXYKReFhykHhQwXTr
         m5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        fh=gPnfm5GsrgsrBQ1qlPVCGjRw6nEZEQ2/6qfI7KIuxD8=;
        b=g8phcF6HLkT7hyQtgAnd24ESrdOZacZ/+xGLig3KZA+AGoOkVzzr/NTIQ/NY/QYqpq
         qbLp7R65m8eMoTvq20Zi3Owp4Ddx5IMfLe7Bj/k/O3Whk4mpgnKX2JHFy01HvDiw9pjg
         dzD4Xbqf3PI6gz2Q4iTYiZkqSOZuTLV6vrVnvY/UIfQD9gOfaQa9ywvtzlG8EYorvktx
         D5JDz7K5s699OYHygAI+YuGivZDy86Bo71mKAJ4LScdoQAl3PDaTrzDuueGmn3WPdDO0
         YeiuzOlmtXI+xy2kVVJQbUPXB5rSECfTKba97jWwDakadX/d398qOtiDNiFdKYlN/qUT
         qxKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829826; x=1793434626; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        b=OxUxrhJ7x2PvCKTSBuEGMy33Z+d5YqsckqZ+mk1Ng9h8gH1k6aKALt00oo2mWgvoL5
         DA+xH50hJFUjhpScnckzqssSF+KD6d4AR4Ob7gJ75R/PZW6e7o+Wz68CLUp9c2LEV6AH
         7sWusAcYCF3WPvg0yFUkQ8CVlne9xT0Pg2SsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829826; x=1793434626;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        b=pgtyHTT/fOBQiGEDxFDXuLRvrR+m9INl+QUNsklDrU439JKr2cktXc8971Nr4aDa8e
         V81KAlDw2zb1nNA82YciSt6oydkIW9+X4LUYqkyUyhk/tLg0JHhbBDRP0YxJs0GJi6tf
         uIy+M0YK/onEI/Bf9gBoqM+Uzy0WxO+4SrYzwcaqVvqTMSi0PFVeonRF2+CYBBt+/lRj
         +qpxpEuBo4A/jGvWeuypO+2WcgllTo3szMWNA67xxDR5ngSJMp4zLOjU+rbYMnHPrEvi
         YK4+rqkEYYxFMqVsx3mfMrAx86dTF5azATkmIVBhtyvZkW1f8CnM4QCZTVeGuxtvrrjz
         +dUQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6QWAtLqouhzlnh0G+9+KY8kElpkGb6sv/MVKEeSc/3TZDlMOg3mIPQIxW/ytgN+MxDXFh+sNBnZ3ghqnDu84I@lists.infradead.org
X-Gm-Message-State: AFq9FYK0HidA8UyNi86DpVIS3Lvwtm/xwkYY6ZRkNyqh5BpalNmKuT8M
	Ukn3Ejhcs7cLzrE3GQ6E/6QFY1pprAzocrfZupE5H/4v0Sgczp0v7j3CHZV6TTclQkujCcn9TYt
	Lo8//zSwy2KmoeL93SnoxtxjR8rxi356CrOBlEr6L
X-Gm-Gg: AYBFou1HjXaTJ7+bqBHe6uT4ffwzZorzE/htVN9xUpe3FAn0+kCRvoJECFMmxKzbqTo
	Avvvz5k9PI9sBTCswEEH7+mN3RMxdBRTVNMI05KVgnWrepfQNY8o4xW+pdF8pwBcbK53ODbq25o
	Va9ZMTqcLhnBHjHmxazAVkx5k5l4uf9HZHxiA0kDZzE/SbAX0kw+tYdoQ5Ga5Ny79TFiMbi/+EH
	JDEcmfAk0ROIfYFQG1F9CgaewoCj74xJfC43f48jVaelt/iQaezU9Wbmj172d0K3WxBayRFJtjW
	/2YKTOU8blr6I8tWYAf4O3W+QnOsAiiCW5hmNAfLEzP/xNWKev0bV97aR8v6sGwQP8QlwJiEVR7
	0nql0XVg9PJk7En+Ze71unQoPr/AbM6bbVEE=
X-Received: by 2002:aa7:d6da:0:b0:6aa:e46b:2ca with SMTP id
 4fb4d7f45d1cf-6b442ff19aamr1213416a12.30.1792829825967; Sat, 24 Oct 2026
 01:17:05 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:01 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:11:00 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:01 -0700
X-Gm-Features: AclHuK_qmQOwk_OOKs0VN1cm__skt9GZJUv6Fec-Si_oH1IGjBDYDz8yVEqOjak
Message-ID: <CAFLszTidu1NFSJ9dprCHts0-XY73gk-ZPAhz0V9BdYPoCcXmvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
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
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_011708_127074_9AC89C2A 
X-CRM114-Status: GOOD (  12.55  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
>
> This adds the following commits from upstream:

>
> f3451d12532b meson: Only take the version from dtc's own git repository

The script builds this list from the last sync point (v1.7.2-69), so
fdtget.c and fdtput.c get loads of changes beyond what this lists.
That's fine, but you could mention it (e.g. the new -r and -d options
in fdtput, automatic growth of the blob, long options, strtol()
instead of sscanf() for parsing integers, fdt_pack() before writing,
the libfdt iterators in fdtget)

I built scripts/dtc and lib/fdt_rw.o at this patch with no warnings,
which covers the in-kernel libfdt now that fdt_setprop() and
fdt_setprop_placeholder() are no longer inline.

>
> f3451d12532b meson: Only take the version from dtc's own git repository
> 7a1e01792600 libfdt: pass sources as keyword argument to library()
> 8c37c14c95d9 fdtget: Use libfdt iterators instead of open coded loops
> 89c99ce78ac8 pylibfdt: Add add_mem_rsv() and del_mem_rsv()
> 3750493c8b0f pylibfdt: Add address_cells() and size_cells()
> 0748c384fde6 pylibfdt: Grow the FdtSw buffer geometrically
> 5008d1d6a356 pylibfdt: Replace removed SWIG Python 2 compatibility macros
> 66e1201c3775 libfdt: fdt_check_full: Add can_assume(PERFECT) check
> 214372a27398 tests: Replace trees.S/dumptrees with treegen for making test dtbs
> 4df9ca4c8ddb tests: Add treegen, a pure C replacement for trees.S + dumptrees
> f116f4800edc tests: Dont have test cases link directly against example dtb data
> 9b53b9a4c2f9 tests: Add missing unterminated_memrsv to dumptrees
> 5f919a25d71b ci: Merge make and meson jobs using build matrix
> 6c1426dfa963 ci: Add macOS support to install-deps.sh
> 23fd89bc8ed8 ci: Move FreeBSD CI from Cirrus CI to GitHub Actions
> 3ad5ebbdd9d5 ci: Upgrade actions/checkout v4 to v6 for Node.js 24 support
> [...]
>
>  scripts/dtc/checks.c        |   2 +-
>  scripts/dtc/fdtget.c        | 207 ++++++++++++++++----------------
>  scripts/dtc/fdtput.c        | 280 +++++++++++++++++++++++++++++++++-----------
>  scripts/dtc/libfdt/fdt_ro.c |   2 +
>  scripts/dtc/libfdt/fdt_rw.c |  41 +++++--
>  scripts/dtc/libfdt/fdt_sw.c |   3 +-
>  scripts/dtc/libfdt/libfdt.h |  70 ++++++-----
>  scripts/dtc/livetree.c      |   2 +-
>  scripts/dtc/version_gen.h   |   2 +-
>  9 files changed, 391 insertions(+), 218 deletions(-)

Regards,
Simon

