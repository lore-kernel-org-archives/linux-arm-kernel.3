Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69957E7E358
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5B2pyHP/JliOmf6Ji1g5Y1Ga/IgQoI6orIY2xFD1nM=; b=mtWUNNiWHNIsSvVrfl7/MM85Po
	AxaYsH4gGhT1kePuF3TIVKG08gQkVbpdYtOl7Jc+sMbLTh+DkFIE+UftORXDITXHxvxSO2n4T7RPE
	JpYOxXTCWit9d1n5k6Anq/3Hs2l9OxZDXRdWbcJ5gOS4v+p7RzWXC1Bu2oxVUCsKi9ZR92UEj0NQ6
	VOYPWIhRlChrvqKL0Ta+Az5DaynViwEjhyvbvVi6EpP11Pn0pA1Opufjo3yU1PSPZsW43+fpJLox7
	EX+SQO9FwtbPH9sSCNcuVM2rG7knHrInxBQ9Y0Nu+3430n9VbrBlUsBHqnLSJLEjXCANlWPJcnHUQ
	ao7dOoWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aj9-00000001n13-2fuG;
	Fri, 03 Apr 2026 09:22:07 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aj7-00000001n0S-0GLd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:22:06 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56d924c7183so1969490e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208124; x=1775812924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5B2pyHP/JliOmf6Ji1g5Y1Ga/IgQoI6orIY2xFD1nM=;
        b=orqcU8lAO8tjUeAhK055BJWSPT4gL0o/akA6J85QHU2VyobT5iA1qvxOXnsS0rGrIy
         +F/WN8j2jTK1JS53Gc3q6uS9g3ME8hZzesIXho2/D51Djg4RVlVN103WOrJWcuUZnjEG
         UnYfomTW1IFPCGnfR2XyKUtl+ER5xY09z/GHdALuyiWxpounbAljrZaMQlNVToh9K/PO
         ZwVBTTh9hZoTcYXGYQREYKh/4A2fsSDMEdQ1glePbk3XvaLsHuGsoqPfnlf3Gyu335Ki
         dM9sM2GLFKlxXK83KuQV0WhVKLEQb+YFOX5uUJge4bPgfxhiF7NH1DR3DwcnHyqdUAHb
         48+g==
X-Gm-Message-State: AOJu0Yz9uqbKh53iBxm3Yq/hjCTzUon9xymxvFOVJSzOtLatyilqjQhV
	QZDqZTuHRMSaidP7SbI1gcQ8jIxQijLN4yD/LUhPpuj16JX+khvGzuqAWRh9WiB4
X-Gm-Gg: AeBDiev/ZRjgKjtwVbLr5irQ4ZxaGzbmj79GLeZYDeac+LxoFMcoLBF1vOvJROt1jF1
	GsHP1gMkZ+q3HoOGgJjFrlyjm5bV6hDuoZdi9p+coEYhilrAZy52wEoo6I2bhbmdOyas3TsT18p
	mnHdmOf7QAH+ojm28Y2piq45onH7xlaaekyz4H57RclSA15/3eRhiCDcBQTO4UNFtTpJ8JaYvCX
	wWEUWTQdCuFUOHcFUcO4ODbYZzQYO4gXVMymamLg70KBmGlJknyxlw97u1tGmg7XMTmUlgon1PP
	5uGNr1nKrab/MBQixW0bnKrDOydjdETUmsKeHnQa88FhGBZXGqTzCq75H0cmF0YJRIqYdRCqMOc
	PS+YaCY/XspIlR2oUppNo5nZT4kWpc2oM5S8dS0ABfh+WCgfc3F6rVYyjcjZl7C1B679+NQKUVv
	L2kz8/n8Li1ZkdwfZ9lBrfhqqQa5jd4gSg15l3Y+/euCPpkDf0MiODN4Z827v7
X-Received: by 2002:a05:6123:149:b0:56d:86dd:d1b0 with SMTP id 71dfb90a1353d-56daaf8137amr747775e0c.0.1775208123516;
        Fri, 03 Apr 2026 02:22:03 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba81b53sm6293818e0c.4.2026.04.03.02.22.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:22:03 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-605b3b6c4dcso107129137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:22:02 -0700 (PDT)
X-Received: by 2002:a67:e70d:0:b0:5ff:c40b:27eb with SMTP id
 ada2fe7eead31-6058a4b3fd6mr2323242137.3.1775208122603; Fri, 03 Apr 2026
 02:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:21:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTV71efsQ6SzdXdsnHHb93Gn6sbNNEjSzVLZ0_w==90g@mail.gmail.com>
X-Gm-Features: AQROBzBnDgdH3_Oj0-6Y6WYqcbqwAQ1EOcuaufJmPvw1l1BD18PtBKWpQ0DK2N8
Message-ID: <CAMuHMdWTV71efsQ6SzdXdsnHHb93Gn6sbNNEjSzVLZ0_w==90g@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: dts: renesas: r8a7778: Add missing unit to bus node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_022205_098869_07C2B93B 
X-CRM114-Status: GOOD (  20.43  )
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

On Sat, 28 Mar 2026 at 00:42, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing unit to bus node to fix the following DTC warning:
> "
> arch/arm/boot/dts/renesas/r8a7778.dtsi:43.12-48.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

> --- a/arch/arm/boot/dts/renesas/r8a7778.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7778.dtsi
> @@ -40,7 +40,7 @@ aliases {
>                 spi2 = &hspi2;
>         };
>
> -       lbsc: bus {
> +       lbsc: bus@0 {

Note for the future: if we ever add proper LBSC support (including its
own compatible value and reg property), this should be changed to the
address in the reg property.  This applies to the first four patches.

>                 compatible = "simple-bus";
>                 #address-cells = <1>;
>                 #size-cells = <1>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

