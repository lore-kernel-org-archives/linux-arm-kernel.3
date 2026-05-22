Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BBBCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEDEgL2tLkOR4zWl+L+uuKuVbGErUH4r4hxSDSLZGiA=; b=pIg/CwzQ3oOoDBxnCCYdWroWLq
	4l0m0Wigv9PO6dswrKtO4uvdrYEN78tti3hMv8YAaaT+xytp8FkR0kRJlHGQb75Ow9PK5Ni9KNy3R
	jlHizx2QUbKghTSvqWHSHxDJ9Kx1mOabLByYH5md0vMpFdKbxGjqrFg8B3htXILxLtd6H7T05uIkc
	fmvMb7zf5TZwFBh623YaclFDAa+iKU0jFpgEmE1tB3NDcTLI6Q/w6e1Wl6aDyM6VXDwEPZ21gNl8w
	HGmWp28hwaT1F5CpbJly6QKinABeULAY+PqWuyi+Y+xh3IQAVSA5hTXNGN442fGUZFVjtdgS6Hgzo
	4DPjpvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPqz-0000000Axv4-3Tda;
	Fri, 22 May 2026 13:23:53 +0000
Received: from mail-ej1-f46.google.com ([209.85.218.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPqw-0000000Axti-3YJB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:23:52 +0000
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bd8f6ef4ba6so1071303066b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456229; x=1780061029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEDEgL2tLkOR4zWl+L+uuKuVbGErUH4r4hxSDSLZGiA=;
        b=N+KrEFpmUvDr6wwPCXd4iVAmnRJZ9ZYvV9zugdxBDI8dq1UjZVF+c4WzgfjaYdnZqQ
         QGXHRHJwxPFe3sG1ajELmyrygut9YXZbbxeRuAKEeow2RNaWho+LTYQ5nyItCyOipA9z
         R5TWDarnW+utnWvYrvUfy5c9K/SdtC3fJM9Y1yEvi8z/1ry7lR7MLQSV3HdhSKHVCYCh
         pG3hHThc3s/Fmy0MhoriuZHMYxItsuCufrTTKDZW/PuWJW8sUrz4PAFp+mC9S9QSLGxg
         65AvjnO8ZiX992iSFYEZx2cuJlQq43CUXHourTCCSst440Q3Y7wIs+GvZzXBjvwLKs5z
         DSHA==
X-Gm-Message-State: AOJu0YxMcF3n/n3ZmK76Cs+IVQu1Df9VErXDnGnp+AKI6wRNLB2yhLFk
	YNqM7E/VymPokgGwF0rnXbS46SQCQESIk7U52Cdi72l9ML3u9Ecz6aJ3bWj+uqqVp/0=
X-Gm-Gg: Acq92OEj5oRRM5mAWp8pK//EGs6JtXZFO7ocnUvz+EswBsrnZO24inpRlhUQ8ypFy/O
	G+BzPttK9JAwg/EsDnZIYk9jY8oMQWIMZkvd1JKe7HrB6mhqhsnpnoDZ03YzQ48dFDKnjx26b1Y
	qgN4WVs/d2tmD02iJXdocAVJVNfc2a6CdHtvNeDYVrHJRzBYc620+MJqDSj4zI8zLJJCu6yrw4z
	gfRcHqOwSxZsO7ZA0gKRQhqjTrejTXcQ6qKfP17Gd7o6fhjMMX1qrA3h3MKim7OpE+hM27qqJmy
	HcN1kmaDU95oSp3RYPs5wVCrCs8N9T9Cp4Rw7jJqtGyOb8uhqVxuGzNDvrCovOLmnZbP6k+gl9T
	J1lofdV9kOHdIg/BIqFyms6LPMnDPaCp+WZ8FfoKYJp9Ow3TmJyNOwaWW5lRT60eS8fQPoTgrSr
	GlnD4n26LTFueL/pU0zaWnSVRyC9hHo3DsBTQAWSyWMt7PQ0VA5nmu8ma9iWyE
X-Received: by 2002:a17:907:986:b0:bd4:c66e:9889 with SMTP id a640c23a62f3a-bdd2580ceebmr226574766b.24.1779456228801;
        Fri, 22 May 2026 06:23:48 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ecee74sm52995866b.29.2026.05.22.06.23.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:23:47 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so2976242a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:23:47 -0700 (PDT)
X-Received: by 2002:a05:6402:4491:b0:670:8b30:a8a7 with SMTP id
 4fb4d7f45d1cf-6889c2a41e0mr2094221a12.0.1779456227391; Fri, 22 May 2026
 06:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-10-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:23:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV13=yJwuCm2PYgqZ3uWzH4ePiA8W0KOBP-3DV9YGazGQ@mail.gmail.com>
X-Gm-Features: AVHnY4KmwTbG4JqyJfdjScRT_TVewlS59f158FM_wCnR3G3Yqp4fZC7KAhrzR-E
Message-ID: <CAMuHMdV13=yJwuCm2PYgqZ3uWzH4ePiA8W0KOBP-3DV9YGazGQ@mail.gmail.com>
Subject: Re: [PATCH 09/11] arm64: dts: renesas: falcon: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062350_888640_586CA840 
X-CRM114-Status: GOOD (  19.71  )
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

On Tue, 5 May 2026 at 05:44, Marek Vasut
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

