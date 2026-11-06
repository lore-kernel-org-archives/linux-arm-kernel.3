Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D9F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ei6V90k0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N8+0WSWq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9q9/GucRs2rxMyyvIvEv5mBk2kzwKt0fGX5jZwrdxao=; b=ei6V90k0ddWxwN
	rtFQ4pb5xurjWWkwd6wQogOL9eOtLQ7asg8apWnMJEcVB6C4vXaMNcSgC3gcgkD5cwJM6X5kB8t9j
	jnKUeoXhMf1WL6RF2s1DG4S9wpTqBUn1ypN0Xt61McwtXsiuZMK22mYGuw2qQ3PvV30YCSxqaLsgX
	uNYuLoecm9gKiGb7x5seHWIf7u0WdlNrL0g8FLJf2IE/DIr2XAVSsWFT/ZAOhZ1RaPO7Shda0M5l6
	HRVxyZuiSJwFlalFOOxNyfZUHKxiMlaWiRxPdEhvshypgD2U+GJ2uaX5jEtYhaHD2rUYZIDPs4C1r
	6P0J1JqvF/bXguAOyrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKCG-0000000CT30-0Wk6;
	Fri, 06 Nov 2026 13:41:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKCF-0000000CT2d-0Y5X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 13:41:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A31C601E3
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 13:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BFE1F008A1
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 13:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972494;
	bh=9q9/GucRs2rxMyyvIvEv5mBk2kzwKt0fGX5jZwrdxao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N8+0WSWqUENHDaYxOsVVcA7LZmsfPVQI92VWEWfyZMBKB+rkuQzJDXgMaNXULrRAq
	 Wxg8GJjgx3A238dchLEhz6CvyfGxyA1sQGufprE/Y6zwjo6iV/ez3TTBhxmhBqDS/l
	 yyIjwUfhoPmGj7c/cpT91cowP0wSgHsZn3YjDQOdiMiujyCOIsZXGpCeiuC8G7LAYF
	 B0eHHGZ0VmF7WYY2Ih4WiEiCIGtPueyVdZaa/bL58U4SpjVHBRLPLwiBedTz4yBZcG
	 8RqyJ6Ue/U5PmsTJdGxY9xJzEgP4jLXilJSTEQXuyYAAJ7nVqxdNrb98St+7MjLoa5
	 iTjUNiQ6Zxb2A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so601885e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 05:41:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy2X07phADBcylxg15/CYf2n30YXzuLjqGg7Z6jici6vJmJpdTh862RXByJz0J8oDfRgp43kZIsUwyPXPbb/zxW@lists.infradead.org
X-Gm-Message-State: APuU4Z+v9PB3EIWHBAaJQnd8X55aXEtmMolC0lyI7mc9WEsa4jsea9dq
	u05K1Z6RZwuYoylZO66vVNfny0pg1sxl5jD+BYxLeSregjO9AofOff45Cu2qwh4Jm0idzdcd9QQ
	CGAsWMXjAWwyCzSWtqQrm4Motp8psJUg=
X-Received: by 2002:a05:6512:3c8e:b0:5be:50c0:9d1a with SMTP id
 2adb3069b0e04-5c003c1697amr924889e87.64.1793972492809; Fri, 06 Nov 2026
 05:41:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org> <20261106-outstanding-turtle-of-opportunity-9fafcb@sudeepholla>
In-Reply-To: <20261106-outstanding-turtle-of-opportunity-9fafcb@sudeepholla>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:41:20 +0100
X-Gmail-Original-Message-ID: <CAD++jLmYJM3VhKN00CjpRviQ4Zfr394c2o3xqZPqEZnq9yz-ig@mail.gmail.com>
X-Gm-Features: AclHuK9GhwQg2qUaY__IEUdcL3E9GYz9QB1x_ggUFxrkTttNeFsX88YL1h6CfOw
Message-ID: <CAD++jLmYJM3VhKN00CjpRviQ4Zfr394c2o3xqZPqEZnq9yz-ig@mail.gmail.com>
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Fri, Nov 6, 2026 at 12:03=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:

> We can remove vexpress-v2f-1xv7-ca53x2.dts because it is highly outdated =
and
> relies on an FPGA tile setup. Replicating this environment is likely
> impossible since the original bitmap files may no longer be available
> easily.
(...)
> > Rob Herring (Arm) (7):
> >       dt-bindings: arm: vexpress-sysreg: Add "mcc" child node
>
> I assume you will take the DT bindings via your tree.

Me too.

> Linus,
>
> Do you want to take this series via your tree or prefer me to take it ?

I think it's better if you do it because it seems you got thinking
you want to delete some files, so then it's better if you
queue all that in one go when you got track of it.

Yours,
Linus Walleij

