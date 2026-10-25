Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B317A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 23:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w5ZejclX;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ToJEnEMm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1hVXHSSffpcrZE2/dIYy72FKUCCmACgLfbWxbiqGBxk=; b=w5ZejclXDpKM6n
	iW/NPgIlWm6SB3waYJrdnX/N4CXdx4i1zvp7rwSf/PIED1fl52XYuv24IskNmAQ6SsBBf/XjRb9yp
	RGnjR4HgfidNeqwkrtKE9y6JFwcUGEsyB8dJPzOF+0IFfMl9bnwu9fQTjmOPezP2Q6V38gbUiGXN7
	5Fg7/6j8gah9c1S8EiRemxBVdtyXJzCopTQaL4EpYj5nNsdr1R/m/ATWTq6RklRx7iZqrf/oac86F
	2FUosnGMl/ThFe/PR0uzQQmCus06QtQnimAuUZbBzF+2QfSJI5IM2JG0JtiDWIV2lPQ2Coo54KjWe
	inoeHB7vax7NhOZwKYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL7T7-00000001UwT-2WBs;
	Sun, 25 Oct 2026 23:17:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL7T5-00000001UwD-3Jo6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 23:17:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19B5143FEF
	for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 23:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DA01F031E2
	for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 23:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792970253;
	bh=1hVXHSSffpcrZE2/dIYy72FKUCCmACgLfbWxbiqGBxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ToJEnEMmIVfjGvCctb2YmRbovLJqqptQ0eSV3TAce8knL7eWYTU8PTmxl7Ld/AmZl
	 vhDC/HZ2XnCdjus2MWVCm+ZXiVoCJHpFf9z6J2Lhrb01hGUfSsZvElxkJlW92uZ80j
	 GyZ433ftSpxT55G0dDNI58CjFVBlZZqZ27zs7JnTQNCsEeIASZ+sgkJ7L0NTSXKEvI
	 aeI2yWENQ5WqhSgqUEQGZDLPbtwuMtZ28Jl+tZPuqHhe1/j4s4dmj8rrN/dViySDkY
	 VVm1d+x6wEsC0dO4zV0HHs+Mp28n52dYY+L7uTI52mzAYEeURH1tNEzfkZqB+VKhc/
	 CbGThHW6AJjOA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so3202673e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 16:17:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwR/gxAesWlI9PVzrpAOkC4LoK41QGCQLXuJTSLQ64SkcnL5MU01JaTGJgplhiJ6ulaMnZc1OEd0sfOX2eYbJSH@lists.infradead.org
X-Gm-Message-State: AFq9FYKd1846xu8pn4PLfA1ltFuhvSgYASWqcK3ZSrB7mGVMv3eFDBEP
	T73VuSTbUR2F0G6XC1xofOebXIW1sHZWPvtw7VB/3Dc0ZknjuPHI1cljVO5TPXvyapyfyiyjjmL
	m4udetY/vsSIUhR8aKLL6gSAadhXfN4M=
X-Received: by 2002:a05:6512:128f:b0:5bf:6c49:42b3 with SMTP id
 2adb3069b0e04-5bfb716e26cmr1579164e87.6.1792970251552; Sun, 25 Oct 2026
 16:17:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
 <20261025-genexis-xg6846-smp-v7-3-rc1-v4-3-b352ab54f46b@kernel.org> <CAHi4H7Gc9_b0L5xdEBd7dVdbYMUirWm4vSVaSpDDB6yZP8NSHA@mail.gmail.com>
In-Reply-To: <CAHi4H7Gc9_b0L5xdEBd7dVdbYMUirWm4vSVaSpDDB6yZP8NSHA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 26 Oct 2026 00:17:19 +0100
X-Gmail-Original-Message-ID: <CAD++jL=sYrL8BV6ap2POTbT5=4iPEjG1mAUexwexiiQGqEUwPA@mail.gmail.com>
X-Gm-Features: AclHuK8hWfyHYeZsI3EvK84CwASHP7zMUupYjb-JuuwHInkQdWD88LMlReS1FOY
Message-ID: <CAD++jL=sYrL8BV6ap2POTbT5=4iPEjG1mAUexwexiiQGqEUwPA@mail.gmail.com>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 7:02=E2=80=AFPM William Zhang
<william.zhang@broadcom.com> wrote:

> > +&CA7_0 {
> > +       enable-method =3D "brcm,bca-smp";
> > +       /* Dummy release address since CPU0 is already online */
> > +       cpu-release-addr =3D <0x00000000>;

> Nitpicky. In your dt-bindings patch,  you use <0xff800568> as example.
> I guess it is better to use the same here to keep consistent, although
> what value doe not really matter.

I did it this way on purpose because I didn't want to put 0x00000000 into t=
he
example in the binding, lest the DT maintainers would complain
about that the dummy is not a good example.

Yours,
Linus Walleij

