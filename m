Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736A0C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT5SmnnEiCJkeSE3HgFIBSVwvA/3E4ZeuxsouiwktnY=; b=WA+XEJTGsbLImWxeiwDgMeH98y
	NbivhUl6rWOu8f4YfBndCEgNE+d5uXIVKEDrlh5nM/pB7hA/51bxNcc7f73UJxdYVQqiX4lIjvx30
	IHy3tJj13GZeJI0oZL9MXU5o0HCv/JxgO5/FhEHzD7XWrrWIb8pHfia+2h31/0ZwzxQHesnSzcFDB
	ratP/A1uMdLpyiKu1gGgo9/fc4I/Lo/wPg8xfV7fhY75nS6mrFg1XcH3SEod0g8TkWFF1lx3usOp6
	/nk9jAok5Ec1rObmAUV8tll1DVC++0eUrS2Bhz/mffAQZspbPOWPoreoBUSIShC0bE9qyhQZgGL++
	dW5vmgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wjP-00000004uNL-2gCO;
	Tue, 22 Sep 2026 09:24:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wjO-00000004uMn-1Db7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 09:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oT5SmnnEiCJkeSE3HgFIBSVwvA/3E4ZeuxsouiwktnY=; b=bhHi5TJUoF25F/yZv0LjNlwECO
	hHeF0CACcBe4yGZOvTf8h/2I+bz9hOPCL4m3AXboE8bwsZ4vRXbJiwKG8Psgv6LXRUT1YnV+FRzYr
	crpSXyEX93pnzyeMzUuIRufJQec/ZcX6u5XQcqO+zVfxuK4nbvGfTw+U88jFI/p1U9lxjtflmOxVr
	yGX4RPueuG0yGj898q9WyzfZby5LD4W9YGV9/wrAdRgRWWK7GsQCna+PgB6C2ZCzDaMOE7VJu5hs3
	LhBKiBTCFMhqtqh4S0iryvsPGLAJq1WXwA8gufvMeq5kNWr3V+UqMihEvYtgOGQdwVSufJeDKgR++
	AFPlqW7A==;
Received: from mail-qv2-f12.google.com ([74.125.230.140])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8wjL-0000000DMMD-07Gp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 09:24:04 +0000
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe208so46756596d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 02:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790069041; x=1790673841;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oT5SmnnEiCJkeSE3HgFIBSVwvA/3E4ZeuxsouiwktnY=;
        b=1j3WrlpOJASfsUlqu5gGOPY8MvjN1fe63e87Ln1QrvKVx3sjJ/RboseRRyYwzcaFgL
         Y6sybK1qL6VEl1aprWhZfZzCovKsFLQtfk27kLhjkjU++YwHVQg25j/sllVU7sbYRVsV
         EA2Zr9j6pvGkysulelfyWSxUhmOO2lZUI5rS76x10SPSzeeC3VjXbcMeAeoCCjAVZJjD
         uvm2hQaRDfVvjOOpxDksWenf2P5/9Og3yhHCm1sXDgAkFEyL9jTJGouWE5IagkJM1aMj
         inAmGYcC+kJYTRScHRwuixC47ROIcBIs6mQZBztK2up6OFGLqQQiZY/fRGQJWEdX+/D5
         4y5g==
X-Forwarded-Encrypted: i=1; AKwUvBznRq2lWbHjZZImA59Rvf5OwZSzS1hpbm4f2sO1mnuayJBH7+EY+W9Klx4UTPSU0wAmtEQgF5Yc2D5zj8Z3g6kN@lists.infradead.org
X-Gm-Message-State: AFuF++mHRnV5OhzkhWNROofkUtLK7ABKw0WIWvtNNRzTSZpI9KKnwdH8
	d6sYfh1eP52M0kqiRHKAknJ1ywL213UfMQ+OjS0ORA3NnizENaqH6uPBh32Y2s+bVaw=
X-Gm-Gg: AYBFou2ISYgh0JUpDFyXx8nU9UReX/M6YAYwzV8dWaZCnnhL+ydyg48emEnx5UJ8uA2
	wXpjKBz7Xg5IpCVVmk7I1kRLXRIRUKTlnxzgHjb36GvRpZtnFes8SrxUnANOPaQG/AHpjKtC8M+
	KcgrziAg2JL4LZ2NH00BV6sgnLLNR+2pW6IzL2b66fm5aZGuupw1BVqcJBnLh1rMuSoeMN8WSPi
	P9m2jLsXxk8Eo3bEA4HELr3+7HCgqH0VyLo6uw0+3ebmLBdZxXuuP7tKkzh1B8spvqAdCri/WTN
	aDXhJf1xKfvWCZwuYqrYoLW++87R53wn3k4mSZHGg+n67B0sumQzsBOulbOoK702aUHcail/3qH
	biBoL6B3wLvBCKRtpjEiFpOVrCT21R04Tl+WfjXMWXdarZlCNeh7UdbJeWHTDvzgDMtoYJN/KRC
	jPwwjr7hY66tA2u+8/uet1rCLypO/CKJqcyeUIc/baxORfruj+cA1nciMUcLLf+1wXXUQ0yaee0
	9sFEswHxc9gRyKyYxdmWXYvD4M50sHabSi/eA==
X-Received: by 2002:a05:6214:3306:b0:912:6380:fe33 with SMTP id 6a1803df08f44-913fc94acf9mr43367196d6.40.1790069041195;
        Tue, 22 Sep 2026 02:24:01 -0700 (PDT)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com. [74.125.230.205])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914023b40dbsm11341236d6.7.2026.09.22.02.24.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:24:01 -0700 (PDT)
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76c9df1so46701861cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 02:24:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw2FcJj0SnCp/LhFkHV7B1yX+5Gr2crbkcZz4AKgt2h3NfH9MRaMNF6Lh3xcZ9p3wPOnxL+vxGqOjHMsIE8FWuE@lists.infradead.org
X-Received: by 2002:a05:6102:1492:b0:7a7:198a:c2b6 with SMTP id
 ada2fe7eead31-7a7198ad381mr4988859137.30.1790068658957; Tue, 22 Sep 2026
 02:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
In-Reply-To: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 11:17:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com>
X-Gm-Features: AclHuK9pjyjJZh6DYzu8j0CaKCcKmJ8CfBcbQ8aIBw9Bf-OTlVvyy4dIW39Xywc
Message-ID: <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] describe RTL8125 PCIe NICs on Rockchip boards (and
 add DT binding)
To: ricardo@pardini.net
Cc: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_102403_119061_9A3EE4B6 
X-CRM114-Status: GOOD (  19.64  )
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

Hi Ricardo,

On Thu, 10 Sept 2026 at 22:08, Ricardo Pardini via B4 Relay
<devnull+ricardo.pardini.net@kernel.org> wrote:
> Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
> NICs whose PCI function nodes are not described in the DT. Describing
> them allows for stable ethernetN aliases (matching the GMAC alias
> convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
> inject mac-address properties from its ethaddr/ethNaddr env, so MACs
> stay stable across boots and U-Boot and kernel MAC match.
>
> Tested on a NanoPC-T6: /sys/bus/pci/devices/0004:41:00.0/of_node ->
> /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and
> u-boot correctly adds local-mac-address property there which is
> correctly picked up kernel-side:

Have you tested this at 2.5Gbps? With which firmware?
I am asking because I have problems at 2.5Gbps using the firmware from
linux-firmware (on a different platform, though)
https://lore.kernel.org/CAMuHMdXPAeHoeaQbM9rXbXukoMbFV+0k28n6sRMw8XF8720WUA@mail.gmail.com

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

