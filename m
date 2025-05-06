Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A93C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JseNVTS5cyJQpI/Mfz9vsdQjjHZ+PMPgo17Lr4qAjrY=; b=uQbp8+ifBjA2gQLLZafvLDCXX9
	n1/Qy3fg3daKF2tEvjLIiF3zui/fgrWCmcvzpR75Y+BgSWM824KvdrKNKfoL1sNDT/BQd4Oif2t+g
	VAzQueYEkH+3xDsGaPmbiY/1Hg2UTYozGMQkiV/nrbzQsuyO0OxQLR4C6XfqXP5WFcm1nE2en9CKd
	00h2Z0HPVEi3TFHlwd+hf5CVFGgdcTRgHVig+Cc5EwYpe9b9hLtMUF/PBKgYD4SFfmsWB5fPnf9TJ
	8pkGemwmx72ZEUP1Gztds0FUiXL5oMZUJTEIM3L0XViiFF5YXdzyYrv52M1S0U/OF2e9pVZPdIlaz
	/pF6LTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMgr-0000000Cw8b-2EKP;
	Tue, 06 May 2025 18:06:49 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIZ1-0000000CB58-3nNy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:42:29 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3081f72c271so5618829a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1746538946; x=1747143746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JseNVTS5cyJQpI/Mfz9vsdQjjHZ+PMPgo17Lr4qAjrY=;
        b=gT1XTUKtCD1u2fraT6Gih46YWYlwgz+RxCrEWH56OJbnbyw2snNN3tDBiEVdmIbFxA
         U8RULXTPiVAnL0ny3VTCCgfPoPlxeAS+gNIjdgfdA/qqJJhWhQFLIIyzI5JsWIt7Qn1Z
         vQ8N2trQ4MnvXsrNoZaAjIBem0rdM6RgowZpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538946; x=1747143746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JseNVTS5cyJQpI/Mfz9vsdQjjHZ+PMPgo17Lr4qAjrY=;
        b=PnVd8D1FoOWY/XMLghS0M4+2XwwVY728Lr6fgIMWzEEDEQrluL9iiDsiibZc30GkGh
         yzbE8L1wHOwO1rz3hDuNH82PanoVEUjNq1SbM4Nb8xWr8k7V9tw20IuPctQ4bAq+HqHC
         vjMv8slQ3QGuUn4NiV8ue+fAh9DNKVTEp1+CgDjdVx5FheHlARbRwJnFEgere5VRoJV9
         54N/ntDXyXvA0FBpDKyYMjTMbP3jcU0sB1mP1L1AKPBV2mYKq3wZCW0b3cJ3iT+2F7oa
         J5nTS8vnYaR7IE5Gcb/tQqdSjRKqgfmJrBHEU/acEQVS2ZS1UcBNfvBxncYMMh6XWiKV
         NcMg==
X-Forwarded-Encrypted: i=1; AJvYcCWfy1vEEbdfinJfol32sNsFFwtBot+/d0dOUnqxBc/uAGlanrad60T3cICjj7bEGCsCIjSW+eXuMH6cluAfl3qh@lists.infradead.org
X-Gm-Message-State: AOJu0YyHrdRdVE6ts/aJHcmOzpPH/00Gh23CEUjvw8LtpTFDeKZAc1fa
	6j82F6UTA8A8IHRiuy9jqzV/3c+i6aby83tWqVxMYpKUYfwOP4Y4C3cOJ7WIQ3gp0cY75+pytnn
	rL6smS6lqezQUzii36/PrYPfn31v/ExJMwpaZBg==
X-Gm-Gg: ASbGncs0HPYafiUz8BYu+DPOivLVE3CDgDlQrnsXe2xMMgnRO4M8aDkxqtnSBNsJcL+
	QJoCRf9syOpnGAcsIeoWfFTVEjTtXxd9I2SeaabrUg9wcrbyt2ohpEZlxGTVmPc46pq/Lfz6/6A
	YPZE2GccKdgOldFN4WKUgmy2GEX3WzOpCdTRpLYkADSNt745tw9qJjgMw=
X-Google-Smtp-Source: AGHT+IFMb+lrclQ4OPHCAh1lzSkIMnskyJOofZ7Kk/Nmt7sTAKcOTEwR67sDgAeExPy9dKzAQGA9Dqsm1s06dVSJZYE=
X-Received: by 2002:a17:90b:5446:b0:301:a0e9:66f with SMTP id
 98e67ed59e1d1-30a6198e12emr19037686a91.14.1746538946445; Tue, 06 May 2025
 06:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250505143700.4029484-1-christianshewitt@gmail.com> <CAFBinCBmBotJL=wC2=oV-o7piGckoBvN3S6ofYh20fEP9sn4XA@mail.gmail.com>
In-Reply-To: <CAFBinCBmBotJL=wC2=oV-o7piGckoBvN3S6ofYh20fEP9sn4XA@mail.gmail.com>
From: Da Xue <da@lessconfused.com>
Date: Tue, 6 May 2025 09:42:13 -0400
X-Gm-Features: ATxdqUHU86InfKfq52zvNkEmca8096lqpeIdB0VVbLy3DnspBF4H2KEICm4USso
Message-ID: <CACdvmAi3JbdLstkudF=Fb_O_P1GGADuubKVS6s22hvC93qz3tg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: sm1-bananapi: lower SD card speed
 for stability
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_064227_933319_388BB0C9 
X-CRM114-Status: GOOD (  20.68  )
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

On Tue, May 6, 2025 at 2:26=E2=80=AFAM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Mon, May 5, 2025 at 4:37=E2=80=AFPM Christian Hewitt
> <christianshewitt@gmail.com> wrote:
> >
> > Users report being able to boot (u-boot) from SD card but kernel
> > init then fails to mount partitions on the card containing boot
> > media resulting in first-boot failure. System logs show only the
> > probe of the mmc devices: the SD card is seen, but no partitions
> > are found so init fails to mount them and boot stalls.
> >
> > Reducing the speed of the SD card from 50MHz to 35MHz results in
> > complete probing of the card and successful boot.
> >
> > Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> > ---
> > The same workaround of dropping to 35MHz is also done with the
> > ac2xx dtsi; which has a comment about CRC errors being seen at
> > 50MHz. It's probable this is the same although I forget now how
> > that diagnosis was done (or who did it, Martin perhaps?).
> Maybe Jerome helped investigate/debug? I can't recall and at the same
> time: if it fixes the end user experience it's a win.

We had an issue too and ended up disabling MMC_MODE_HS_52MHz | MMC_MODE_HS;

>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

