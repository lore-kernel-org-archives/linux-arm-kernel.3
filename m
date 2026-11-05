Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D0C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jEhucjfI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kXFK+zVX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nMhxd5sX2bBZthIUhvKObHc2HEyCH8o/K6wybrIpziE=; b=jEhucjfIpk8HAg
	QQRkhzFsMsS+iSzVZQ0xTHjOSfqABpuckx5Y/fsD8IAT99PACD/TUjfQpZiBtpZQRfIUPWCAx1w4f
	uho4Po048YSmcAdPW7jIaspo+DeOBnEDQd+OsrYvEe7esog1ObOJrNjBm2bLpZSOOHk6A5DXhI4qU
	KRGsp/ddeXDc6yAdd4tCrpPpQTtLBdTVbwJvcm5xKBzJVFatLuAHCoRqjtCh45HvYjwIQwo5UTx0S
	+Z2AVRivlwYndzSntE06A7lMYyLqTpnk5qHDSlT+cLXomD3An4At4U/fuzyKxy2O+CXjmlog7h1l9
	tqnvKe9aWPwVg6DLyvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtvS-00000008Kz2-1HAl;
	Thu, 05 Nov 2026 09:38:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtvR-00000008Kyt-2IYf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:38:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0501360F34
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 09:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDA71F00A1A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 09:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793871508;
	bh=nMhxd5sX2bBZthIUhvKObHc2HEyCH8o/K6wybrIpziE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kXFK+zVX0EsK1vdvshuHnv+dAW+NeX2n/SI/6ZgpuTiJ8A1HoPcAGd6OuUgLM5IgC
	 6JVMmopN1nDQcpJYTEYSvht1g8v6z9z3lsvkbs1IT/+91QFgGW+VHfczHmnv2uMff0
	 HVAMq8Baf9wJx3i0ZIT6k3X+ZKgtX8+LehISe2S6/1TJsAII6ImtuqP1+fwJrMXi+q
	 MtiXE+hHZBC1lyCOrTzlghYW+uhH23VAMO6NoZhrkO4sebGJfSNQYdRAH4o7UGACud
	 CcyPu9ptrqzdWQFwLR/uziFgUHydr3zVdqv8mmloRFEh9neoEqXk2e8YngMMJ1XsDy
	 FY9yoS1QNdcOw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be416e603cso1108903e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:38:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBycN6mf+Da9YWvCZxmPeI1mxgP7Z5Yi162hzVV6tFFK32MjRtPv0w/HJ4a1kKck0AAwGwaeROvVOEZF2Jf9TWUS@lists.infradead.org
X-Gm-Message-State: APuU4Z8xZEgngXFdyb8cgPpJM5TyhiEh9mtwlAGO14CKN7I7nRc4H9rf
	CskkXGzbljtEHJWtUvYzffYawpsFT68sjcMQcO3xJwZQmJfaCw85VGT+vfEm0kcq3/gYK0PjguM
	ZvXots2P/tU3bEKvBrQ8yVV4yk6Wa1Sc=
X-Received: by 2002:a05:6512:10cc:b0:5bc:c228:1d75 with SMTP id
 2adb3069b0e04-5bfd957698bmr6814971e87.55.1793871507492; Thu, 05 Nov 2026
 01:38:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-multi-timers-cpufreq-cpuidle-v1-0-c7fd14706715@kernel.org>
 <20261104-multi-timers-cpufreq-cpuidle-v1-2-c7fd14706715@kernel.org> <96fdaca6-5918-41b2-9ec3-c69ba6da24ba@kernel.org>
In-Reply-To: <96fdaca6-5918-41b2-9ec3-c69ba6da24ba@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:38:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLk=uWQ4QQcd+kcm1jx4bqGpAAa8LtgeKFZHRfv6mr7x3A@mail.gmail.com>
X-Gm-Features: AclHuK8I9fAKU9f7FrsFizavhu-R5ehiVY76LKNeDnoalMyplV6N55_ihKEM6Rk
Message-ID: <CAD++jLk=uWQ4QQcd+kcm1jx4bqGpAAa8LtgeKFZHRfv6mr7x3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: configs: multi_v7: Enable the TEO cpuidle governor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
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

On Wed, Nov 4, 2026 at 1:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
> On 04/11/2026 13:15, Linus Walleij wrote:

> > The multi_v7 defconfig already enables cpuidle and idle dynticks.
> > Select TEO to use it as the default cpuidle governor instead of menu.
>
> But why? Commit msg misses the main point here.

It's in the cover letter, you're right. I'll just copy the same info into e=
ach
commit.

Yours,
Linus Walleij

