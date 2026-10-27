Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAF3606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hlVQ/8or;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/3197F/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GGNr41yBdTpZYx2SDxAZUmAJloAwnOll1e229XCkLow=; b=hlVQ/8orIk+aaU
	p0UelD54qHF+WtJCT2OMX80DR58+ULL/tEBeMEObQJwwaC2FkVVnk9u7fvctOIqntgjLjLfA0Qf2k
	23aSzHqyczWMCVXoxePsVQ6yQyskunpZaAobilZAwzByZgDPTCH2Uow8W4Vrt4b7RUQuumjFz6yJk
	20WMy9TySMReocsJTheV7T4/PqaxholPkuJKUL5f8fMX2NLlgtHhG7bRbG4Wy8O+/YY9LfN5S5eGY
	9L6eoXqVf/hvjNdGwYnXKTdz+5rzYXFcllcvsbYSy66oqLW8dihOTlIq3FOQNE425aZKbqRYP/DNb
	DrLatmhMCEklMyoj8yVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLi2P-000000050xD-3H9o;
	Tue, 27 Oct 2026 14:20:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLi2O-000000050ww-1duj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 14:20:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E63F543BB1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 14:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4DE1F031E2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110827;
	bh=GGNr41yBdTpZYx2SDxAZUmAJloAwnOll1e229XCkLow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I/3197F//5bf406jcAf97sCVxQOGKU6UQ+ppRF4YfsIIKbMuoTYo9LTj5Sjy3AD8w
	 KzUFb/HWCvyqo6L0w0RA7Mux0i2L9tlWeNARzqQCoTEuRvWNWYhZUgP4kshPwZnbqR
	 qLTdSi5pTD64Oq88TgupSzSmf5UvVYDrrasz4m671Snyp+Qd5JLlhhCzeJ6yacD0A1
	 ot3I4+kOrMBuvLutRTGJ/d8Tc0Og1ksLmp6oy4CedyYgX6NINvi1kEE5e0iYTsAhic
	 BWtWbqRrF12zvUIqmwHD09OsGL0TYIP5ow6FProRbLMo8vvbOqpDP+oG7cmSY0LqTR
	 dCULZxEgiBaxQ==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a71d0c4233so1681279fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 07:20:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSw4KLqIqJyB+zvTq/QZaVf9b2jm/q5EY7Gz3aujKR6u3MYjfGcf8V1NaD2BDyanTNXumKiz5gruapGWnIPsW8@lists.infradead.org
X-Gm-Message-State: AFq9FYJbVCIAcACXoJbRzhTjQT6mNPAhOiSKNItnWuO9/s8j3rbZIDux
	6oIKikwHtxOtaNYvrScihPCc1o+424VBPVvKY7M1txxaRV1g72JUfXj+Pzw1Ij52oce3sLWCaTQ
	AlWnjhsaD13rwzNQvhWIZ34wAFLONjAk=
X-Received: by 2002:a05:6870:c2b5:b0:47d:b8a7:40f5 with SMTP id
 586e51a60fabf-4a83f533260mr6584722fac.22.1793110827181; Tue, 27 Oct 2026
 07:20:27 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <cae27d2d9dd17c081dcea27e3b223a8fb8653796.1792776697.git.geert+renesas@glider.be>
In-Reply-To: <cae27d2d9dd17c081dcea27e3b223a8fb8653796.1792776697.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:20:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=7GkFOS9i46WDuKHcJa0S-VemJ1OW33H8EKK-SZ67ufQ@mail.gmail.com>
X-Gm-Features: AclHuK9MY21FRxc3OT2vCWHfUpZZ9cxWX59B-lOuZ_icl7P9J24tGPdGErZiGJg
Message-ID: <CAD++jL=7GkFOS9i46WDuKHcJa0S-VemJ1OW33H8EKK-SZ67ufQ@mail.gmail.com>
Subject: Re: [PATCH/DNI 7/7] arm64: dts: renesas: r8a78000: Add gpio-ranges
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 7:55=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Link all GPIO controllers to the Pin Function Controller using
> "gpio-ranges" properties.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

