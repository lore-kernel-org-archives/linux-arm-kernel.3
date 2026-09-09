Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F95EC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=seHJEHV+vbkaWfT2PmVXZhUQLZRva7SU7v2d3J1NVwM=; b=kYLgsIMzC0m5aZD32zm/A4/16i
	iDeSetoLVLX4F11lMQFqQlTGzWbYQarP4Rj4KXFLhNF0TsQ6NEkJLWeeTVIPH3bCRRr9NOfpcgKuF
	TwAFXXKZIhalwyCSgEhKmpIMaFeM+9f7Jffg3L7P4EIxe20yCfeNdA6GZVWo0eQt3mNUKVz6u6eam
	T9xh2HxmnsJVvu+cf/AEhYJ4s9/UGYibA8CsWqPumlvJRJJXiWeeRl9saz1PnB+cDbDto5DMrMPMO
	9UrVjesLyrNeJby7FSo6xztdlNhWDEdGge8LW6OOKkcDCjrlCc/xUb5ypBKh4+cgaQ1THQDnK++p7
	qHHrllJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KIs-0000000CBCt-1wxN;
	Wed, 09 Sep 2026 15:33:38 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KIq-0000000CBCP-0BGa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:33:37 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c7afda4515so3409954e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968014; x=1789572814;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=seHJEHV+vbkaWfT2PmVXZhUQLZRva7SU7v2d3J1NVwM=;
        b=tYS+XQuGkTANMtdNYeo+xbupFsmJ2gNTHByLTGdMHgjJNiJmTQaNLqC1D23NlhMPxr
         h6TRxo4wu1EE+PFuDybITbcqEDASr4wGfYuWF9LBJkxQ4ia0Z+qpzTFPW5Zqy9IyS8No
         v0ENPQOOnKrEMgC1hOwIIUCq9FtShgZ6kZa4c/dxJKUL/lbPQKXCaFXaZkUaHU4GBIT1
         I79SbnjBEavnWoDc6/OL51sUyiw2ne+E5F7ldrHcZH6y81z7G6o2qFkrFKXZOxPCmBjy
         h5+FJnkxsmagnuzq/rHT6Fr7QfkWrtZdzXdUy84/scbhNfBqENbLL9LcA+nk0mFOsXpB
         m2dQ==
X-Gm-Message-State: AFuF++lzK+1e+rPgolZ3jEgLlB40YI4wiw6edAqRw5R9zqDUEjzbaZ0g
	EKy2nn/GRPGRGB6o2CVMMDzOjd7vMYuIh7h3c2WlEKgt59qvbSUHUJJSKUcTGsJWwmY=
X-Gm-Gg: AYBFou3sqEglrs+XjdKz3KGodYJwOtMIpin7qVqtjVARL2CHMU5JDiTBP9Us2ZSfg0O
	7tpF59OpxFZcfCl6FDak7/rozrPihs6Com04rzRyU8qG/mJsnXVAjVgIHfy/LTGBHiz00xWj1Sq
	+2r6IuWu7wDTCmdE/Bz0eNDGeh+3AsYQ8/3j6oshxbUlE9Ih9LH9LUD1P7v485KHQTWfGVFFH4w
	fZi9M2vXxkbLat478wY6Lv6ozfUcbVG4CRMp8ZspdxHlt5yj+6kuSnXL32U4NbylnOPhoF9h7L9
	zKW7YvTvqHyKKP0cv5wHueCa+Z0RX6xsPs46yklF6MwXFQr/f2oRSOyxeKBruKffL/plCBWIuVR
	XEDd0Pqm2FiK+hpHrfxSxNwqGoCwYHGW3Db89ugDjTFZBoKU6hSUkq6XFMkmtUPur3UqEQGZ5R3
	WvclQ5MAWr+hKKaO/v4V585gM+j9ePwmWzVSRh1xsO/hFwx3Q47RRbceBqtR7QwyUB9P9dCAf6+
	Xzcwo3emgQstpqmP9a9FzEQGo98NGRChW65M3zg
X-Received: by 2002:a05:6122:5104:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c82ad81902mr3071579e0c.1.1788968010920;
        Wed, 09 Sep 2026 08:33:30 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9809e56231fsm11368994241.2.2026.09.09.08.33.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:33:30 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso2909225e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:33:27 -0700 (PDT)
X-Received: by 2002:a05:6122:4f82:b0:5c2:ac92:eb18 with SMTP id
 71dfb90a1353d-5c7ed3f6d2bmr14626613e0c.7.1788968005930; Wed, 09 Sep 2026
 08:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260908162323.16440-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260908162323.16440-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:33:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsfPrHQ-bPSbZnQq8q-t6erDebddnf5Mr9+6L-8oXC7A@mail.gmail.com>
X-Gm-Features: AcwNN1UdM4cUGYydPQaEaeecPmIzkWQH4nuP4PrjWCOhXFLM5sncau6pHe3OeUM
Message-ID: <CAMuHMdVsfPrHQ-bPSbZnQq8q-t6erDebddnf5Mr9+6L-8oXC7A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_083336_084998_697F28BD 
X-CRM114-Status: GOOD (  17.90  )
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

On Tue, 8 Sept 2026 at 18:23, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Fill in missing #msi-cells = <1> into the GIC ITS node, update
> its-parent phandles and fill in 1:1 msi-map .
>
> Fixes: 7fe73a3a3f2c ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As the original commit is not yet in soc, I will fold this fix into
the original while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

