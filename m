Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB25606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 05:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J83ewYbr;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JlsCa+ic
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jVHkdup9h6VAyVXa9WHVnyDXMjAy2tnvxXwmB5v5HJk=; b=J83ewYbrY8oOwY
	op/O8s59YUK7eSP9rCDUdH8/ZxMSWMwLLvymAYiF9LQdebxrcCj3DPAoy5WKWKadfCoeZ+rQoI6FG
	nrQcFur0fYQkVGa1jlpXT8fNq2qi2HBpALkmAsAE+ANKy7sXSt53GKm8WkZZWEvewcEb/Xo+d9LoB
	Rfz9A6497cjT39bf6awg4XnNIZwweBs0kkR+P8X6KKolK7mQjRrNU+arCtQ/xGy4dfZfWG37QhC2p
	dz1L7qGzWbfbJ2Xiv3iMluhNYbGFV4gHWSe9vhlg1thyQ+G2RXAhnLgx3rnNMyLY34KH22DC2msEF
	h0BDKL+/8C28vueBOkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMejj-0000000Aq3v-02TD;
	Fri, 30 Oct 2026 05:01:07 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMejg-0000000Aq32-2n9m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 05:01:06 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-55e0090c580so80336b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 22:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793336463; cv=none;
        d=google.com; s=arc-20260327;
        b=SrtUrv6aEj6IIfenY26V46wmZbdDbS7ILH9CDDklehl6eIA/Hd5/OfCSqPivq73Ufp
         ovLo1nCbzxAQ2m7HK9uowuz6r5gcfjROy/+hb3vaFeYea9t1o8zF4pIfwB0T08dpKiGB
         yQPRKZ77mWiVQp4WiW+eZAOxXsHoRv+vw8LGc092jmtOqD3s/f7up73EgY0P9USJQgaT
         +gO7y997z9hnNUYYPO9Pk7s0/wo0rDQLBhMIopJdqCEvOymK4cbvcE/Od8z2TQt45E0I
         UVT8ov1ZNxWDtu8r0MpMzNqO+qTiw/kHiDHGiof1L52T6yTPwfmOTA1FsbevXNBspq+5
         N2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jVHkdup9h6VAyVXa9WHVnyDXMjAy2tnvxXwmB5v5HJk=;
        fh=s4RNHltAyuNRLsK9NN9MrPK0g8Es66wr+nYIgxB7r3I=;
        b=oClLiGlI9wcehCZ8G118vgWqSyzSdn38YsRuTBX2R//6etdpLqXaA0Aoza3N0C6FSz
         ACtG52lBDcdDzaQchiAwlFmU1Aw0ZJMpb2PI6iNZOltyHgI9TPEWXzSUS39E6ne74Jlg
         Sg4R8e3WFD5du2tkR2TR2DA0iVPu6U1gfwnNFqLBHoRO7wFV3u+MTmuOpKXTdja5nXm2
         HjrdvVjj7EahSn2B6G6PSRM+IBsq8siojXt4yL4PmNkewiS2J7gGEAfLSj+WMyJ4f1zD
         iDx/rSVTX3N7cqsD6CLh/f99XIrWSym/wsj93gETCyd3l4Pa3G3683+ZLAsTLqHaBLv1
         OBJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793336463; x=1793941263; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jVHkdup9h6VAyVXa9WHVnyDXMjAy2tnvxXwmB5v5HJk=;
        b=JlsCa+ic4F4uxmDww8omLjar8vMLV9JTCA3LGu3dgJ5J8g5kWLsYMamBs3TbatQRIi
         Fhjbx/Za7EfRA8y73kJydl9ofFmQ7KvM8sOibWOWq8quFbRXG9a1YTy9cz9eij/qlw2Y
         +5gtRj3m1yWALPcL5oWIWdlGi8HETwEQdDkTVMOi2trQEcXKdjAg2HJ+HTcfN8dyfuTL
         BkDdBNkn0AK0048+7tZJgGQLQb4o4Un14UnMjPu/9Ut1MiIQEF2aRnGL5kRUkMoF99QT
         B7EoeghtAY4wj1EP8iutDVRuK0uUhpOP8PPLffCWparcwWqJY0Gl5ZVwjsF6R5OL7fn6
         xDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336463; x=1793941263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVHkdup9h6VAyVXa9WHVnyDXMjAy2tnvxXwmB5v5HJk=;
        b=EYEBPs3PCrE84ZEFFytjwRxZU7PcH2wfUV1ms2+sHiRNp823Ic3krt9WYPa0r0A1zD
         RbSegiP00dOppa6Wuukc7bhMBZ4ZIu7FPCAwkit7GjfhNPFgaPOF1Y5tBmGZ2YWv8S6j
         7XEt25S3yC4mNxB7W5+F/XiAJthM1tgnmmcWh8OxIE4gqCaVVa/HhBDa+L879t+jw3sO
         XygnA7i+h+Sk3OPumG41LJQ+pX1IntzvFLywdyQQTwzEs3YdusB5E1CHHJfWYJBYNZt9
         5x6r1yc1mSB1VXE5o+QxQyoyd1K1OZ4QJeTuuI8f53NYBki0ZKjR+KZ+76uRQESQpkKC
         D4Qg==
