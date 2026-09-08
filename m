Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEEAC79FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jpscs7JaPB6a7DSYaibBo7ovev0XT0EFpj0jxoPpShE=; b=rdhXB+I/k6rV8MKlDOJxiEYxZo
	GU8F+XfkfvVl+bTe22/Eqfhyi0qJ612N+l1zLgnZF18MXQa4uc4F+hgzQvJGhsr+bdH7smWpYKNuh
	c7X56mR/CNYxRw9LK2z+Lr1KtXBhDbybo405H9sMLXQ6CuzCtCIkq6RV5zxU/ib/KVxi2dCde5pXH
	5U1G9sTH1dTdFHS+hBdjM8iuB31gS7eGH4lVfPVDWmvV/QK4rzcv80Ug1tPLB1j43Qr+s8dacUNrR
	lYTZyffMUK3Q0slnYO6LEDtzutsBiYrLm789nMn+te37iOcWgU5xjTYDyRA+eytptB+0XQKw7Ms1C
	Syw563/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rTU-00000008S95-0qYo;
	Tue, 08 Sep 2026 08:46:40 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rTO-00000008S7F-3gi1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:46:35 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso2024539e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 01:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857193; x=1789461993;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jpscs7JaPB6a7DSYaibBo7ovev0XT0EFpj0jxoPpShE=;
        b=Yp3HHExTojug5bL9mTjt1dL36aDRdhTTgz1MHO8gV8mdE92q7hPNgI97jaz9mFhXnR
         5Lqa2U6QS0aXUfdFP4xk7Fj0s2MBCFpu58eHXB65E8FLf/Fw8hrMbI19Izq+tAHbwFt7
         sZ4nUkDXi1jI1Yri8kig56lmXP1kC3izImYJ2G3QFk2KFHlnVRV7EzGWdyZO+2qSAayc
         aVG6kWvHbRe2ZS93/EDr4u5bHqcWvM0C41X3WaS5hwnPh7xXILfvlP+haX/YpHgJnEiQ
         hBlZqc6w0gmpzYQOJRoUuwra/0ZlS3WSlzlhNkgQpjCPJn0DZxiJLaVbkzWJCUYUEzzP
         njmQ==
X-Gm-Message-State: AFuF++lQ9t1LYdglAaJj8l6QwvIhaFJcafPJFgYOyczaWW7QozOj+rhH
	czIg+tdL8cHhbQesuVcgCm6i2aotKeTYc0gZC/JJpFcbfNZfqharRK6B6NBAr5LG
X-Gm-Gg: AYBFou157PBa1n2AsNwhZdZr8Zl+5Z1FKDiF9vD8y7MCh1yMtJM4JYNcsKiRG/ur6rx
	byRJUKjqwEEPurKFzmJ5BVkNVle2tPfyRn7vBY8+DYqLeYPfpugxZXF+xeg7llQ+XrNzNlQ91Cm
	yC2uDm0UlVmk4gm38m7HmvfeJNFB/mtdmU5ogZRNXKjATN3ordSwyGk79mOw61tgbovdDXauFPn
	HBx7lPBbXoZTCWx6Ur62OH6Bqlo7OJd8FvdMrcDIDkGLgP0ecXWx7AcEiQsFUrwytQ3iWF/IeJT
	gVukg6ScblCf5qZnxdrb3mYwipk1uN9TyFw3qryjB9src1Vo0hVlJooU594EI9xy/R92ra8ucqk
	oaIuZVDk5ZSu+CsJa//d9t150piYs4MECeKsuJaWwOhZ2RGpPqJn1l/tFQLc/v3v4EIzEKuiHVl
	8T41UWlQ1mqymELz9MspBElC9MbLdWEKDpEqr2bHuCHieA5WJ8OxPaUk/T+oGWt3IdSliEJ5qmX
	hXiorY6yK9n68AR0Dfo+k0pPAmTcA==
X-Received: by 2002:a05:6122:da0:b0:5c7:ae9a:a056 with SMTP id 71dfb90a1353d-5c7ed457809mr11677877e0c.8.1788857193439;
        Tue, 08 Sep 2026 01:46:33 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm9782124e0c.5.2026.09.08.01.46.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:46:32 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso1768613e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 01:46:32 -0700 (PDT)
X-Received: by 2002:a05:6102:3054:b0:726:cd42:d023 with SMTP id
 ada2fe7eead31-78a4aa3506cmr8542865137.11.1788857192323; Tue, 08 Sep 2026
 01:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 10:46:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpq170gW12KEzmf5cUkUfRQ-6Vj_hMyeGeUny_WUCohA@mail.gmail.com>
X-Gm-Features: AcwNN1U6U5lTYgv4OCUonWRRw758LHZnUmo8hmQI7dJ9Temn454yHA3PWD6OCBM
Message-ID: <CAMuHMdXpq170gW12KEzmf5cUkUfRQ-6Vj_hMyeGeUny_WUCohA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_014634_927952_3E7F878B 
X-CRM114-Status: GOOD (  26.48  )
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

On Sun, 9 Aug 2026 at 22:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.

I missed before that "msi-map" is not actually added?

>
> The GIC ITS does have master interface to issue transactions to RAM.
> The interface does support cacheable transactions, however, it does
> not support shareable attribute, because the AXI port signals are tied
> to inactive in this implementation. Therefore, add "dma-noncoherent"
> DT property into the GIC ITS subnode.
>
> The GIC redistributor does not have cacheable/shareable, therefore
> add "dma-noncoherent" DT property into the GIC node.
>
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -809,6 +809,7 @@ pciec0: pcie@e65d0000 {
>                         resets = <&cpg 624>;
>                         reset-names = "pwr";
>                         max-link-speed = <4>;
> +                       msi-parent = <&its>;
>                         num-lanes = <2>;
>                         #address-cells = <3>;
>                         #size-cells = <2>;

> @@ -2148,11 +2150,22 @@ ipmmu_mm: iommu@eefc0000 {
>                 gic: interrupt-controller@f1000000 {
>                         compatible = "arm,gic-v3";
>                         #interrupt-cells = <3>;
> -                       #address-cells = <0>;
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
>                         interrupt-controller;
>                         reg = <0x0 0xf1000000 0 0x20000>,
>                               <0x0 0xf1060000 0 0x110000>;
>                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +                       dma-noncoherent;
> +
> +                       ranges = <0x0 0x0 0x0 0xf1000000 0x0 0x200000>;
> +
> +                       its: msi-controller@40000 {
> +                               compatible = "arm,gic-v3-its";
> +                               reg = <0x0 0x40000 0x0 0x20000>;
> +                               dma-noncoherent;
> +                               msi-controller;

Likewise, make dtbs_check: "'#msi-cells' is a required property"
And it must be <1>, so msi-parent above is wrong, too?

> +                       };
>                 };
>
>                 gpu: gpu@fd000000 {

I have already queued this in renesas-devel as commit 7fe73a3a3f2c3718
("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes"),
but I can still amend it.

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

