Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98EF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tUxxdKlC;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=6DhOsruf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q/eIx/IUOdi7y2UVsh8BBzkkFOgj24Cn4YadoL10m2E=; b=tUxxdKlCrT3gTz
	wzaI0AVz5JORRHZKjh4XUGuQftTfZ0AT0Awg0pGQM5KUqXCSk3PnP+09AUKZXzugApOdluMC/+lhm
	la1sW0oyEeUB/8SrxwS+pSGGyrxeESJu3+K16x94SkOR2mzHuzgLMcq5w0Pvfxw7Oxm13Ou/wyG1e
	8sU3QD9yqtfbB+ocpUnEqJyJ6fZq0w7C/QlCF2pSJY9YjSOcV2G2gomG4BkrlpwJ0YBWIyk4aE9Rm
	6ugMgyb8U9NMaZqXiMxPied/gLNlHD1Hr+RYyyLJRcuf0COcyPUlR0yXqzXLU/tTRWUKb+ncKWP6F
	AI/O4z9bbZf1n26Ma8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhX3-0000000B3qD-1oXZ;
	Fri, 30 Oct 2026 08:00:13 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhWz-0000000B3oG-18em
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:00:11 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c450ab1483cso59214566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 01:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793347204; cv=none;
        d=google.com; s=arc-20260327;
        b=LoquR6jD/c4uQBMMu6Bk/gP5o9ZseE6HGmW1YE9rqhsCRH8lh6vTd/4qGB6YZK7O5C
         uHmjar9KQi6IcJ77zCiFt5ab8y8wdfRdTT9vg8qyEHx2Sd/9H4aiIT5Byceht5YIYRLX
         7T9KhflC1gB/ZGi7/pmt8SR631udvB2SmbTUGyyrfQC4uL9hrSKK+OKFWLzqj6j5Zcx7
         VtYZt9GWD4BV6eioOrQ247N6sCGzPUqkYdc2uiujTjJ9Vk37H1w1XsyUU49gj6iz0ySw
         cUjr/dfBEty32NfT60l3vULbi2/24NK6gpHSiqUYEBw2z5AWDQRA/dUQDuBDFbSOYKsc
         GCEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/eIx/IUOdi7y2UVsh8BBzkkFOgj24Cn4YadoL10m2E=;
        fh=MkNhhIbU+P81XlVl3qEq+gnGidgS/AQ+wVr4pQIRAbE=;
        b=b9ya9YmHQzgI/I7nTuPryL/5PoRi29Az6pRQMDULrqgPbva4O66T81BPHUBiKGVb5k
         zQK6ZRA047CTNhYZwNsxeURQHGh3su+MYH0xb3y1/nHmzROHXIrqhtYzUDtPL0xoJ9u7
         x2psFV2XtMPRJZZzgh/4mia5CAqXO83V8rhO1XAX+duDe3K8YmJdwrvDosiu7ISvI36y
         jMLHPq+zSAwTma9poZwIqFv6rbRkwDFIBQYbqghYVOIVacELmQhNJFVWLXMXzFG7wHl4
         LjNIPpJV+i5kh1Hd+Lk8S90jzfhB9D2OcMQ27UjH/uX9CgaBSk0CP8SjWW8ZhOAXwFQv
         6kEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793347204; x=1793952004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q/eIx/IUOdi7y2UVsh8BBzkkFOgj24Cn4YadoL10m2E=;
        b=6DhOsrufn4rXZTZv7grvYezQd19jGIdyVrV/TRkLKM6pYcCPD4lOHnYc+JlMbWKTNR
         JnzlFZDrmT0XAi5EiGrLd9Y/gl34oMvOlnjnQQV9gffw+rVI9V9YYe/3yoxfc9k+1FgX
         xLN/seLZAreMIj2AbC5xiLUk2zI2wyw3PWsXJfzU4oHOPOmgDn/F1YsvHm9sCbr497s6
         O2yiuVHzyKlVGJprLWijhTOhMX3IVPrO2criyOGddt2IWmktbbForvZnqrsW2x5yb3II
         UBOoKLRhZvOqeFvfvmoXsHEgmLvunFE1npTFYRM1no4d9yaxVO5zkp6vczeg6sX7NUtZ
         Zl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347204; x=1793952004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/eIx/IUOdi7y2UVsh8BBzkkFOgj24Cn4YadoL10m2E=;
        b=1YcgMOmhEpOJR/wP5HnMykE4GkTiI8M0juSoGcWoyZgfCZMxjjINIHURFKHd8BQT+M
         zf2OtGftMW80oCfCWXcBELs0s75bt8G4hCxZcpZaZ0pMpiOg3KX+GDCw734AnzCVCmUe
         zUEzrKDGB0h9fxh9pORSVwRljtMwE0m957NA8bBVqtq2/ys7eWRGBe3S0r7E6/fI7m57
         zt62ubmEoghvTTUXt1yR5MbbOCgsXOojfYjM40E04q0kTytGP69TkPL0XgWY9h6bpU+N
         p6Q5I/fs0kSLvQklvdDxbCumdI+tt8RwXodNj2qBxlqQwPZ6GxrGaLj6nVhex0fFe/+y
         bODQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7kWonhmoBU5zJvWPSFWsEVGiFJbHAHBLgnqr+Dx/sjDY8TzEDQta7HeEPjCaMHzcrxD30lw4Gc1fcHai/qJDz@lists.infradead.org
