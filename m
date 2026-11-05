Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA137606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w6dFfFfA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H6rcAFKo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=38nZMeNznVKeupiqH5IxVPd4xUnhI8fUvfCaQKWMg2A=; b=w6dFfFfAjMDnFy
	swEw7clO/Nz0iIKllW6TgegKEjrEhemuhSn0eR1h3ZIliG/R2CqgHQoomqkvxvUbPDPXPG+nd+q4M
	WJq2GUyoAYMCpAf/1YaOZnefcRcBpRnLqD1+T8gCPoqZtn1A2YUdGhyLpBNXA9MekTBqDERn6yQ5n
	mfrNq1NEiorc7FEdkZiPcQ3ltblYKa626vvybJ2P7vgcjmM66E5qEtoR6SQ5Kp3XCcscncV0fHlUV
	EkQm2InkQ+K6rRWPa4q9TIQpoV/lF7ACE1ZGVuKXs/cCTj4qYzxFE90y9N4ympO39B2JoDGuUuDmZ
	0D5Ju7TQzShWPKu/ykSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtfw-00000008HbD-3n8N;
	Thu, 05 Nov 2026 09:22:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtfr-00000008HZu-2DZq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:22:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F304843F2C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 09:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AE11F00919
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 09:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870542;
	bh=38nZMeNznVKeupiqH5IxVPd4xUnhI8fUvfCaQKWMg2A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H6rcAFKo+4gqVyPOhTaEkldRgXH0ytPgPp3wFiSJavm8fKl7xBo2iNAPeIKCvjvUB
	 cvbq8/s4ee1bfehZxxSs4jCYqpIsRvRRtUhMyAZcqEANoHHC9/t299bmfA7vYPj5sG
	 xJXZZUkQ8C/JSBDTj1c12SeE8708LYkyctwZOFUEriY/G40pGeni2VhYrq2TK0KTgl
	 kTY2zoALYSnXskb3xcya7NaHInRQWoQsIg7glYviBojQbtR0hSRT2HmrGhpt7KGDDH
	 wH7P3RZfXZh7GRyrE2CyLJxxdetwEt6HlmHRAEdajeWUixKxzlbMQkZS39nwC9zbEd
	 FHUfFPLMF7cTg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bccecba199so1437176e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:22:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxyEvgIlJ6uDbTzPTksHx0HtoDXF4RSQX6uf/aY/7Be7iHGS+vCHlyUE+90Eecc1HylwVzdoEwsDJY3BekQFsEI@lists.infradead.org
X-Gm-Message-State: APuU4Z8+YiKRZDTV5LfMIJkB58JVqCvlXtp0FDO0+JCw8n2St9MkL599
	wfckPaq0Ryka3/w7hQXQ008/OP+KktArj7rB7bMhZzK3eMuRPLqWdlvnHn9vRqmgBoF4tF+JtGk
	v7Sm4JBCxnWlBeLoRN+4/RJjcmLH1jd4=
X-Received: by 2002:a05:6512:33d3:b0:5bf:b144:fd05 with SMTP id
 2adb3069b0e04-5bfd957ec46mr6771787e87.54.1793870541701; Thu, 05 Nov 2026
 01:22:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org> <20261103213002.1673560-8-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-8-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:22:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLmF0U6ehFSuauqKDQiZRkuUnqpbZd--v2aqF2YZQF=HwA@mail.gmail.com>
X-Gm-Features: AclHuK_usnBCJ7KUuM8edZVtpiEIeTbj7Pj1_drbEmXyfoNip4o1DLtzy4-1lMQ
Message-ID: <CAD++jLmF0U6ehFSuauqKDQiZRkuUnqpbZd--v2aqF2YZQF=HwA@mail.gmail.com>
Subject: Re: [PATCH 07/10] pinctrl: realtek: Initialise omitted offset fields
 to NA in config macros
To: Lee Jones <lee@kernel.org>
Cc: James Tai <james.tai@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	Tzuyi Chang <tychang@realtek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 10:31=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> The Realtek pinctrl driver uses NA (0xffffffff) as the sentinel for
> unsupported pin configuration features.  However, RTK_PIN_CONFIG omits
> input_volt_offset, slew_rate_offset, and hvil_offset, and
> RTK_PIN_CONFIG_V2 omits slew_rate_offset and hvil_offset.  Because C99
> designated initialisers zero-initialise omitted members, those fields
> default to 0 instead of NA, causing rtd_pconf_parse_conf() to treat
> unsupported features as valid at bit offset base_bit + 0 and corrupt
> adjacent register bits.
>
> Explicitly initialise the omitted offset fields to NA in RTK_PIN_CONFIG
> and RTK_PIN_CONFIG_V2.
>
> Fixes: dcc9334435b0 ("pinctrl: realtek: add support for slew rate, input =
voltage and high VIL")
> Fixes: e309dbd523b8 ("pinctrl: realtek: add rtd1625 pinctrl driver")
> Closes: https://sashiko.dev/#/bug/linux-fbd0bf54-6dba-4652-9418-270b11fb6=
d8b
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

This patch 7/10 applied to the pinctrl tree for fixes.

Yours,
Linus Walleij

