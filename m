Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B8AC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyM97ZqplBFeYxTzqGSXBQxiPc6c/u7cZVlPywBv4fY=; b=qycBBNuA67jYnQ7FpahN6P+T9Z
	zzUwGBr2krDInY2VxJmhuL2Tahz7eLR8HDk85L36umJxlsnp2/PZ9/nIP8ahSxyU2viH1ynz8QNhI
	6CRse+6tLcy+YNdlDjRGJnQfx2tKZi9Ll/dL02teMLHSf+m2eZjUmxaWnPmpd15aGKhqBJz7MmVoA
	8/qTSt14eqY56CpkoRVo4LvkHqqMsywA8rys2HGszPkTTYxExOCFDH5dEyLEGGJvtFUsDXp3LtEry
	exgnG/QrJAr1xTDJWB2bsj0jtxhF3KoXzFpYmfxSFIvuEAIJKrR7aZy6GXpoD83Z1Ftmt8jPoaOVH
	HzkZNwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMUQV-0000000BOA9-0IzX;
	Tue, 03 Jun 2025 16:23:47 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMUOI-0000000BNqd-47hR;
	Tue, 03 Jun 2025 16:21:32 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2301ac32320so54608845ad.1;
        Tue, 03 Jun 2025 09:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748967690; x=1749572490; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TyM97ZqplBFeYxTzqGSXBQxiPc6c/u7cZVlPywBv4fY=;
        b=O411IwHnsychzBmHj8LCTiySHSZ3ZNCHFTZJa4/3TI95Hw+O6BpQFn6ES4oiT0+cmt
         zDW1SGqWcWp0xL1VSrFQczizaV26ldq+sriCOo9T/caAZq9F0ipU5xfZnc9PzkcHrJaW
         ImCFVt3e5ii68jNXnCcQlo3AEAuwN/Z/Cp8TL6BFdFtDSozPVg4Iv7iv4HCnbuQCInXV
         xR7alwY8ZBJO528A7KELaIH+YaCpW9giPeyFlBR/p5tnmvxiBmOh4yZ4SgvQUBFF475d
         /k69qlfVvt//4EaeYninhGdG+VaL7Udce9dRE3y7RrcfbON2JrDQUKpyIfJ/gpFnLfNs
         E6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748967690; x=1749572490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyM97ZqplBFeYxTzqGSXBQxiPc6c/u7cZVlPywBv4fY=;
        b=tfWFzvRpMN/+Ag/M12ULjljOMiZ9Rdzui1fIvUCUxV3vVXlFwoa/uav7V/0XBvlVrs
         aMHm5s7A8yhRHN6kUjZLsakxuSf+3+I8AkGa1PNP9NqRwURiZwqaPJmQsYf5nh86Qhzk
         X9qYEu/8Cg6UmvIVONI8uF1LXqTatXlrOp604afiml33xOu6nP1HiZ155NdzyCcA9sxg
         41Zgz1DEMG16PAdeK3KQvelxGgVi6lCp3+gOhJMQFNeOFDXY6ZPHiT5yrP7GFmR9xYDS
         0pjdh5EAyNAC08vRVEhUUA9NF0cOM0QWXd2npG8xMEx6aksMfNUxpe722yc/IZ261vXX
         UUKA==
X-Forwarded-Encrypted: i=1; AJvYcCUnPg3QSsQUEACZ5lRnvjOaZhTxC6wn86yadXRI9hBOAyC9TFv28mQfkLfsbonl8mqreVzKVYDyLxbbmODwZI8=@lists.infradead.org, AJvYcCXh2GzWcE4DjhHkq2VipshqWfg0nMWJDUlC6lw8JQV+SxpkgrlZZQUGmYA8k8rnz21NmWTUKQBgE0xJ+vioyfqr@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi5dw6M+3Je32qtIvBnAyJtuOHpOlKP2rk9NmSR/5IDYgZGStz
	U1SGx2Y1Uq+l2HaKCAoJMm64SOlsikXkZClKvw3oxccxh1HNpVejSK4p
X-Gm-Gg: ASbGncshkE+lUPGOvHCNEdTnt6K0TZ4WFOaeifQkN5R3t7aAePdHdppCkU716FRZsAS
	vT9ZgUN2EM4HN1jQdILPxSB22mE6Mw/F6VerImjhBw9jTW+ny6DUuATaofC8lcPOwzlR11XZhx2
	64VfgmEp9wqHTsY2GBzQWfr9tvKhA6SqmabBJ/ihG4BI39Gf73C8e9XvIDY+ZkEXyJhkv174Dcl
	ACBNr0qpFuMlyvR/YKeBtoxy2vsNWFF0kJgN6YPzJTPW04LQLLfm8o+65Sk2Oi+CU3FXhozvpSy
	49K1eMQ7P9J/5ms+llFIFS9wQYhstYNp3mTGHsSedbahY0gH65M=
X-Google-Smtp-Source: AGHT+IHL/yQEZQ8M/N4GhQRHikLMeXiY0d5QIcz0Hymi30PtwkzByDtwLbrV2LTGw1hKZHdR4DW3Cg==
X-Received: by 2002:a17:902:ec84:b0:234:9fed:ccb7 with SMTP id d9443c01a7336-23529904f37mr258003925ad.33.1748967689830;
        Tue, 03 Jun 2025 09:21:29 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3513sm90018585ad.108.2025.06.03.09.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 09:21:29 -0700 (PDT)
Date: Tue, 3 Jun 2025 12:21:27 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
	kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH v2 3/7] bitfield: introduce HI16_WE bitfield prep macros