X-Gm-Message-State: AFq9FYLbSuXkbVq7pi1pkfS+lvoF6Y1PKMoqnCR5w61iLIdqCkVps3Rx
	8eLLsQgfmLISQFXmMesh6fZuswzv/EYfAfPFxmq342zPONkn62aik238YbEX3pktrExe7oUjygP
	2Q4sEB2MKRAUGRPUERTUxEDMUIBgk/vekctEzK61gEA==
X-Gm-Gg: AYBFou1GbhvKLq/oMiYy/89g9o0Zod0iPOyCp2aTAYudm9JNJMZ+3PrUGkLd1Ng26nV
	MBP3cqRKxFsgoRuZPZFlR3FAchYNIv53y3DGARUJk2LZYpVd5G+E1obQb+45XhOJ+F0az8q87P0
	PYiHwbtsm2dBDphSlbZRyZc0MykJcaItqb+fQDqztQ7bPucDWypiUMTce6vOuqRkAVIaynO0by8
	TUMGK/IVrqnmVDKMqV33uIIurZG233kPbb0JLG00Kh+L9yxIki4oHKsQd7OoYEjwRJ6JQrh+KgJ
	bWAa+u6QpNS9Z4qgQNcFkj5Xal/jJpelfkaI/QBGLrdz8Rqn48T6j++uhuUcr5U/6c4OEl2vTNM
	SnldabG98l13uNCMBCnnGHimffQ1YZ3fF4F0/1GXTCgazKGKkXUAYosRFvW05Z14+KlRqqQ==
X-Received: by 2002:a17:907:c23:b0:c49:cfcf:8d7f with SMTP id
 a640c23a62f3a-c4ca7ae8ad6mr121607566b.46.1793347203897; Fri, 30 Oct 2026
 01:00:03 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260901234351.190506-1-anarsoul@gmail.com> <CAKTNdwFqSBt4QVCuYJxTyEDsxkW96JbUirFNAgJYWVLHzGpk4A@mail.gmail.com>
 <CA+E=qVcizyQZytw8M6DA72YGrRDDNx_cCvYj565zf9wjMWh8tg@mail.gmail.com>
 <CAKTNdwFQvKtHQA0JD-GAq3bgr5Brq2NyLfccenkHcrKcjeptwg@mail.gmail.com>
 <CA+E=qVcwtnU_Gg6_oFmWqMpCEF8vOvB_G+H-ihfbiAr0PpFUJw@mail.gmail.com>
 <CAKTNdwGTacFvn5BEN+iu0OBG2BUas7Vfj=YYF8OhAhNq-9kmyg@mail.gmail.com> <CA+E=qVf=oBf9a=nrN-F2gGGY60+Gfuj3NMvuW4pWAdbU6NKceA@mail.gmail.com>
