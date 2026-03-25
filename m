Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AB5109C021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcbIQYAOh9cDG6sNZOxVKtvVxUHP1WsG0mtWehRBwvI=; b=yYwGvLmtPIN2wzUz2vn/ZonToC
	wnYoTrMvoRnuNEzbLuLscE5VL7WRL2u4woYwmGSzA2ypkxJW0c5WxO+7/RiwifSAjKqtjJON9Kj6h
	GehfZg6Ja112PY6pZg45goHHEP1kcSMHPN8Uo5sb0zC2WtOlmh/fHCYUDs1GF3oNb5+OYcxjrb/sU
	kAMZzz2m5JlTOf1jWtVtuG+zGJt0vXQe9ekTGDTxM8e7Wz1qa8QkgBZSU2HhfOF1y6rejSg2uaAUm
	Xhu/q8/Kao5qdfE0NB1CC67H8zEh39pwItgI0Cn2xOOW+qZQjzGBmZkksWQHWkvTIcCAc7sHM0cL1
	F31OJEeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5P9Y-00000003Z7q-2ZFc;
	Wed, 25 Mar 2026 14:24:12 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5P9W-00000003Z7F-0od8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:24:11 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56ba039eecbso2095914e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448649; x=1775053449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcbIQYAOh9cDG6sNZOxVKtvVxUHP1WsG0mtWehRBwvI=;
        b=Pw00VUCEEE5TkHCpWWj3v6T5lzHnV/aTZKAj6c+0QVzmECcz4IlZXrvwu7e3eR3em3
         n2xuSE39zUNPlTxpqiXgr6ahJLfR1rkiUFqRsbJGjv7vuSf5KIL0ULv2/R5OyEu8NpXD
         6H4KbrEREsln1xzu9h38slLWMDJUpatBrCAUdLXwc2sgE+l3WkVZltsJJuzYX2uqBZcG
         we+nR9QBrjiKA+J+95MBB/Pt/tDiqN9cavOXORy/G05Wod/zLbbCvSjqrwmLm4HwJnUA
         P0o3ABKYi7Ef4Lt89OpjmcudTayvMb8JYV5OLS3ALRZBuBlBSFU2wcYrK9oL6RR+s2sp
         H28Q==
X-Gm-Message-State: AOJu0YwvYExWjB2hPv9ddPqHANGylZubCnYk7jfwMT8/381vMipcJV3C
	FXP56BjF+u+ZDFAIBWfnwWlbNuyGTLfqWeAiZjhxKePZRZtEtrsSubaS2rpRM16J/jI=
X-Gm-Gg: ATEYQzy+FhQdvnYhe4P22XayckJhZynDPQdzBBpHukgR7VHKzusjlhyt17P00DdsHWT
	d+V+rhHblrvHQ8ULEM/CWwzft7lKUFmgxn0mVn8UEXqdnS5fuYolGkVVeY3vops2my8N8lL4rtK
	vuUjc4aZBnj1/6q+7jC5IinaF/gK1SBoC/TJdQ9DCRwFgQ3GKAlMggeJo6T8a9X8WEuKauis84i
	0pFucKxNUcQ2elWSi2PuNVnZWqh60VsX3v37tcMIEkNurjia0Gt/siYW6NAkxe5hRow0hvSKNep
	OdMrlfjxBt/jFaOEy1GWcC/Zu+Bwiy5AI8MZS340UlFlKcS2ERCdQGpkXheLyQ6i115SMxg/d9y
	6foTfxHdt8KB0zowAVtO6LpmCOqZilKwKLHkLWkhYca6gcCpvfN3jCZvZWJqrwxih4JSPXin1io
	dEAuIT2vJ3+RrOF5fno+lcSVX+noapAvTvAqITEp6VPeW/ynQ+PqZQ7x/4ISLS
X-Received: by 2002:a05:6122:e46d:b0:56c:d1e5:1a2a with SMTP id 71dfb90a1353d-56d220625f6mr1688347e0c.10.1774448648649;
        Wed, 25 Mar 2026 07:24:08 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddb939c2sm20048579e0c.6.2026.03.25.07.24.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:24:07 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-60327793ec9so561580137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:24:06 -0700 (PDT)
X-Received: by 2002:a05:6102:5694:b0:5ff:cee8:6620 with SMTP id
 ada2fe7eead31-603870ce0dfmr1803350137.11.1774448646696; Wed, 25 Mar 2026
 07:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <20260313164008.40933-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:23:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfRS7GNfjap74h5rUx1v4btr87vWyMRON2-5FMUVwMzw@mail.gmail.com>
X-Gm-Features: AQROBzBQrP8z2Gc4Hd7jXaA3HaJVzjYUVvRTvP9CWmOYpIcArfN0qWHYtAQ_lAg
Message-ID: <CAMuHMdXfRS7GNfjap74h5rUx1v4btr87vWyMRON2-5FMUVwMzw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072410_236332_7E35E144 
X-CRM114-Status: GOOD (  17.02  )
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

On Fri, 13 Mar 2026 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Microchip KSZ9131 PHY schema indicates that compatible string
> "ethernet-phy-id0022.1640" must not be followed by any other
> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

