Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6910FF8A15F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 11:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6jqlHRyBmHp78NPQbVn/INUSPCxYZ/sUXVIyq1nXfE=; b=PzSJbjxQs3oHSwSiQlBp2hbQhw
	mP/QsLQGSgr+Y1U2cShkY4Aj8eogLxl3ckzNq/+SvWiwd3elrKVtP2sKTheFIinlJH1cHc/roN8YH
	PK6aAyzkLw/PySjhTRpkWPjsDZQaUhJVWNsI+ZMLyp4fBTkVOXEtCpLZvEQ1YKC8IleZcLl22L3Wn
	BH1dfghH6nPuXeCD4IDmNkjOJe/FhpOY+DZIi0jXcS44MP+/kVeC1uSiVQ7QLBA5spiQ0bXpdzAsf
	xy5AaiD8e7aie4+yGZJOainnYzZMX5w3OP9ibU9gxlAkP4TN/sv0VQmAebr7Hp8TUirLIJHnFgk24
	n84Phz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKv5-00000002ODq-0Ilt;
	Thu, 16 Apr 2026 11:30:03 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKv3-00000002ODH-19IB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 11:30:02 +0000
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8dfd34c9ac0so362971685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 04:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776339000; x=1776943800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6jqlHRyBmHp78NPQbVn/INUSPCxYZ/sUXVIyq1nXfE=;
        b=iQ5QL844XFBj0icHTbA8iJJ0xOE5dOXHeaofDClAudkjybdduYhOFVHHfNCSC3tEoY
         l1ylaBZ7De3v3bCz2g1eSW8hxALTo0Gix8PRs1qQ0JRXPIuyvkHwAOHdYZd5KUlHnixA
         twATePiNdnZGfmZATn4K9Dcdh9zAvn1E/UtYEQAuKO+svILmhJEvfiU+ykvN1bfIXxQq
         9ZXoXEfwIL5YPyyDnhqGKQQkbt6wsa8+nJBlMoxtard5+xcZ25Jf7A1BAZk3ui46j8yU
         joKWp50JuyBEym/HAcZ4MzlML2RbnPf7D9AencR4AvfA4FwR1SqrnZXcY3BlmtrNQrGK
         sGEw==
X-Forwarded-Encrypted: i=1; AFNElJ/iYuZMwLgIrwMnUNMuICHizzH2FkAUe9oMTu99rMgWxgvknBmMCGPMQ6RAOI6OmsV3JlwOdn2LEUEvL3hvIpB9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3yGyC8zDDpRuOmCEVu/cmUqqRaGW9qFUzy01zJGqM+hW4QGoC
	3x58edtyYzuqn/PbBMEBViuvknRRSi2rWXAP478w0jpSyljuK2vwEYO5P5sevOm5
X-Gm-Gg: AeBDiesURO/8K7yxsqFANxrhov+e1YemMdsCvB1Z45DbKr+l0omZKzyIFK+F/O4s1t8
	XtPoz+IXtuwYAGtDigjIwjWuyTgpayhZaR8I40E6ZeHxyXA2sGej5Lf6VwMUko0W1JNg4N3Es+o
	Vjt2N6g47bShoLNBZEYDR/Af/tYFzVapyfzA/RwEjfBjtjasD5qGkSrFVKVV9SMI00ShbPu3JVx
	e+ZQwaYlw5ks/yfsZxCJikxme3UGBNsRu8/FC0Euk9WdEJY+A+XRgo+dRdfRIV8rUDLYc6z8OjZ
	IhHs8nwzBRCQxxrW4qTPMMC6riGxNch7EhKoyZJIEQbyue6GY4QeZX47xpSg6DsxI4TQqrMiT+u
	C1RKUnrCQMHe0ep/UcTnhp8eZ1ntCWKBCIZsmjMMkF8BpN71Ha2PhrnIYK5udtNYSaX8Pd38G82
	97TT/o5s10WErSo10URLCZB2VyiGA+84lxpdvQftaHCPy8wEpyKbFHqIQPaVbTgL5psmwBHtfIu
	/E=
X-Received: by 2002:a05:620a:450b:b0:8cd:b620:f3ed with SMTP id af79cd13be357-8ddcf2bf6e4mr3710690185a.38.1776338999920;
        Thu, 16 Apr 2026 04:29:59 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e4ef817b56sm342433785a.21.2026.04.16.04.29.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:29:59 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8d68bcf50fdso901014185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 04:29:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ZkDKhwoLwkZygA2zoM4aLH8rpttBnRCxSZYlGhTfkeOX02PEJ6544txyLIOApz6FC60XImejGFNqvi0HKj8iO@lists.infradead.org
X-Received: by 2002:a05:6102:6044:b0:5ff:c64d:2283 with SMTP id
 ada2fe7eead31-60a0157295cmr11348128137.30.1776338547396; Thu, 16 Apr 2026
 04:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
X-Gm-Features: AQROBzCJ6rVnwwfhi99PI36wWXAFQ5DEgo1zw3RhVwYNSXoxkTYAcgIxt5Z0K1g
Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, 
	iommu@lists.linux.dev, Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_043001_316260_902F75A3 
X-CRM114-Status: GOOD (  19.11  )
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

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.
>
> Remove asm/timex.h as it has no functionality anymore.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