In-Reply-To: <CA+E=qVf=oBf9a=nrN-F2gGGY60+Gfuj3NMvuW4pWAdbU6NKceA@mail.gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 30 Oct 2026 11:59:55 +0400
X-Gm-Features: AclHuK80eGfXzrhDU1BJmzUNyq0YUUcHy3czLcESvjD2RbRa1URB1Gh73rfRLng
Message-ID: <CAKTNdwEiNjjX3DgBm5whH0HHvAfZQFgF4LhKf7PJ+1p7MJ=QJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
To: Vasily Khoruzhick <anarsoul@gmail.com>
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
X-CRM114-CacheID: sfid-20261030_010009_642977_0A64A2FD 
X-CRM114-Status: GOOD (  44.86  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vasily,

On Fri, Oct 30, 2026 at 9:01=E2=80=AFAM Vasily Khoruzhick <anarsoul@gmail.c=
om> wrote:
>
> On Sat, Sep 5, 2026 at 11:31=E2=80=AFPM Alexey Charkov <alchark@flipper.n=
et> wrote:
> > > > I believe something is hardcoding the divisor (or leaving it at the
> > > > power-on default) in the actual DCLK of a VOP which the HDMI
> > > > controller uses, instead of modelling it properly as a mux (frac/di=
v)
> > > > feeding off VPLL via another mux - both perfectly representable in =
the
> > > > clock framework and already envisaged in the clock driver, making t=
he
> > > > PLL table patching unnecessary.
> > > >
> > > > Can you please try re-pointing the "ref" clock at DCLK_VOP0 (or 1,
> > > > depending on which one your HDMI controller uses)? Your clock summa=
ry
> > > > already shows that something is assigning its parent to DCLK_VOPx_D=
IV
> > > > and the latter's parent to PLL_VPLL, so rate changes the current
> > > > driver code does on VPLL propagate to the muxed and divided downstr=
eam
> > > > consumer as a side-effect rather than as an actual rate request.
> > >
> > > I don't think it is a reasonable ask. Wrong clock for the HDMI encode=
r
> > > would just result in non-working HDMI output and no feasible way for
> > > me to debug what is wrong.
> >
> > Hope you have a serial console or ssh connection to the board. If it
> > doesn't work you'll know soon enough.
> >
> > What I'm pointing out is that the clock setup implied by the current
> > dtsi doesn't make much sense: VOP's dclk is driven off VPLL via a mux
> > and divisor. If the encoder's pixel clock is truly driven directly off
> > VPLL then Rockchip designed the muxes and dividers for nothing, as
> > they will always be no-ops. This doesn't square, so something must be
> > wrong, and I believe it's the dtsi.
> >
> > I'll be happy to be proven wrong here.
>
> Hey Alexey,
>
> Sorry for the long delay - NVMe in my laptop died and I had to wait
> for a warranty replacement to arrive. I would have bought a new one if
> the price wasn't ridiculous :)
>
> The dtsi describes the hardware correctly. The HDMI PHY's reference
> clock input (TRM Part 1, 1.1.11: "13.5-600MHz input reference clock")
> is wired to VPLL with no mux or divider in between; it is not one of
> the CRU clocks in the TRM's clock tree at all.

The TRM unfortunately only says there is an input reference clock but
gives no detail on how it's wired.

> That's exactly what the commit that introduced the "vpll" clock says,
> from Rockchip's own engineers, see 5e3bc6d1ab48 ("drm/rockchip:
> dw_hdmi: introduce the VPLL clock setting")

That commit indeed mentions that there is no divider between the VPLL
and HDMI PHY. Looks like it's our only evidence, but I believe we
should trust the information in Mark Yao's commit message, given his
Rockchip sign-off line.

> This bug report itself is a solid proof of this wiring. With VPLL left
> at 74.25 MHz and the VOP on GPLL/7 =3D 84.857 MHz, the monitor reported
> the mode as 1195x768. 74.25/84.857 =3D 0.875, and 1366 * 0.875 =3D 1195.
> The TMDS clock came from VPLL while the sync timing came from the VOP.
> If the PHY were clocked from the dclk mux output, that mismatch could
> not exist.

Fair enough.

> The mux and dividers are not for nothing: there is one VPLL and two
> VOPs, and each VOP can also drive eDP, MIPI DSI and DP, whose PHYs
> have their own PLLs. When VOPB drives HDMI from VPLL/1, VOPL has to
> run from CPLL or GPLL through the divider, and the fractional divider
> exists for DSI panels with odd pixel clocks. For HDMI the divider is
> legitimately 1.
>
> This is also why the PLL table patch is needed under any scheme: the
> RK3399 PLL driver is table-only (rockchip_pll_determine_rate() snaps
> to the nearest lower table entry), and the PHY reference has to be
> 85.5 MHz exactly because nothing between VPLL and the PHY can divide
> it.
>
> And the VOP patch doesn't hardcode a divisor. The VOP still makes a
> real clk_set_rate() on its dclk at enable time. The bug was ordering:
> mode_fixup() rounded the pixel clock through the dclk while VPLL was
> still at its old rate, so the composite chose GPLL/7 and the encoder
> then asked VPLL for 84.857 MHz, which the table snapped to 74.25 MHz.
> With VPLL programmed first, the composite picks VPLL with divider 1
> because it is the exact match.

Ack. Thanks a lot for double-checking all of these - it's great to
have your explanations recorded on the mailing list for posterity!

Back to the patch itself. The new rate you're defining is consistent
with the existing entry for RK3036_PLL_RATE(1368000000, 1, 57, 1, 1,
1, 0), and the parameters are within spec (VCO rate of 1368000000
falls within the documented range of 800 MHz to 3.2 GHz). Feel free to
include my:

Reviewed-by: Alexey Charkov <alchark@flipper.net>

On the existing 1368000000 entry, I'm pretty sure it would produce
less jitter as RK3036_PLL_RATE(1368000000, 1, 114, 2, 1, 1, 0), by the
virtue of FVCO=3D2736MHz falling into the higher end of the allowed
band. This won't apply to your 85.5MHz rate though, because the
required divisors won't fit in two 3-bit registers.

Best regards,
Alexey