X-Forwarded-Encrypted: i=1; AKwUvBz6zMawvwEHDwCfJB7FUYW+88H+iyAOZWwvr0NU9Eik7e0MoZzhY9li5ioADdqdWzo1oYlBu0dypEsSxlAHBrRi@lists.infradead.org
X-Gm-Message-State: AFq9FYKq9JEw2N+SuKPEmCcRMp/gbyqrU4b+RwjAcWCaMhzHxfhmjTs7
	9lus2xKx/cVlyaOhNtaMq/LiLJcqy6uEVzmrV9CCSOk5AIb72HFlqZeIdw3d8UqJlHOu+mI1jgc
	AxjKXKgEO2JhcTORvccBPsP5b8W+vluA=
X-Gm-Gg: AYBFou27K+bGx7UsoFXG/GACIT5vP9Dh2HO8Sd+vZkL8QRBddsIO592APPvj85epHRT
	S4pE7ZS7Pfl7j0YJfDgr7fyUXA85nctYncXYXC/VoUMp0ymAZlEhNIduyjc7VPcyBoWXpCMzuC5
	8Kz+GvrgIm/iN3PoDWm/SviNdYG7RnLCgLmo9rXOLGu/T38z6/O4KKfe9TZU1D5VnWBTf3YWhbg
	itOqsar45XRF+ziCUAPEU2F7OTfiVo++KkuIJKwOXqHdJ6Z5R0t/QHwp0qvfIP6pAQVXHAMA1db
	Dn9vLNqOD34/wx6GxHdrdz3vlGBshnFFOppKAiCTXAk0wDsqH0S7wKRNNU7ffV0STaFpn6ldXTq
	ynmKtFxlmpIcAoWNZIurY6XnSnAkHnW9ElWVM1a+gsx3j9x4hQQbm4CtcNpe7XjhE7TMSrg==
X-Received: by 2002:a05:6808:c122:b0:55e:fa63:7001 with SMTP id
 5614622812f47-5640ddca9edmr954504b6e.36.1793336462734; Thu, 29 Oct 2026
 22:01:02 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260901234351.190506-1-anarsoul@gmail.com> <CAKTNdwFqSBt4QVCuYJxTyEDsxkW96JbUirFNAgJYWVLHzGpk4A@mail.gmail.com>
 <CA+E=qVcizyQZytw8M6DA72YGrRDDNx_cCvYj565zf9wjMWh8tg@mail.gmail.com>
 <CAKTNdwFQvKtHQA0JD-GAq3bgr5Brq2NyLfccenkHcrKcjeptwg@mail.gmail.com>
 <CA+E=qVcwtnU_Gg6_oFmWqMpCEF8vOvB_G+H-ihfbiAr0PpFUJw@mail.gmail.com> <CAKTNdwGTacFvn5BEN+iu0OBG2BUas7Vfj=YYF8OhAhNq-9kmyg@mail.gmail.com>
