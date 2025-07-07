Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0674BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42jtsUDXPCPmNytXrx59THHUxajHEyTomBc5xpmWMc0=; b=FbAOP6UzBkkvC2RuJUjOIkIb3x
	TIAKdIMLdIAHDzGD/F3sRH3U0NlKfEYhucB1Q6kpXlt3x9OnGP/ihFVsbiwpBt4QbZl2sCDTSWCGi
	n8DnGbWbklUAVqaXH9rqMj0YR6Z0C1g9d5x2ECSL5zJVTk+ZfX9KFiprHcpeCsjc5FvXI156Mp6Ky
	0fW/Ki33662+tFVHSmSZJD79VbyRTtbToZ706ccg1MrLsjcJLt+9F9n7QiRBBFzstPwW5r+RrUoqc
	+a7nfnClnTjl8SBcTJ/e3VNo/SA2VUqpGDDqasqTOz8VegGAeuM6oFuTDgJi5/dnWw0ZiP7KQd7TA
	nbQOuOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqgk-00000003JbC-3Ywl;
	Mon, 07 Jul 2025 18:35:38 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpqz-00000003CLc-3PAX;
	Mon, 07 Jul 2025 17:42:10 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-70e75f30452so22311137b3.2;
        Mon, 07 Jul 2025 10:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751910129; x=1752514929; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42jtsUDXPCPmNytXrx59THHUxajHEyTomBc5xpmWMc0=;
        b=Hue/P1H4tOOz3H5xaVHzkOszy1NOasNJB3irKSmH7gM8Hh+W5+hPHQrwYertHOOAR6
         NGE7Vod8KphnnOCWvlnDwwZzaYu/H2eyND0NiWeQsglMK9z3cY3uliMMdfSRs5yhBZRs
         cAFAIs0FkRwtHJPxrNNPDS34/zn7Xf4B4+BGV5Opd5EqMhJd8QMyirAj+ICz6jQtzZBV
         WhjDGWhm2sb+op8il0aKNTWlHAXhjmvznxf7N5bk2K1ZF4qa1BVLizKTsbyIp8UubQ2R
         VUw4npj0qgrppdsw/uoFMbLMUs0VCM/BZM3qKYw8uDBoJIqCQfXfLj9y8knh2gv7ZLFb
         9jyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751910129; x=1752514929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42jtsUDXPCPmNytXrx59THHUxajHEyTomBc5xpmWMc0=;
        b=YsC3OZtpWvqusyxr/v0zaLeRq2MqHPN5TSnCt6f80mkkC5QKRbn72BA4ggkcHsMEyZ
         JPbPwkmoJ4NiRd6LmxEne6zzhrbP4BWyyKKvZoMF1USLJQA7Tzl6/nhxn1uJgTMwcp35
         ZzWTzUrFjulhgeKntL0DT9IVoxc5jHFma3aLDKRdykeMEv3ohwfYnGJGIdpmY6mlSwxG
         +UE6H0flXWKg+ic9HerThIVEEf2KiW8VHBw5hjBNF32oovxWGnDeZ7e4LnclJSiOW0eN
         0UEkV/9xfW46iU0TLyEo5P9kr5j4WTcPknTYRbMWf1GkW60GqyHDeBWQNIXYc9lkKm5v
         Yfrg==
X-Forwarded-Encrypted: i=1; AJvYcCVKM2NCVvGc9/ZboN9LrbGLB3WHq116KOBqyJDEyMruj/xtCogiR42bTiiXoMLmcE2dqWdVDWDlJMNdftABN+HE@lists.infradead.org, AJvYcCX/xy1PFN76nd98RWFnY8+ZjEggzar7zzTRFfxxk6H3WV8RX/wl7mOszfqLC4p0Z7ykZ1ViHY9xI87KDE/4/wU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6qhlU4XQkWTbwQF6o3QG3I/42W+D5MCgXP3/No3//yTTYKs2q
	Ml3YFXAKFWn0dqnOpkE5o324ey+pwtkxS5iKOVWiEaFo0Lvt4nf6DaoormFxKI6aUEK2Gw5sOtr
	bJwnKqAcAy4CJ0+0jNKwVKmK0FX2zcTNfQaRHcJc=
X-Gm-Gg: ASbGnculVkOAiW9Glwv9Zoa4ynsB1hGTt1jdmWv2LY+e2SVd4hqL4eRb6oVy3eMVWsF
	J9TQXndJolLWwI9vqDom/roIvuBnFb8n05hEbBGBbfjLrKM70GmLeUMxbyfxdtjaPXuFzUwKEcB
	K0kZg/Qzil260ZnTC/WROrfikICFae41ZQy5j+7sNG4cTMvnhmdn7hVe05
X-Google-Smtp-Source: AGHT+IGdu+lUB6aYqtWH4AiO6Py1SgyDO+jxiLBNa4PCqXrusbUeunWL1E2NWxsWS+1ctn1q5K5//624lv0vLW+ua3Q=
X-Received: by 2002:a05:690c:f8e:b0:70c:c013:f2f with SMTP id
 00721157ae682-7179e44d3e9mr7404627b3.35.1751910128762; Mon, 07 Jul 2025
 10:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250706214111.45687-1-rosenp@gmail.com> <8c6f18ca47bf0dd78b6675d8b94000679b6c75cd.camel@sipsolutions.net>
In-Reply-To: <8c6f18ca47bf0dd78b6675d8b94000679b6c75cd.camel@sipsolutions.net>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 7 Jul 2025 10:41:58 -0700
X-Gm-Features: Ac12FXwpmQW7d4a2Au2Yz5auZhjQPGBnlW83MkM8UJ0V9bkuM1yY9_y20XPBBjc
Message-ID: <CAKxU2N9vs5o4tj-9KxCHKevWU+J9wv+ZCOeD8o602y1GY8FzNw@mail.gmail.com>
Subject: Re: [PATCH 0/6] wifi: rt2x00: add OF bindings + cleanup
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, yangshiji66@qq.com, ansuelsmth@gmail.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_104209_848873_12646701 
X-CRM114-Status: GOOD (  12.32  )
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

On Mon, Jul 7, 2025 at 2:01=E2=80=AFAM Johannes Berg <johannes@sipsolutions=
.net> wrote:
>
> On Sun, 2025-07-06 at 14:41 -0700, Rosen Penev wrote:
> > It doesn't even compile. Added OF bindings, documentation, and other
> > stuff to hopefully this doesn't happen again.
> >
> > Rosen Penev (6):
> >   wifi: rt2x00: fix compilation
> >
>
> That was half covered by Felix already, and really shouldn't do two
> things at the same time anyway.
Just saw what you're talking about. That's gonna be annoying though.
The COMPILE_TEST commit will cause compilation to fail and the bot to
complain before Felix' patch gets merged.
>
> Also please add [PATCH wireless] or [PATCH wireless-next] prefix when
> you submit patches, to make it clear where the series is targeted. In
> this case, you probably should've split it up, but Felix already covered
> the immediate bug.
Will do.
>
> johannes

