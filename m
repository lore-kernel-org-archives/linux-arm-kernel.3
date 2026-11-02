Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D45606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=joWC+LMf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xvj4Jys2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+KNo4bpud+SMYchvK5KCDswdCQ037Y0sDC1uaSlb35Y=; b=joWC+LMfgcfZ1r
	fOsJPZy8kBR863MvyhADR0OADYR2ptv1tbkzKOvVswI/3F4hg/lPAfw3/EPjSHEqXwFZMyKx4iJLI
	EyU331wFERiavDhG279+MMz8gzR3rRx5hq3vR9Cjkgx87k+Ap0N9y6RHh5g/Rk23H1/SrWJn3nASR
	cTDBJW2AJp9fo00Sf/w3KxOzCJWHO2lqFTweeYcEXJcjCu+9fYuFgZBiOAwqz3QS4AWNtITFNRRlq
	Igo8hWXcil2mX+KUFl6KuiG/h8g+O12idQagonfgclmUc591Lo5ztYNSTIcMMBQulT0D2zsXOiM3+
	PcOT0USbHnqfwqyiqCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs97-0000000GcTs-1HeO;
	Mon, 02 Nov 2026 13:32:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs95-0000000GcT5-1ku8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:32:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D31D243CF0
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Nov 2026 13:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84901F00A1C
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Nov 2026 13:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793626338;
	bh=+KNo4bpud+SMYchvK5KCDswdCQ037Y0sDC1uaSlb35Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Xvj4Jys23GETo9grfLKMbvGSh4RgLw8HsL6f9b/mbpgnyy/pKYBZTFLhYKpZLQg6H
	 eufN+0t1CG+Nn6Ru4WCURQFx92w1aPoaY4k0AxuwOeRnebPpYtwpmow5ZYkyC2Z1lC
	 GuM6/I+9vDPnlDuALgVNJUqAC3AtA8EQjW0gZqjIWzPw779QKPlyYa7BfAKS2uLYN6
	 X3jvMer+WxHs0dd8LrPgeVnsiGPWarPBMAdukj3Bc5kgQmC+y0LRJQLUXztDevdpDA
	 x/fz+si4fpVRE0M8+bLkvaZjJrk5DC+VLPO8vprdqT17JBXWvq8p64g345ZcthTtOS
	 USJGxDCz6vZjA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so1807996e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 05:32:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzZBH19OuidYOpYxkGP113eu+FN+yqs3tHeG/m2eO30K5R3SKa/SxN/Uf88d+fafpIlOLNjkQ4YhRcWBejCpYr3@lists.infradead.org
X-Gm-Message-State: APuU4Z9XGEfzJj1eRRZdAUq+iNRzxDvvp/ouR9d3Faz7R2dieslwoYGk
	6qiBgxPqMmlK/3Lnal+p7vLk9g3ADIv3TLLpMS5XpFyvdrW9VTwDw0Cc5RuX6oYhQMWVjuLMdwX
	8tEm2XObxOvaetqO54sNCkSO9i2F6Pb0=
X-Received: by 2002:a05:6512:230e:b0:5bf:b313:993f with SMTP id
 2adb3069b0e04-5bfd9563266mr3175580e87.18.1793626337495; Mon, 02 Nov 2026
 05:32:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
 <20261025-genexis-xg6846-smp-v7-3-rc1-v4-3-b352ab54f46b@kernel.org>
 <CAHi4H7Gc9_b0L5xdEBd7dVdbYMUirWm4vSVaSpDDB6yZP8NSHA@mail.gmail.com>
 <CAD++jL=sYrL8BV6ap2POTbT5=4iPEjG1mAUexwexiiQGqEUwPA@mail.gmail.com> <CAHi4H7HkCPWTTMW8tmejx0Cxojn9Xq_Jkm09nH-=v3tJKUGa_w@mail.gmail.com>
In-Reply-To: <CAHi4H7HkCPWTTMW8tmejx0Cxojn9Xq_Jkm09nH-=v3tJKUGa_w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Nov 2026 14:32:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLny6x9u3iFH1HnmeahSBshzghEXvGFpdFJHN4kzwrrWHA@mail.gmail.com>
X-Gm-Features: AclHuK9aAhqsiw-4JCsbkVqcNN-7vMsWqGS51RqakSrrCdq1GW5KD7oX1FrUGSg
Message-ID: <CAD++jLny6x9u3iFH1HnmeahSBshzghEXvGFpdFJHN4kzwrrWHA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
To: William Zhang <william.zhang@broadcom.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Wed, Oct 28, 2026 at 6:03=E2=80=AFPM William Zhang
<william.zhang@broadcom.com> wrote:

> > > Nitpicky. In your dt-bindings patch,  you use <0xff800568> as example=
.
> > > I guess it is better to use the same here to keep consistent, althoug=
h
> > > what value doe not really matter.
> >
> > I did it this way on purpose because I didn't want to put 0x00000000 in=
to the
> > example in the binding, lest the DT maintainers would complain
> > about that the dummy is not a good example.
> >
> All right. I don't have strong preference either way so it is up to
> you or if anyone else has anything to say.

Me neither, I'll do it any way that makes Florian merge these patches :D
(I think Florian does the mach-bcm business?)

Yours,
Linus Walleij

