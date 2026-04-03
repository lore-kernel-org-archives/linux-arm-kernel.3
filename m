Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22325E7E345
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I33x8hNGNTQHLqp8m/P6sxkK71TBmOtYKAjfqJkvDog=; b=kxhfEEhi3IJHM25g28WwLbgzZz
	bePjLnHglsCc9xsPCidzkO19MsBAFsh7DBY8LMTBNHB3o/89VnFXbR2vSVzFOtYRey11HNOadaz91
	F7lg2iRZk7/qgUuuuBMaMM63zJJ78RjB7rDF4RnbGlEYJIZVlvWFKZJkO4q5NupElweoXOlH4abHX
	Cz7mnYOnLZhxwodCQISXwLW+ON20k0pI8BDx+LsI0WquRoqJT2/7lzralwqtTiESxaK0iFsWb1lIR
	Eo2gh4cfypjalcRCJi7jCvVSSQ13NJDKiznU4cW4IgKwNR1rYR2rCmvDNFi1KFVN2XT3kj2cIpKbe
	s9SQ9ORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8akE-00000001nM7-0GvB;
	Fri, 03 Apr 2026 09:23:14 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8akB-00000001nKv-3M9d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:23:12 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso1334645e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208190; x=1775812990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I33x8hNGNTQHLqp8m/P6sxkK71TBmOtYKAjfqJkvDog=;
        b=ewp/sNtC59a45Y7qldmyEB7Ioug15DdI6D/9FvRoOL/NmhBphkgePLP1j288CQ7qes
         silx3n7ZOUHM33XmKLciQzcFIYgTplyeezyrX0JCaEmGS7MH/0FPZCA74aRnYOLRfBjt
         5XhKsqOh3GQp7VTr5q2BghOIQ6/20ytf4OEDY1ukLuGeM4VHRVDXQhivCLutHjnwnT8s
         XWOIVWQwz5rDPKF2PlOqNPKJ3yXJ4gelwr3mOtqPqP5wQec5B2U1cVCvI5fe4LsaZ0O7
         pX7t0syDYfrcKw8Kod39hBlBLSfKp+ZKaBn+4mWGdQUqW7VjCKqkHJ0V0VL3okXX2d8k
         B/QA==
X-Gm-Message-State: AOJu0Yw2CbFo5/wHBUCC/1RKqqk/FYnmr0c2UYRvRHpYSQJ7QZcRhDnp
	3bmvGk6w/MBtifwMPQL5/+i6dZ7fyxq6hiIfLWk/gHlEUsCITLcQYAyOdEtzSg6R
X-Gm-Gg: AeBDietSVdkBuunhw5+WrAbgW+MSkBjhm39NtLwId4QogHzlStcOowACpO6YzA30tcW
	t6cLvPB58FF45sX3/QNjcb2izXGnFcDNTbKBZ0+VK2LQivScviLaIK2lCd0GyZzGtlsEziLSl+n
	DKXwJE+PVXORbVLr4HDHIC7Cu1kw6qoX4cgTwLVkt47OFLODfEe2Pb2MfJL1lsE3c0b3CLc1xab
	0DsI8mkgZEen92VEomJFxbQl/h4ZoM0HNEHf8UuGQOFRQkg9L/qZLE2CmdHlO4Alop3UDsjxoFI
	Q7YaIMhURnTsOZJj6lPbPy9DC/fxm+gd6PJmgfcCSVkldfqsEkTQezRG2jrCyrsIb0MJIeySeUP
	7GIlSn5mutVy/n8h3uhWU9wr57DSz4maTa8t5QJJ/bkkYAdoy8D9ZVS99zHG7w6XCGcj5rfbPj1
	+I6YwCsXBp4kMpHRkNluSBhIR8u831ma3pXM3Ene7rkQg/xyxzIUDwS/RehqGj
X-Received: by 2002:a05:6102:5cc1:b0:604:f640:301d with SMTP id ada2fe7eead31-605a4cc1e7emr999962137.7.1775208190433;
        Fri, 03 Apr 2026 02:23:10 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fba6da8bsm5626236241.10.2026.04.03.02.23.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:23:10 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-604dfcc9892so1181382137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:23:10 -0700 (PDT)
X-Received: by 2002:a05:6102:390a:b0:5ff:1d91:a4bc with SMTP id
 ada2fe7eead31-605a4fcd40emr771373137.18.1775208189971; Fri, 03 Apr 2026
 02:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:22:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvMorMi+wXaY0Lyh6V7UAHfWmLi-L4q8UbuY7oe=UC+w@mail.gmail.com>
X-Gm-Features: AQROBzCQwZaYRUu7vhbxTj26YE3Owx_k7G6dQI1gQ3uOUpCmwWAEjJ6d9e-9qTc
Message-ID: <CAMuHMdUvMorMi+wXaY0Lyh6V7UAHfWmLi-L4q8UbuY7oe=UC+w@mail.gmail.com>
Subject: Re: [PATCH 4/6] ARM: dts: renesas: r7s72100: Add missing unit to bus node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_022311_837541_FC3F4854 
X-CRM114-Status: GOOD (  16.56  )
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

On Sat, 28 Mar 2026 at 00:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing unit to bus node to fix the following DTC warning:
> "
> arch/arm/boot/dts/renesas/r7s72100.dtsi:40.11-46.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

