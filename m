Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30938606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xGWZENoO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nQBpIvu4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hs6z4qUCneEFm9kHDK24+LRTeO4FQK/dQ4HNM7ckJB8=; b=xGWZENoOpDOFAg
	HhYJJu0xWcnqAVMYafFfYtLkFKAYliWF2wj4KmpddcXN43oHbFZI5iqZkHyqC6Za/R8wWdRN6/ya/
	bQUX461T1/th5KXhEPtT2YpJ1Qvx/g5xWBK13yr6Qi/lm1sG2u0GAdEpGVjzpQC+yNTOruk/R8dk/
	RaY8fjkCIOngpdrheG5TYUglE2C5iMSF+3PUZ4tLyJWPCO9/Im1tVbBajqXBqNUuS78WaTbjNX1w7
	raOkKxUrm81e6H83oixiTVa+Te3InnZp58biD46nrT9kVfdbHuEhOHJtjzatsMBoR5s0CiAhXg5Tl
	4ZV8srhetuZ6ZKptzx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwL4-0000000EZIo-0VAj;
	Thu, 22 Oct 2026 17:12:26 +0000
Received: from mail-ej2-x07.google.com ([2a00:1450:4864:34::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwL1-0000000EZHy-2wNK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:12:24 +0000
Received: by mail-ej2-x07.google.com with SMTP id a640c23a62f3a-c3e0e38c8c2so777366b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792689141; cv=none;
        d=google.com; s=arc-20260327;
        b=E6MzlnVfD4DHhJvDCnH9siwBWmtvgZNqHi/3BHXJ9AdUltOlH113hgh73Mr3ULBSyg
         NblLbYwWzmiIo92EYLozmqhMWXwSfKbx/ta+BT9Rjqw02QLxERM1HRZr4vzILoBs6Jvv
         NmqzZuI5U4pF/HcPnTS+jtpXXf1j+BPHBlkzt00S6EJepTE0wABOvYr5TEmLSJgRKdfG
         3+2H8DKV2SHJbM2ecES2FiTrLy37jwbXWQ6zbcAALYDp1xYtkOEoqXmExMwcbjpa2rFz
         xOuZFqfFVE2fz+ScP3oOmKdtDhsGwW7Ljd23MsTTdWdiSqTBjiwuxD6IDbLdzV7ZLViJ
         YADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hs6z4qUCneEFm9kHDK24+LRTeO4FQK/dQ4HNM7ckJB8=;
        fh=NlZbFVwmGwoKUQHZKcjiK12eN6RffDmS60HwUbZN/lg=;
        b=U4o1pO21kJi05U5qd8z9S+KBv+/LmfxK1XO3FE2IGwbvobBkoHk4zn62VZaz4cwM1H
         f20umsG59rZ2x1NTq6tUp77MUEulUQ/uBPqTgKg66/68PnluC8UvqHeStg0vTTT7wrDW
         Jux4HaXD5quz4x9QVbx7DE+56Z2hmkXJcMAGDhwtINsLSqDNL+dQnMCzhdCdk7HzuV8s
         kxTTf4HQO9Z0wOb8LDBv4dkW/41QdYy9U98aBorlwUuM2ryrCv8RFgQSAxc1NTSR0ZAw
         5Lb/PFnyXWK69j5tDGmr6KjjcPGXFYTYh3yYXI6IpnJbwwNgEPNTTljTEkfZZz/0jZi9
         BHwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792689141; x=1793293941; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hs6z4qUCneEFm9kHDK24+LRTeO4FQK/dQ4HNM7ckJB8=;
        b=nQBpIvu4uZjGf75T7E4EvexMQRjh+7xLzVCMuIz8xI1P0eHe0LRCl5NqQbPx9br8I/
         zfNiQ+KC8NXcwBEzelwVuL5b08VyUEMVdNbLD9N2CVXbh9Cq+k0DNVlTE5WxRULu+67D
         taUfwExLeRbWPjrUE3RpX9XrPzV6lt5Vf3aD/PE64ZFVKlGJybo44+gui1zo4pIYbF9C
         wsyfOqBqllMaYy0DS1kJcL8tK9R3sHjrj+wZnXHHXXkaGCjrGpIsR5dA2CXxptMqhIZh
         /IX/3r0zolfovG7FnvsWHp1iJOELJBEt2Y59oSskaoa1PIwbk2BM2gv1o1GlPpiNkYl8
         j/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689141; x=1793293941;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs6z4qUCneEFm9kHDK24+LRTeO4FQK/dQ4HNM7ckJB8=;
        b=ERzBVJecytmdAxIGIdsm38rJIZxN1qv5I9JUQoUlJaeQitXsnBcFss3RZLwNQycOZd
         z9dlG2oateqNh22D6EHWOA8yhhM/YwYO+IczyZAXp7rD5ayub1zdGAfAUUyF8BeF2dOL
         Yu85WMf7k9dxz/wXQzNXNEXni485vcq3P3GQMUwkKWlvyuJJscBoPho/Heq3ZEg23TXU
         eScMNXZIR+Jpv7ceZOh9c0zVB4dcH8Y9rikepTcxBG7umk+yXTNiAud8JG4bhwLlgWzS
         sRURQUej4Nl8ZpF1drcen65AwXoEtmSSxOv9TQANe8TQlA3vzk0fPNFl4lOoXVB49+UA
         QsBA==
X-Forwarded-Encrypted: i=1; AKwUvBwuWjEOPUCf7QngHTYahlbMT4f6IzrXNl9o993Ucvs6I+8/0LHCZBF5bL15C8ZDEYjw20I1C2vyaEecXgXIBVGZ@lists.infradead.org
X-Gm-Message-State: AFq9FYKd0Ge5pc9FRAyO5a/zSQJX+4yLHiYLyOIXaD4kaIyI6eo6dqhN
	+yl3VI0qYhTxfzDJcAn8EfFqpJihfKtUIl1qqFolRUrdhVUSDY88AIpN3wLIuhweqUp2VCx4Ar1
	nXd0Yo3V7dkx6AwnmMXzJf32oXnL09zQ=
X-Gm-Gg: AYBFou2dKLMrIReSu8yGEtp3o/6/UMkyACyctxcD0q5spvucB2oflC6o1HBkZHl6xD2
	hLVz+CXBaUSzFlW+BTJVIPbzh8ti/bjqX9hgfyzXLaiT/leI4R2auy86aufIuRz1MeQhXgyXG5H
	zkGwH3j1g8oxNpq+xnnBOvZGHcEAOiIZV3z3qI1NI24NQBjrUAIKMbWj74TrOL3cL1h5ODuxRIj
	3yrFATpzwBpG+VOw+JzTIv6oqKVPVaqkuvDoe7IarZsV5ejRMxaKAjUJrqei3Gsvk/G1UQk8gi9
	b8ltCByjrY/+TnXB5weUqTfSGIVDcULrYdMc0hHRw3C3296gPx8+sem61WABJJN6NZVJtGzF0cf
	zFRV7hfdcDq3bKRaTY+mCNpsk9aYExEp5RKZYyZUMXTOdYfI2tu/uTAd38em8
X-Received: by 2002:a17:907:1c95:b0:c26:19de:9aec with SMTP id
 a640c23a62f3a-c4679b577d3mr599686166b.43.1792689140926; Thu, 22 Oct 2026
 10:12:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022025844.150320-1-coiaprant@gmail.com> <20261022025844.150320-4-coiaprant@gmail.com>
 <e7f68299-1c0d-4b0f-948b-4835086c0df8@lunn.ch>
In-Reply-To: <e7f68299-1c0d-4b0f-948b-4835086c0df8@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 23 Oct 2026 01:12:07 +0800
X-Gm-Features: AclHuK9Aw-1KGTe0rcDr7TiLvHCZz-VKOsYzCIMnUV4-DQLpiOO8Gle6TTGKUh8
Message-ID: <CALj3r0gMA45HG2khs2SyehftU5KAHR5i7__CKXSZR8GSE1Q19A@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] arm64: dts: rockchip: rk3568-photonicat: enable
 SGMII LAN port
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_101223_822852_F0CFA767 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B410=E6=9C=8823=E6=97=A5=
=E5=91=A8=E4=BA=94 00:58=E5=86=99=E9=81=93=EF=BC=9A
>
> > +     sgmii_phy: ethernet-phy@3 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <0x3>;
> > +             max-speed =3D <1000>;
>
> Pointless. SGMII cannot do faster, so there is no need to limit it.
>
>         Andrew

Hi Andrew,

Right, SGMII tops out at 1000Mbps anyway. Dropping max-speed.

Coia

