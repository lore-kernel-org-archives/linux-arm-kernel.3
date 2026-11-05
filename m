Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC3A606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i3059VY+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QzaPaUYG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Xttwb3ALnGWe1CpyQhX8yLnDD5ytpmDjGeCZQnnf2bs=; b=i3059VY+e9tb/9
	CGWNytKOzchIIZhYeyXCTX4W/xv0gXLU8XDpQYuW+PAYnVQvXhlHUdvss3Td3Q7U2e5UnqpHr2Dy+
	cDu0dEoVzDjZqXCpWmVLjHtgTEFPQrJThKo3RBAi0MqAG583ob67+Xnyt44vXM92kA5T4OeFc8wFu
	YkdswX9SSvctqMcfZgqtRYqlBflr/y8NIxIEUGU53tbaDScndwVFPPTXwmmpHLaSIuXdDBK2Icuxh
	eX/nAPK9ha7BjjmnSGhQai/R3uA1lJOtUGfi2IL2I5wm/PIevYJf2eKM3ZlyT/XjWfbCLSegjmnqn
	LVwZujixmZICfNIvfDAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtty-00000008KaO-2ndb;
	Thu, 05 Nov 2026 09:36:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOttr-00000008KXH-2Riy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:36:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E462460F34
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 09:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988BA1F00A1E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793871410;
	bh=Xttwb3ALnGWe1CpyQhX8yLnDD5ytpmDjGeCZQnnf2bs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QzaPaUYGOBR3miwPVDWhr7OJicYxq20cxOgZyT++3qWCbEM7FZ8rhypz6I3IeYdhq
	 eDuYGm7pDZ84OJxav2DOY3acgUM+a/AQrvXLypZannpFbD8gwZ0Ncv5Jd76gkBxEd1
	 IJzJvZJonAWqwf7y2TAFJsAZs93CI50xZ07RfetsXojc5/yft5sm9oT90v457/4wgY
	 PNlFdBz4qbSSQYhdiqPbinHDlyu7moaDhx7JEa4MziUoBb+XeFOj6netvQtjygHbon
	 7UnO7T8+RgPUcfGL/AvyJ2zb/eSbgV+0vFpgz5g4zKMIC2jFlUPUV8uPBNio0cclbo
	 QgVDz+epi2jrg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1319168e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:36:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwA3FE+WNFVTd231PPW3WiCj9K/UPvT7FV6rLLUVCf7VjHnMCTXZPFZSAWGRXGrW6VGuleQ7Hqkz+JoFQIKX7bB@lists.infradead.org
X-Gm-Message-State: APuU4Z/TduyN4gAMO1+fDNWyuLSwHSZI3ivkgB69AgN3g2xQu00OqZ33
	WLIYYlJi6Ldl+sEjNcRNU9RTwWj+YBSPX0buyjSBZK+HRAnLrWSVlckOFms9Ze8UvZ5ccICiVXT
	3NTG/ydmocM150AZ5x/psyrFgmvhfVkk=
X-Received: by 2002:a05:6512:33d3:b0:5bc:c9e3:d5bc with SMTP id
 2adb3069b0e04-5bfd9584f1amr6097727e87.29.1793871409322; Thu, 05 Nov 2026
 01:36:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104113905.96582-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20261104113905.96582-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:36:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLmQb_tk_1gXOVavVCnUcWGihBkCm5Bmww6Y+Yrp9Ka1-g@mail.gmail.com>
X-Gm-Features: AclHuK8pW7D9RB9awGqdcgXKLChyrlrBOvB5_MS58ipV8Yromw29U_dlx6MJAjw
Message-ID: <CAD++jLmQb_tk_1gXOVavVCnUcWGihBkCm5Bmww6Y+Yrp9Ka1-g@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chester Lin <chester62515@gmail.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
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

On Wed, Nov 4, 2026 at 12:39=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> The SIUL2 pin controller provides the pin muxing used by peripherals on
> the supported S32G boards: the S32G2-based S32G274A-EVB and
> S32G274A-RDB2, and the S32G3-based S32G399A-RDB3. Without the driver
> some peripherals never finish probing and a defconfig kernel cannot
> boot to rootfs on these boards.
>
> As the driver is required by every supported S32G board rather than
> being optional, make PINCTRL_S32G2 default to ARCH_S32 and keep the
> user prompt only under COMPILE_TEST.
>
> v2 -> v1:
> - list the S32G boards that need the pinctrl driver
> in the commit message
> - drop the v1 arm64 defconfig change
> - default to ARCH_S32 in Kconfig instead

No Signed-off-by.

A reason this happens is that we have instructed coding agents in the new
AGENTS.md to not add Signed-off-by so that the patch author always
will edit the commit message and add their sign-off manually.

Yours,
Linus Walleij