In-Reply-To: <CAKTNdwGTacFvn5BEN+iu0OBG2BUas7Vfj=YYF8OhAhNq-9kmyg@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 29 Oct 2026 22:00:36 -0700
X-Gm-Features: AclHuK91Kq4AK7MRfCEoN-bxDWWEQLSESXtbozHlwJea6SWMh0uWvQ7bm47NBQ0
Message-ID: <CA+E=qVf=oBf9a=nrN-F2gGGY60+Gfuj3NMvuW4pWAdbU6NKceA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
To: Alexey Charkov <alchark@flipper.net>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_220104_715934_18633205 
X-CRM114-Status: GOOD (  34.88  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Sep 5, 2026 at 11:31=E2=80=AFPM Alexey Charkov <alchark@flipper.net=
> wrote:
> > > I believe something is hardcoding the divisor (or leaving it at the
> > > power-on default) in the actual DCLK of a VOP which the HDMI
> > > controller uses, instead of modelling it properly as a mux (frac/div)
> > > feeding off VPLL via another mux - both perfectly representable in th=
e
> > > clock framework and already envisaged in the clock driver, making the
> > > PLL table patching unnecessary.
> > >
> > > Can you please try re-pointing the "ref" clock at DCLK_VOP0 (or 1,
> > > depending on which one your HDMI controller uses)? Your clock summary
> > > already shows that something is assigning its parent to DCLK_VOPx_DIV
> > > and the latter's parent to PLL_VPLL, so rate changes the current
> > > driver code does on VPLL propagate to the muxed and divided downstrea=
m
> > > consumer as a side-effect rather than as an actual rate request.
> >
> > I don't think it is a reasonable ask. Wrong clock for the HDMI encoder
> > would just result in non-working HDMI output and no feasible way for
> > me to debug what is wrong.
>
> Hope you have a serial console or ssh connection to the board. If it
> doesn't work you'll know soon enough.
>
> What I'm pointing out is that the clock setup implied by the current
> dtsi doesn't make much sense: VOP's dclk is driven off VPLL via a mux
> and divisor. If the encoder's pixel clock is truly driven directly off
> VPLL then Rockchip designed the muxes and dividers for nothing, as
> they will always be no-ops. This doesn't square, so something must be
> wrong, and I believe it's the dtsi.
>
> I'll be happy to be proven wrong here.

Hey Alexey,

Sorry for the long delay - NVMe in my laptop died and I had to wait
for a warranty replacement to arrive. I would have bought a new one if
the price wasn't ridiculous :)

The dtsi describes the hardware correctly. The HDMI PHY's reference
clock input (TRM Part 1, 1.1.11: "13.5-600MHz input reference clock")
is wired to VPLL with no mux or divider in between; it is not one of
the CRU clocks in the TRM's clock tree at all.

That's exactly what the commit that introduced the "vpll" clock says,
from Rockchip's own engineers, see 5e3bc6d1ab48 ("drm/rockchip:
dw_hdmi: introduce the VPLL clock setting")

This bug report itself is a solid proof of this wiring. With VPLL left
at 74.25 MHz and the VOP on GPLL/7 =3D 84.857 MHz, the monitor reported
the mode as 1195x768. 74.25/84.857 =3D 0.875, and 1366 * 0.875 =3D 1195.
The TMDS clock came from VPLL while the sync timing came from the VOP.
If the PHY were clocked from the dclk mux output, that mismatch could
not exist.

The mux and dividers are not for nothing: there is one VPLL and two
VOPs, and each VOP can also drive eDP, MIPI DSI and DP, whose PHYs
have their own PLLs. When VOPB drives HDMI from VPLL/1, VOPL has to
run from CPLL or GPLL through the divider, and the fractional divider
exists for DSI panels with odd pixel clocks. For HDMI the divider is
legitimately 1.

This is also why the PLL table patch is needed under any scheme: the
RK3399 PLL driver is table-only (rockchip_pll_determine_rate() snaps
to the nearest lower table entry), and the PHY reference has to be
85.5 MHz exactly because nothing between VPLL and the PHY can divide
it.

And the VOP patch doesn't hardcode a divisor. The VOP still makes a
real clk_set_rate() on its dclk at enable time. The bug was ordering:
mode_fixup() rounded the pixel clock through the dclk while VPLL was
still at its old rate, so the composite chose GPLL/7 and the encoder
then asked VPLL for 84.857 MHz, which the table snapped to 74.25 MHz.
With VPLL programmed first, the composite picks VPLL with divider 1
because it is the exact match.

Regards,
Vasily

