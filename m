Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C13EC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZUI524BMDsbhp2lZJc1Rdx4zR0WktzD1HMi2A/r9Eg=; b=KSR7v1P2cThjfap2WCQj1nNzIR
	Z0IyVSmi1SJLbyAzNYnvQHmSU3XAuylqFtzD0OnHfbseX586BfG463REnGEV4MquFZjzvLJIHnwpG
	hkziYiABhuJrWN3bGU/8WmAIiweHE5nL2snQHVgxDj+oWpPs1ZWNG7iPhY5BtK1GD7PlMyAta3nAd
	hWEFcH7OK2zZ6Ug9Yd4dCQ6IK4WoT6dPOW36sylwbw0hz+4gSJsu0k2qfpmc6acPRfVF665GtVgBc
	VjCssTBho5twWonDEgk/1M2ZzLwgQ+DJqkZk9C9HVEM7T6dCbsnlNL8s0DgQuET8kkIL5pGRftgFA
	h7vAA/Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazE9-0000000Cijj-2DH4;
	Thu, 23 Jan 2025 15:34:41 +0000
Received: from mail-qv1-f52.google.com ([209.85.219.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazB4-0000000CiNV-2BjM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 15:31:31 +0000
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dd43aa1558so9907486d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 07:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646288; x=1738251088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZUI524BMDsbhp2lZJc1Rdx4zR0WktzD1HMi2A/r9Eg=;
        b=i0+I0ShnfmJ+9Trj6PEp8JNbCU57nNytJ2X5S6f5DJRsnuI9HvB0j6f+BYU0yewy60
         YS2HB8m7cSjiI4Icv4qzk8vqeT/FudkG2BBNYI+1xF+rpPYEoFdylTGjRcyPgvFVGOck
         yPUdrKeN266ZjSZFKg2G80HfbmAoTCO+Ml4YgOuOJ/APkCcniPo2XfWEkIeyXiQQysQC
         5HYA1WPZcuukQePX7ERn3oIFLy2h3KG47/uFdOBUi0YHgRygr7VNCyX7X0fh9AC2gdhM
         jqqfiXq9bo6NAG0NO4ANZaD4pcX9yE/gy5sjPSM+m6d/eXlWri0QXkMfqRIeVExjAEzo
         Bqzg==
X-Gm-Message-State: AOJu0Yy0cElXjHWfymZodWsIVaDaFb5a2VcvJ9rChTeGRPXIiD4heLn4
	EfI9p7yPRtEXsuVLQytyLpd4fkBvXs5OGlOOF+EbUBdRUAApelCh0bPZYZZ7
X-Gm-Gg: ASbGncukmieF87SlZtn9rURDGpj1vbzUbzy1xuOuoskYXJJIrvu0PK4CjO+RfPbNIbg
	HxGBcHY8tBhaYIBixjrrmeAVG0SrgG2lVw72uaWV5tPSoFKhYOTl8lj3E62TCAs/aNx7lXxG4Zu
	i6XqylaYGmwJ8SXB0P1yeoOotmQr/KRk742D1DnOr/e9D7HLQtCax6gYjxh9wwBCw5xFd4eHv0j
	VQBX14eDErnG4NCu177iEBubOCJvjtvh72GD5BeVLn7MlzAe3CVT681kouH7kUzubxJg7lWbIYh
	MbXhcwBmvi/JCUn5vTT/l623B+OEZA8xibqLQUSEenGWJZavhLyvaFTdvw==
X-Google-Smtp-Source: AGHT+IHL5nlEnJN6zjIPxgo9dNaVC8cIrKSPk5XWOoiHkyvHm3Bt7idwWINFXVXTda182zWsW9p/IA==
X-Received: by 2002:ad4:5dc8:0:b0:6d4:3593:2def with SMTP id 6a1803df08f44-6e1b217882dmr355467316d6.5.1737646288412;
        Thu, 23 Jan 2025 07:31:28 -0800 (PST)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc22e4asm71816606d6.56.2025.01.23.07.31.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:31:28 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4679fc9b5f1so8976611cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 07:31:28 -0800 (PST)
X-Received: by 2002:ac8:5a53:0:b0:467:4fc5:9d72 with SMTP id
 d75a77b69052e-46e12b6895dmr364176431cf.36.1737646287889; Thu, 23 Jan 2025
 07:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org> <20250118111344.361617-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 16:31:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_H-BqZDQt5ZRnbWBZGAaMsgqjT_FM545yx1U=CozHRQ@mail.gmail.com>
X-Gm-Features: AWEUYZlLlmIIKqicmA67WvcT46tS9dqaX8h6RS73T-ArCQYC0Th4xFZmrNVXGh0
Message-ID: <CAMuHMdV_H-BqZDQt5ZRnbWBZGAaMsgqjT_FM545yx1U=CozHRQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: s4sk: Fix ethernet0 alias for rswitch
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_073130_560263_23C745B6 
X-CRM114-Status: GOOD (  23.88  )
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

On Sat, Jan 18, 2025 at 12:14=E2=80=AFPM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Each rswitch port TSNn has a dedicated MAC address assigned to it,
> so does AVB MAC. The MAC addresses for each rswitch port and AVB,
> four in total, are stored in the FPGA populated on the board and
> can be read out via I2C from bus i2c@e66e0000 address 0x70 offsets
> 0x58 for AVB and 0x60, 0x68, 0x70 for TSNn .
>
> There is no single MAC address assigned to the rswitch itself, there
> are three of them, one for each rswitch port. Instead of ethernet0
> alias for rswitch itself, describe alias ethernet0, ethernet1 for
> each enabled rswitch port. This allows U-Boot to insert MAC addresses
> from its environment variables ethaddr/eth1addr/eth2addr into each
> rswitch port nodes, so Linux can read and use one unique MAC address
> for each rswitch port.
>
> Note that it is unlikely this would break existing rswitch driver
> operation in the Linux kernel, because as of right now, the rswitch
> driver already calls of_get_ethdev_address() for each port to read
> out the MAC address out of each rswitch port DT node, and if that is
> missing, it falls back to MAC address settings read from the hardware
> itself, and if that also fails, it uses random MAC address.
>
> Fixes: 412f2224b3b6 ("arm64: dts: renesas: s4sk: Fix ethernet0 alias")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

