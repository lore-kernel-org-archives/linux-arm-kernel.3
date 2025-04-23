Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4E3C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nF++/aev6jNhzegBy5atlaShBegS0AcHCyK/R4zdaVU=; b=SopNuKV+/pQbx1gfGqy+NOiVpf
	NINbXA3qdPjbv0GPsoK7TQxYDVQdasSHm9iKVMUoGByC3d4LPwPL2OiarORbylLwNaIVlXR251DC5
	4RPDU1CLiTHOWOJeS9UiPUTSgL8c53lvL3i873hzH2GiKhZ1U8LpVjlJUYzHV2SuQkA62aPbbt267
	zYDECaQbmrOMLiWkwjoYf7h7FzbWyME16Wel+O8eW1s8i26Cgf4HNUhowpUuf5H2rFpkXnKbg4lzp
	S/f4UbAMWMe5q73K//H+aG4YJXhWlrF1ZZbY1COnEfgOj88LaPDjaWIMABNFSRDpk0fBsb58PLa1W
	xDOPsBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zn3-0000000AX4V-0qr0;
	Wed, 23 Apr 2025 13:05:25 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WeM-0000000A25z-0Qmw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:44:15 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51eb18130f9so2784104e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745401452; x=1746006252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nF++/aev6jNhzegBy5atlaShBegS0AcHCyK/R4zdaVU=;
        b=u0X8InOuwD/h7RlmvwEz96YKkbfGf0vHvU+0ySaVAZz4uuzpn4y139jG2XMvXm1ln8
         KmoTGwXwDoZ1xN9jPTZLkhadD+uEB+xVUkbexNLtqEWG6851dL1Y0EDSO8YCDTKMTzb/
         ioxctykMoFXKiA5GG8crwjNAveKfDOiTEwU/atTXoaS6QOO/42kwgpP61qz+SJDlmT8T
         swNWOq0cauhSiYkc7D2GQmlamxnPkeGwDZQ8DYJPUgia2rBp/pMFoiKw0+1zPH756k8f
         YrgHe7sYIsuGMuQNamTTbKNLTiY82bSVkIqhYGRjsJ/kKpbBOy8q1KdH0T1fzgkRd2qi
         t6jQ==
X-Gm-Message-State: AOJu0YyystEcicvIYAefPicMA2mGr6ff9+CsUo1LO46ehvqYf1xoNoQk
	OH+9V+9Qt99KUOyh2VLKWfS1ZSc/c48OSHa+fvEameLzyuGjNQzVfgoAyIsw9P4=
X-Gm-Gg: ASbGncumXu9bwfgUX3fsOcJL3ztUSQIVk9Dn9AG5Jur+nzxZ2CrFlxIT3pwsPZ3aoAw
	Jra2XIdqIFsXCA/e9+1uPJ25nM58nOOGgXpE6kQv05vPbSsW/TVHSBVd3pwEN6JQiPWuxVvc/zc
	/fqXPOtN5H7QNiHMyqKwHUfYDM+19euUiTmrijtdJ5lW4hmwX9uJj+0elY1gUojnW7GIIDKQyop
	immGZAIFoKHjwh4sd3XuGWjW//qLnRmMQyu8TVrMt9yB1xEeOcX3xbBQ9EmoPSdSqU8mO+MPH/0
	ePnyuY+/RZzKQ//LpFZr69x4EaNiQNzvViPoe9cAi83mz1ROeQ5pOTSCsAzr76awT8VS3vnRwfd
	+Rjo=
X-Google-Smtp-Source: AGHT+IFXKhSb+F1CiZXQPHkjNOHVNVVDixdSKpZM+t/Jk37ZpIdDyOQ/sgo1VhIl+UJ7X0wpmD/Ivg==
X-Received: by 2002:a05:6122:8d6:b0:518:965c:34a with SMTP id 71dfb90a1353d-52925398e35mr15336679e0c.2.1745401452115;
        Wed, 23 Apr 2025 02:44:12 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8776466ce9fsm2649489241.12.2025.04.23.02.44.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:44:10 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86dddba7e0eso2416238241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:44:10 -0700 (PDT)
X-Received: by 2002:a67:f093:0:b0:4c3:64bc:7d16 with SMTP id
 ada2fe7eead31-4cb801fe2d8mr9882874137.16.1745401449838; Wed, 23 Apr 2025
 02:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250420173829.200553-1-marek.vasut+renesas@mailbox.org> <20250420173829.200553-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250420173829.200553-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 11:43:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUf6ZRWv39f3qdyJFUwvgVMJRRc0TsfKiPUNca4JRvM=Q@mail.gmail.com>
X-Gm-Features: ATxdqUEcXQMXrldJVinPbdvd-wgbRX507q25YIFyRIZweCQdoMNB4nEDdseAvv8
Message-ID: <CAMuHMdUf6ZRWv39f3qdyJFUwvgVMJRRc0TsfKiPUNca4JRvM=Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: renesas: r8a779g3: Add Retronix R-Car
 V4H Sparrow Hawk board support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	Kever Yang <kever.yang@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_024414_140628_B537328D 
X-CRM114-Status: GOOD (  14.59  )
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

On Sun, 20 Apr 2025 at 19:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add Retronix R-Car V4H Sparrow Hawk board based on Renesas R-Car V4H ES3.=
0
> (R8A779G3) SoC. This is a single-board computer with single gigabit ether=
net,
> DSI-to-eDP bridge, DSI and two CSI2 interfaces, audio codec, two CANFD po=
rts,
> micro SD card slot, USB PD supply, USB 3.0 ports, M.2 Key-M slot for NVMe=
 SSD,
> debug UART and JTAG.
>
> Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

