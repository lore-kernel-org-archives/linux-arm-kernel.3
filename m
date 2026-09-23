Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F055C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAUfWTzk2vrn13xOUws34cNgXar+RdYHbZnk3nf0APo=; b=ipFMfJdc7ahK1FiWTjqtzgbNUr
	di9jZ+8GwtYGmA0NYY5ZedbF849Fkgp2cqsB/B8s/QNwFxIqprY7+x3jww2cwDS7MJPaMgMMUHcUJ
	rzyvQ03SjEUj4OJlG62BSjCrtT/VB5WwK/Wm5YsunSBasbV5ATLKkzGgqGmzswsDwdOuQYsJigVNs
	LVJu0TLQy6pEaBgmatQJ/hABtvhyHIc1oK6+2htT8Z3nq1nfFX8mgt9UttoU/zsa9syipBmX4DLZo
	Dgm34wzUEbYYBm/d0XP3iFHUgNwJ30jlDNQJd5FaaB3yR7wrQFgrxcdMffZTcU5G+UtD20YhSiSmU
	1E39UsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jlb-00000007pkM-1NqT;
	Wed, 23 Sep 2026 09:59:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JlZ-00000007pju-2seM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 09:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZAUfWTzk2vrn13xOUws34cNgXar+RdYHbZnk3nf0APo=; b=Hlg8LVzkG0bX4mhzwGh95dS//+
	n+uEnJ8rjQIZQHMARh1/wNyHdqXatXRhnXuhTkkHxQpWTX9ZyQdxpjUJUj3OsAfIZvYTSrBcO539k
	U/pddBpNofihInz9N5wxkiAknHo6owq3x+1ZyLyg5HD8uj52bhb4c9/+voVSCWu6+dSLWn/+y3iCG
	zaZ9b8daR1Aj1GCsS6aHNug4tEu/9clhG2WAWV7MsHPRnNOuMvNKIQ9fNTnefCOFNipz/mgWn2G6C
	Hi/Mt/Ls4nmjq55pKZodLOFLqlf2ybCD0d5rvtFYjaZgM01/XcWbdDvX4gFZyVp0y8BSacIvFAkcC
	JGSkRSXw==;
Received: from mail-vs2-f12.google.com ([74.125.227.12])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9JlH-0000000EcVF-3e6f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:59:37 +0000
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-791a9878aa9so252865137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157574; x=1790762374;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZAUfWTzk2vrn13xOUws34cNgXar+RdYHbZnk3nf0APo=;
        b=zfugD7dYwsBrcd0XwBI1e/ofT7Z8k5nw5v/3fAx0/kT/HKGH4BnSz0yD+z0oa/k38X
         pw/W1zz9zxNk9bKKVCq6PPXptK57mUObQb6LbN924uhVSIEHg7hpc7Q9QNgjWyVMJirD
         mnswpkstNbCRNjq5882zro+nMuIs7Lf0Xikrn/k/PBE3Ft6zhbUWwGWq6In5nTe7VLFT
         Qxtl86MnXUdbDyk5V1FoT5zXCLWBxX/sQBKvnwUhQNxGzI7CC3mpMWPNI6JY/0S3gFfV
         1YZVaWuzjHYPpDOqLggKtOClnH9G7Lp73mmoFj7YfX7pzjLnCuKXEPFhc9Px61Ge1ZOr
         fLXw==
X-Forwarded-Encrypted: i=1; AKwUvBxo5RAI5r7F145gZIW4HsdbWqmk2Bbe1Ss3YNqgKz+ecQeLB3C8Eg/CWSh+V3zP3URPUaQQ1xJi5yHpLwlJ3TI1@lists.infradead.org
X-Gm-Message-State: AFuF++noWLaX4w3O3FfBWjQ6gTa9Gh3uATA0JgEJG355Cu2lUmAe1/Yo
	FoG3QhMyL8LzaNZCe/3ToqqFBQe9F2GvqAc2M0QugL9YyKUcu/50LgO2ryVuAljoIPc=
X-Gm-Gg: AYBFou0PeFgMClrnS0R3FInT0TtUVzFn5kbnLg71xB+dTtihb+Po19Qao11v83w3PFe
	wY0jPeeR2gX3vpQNq5V9+hyy8ixvkyOjB2l1+IVv4oN0SBKuyNpcirXHOqiyEVkqnThNEk1wRl0
	4YEzjbHWDSBhz8WBIQQjeLFJIdr5AaM3kQfPLT/SdKkG4UKV1mEIrP+9rmIQXkmbHFeyT2LI4eB
	aJgc6XUQkp9/Ei4i0qh7BVhmFNJKcEoV1iAlZZtAB3lV7Nb5FjCmox/0SsPCH2c4lAzfHSTlshG
	XTIYW86Kib1tPY2mjn7+OojI5jhm+/oo8P07dmfTf2xWBMDu7/aDgsz0FWrIHDoKpYlCOrKpeqO
	Xs+2SNLjQCkmGpaxbmGhBWgWKYQcJeCN8eDrqEX+puHCRISVK2HYW0gKcmgsWVRtjNAZRKzBQ56
	/iJzmVQgKGiadMc+FBAaVFMP7HJ2mTwIu1jbiqEeOao3wJr0qHr5aSGCcn/VoF342PbO7IxQEl7
	l1bi7IEfFGV38NMXAbAAUdubtuzyC/yKgog5Q==
X-Received: by 2002:a05:6102:370b:b0:7a1:f971:78f3 with SMTP id ada2fe7eead31-7ac1de3bd78mr1948562137.31.1790157573882;
        Wed, 23 Sep 2026 02:59:33 -0700 (PDT)
Received: from mail-ua2-f29.google.com (mail-ua2-f29.google.com. [74.125.226.221])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf65b6a0esm2911018137.12.2026.09.23.02.59.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:59:33 -0700 (PDT)
Received: by mail-ua2-f29.google.com with SMTP id a1e0cc1a2514c-97e80579b7dso245878241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:59:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwfIpmN5gRudwnTGBV0b3U9ESUdwv0e5UKUjQfjE/B8buAmAJgEKbx7IsLOUrYOmYiaJwWjX1VcPrIpxtSAl8X1@lists.infradead.org
X-Received: by 2002:a05:6102:c13:b0:7a1:fa0f:1106 with SMTP id
 ada2fe7eead31-7ac1e65caf8mr1733659137.36.1790157573285; Wed, 23 Sep 2026
 02:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org> <20260922-mali-c55-renesas-dts-v1-2-cd63cdb51033@kernel.org>
In-Reply-To: <20260922-mali-c55-renesas-dts-v1-2-cd63cdb51033@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:59:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYe87S_fEQo8zj_VujmRB5yQKyKCEDazHGM6qk0MbOGA@mail.gmail.com>
X-Gm-Features: AclHuK8WjDB7V2CQNwZO4G_mraK9sglGs33f4ItFn_8kEnfCQnx4H75r4eqopEg
Message-ID: <CAMuHMdUYe87S_fEQo8zj_VujmRB5yQKyKCEDazHGM6qk0MbOGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP
 and IVC nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_105936_242961_53682114 
X-CRM114-Status: GOOD (  18.37  )
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

On Tue, 22 Sept 2026 at 15:34, Linus Walleij <linusw@kernel.org> wrote:
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add nodes to devicetree enabling the ISP and IVC that are found on
> the RZ/V2H(P) SoC.
>
> [Rebase onto v7.3-rc1 and sort the board overrides by label.
>  - Linus Walleij]
>
> Assisted-by: LLM
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

