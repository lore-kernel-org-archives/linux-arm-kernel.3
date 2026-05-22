Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6116CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=; b=MRr/b2s0mbimMmbutKipqkseld
	mc8va7cR6DY5YmXoh2ArtjO4pY0MnRHaIQxBthBAhwA/e/i3QlZuSMy8ypvqV4BoYkz/bVpanF92B
	wQdTPm4i5YnU/2BIUt7Sl/GkvYtqcsSwRfOosUax0XiYP9p+fbUcAvkd+hZ0zux2MeBaWP+7b8r/H
	n53ENFHGXjYwG6+j4b5h5RQirsChGHovIav9/yIX9PMpsG3BvCwtT12XOghGH4nHetLuDP7Bk7GdU
	GPdmM67JXfNPPs9fxT/oBylDYa30pek4+hB9iVyOBJVBaK7GzURMUlvNh7+EuySGLLf5b9O5tobke
	/iwxqrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPpa-0000000AxUA-0q3F;
	Fri, 22 May 2026 13:22:26 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPpK-0000000AxPE-05dD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:22:11 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bce57c132b2so1470399666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456128; x=1780060928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=r3uFHxAx24WhBAlUOkNBhXAkgZA5oqumjIPFj+K8MVQDfdy/NLoWGk1ruZZutcU+0K
         dHCuOY2wzA6IBXbTage0OeVaO4ylpfPchPP4MjMLOsrbMhjjwingrBw44t/+pfW+mxAd
         t68dv1ZujFDJTVFNFifsIICMifLw6KxlvkjQL4yXN86jPtoGZTzYSydstpMBksDZvFfK
         fkWX4WuLcCIgiggh6uhGisvyL0teW+66BEaG/JWItGjr97176FLa+zqqzAVvXHOvSOvL
         NeYI11syEmkN1GijwbbHCgDW7BTghVLdW+TglxKz4Fbl9stl7PcWdBOnefCxSutVK3DZ
         O7dQ==
X-Gm-Message-State: AOJu0YwLdD/VGTT0W6iygygWx+C47ZvOAq7ZvDhSno9pd9Mz7QqSwwba
	VFX2r6HXuTdEtEVOBaScn4Bq6iQZFjcxWwZVUGJjl3dBEmxcipYpskrcAX02W8bq488=
X-Gm-Gg: Acq92OEmSdmMhkTGSyb0yhLHOJNzRvCwtdt/96zbQKkFICTP1Pc1uv/UMD/O8QLOWcY
	lye3sx36gSggmnHvLajYkM2uhpk5/XT1kvcMJyfFOD8JdMpGMKP6EKyI6zQhDgZwXE45BILk4yO
	+XRSQX7cLRPVRC5oz3Ei0AuzlVEMbTJQ2AhIaQdOpPOdIP7lPni+pG07G0I0/J1jXtNnJW8bn6V
	eqff8VHb2LQ2//EdpaiVm47W4IaoS9FF4UZ5LojgB1StSLnfPVssUbAutij0qMB7qhNtDgXsSh5
	PPEyVC86gt2sQqtgeN0Osr1oKup529MBi1hXL6yUq3qHTY22+Qyw6Ip6X2ikScTaPB7yl/MGF9o
	P2T2431MLUA4E4h48eVwSJWL3uKLWlHGnDhQblj/FHfmK/Aky/0vs825uQuyJPbw7ZeB8XQVFMG
	yWfqusO7mo5J5MqU+q4TgKGaOVOVtlpZdWNjhdLPwn0PCKr0vnIoJ4YF5GEi6+JtJMP+AspW8=
X-Received: by 2002:a17:906:9fc1:b0:bd4:aafb:def8 with SMTP id a640c23a62f3a-bdd4aa86a50mr196138166b.21.1779456127949;
        Fri, 22 May 2026 06:22:07 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d6369sm53983566b.45.2026.05.22.06.22.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:22:06 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso2772280a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:22:06 -0700 (PDT)
X-Received: by 2002:a05:6402:510e:b0:682:c363:d96f with SMTP id
 4fb4d7f45d1cf-6889c44e129mr1665620a12.10.1779456126723; Fri, 22 May 2026
 06:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:21:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQMHxkEU4DTN76CgBX1Y2Q-fpGqa5M2s8rTuw_QNx1+Q@mail.gmail.com>
X-Gm-Features: AVHnY4JaUyiF83u7ZZ_15Eo8SUYauLgYscK3wdborUbq63bx7aDzqid-QKvlQG4
Message-ID: <CAMuHMdUQMHxkEU4DTN76CgBX1Y2Q-fpGqa5M2s8rTuw_QNx1+Q@mail.gmail.com>
Subject: Re: [PATCH 05/11] arm64: dts: renesas: condor-common: Specify
 ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062210_078880_72B509D0 
X-CRM114-Status: GOOD (  19.73  )
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

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

