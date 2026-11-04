Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDAA606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cmgMWpMo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VTnZ9KxipM57oeI6XdWPJAXVctjy3UG+Ti/EianJRiM=; b=cmgMWpMotsxfRTdShyLKe0T/06
	2s03O/9prxzwafENbTe0zBRfghgLs/+LH7/pL8OS8cwf2lJiXiHbhs7ZZlNDTRbBS1iXFXYnGJP41
	BCRcr6oyTdwJNvTOfBqmyuV0zRXEfDL63+Dmj/0Dnq3TZpiSi8iXtV0WBPYwuMdAlghhgCMn2RO5B
	mAHznH/vn+ch16Da04utSFw9EKArQJzIK5GfEy6996NIjQ73sFK8X85dGtiieXhNvo76R81yyjElA
	RBGDGUR5EYhJgvgcz7+3MqN1Oi6ni666/vbM5Df6AXmLgrRiE43xxm5elIkuA8kIKKtW6htTnuhCH
	iPFb6PLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWOE-00000004i0p-20Bs;
	Wed, 04 Nov 2026 08:30:38 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWOC-00000004i0G-2avr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:30:37 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-998749fe872so297274241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781035; x=1794385835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VTnZ9KxipM57oeI6XdWPJAXVctjy3UG+Ti/EianJRiM=;
        b=1oxKl9q4ZvwGrhwaBQ9BHfQu0vy+unhcbxpwFDGjFcX8u+RowFtdtt1LbTcDqEh03g
         Ks3Hh3SAdRmtj4cH4gNF+o6sNe4pqWAYC/pzdRHA5e8r3CecLY9FYpIHv65Q/SnxACtN
         0PJN4H5ehyjyncj887gqRcljbww/JQUqjs/OEHep+Jb1tx55Q7ihabre3htKJ73PV/EV
         VO/G4lwIoSRL4gwR3Oruj+thsdB/iq3DTMjkarcCYszAYgi2TOoJitNdMhyoxr3zXglH
         ZJFP1yuBQFAzliWICZrQwpl5TBm3gmDBR8S5A7SErys0NFBMdneqxUl9bId42f071ZDJ
         /Sag==
X-Forwarded-Encrypted: i=1; AKwUvBx0HDwX86GnZXhKECqadbah7F7/uGBRz9ROgux5hNrMcWj+EbdsHdzgtqgAP7XDkkdNu8rBH8Ha6/Xr13fKnF0O@lists.infradead.org
X-Gm-Message-State: APuU4Z/Zts6M5/MfkQArjdaR7LCf8k6cff1PDjDh/6SIe+rgc2L8spyJ
	enD8xg2brZejilwuuS+uwILMSmrSqmqmFw7a+5EHCoWtjLZyttlyzkqkjCuXzQRJ
X-Gm-Gg: AYBFou1oKxsvRgKCwEl+FFOwLehowPZoRcyvaMU5y3tuLmG6UH+k0iU1MhozRRHlViQ
	EVe0kPs7jfgrLRUdB8QPbpzO1FKIryIkQNNtNKHqwrY206p4fHU+xxItMOww1ITixv1duwZMeFw
	9bCXo1YmAnBBRRsbRlKGzMvsOegYAAJlMGOquRSRoqnRCg6e+DhIRZazDqNyOOltbnqtXKiY+Zw
	/O7t7wC/yEvntMSxfpzWwvNbGk/+EBTHGEARVRy2rcUsBAYVm+FARD9FwB7//xpiyLOTgfDKxdf
	baLB9jCbiZDVG/R6c3xeBiO1LhpmPPKPCkyMtVq8Ig/+9RA8uiJ4vUwngO5NSu65d1HuYZeFXv9
	4ZHw8l4ezEFXLfRicX8ZiH7qFc9kmoBWkVr/SwTEvO4/0CIWPEGwFQqSGKH7aex3ED8WZYwtbmh
	w4D0jGWxRZVISM5ftMnO0dq1M816VVtOU5ejrE+BaKDBJ7BhFmGOqlhhhXpXoDDdXjx+mHu4jwo
	YVxxhxsADC0BQuFUhSXb+Z4HKA88CiMOJPWhPKjpYNcyiBTWts38jwDYkor9d7MEFAuzLX+V8Jm
	zeB2o0+HDNoVmFhH/laA6RBlYwBMghwSL14XuClj2jiLgF5KcpioQ6N+nrsYyA7FIA==
X-Received: by 2002:a05:6102:2b85:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d0723d2480mr6676218137.0.1793781034901;
        Wed, 04 Nov 2026 00:30:34 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8dbc439sm1125983e0c.13.2026.11.04.00.30.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:30:34 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7bec5112765so243983137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:30:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzr1ly4vzL0Uc98f5X0ybwp7A84mnWyl5wFoPsT1W0ldnCYdxB5cNTcxXG3nYvvEr8jtrQZq+EAbfq+RWQm9m3S@lists.infradead.org
X-Received: by 2002:a05:6102:8099:b0:7cc:bc0:b2d0 with SMTP id
 ada2fe7eead31-7d072d59168mr6120354137.33.1793781034293; Wed, 04 Nov 2026
 00:30:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de> <20261103-reset-regmap-test-bits-v1-5-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-5-1b33607a76b0@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 09:30:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8-8nEYKOB3Hhbb5DiXHcOgYaMCtJ0do=evQDbYNEMLw@mail.gmail.com>
X-Gm-Features: AclHuK8USmfzs7i7XtJ90bDmKjuz-weCg5Jo9uiJtfA3Xj-kpN0lb8TQTdngXvE
Message-ID: <CAMuHMdX8-8nEYKOB3Hhbb5DiXHcOgYaMCtJ0do=evQDbYNEMLw@mail.gmail.com>
Subject: Re: [PATCH 5/8] reset: mpfs: Use regmap_test_bits in mpfs_status
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_003036_658268_F1964824 
X-CRM114-Status: GOOD (  16.16  )
X-Spam-Score: -1.6 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026 at 15:53, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Simplify mpfs_status() by using regmap_test_bits().
> Now returns 1 if asserted for all bits.

and propagates errors.

>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

