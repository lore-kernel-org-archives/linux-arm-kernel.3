Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFB0C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4dyKB/emFRDPrDqz9X2vH5TTb96Md3MW8gLHSI8vTI=; b=xSsPshnX0mlNqY1KVww7PqHKl6
	aYAYG3FOSJiNRIHvdfku4zI4mVnqT13pACzGWkpSBRuckRyOOjoP0IVaHFtR1vaBNBf9SUbQF7WSx
	K4fKy95p8gxzCalC2lSrv7Ya6vVDisUHGiulVW8x8IFWNtfMxvSdZf36n1BQg3S6SHSMBrh+0zrc/
	dOa5XmWkcZaxCA9WEcEPqf0QGoG2u0gRtUrjwlosvakNvJ7HklSAnMwxUFHHtqgWwjAagOlauZYtR
	fFuBoXszSI2A7YvAFvOMxKTTrcrAQiiCSotptvbhRPRAbSPFbRP6rGg1SUEVWqDrcI4MJIuRp4l2t
	uSzI4odg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DC0-0000000B2w1-00UO;
	Wed, 09 Sep 2026 07:58:04 +0000
Received: from mail-ej2-f12.google.com ([74.125.228.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DBy-0000000B2vV-0yHI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:58:03 +0000
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f8694a7so159339566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 00:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940680; x=1789545480;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u4dyKB/emFRDPrDqz9X2vH5TTb96Md3MW8gLHSI8vTI=;
        b=Zkov/+ZqXzaAUYCFWDGa6M8xEqY6HlpzKD8d4dgRjoEUxvr2eGgboC08i8JsGFJdoI
         xLgmzXAXFLOqpz89MewED1Jc40u4gbOIenqTVIXYYt9tjSrHfTKEERBDCZRngf8sBJc9
         w67yfCY8j1+1L7Bkl3P4jlcm4KpzGRgGHDc6+m6zZ+NQsk64I/Fk8LhTcMjKZiJIR8vN
         uDePiDb9us7/U5hcViekcXbejrvlC33KFKIsXKVqJxhUq2DonbYxCA5EIEv3X6/TiQEf
         QLXFtN+Vzc5vUoGI5P6+Lom3n0BdbIsJAW+rgKCzjBPxFa/zat9aLTk5AzQmSbazmBUP
         yIig==
X-Forwarded-Encrypted: i=1; AKwUvBx+KWajUKi8+qXy9m4txKGXSxaosk7Hw+3uyvNpqMfCXxDHPypNyDPX5X/PoHJ3J3Fr9r0KNkwqPlg7YEn15eaX@lists.infradead.org
X-Gm-Message-State: AFuF++mb8MX3nNOyEM2k1/YbrLnLDDLbYWLP34JRXotRJgiEApgW6tJ9
	NgC+Of8yzxx8ionBPxFmN4wqxSFZwSQjW7Doi26XvqkR8bIjf3uWtoswa0C3ng5S4Rs=
X-Gm-Gg: AYBFou2Gsb7zO3uvyxAx4FXxD5Qx/qEce6K6xbcMiB1bLqIRRv5S0FSGBbFyYWxfFAK
	HYADTgka6TdoC4qo7Dpn4kKxhtFirN5mVfQrbvPa4MmdlTVomVD5QlnN+9OeHcUFOdoaxjos9cs
	QK1364xFuiyFoPB/r3OGsemrjNq2NFbOiXwgLuB8MtOBYfDELx29V8LchQDMPWdh3/7saOpSHTG
	E4nffW84U6a+wRLGQbZDYVa61TgJ+XHijN5zD1aQ2x4nSyMn2jcCi8l5eWNMXYCeEUOo9yHVI18
	L5+9J6yjXgYpzhgmkSX3qqOUx4ALZxV6VhIHw1D/AJdPbDuHt+KYuMXzUxR5lqZWP3J++Qncr5d
	Z03jq5VUMdAVHCXhEjEZRGheW7+BvH6J2vUyDKC5BvhRqEyhn/RjqNjuGmgP9P62FfmQKEnvOAS
	Ucv5VvKooT+XxzginRqBaSi5puInzemIS5hPbxYeh/QKuP8I+qA1FMssdXTKn20BQer5wVVYZys
	WnL27QL++SCt0trj5dwBqaVI0CRSrlIjQ63
X-Received: by 2002:a17:907:3d0d:b0:c25:f7db:4bf0 with SMTP id a640c23a62f3a-c29045c4fbfmr532372766b.22.1788940680111;
        Wed, 09 Sep 2026 00:58:00 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5375d9sm715093666b.30.2026.09.09.00.57.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:57:58 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a985799954so1460662a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 00:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwI3jSgcb/N+ePwDNGcAM093DfK7eGV6c5p7EjzrdzLVC/BJRyQshJ7xje3NIfjP9vSG2d8Jpnq2RBFPiuNsrKr@lists.infradead.org
X-Received: by 2002:a05:6402:3247:10b0:6a6:b2b9:7662 with SMTP id
 4fb4d7f45d1cf-6a6b2b976demr10117247a12.15.1788940675713; Wed, 09 Sep 2026
 00:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com> <b1a64102-9c86-4cbc-aa07-11ad051b0dc2@mailbox.org>
In-Reply-To: <b1a64102-9c86-4cbc-aa07-11ad051b0dc2@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:57:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJso7-432-pgJ7SJr_QC_krOgLE6U1dhP6c5=r_TL_og@mail.gmail.com>
X-Gm-Features: AcwNN1Ua9Vke213V9Nb0AugUOA6EaQLwJxCjzIaW2N2cORqAOZX-qMn7euhb-OU
Message-ID: <CAMuHMdWJso7-432-pgJ7SJr_QC_krOgLE6U1dhP6c5=r_TL_og@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update
 PCIe node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_005802_286575_82E538BC 
X-CRM114-Status: GOOD (  30.53  )
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

Hi Marek,

On Tue, 8 Sept 2026 at 18:27, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/8/26 10:46 AM, Geert Uytterhoeven wrote:
> > As I am not PCIe DT expert, I am comparing this to the corresponding
> > patch for R-Car V4H, which I have already queued as commit
> > 7fe73a3a3f2c3718 ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
> > update PCIe nodes") in renesas-devel, but which probably needs some
> > updates.
>
> I sent a fix for that one:
>
> [PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS

Thanks!

> >> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> >> @@ -691,6 +691,8 @@ pciec0: pcie@e65d0000 {
> >>                          resets = <&cpg 624>, <&cpg 1121>;
> >>                          reset-names = "pwr", "core";
> >>                          max-link-speed = <4>;
> >> +                       msi-parent = <&its 0>;
> >
> > This has an extra cell "0", which is probably correct, given
> > "#msi-cells = <1>" below.
> >
> >> +                       msi-map = <0x0 &its 0x0 0x10000>;
> >
> > This is not present on R-Car V4H (which is probably wrong).
> >
> > Interestingly, Documentation/devicetree/bindings/pci/pci-ep.yaml
> > documents msi-map for endpoint node, so should it be added to the
> > pcie-ep node, too?
>
> I do not think we should be adding it until we can test ITS with EP ?
> This patch adds the ITS only to the RC side, where I can test it.

OK
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

