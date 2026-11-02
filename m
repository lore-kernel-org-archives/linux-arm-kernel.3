Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB4F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CoQtLDow;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kouic5Ck
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kfdLzuznSP86OXMBv2cc50+pGlhDjviKqnXgIgBSXeU=; b=CoQtLDow1vQlq4
	kHgUp67SWqiN7PMhFkNCLHbClT1YtlNLxXgXRagHi0ROVDWKtR8FhwzUk4gxBdf9R4f3IqlJQv+Bm
	Emsl2phPDKBSDbw3qPtwERdLz0FE4ccvEwiAi/FtVhsNndpOTkMl3sc0E+/FiqgUsw7X7+r8VqcD3
	uJnqXpMszangTCPycT098q/h9xx9EVg/jMvP14haF63qvdvjLgLyKFNZbpJ03MGCpxNv5KhKt0jJ+
	iB41eCf603DIerBMzH+ILG3GL8lPlO1hdLqUACg2w1ZJkKBrHheAr4RFJr5PCzN4V9x3jrnFhY/Up
	BjO6qGPgZTpshLqaEnRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmoR-0000000FnVh-37yq;
	Mon, 02 Nov 2026 07:50:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmoQ-0000000FnVV-2cRR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:50:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AD7B43DF5
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Nov 2026 07:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D181F00A1D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Nov 2026 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793605838;
	bh=kfdLzuznSP86OXMBv2cc50+pGlhDjviKqnXgIgBSXeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kouic5CkKUn0X0KnSs1wuePb74UNjNwda3bpX00QX1ekyyxJ8FwaWU3wP6Wy1IN/B
	 rAMHTltmOUpaLKipGg6UXleSHzozKeNbk1NWDAjRo0sgHfjHsyMhSGhH6iO1dBVQ+x
	 O3wh6WEDtQyTPj0Tk8qUxscxwXYPtvvQe6M8/etT2g8vmZnAJFnozckVUM+UA4Nt6Z
	 1/3x74j4R85qqXqkQiW4oTvR8nkZat3STfaBOBrP0wQvpRxp0PcWGp/04hHE2RjGls
	 nxRAMLaE6uXGmcoOdBRq6nilE9wX4yZbwz12Gq+UJ0a+bbyBvZDW9XdMYF1JV0TsEM
	 mbsk19b5t2r5A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so2543246e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 23:50:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByB8myE2DSrJ7GuJg46LmDXHznzqOKMaLOwIE56RcvkV4x54rjug9lpq8THiNVxsjg/BXytW+JdL6sowDwPmtgw@lists.infradead.org
X-Gm-Message-State: APuU4Z/JWqTZhqF9ZlpDR6kIlMtHiTs/G/UHxv+1LMm0112y7TzoIMD/
	K6lwzW3DbDbQBnj01EgKZexWIaZ85PMGvDf/k645SncAUh5ugF8ppbQB8yXkdtJR51ayIzgTFd0
	bmOt/iaTN6C7BIvajy4Sfga0TILbbUFM=
X-Received: by 2002:a05:6512:15a7:b0:5bf:a7d2:e8a0 with SMTP id
 2adb3069b0e04-5bfd956a316mr2897713e87.24.1793605836758; Sun, 01 Nov 2026
 23:50:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org> <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com>
In-Reply-To: <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Nov 2026 08:50:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
X-Gm-Features: AclHuK9dC-mcHphjDYNUk7hAmH2idhA5q-arw9O8qj4lPel0YZKSwwgRuar-Ksc
Message-ID: <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] BCMBCA PMB clock, reset and hardware monitoring support
To: William Zhang <william.zhang@broadcom.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 5:33=E2=80=AFAM William Zhang <william.zhang@broadco=
m.com> wrote:

> > Inside the PMC is the PMB, the processor monitor bus. This bridges

> Should have pointed this out last time.  PMB: Power Management Bus

I think you did point it out, I just didn't manage to change it everywhere,
hopefully I only missed this one...

Yours,
Linus Walleij