Message-ID: <aD8hB-qJ4Qm6IFuS@yury>
References: <20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com>
 <20250602-rk3576-pwm-v2-3-a6434b0ce60c@collabora.com>
 <aD4DSz3vs41yMQSv@yury>
 <2525788.jE0xQCEvom@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2525788.jE0xQCEvom@workhorse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_092131_024693_17FF2A82 
X-CRM114-Status: GOOD (  49.17  )
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

On Tue, Jun 03, 2025 at 02:55:40PM +0200, Nicolas Frattaroli wrote:
> On Monday, 2 June 2025 22:02:19 Central European Summer Time Yury Norov wrote:
> > On Mon, Jun 02, 2025 at 06:19:14PM +0200, Nicolas Frattaroli wrote:
> > > Hardware of various vendors, but very notably Rockchip, often uses
> > > 32-bit registers where the upper 16-bit half of the register is a
> > > write-enable mask for the lower half.
> > 
> > Can you list them all explicitly please? I grepped myself for the
> > 'HIGHWORD_UPDATE' and 'FIELD_PREP_HIGWORD', and found just 4 or 5 in
> > addition to the rockchip.
> 
> Most of the ones Heiko brought up[1] just appear to be the clock stuff,
> I'm only aware of the drivers/mmc/host/sdhci-of-arasan.c one outside of
> Rockchip. For a complete listing I'd have to do a semantic search with
> e.g. Coccinelle, which I've never used before and would need to wrap
> my head around first. grep is a bad fit for catching them all as some
> macros are split across lines, or reverse the operators of the OR.
> Weggli[2] is another possibility but it's abandoned and undocumented, and
> I've ran into its limitations before fairly quickly.

Going Coccinelle way is fine, but I think it's an endless route. :)

What I meant is: you caught this HIWORD_UPDATE() duplication, and it's
great. When people copy-paste a macro implementation and even a name,
their intention is clear: they need this functionality, but the core
headers lack it, so: I'll make another small copy in my small driver,
and nobody cares.

I think your consolidation should at first target the above users.

Those having different names or substantially different implementation,
may also be a target. But they are:
 1. Obviously a minority in terms of LOCs, and
 2. More likely have their reasons to have custom flavors of the same.

...

> > Can you please prepare a series that introduces the new macro and
> > wires all arch duplications to it?
> 
> Okay, I will do that after I learn Coccinelle. Though I suspect the reason
> why I'm the first person to address this is because it's much easier to
> hide duplicated macros away in drivers than go the long route of fixing up
> every single other user. I'm not too miffed about it though, it's cleanup
> of technical debt that's long overdue.
 
I just fired 

        $ git grep "define HIWORD"

and found 27 matches. The relevant 'hiwords' have the following
semantics:

 - HIWORD_UPDATE(val, mask, shift)
 - HIWORD_UPDATE(val, mask)
 - HIWORD_UPDATE(mask, val)
 - HIWORD_UPDATE(v, h, l)
 - HIWORD_UPDATE_BIT(val)
 - HIWORD_DISABLE_BIT(val)

Most of them don't bother doing any static checks at all.

If you will just consolidate the above, and wire those drivers
to generic version with all that checks - it would be a decent
consolidation by any measure.

Something like this:

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 0470d7c175f4..d5e74d555a3d 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -30,7 +30,7 @@

 #define DMC_MAX_CHANNELS       4

-#define HIWORD_UPDATE(val, mask)       ((val) | (mask) << 16)
+#define HIWORD_UPDATE(val, mask)       HWORD_UPDATE(mask, val)

 /* DDRMON_CTRL */
 #define DDRMON_CTRL    0x04

...

> > Regarding the name... I can't invent a good one as well, so the best
> > thing I can suggest is not to invent something that can mislead. The
> > HWM_FIELD_PREP() is not bad because it tells almost nothing and
> > encourages one to refer to the documentation. If you want something
> > self-explaining, maybe MASK_HI_FIELD_LO_PREP_U16(), or something?
> 
> This seems a bit unwieldy, at 25 characters. "FIELD32_HIMASK_LOPREP"
> (or FIELD16, depending on which end of the cornet to eat) would be 21
> characters but I'm also not in love with it.
> 
> I think the name should include the following parts:
> 1. it's a field
> 2. the field is halved into two halves of 16 bits
> 3. the mask is copied into the upper 16 bits

Or just keep the HIWORD_UPDATE name as it already has over 300 users.
If it's commented well, and has an implementation based on FIELD_PREP,
I don't think users will struggle to understand what is actually
happening there.
 
> Since we're on the subject of bit widths, I have a somewhat sacrilegious
> point to raise: should this be a function-like macro at all, as opposed
> to a static __pure inline function? It's not generic with regards to the
> data types, as we're always assuming a u16 value and mask input and a
> u32 output. The __pure inline definition should let the compiler treat it
> essentially similar to what the pre-processor expanded macro does, which
> is as not a function call at all but a bunch of code to constant fold away
> if possible. What we get in return is type checking and less awful syntax.
> Then we could call it something like `himask_field_prep_u32`, which is
> also 21 characters but the ambiguity of whether the u32 refers to the mask
> or the whole register width is cleared up by the types of the function
> arguments.
> 
> The const version of the macro may still need to remain though because I'm
> not sure C11 can do that for us. With C23 maybe there's a way with
> constexpr but I've never used it before.

Inline function will disable parameters compile checks, and will be
too diverged from _CONST counterpart.

Thanks,
Yury

