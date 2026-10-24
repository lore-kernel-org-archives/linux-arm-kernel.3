Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650F5606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E80hNKFU;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LkqpTc0Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=; b=E80hNKFUBie+rWTxZHbVG7EzYX
	S3q5BjeWe6lMG6O0t9GOGeU+RjjVqWZPDttUeQx4Iw1MWPyPyl5ebXF/ou1X4W2qL7Sgb0BRnrOqB
	T7bOYrZHOpRV+lw/FON6AVQTsFePVFrC4wdnVQWaoVFnTvAsH45eV2lmgYNPq2usBDUPqPud+SKZK
	7TKVL/5T11NIKhrrUzJpcwV/bdXWef+HUr22zIqnPLTQBP7lCwsB3/AvEUilLZcqdtObMt7gxvl45
	f88JvVKmLQ2+hPrBSuZVIjmLXnNz6jwXNG6Ic7kIxAhWucNgxTNp1TYha6/GIxCyI1xTNQOd5TpaW
	tGuMyfYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWw9-0000000HaJn-2uwg;
	Sat, 24 Oct 2026 08:17:09 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWvy-0000000HaH6-430S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 08:17:00 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2414257a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 01:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829817; cv=none;
        d=google.com; s=arc-20260327;
        b=UWqbNu5+0yQFcyAJwmkYIywXMKdrrtTvcY2lu2cBHUt/93UrfXITeWJKIKYn8ZNoNQ
         /VyZugXBxgrNWi9aWgh57iDH7F3ibkln+7kYZCwuOsmZwEg0jR4DuXU3ylJIgn8LYMTU
         NTDMi1Jo8EPDFvxN0CzU1ox6FFqu5Ma11YKp5J3g5lnMIm5/GWhoF8Twkz6k2m7hUJAN
         A6QU3L3djsdJNxMeoRDg5BL6ZpKtFnumgS1krOL01Ex24FVDSHsOPUH7UB04M3eUv7TD
         okUYbI4YNFzJ7byFYEwMLycsoiHnfYGQDS6Beg77J5eBZwwIXRrPkQT6yACQFMtYITZt
         MkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        fh=CR/JgDJ1cXnTodMBbMSFL+5uMsVkNBNYAj81oPCn6CU=;
        b=X93XSMCMicT6xCQcmQh4yuocTb451F2pj50aGuo4K0gg7Hmxw7EedOwIlVZ/oX3xsi
         GSeNh6NI/zXo9jhBriKk8AY5x7Hk26OinAIEBi23y0rBsObYHPT9z/LRXvwuQH/H/L4h
         UgOW6cd46YG7vprfUmDj1uTupYAC5FEITYvFQ37/HG4Wy6dx0kgWDJi28+Z80zAOMy8S
         v4r++/hIiTHHXvwMPoB7AkkOWleh3JGHv5ucEpBd2xf3s2eBqf1qmqHHke/I1BaqlMcM
         WBCqkQ/Jg2k4lgVIxNfJmSV6sHU6xPbROCpxTYDSteLKSWlJ4zOqVNQsWIRNx9inUOhr
         pJQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829817; x=1793434617; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        b=LkqpTc0QiMD4c7yxArTIjUdMV/Kv8PMN/hsHnW1hipoDhWylHZRA9z5yyIKZwxM+a2
         vtZdq+dpCwRIOvp3c9Cha4BBtl3hbu0rY2FmNi1bg7R5uc3S6cLVYXcBJ14oGmuqdZ33
         S/A9mtpf+vYCWBlCYaE74b1qdvkoBXFpTxQHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829817; x=1793434617;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        b=CN0S1/fm2hdccW6RILOxkLnxcRua+LzUWWYol2hskAqY+5uK213JmTqS7suuE1hyva
         nystJYC5aBNT7gIR+6Fl4A1myxI4/7fV434jx6PGajPEZscF/i5VxcxA+K4z/hsk0oY8
         EIlWlJOY2HsahhXsCQW4V7VaabPgjGMwRYu+11z/xCry81F9FU0Yhtr69SxInFgxuIhi
         RVDJYKgFuoSn9OIqqQArLYVgRP4IY4BAjKmwSmR8QiGYwQ9j6vc8ISbxSyUtUHtW6fwq
         3UpisOgA1DdlYu1NSKtH78Lgf/GX+sraU2ow54W0tu3jWDvAmhOGNGzHqCH+yxjtkrVZ
         48XA==
X-Forwarded-Encrypted: i=1; AKwUvByfuAb9oxzk9j25o4I8vUNcOWBT3dbEgC+Myj0IU7DoBo1eOd5iG/hl2+xLVoybeXzQ/vdPNYQB6O5ndUMvEEWe@lists.infradead.org
X-Gm-Message-State: AFq9FYIrp6UolaHJPGWS0HvdEH4SQh2RdGRuBTsiA5TnDmSucEd8imOE
	u/4r1uPKtxCu8AG7CesJ0F+EV4FJuk7WphTIaqH3Ms/GGOte8L9QWKom7SrUW6Ie0MaQOmCN13l
	4Om1XyLUzS6+J44Uj7pNpNy4h+jgnxNsduZzlYl6w
X-Gm-Gg: AYBFou3rudq/XajooD3R1fNXupfQQYG3FGJCpHO5BrOM1f78wARHoU4RduW463wh4aJ
	xx7PTbewvaAo/Hvg71iQ51PMkGyy9t6u28VpILBi3pfjrzVcmjaismSJ3btsxLzbKkM1995Bplg
	6JtqUxVPn1i/2+3YR1J4RtuvtuxEYO2MJitYFI3W5JDHyUM/DsdxKnSzWHuSVyvaB6WlerRqBDu
	X26KVAutikDr6GwZXtmQs/VxaxSTQ+uMRegbrifUReQhtfamrvRhVTp7IT90yLr8x8X6anCHXAp
	gtvnavfsWXUFwra+/rrl5ohaiOoqITCG1z0yBK+2aI/GoQuNq6Lj4dO3RjZ7BSRk4bwPw4fldS4
	GqItF31mXz/+TXbOZay2jVPPr/BQwNDBbVwI=
X-Received: by 2002:aa7:c9d4:0:b0:6b1:c355:c7c0 with SMTP id
 4fb4d7f45d1cf-6b442fde26emr1152906a12.26.1792829816963; Sat, 24 Oct 2026
 01:16:56 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:55 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:28 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:55 -0700
X-Gm-Features: AclHuK-X20URHOUw51jVSQxB-TyQaLgWVXdt5sH3O8YNafmV3nonazmm4bHkTWI
Message-ID: <CAFLszTjoZ=TZqW8BTFTot0ZRcv_--BYZgdOCUD-rv6nT479--Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] scripts/dtc: Add fdtget.c and fdtput.c to sync script
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
X-CRM114-CacheID: sfid-20261024_011659_037642_8ABC7D00 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Add fdtget.c and fdtput.c to sync script
>
> fdtget.c and fdtput.c were imported into scripts/dtc/ in commit
> cd296721a964 ("dtc: import latest upstream dtc") prior to the creation
> of update-dtc-source.sh, and were never added to the sync script.
>
> Add FDTGET_SOURCE and FDTPUT_SOURCE to update-dtc-source.sh so they are
> kept in sync with the rest of scripts/dtc/.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/dtc/update-dtc-source.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

