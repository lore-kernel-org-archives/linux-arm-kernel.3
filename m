Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EC4C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 17:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLWa8pfmRBA0MCYaPm56slHNdbjbr5WNg/DtpiVizww=; b=RXrug3d5R4cIuidd9x2T4d6qoC
	NeCq6VTkqvMs9ip62yWw3xWVyZJpCX7dFlhb5V6mMPUP9IySquPOizBOkJtftbA/yNk5mkmkF1kCs
	mk5MTMIlrVEs1gl912GfnFWYqfPCIoTyGGgXAlHD6WFpA6afV0gALazaxdsJBAI+0fGK7vNXHPD23
	1McZ7CXKgKdwJglLM74wiuVBHR7CSrTyinfHGRVidGgB7FVO1Qq5cQuMbUorfvrs+croO7fDMq3FO
	eOs3q45YfD7gncSkz09I5c2ifLmOFrS9l+leuvMX4dualPxytA3QYqQeNJfdp1U2zO68N0772cYLz
	oL66jkMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfsr-00000004kQC-0mUC;
	Mon, 09 Jun 2025 17:02:05 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOey3-00000004bdN-0NhB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 16:03:24 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e81877c1ed6so3850576276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749485002; x=1750089802; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JLWa8pfmRBA0MCYaPm56slHNdbjbr5WNg/DtpiVizww=;
        b=OUEroA6JiKRMo4ZfR4yloJHO4DcZRHSVZDNQ02MMWx9vo+shLAuQ98S81I4aYFpHrs
         uknhT9vsb4rHqSIlPGmduva6snxc7/i5Hy85lK9/wGLoowqEN9UqkRFstFxW/CNM31UF
         uV//afomCu0OFZlVoUB+ug2N9cnFiYHbj2IxRjYR0qhjrF3RJnYEawp5ocLn0ZRFxOZ1
         ZTswsaOrUMzdTXRHO4HQ5SRcfZE06rpV+Ztl73lS1EaH7aWGRIdbVy5ASY5ZE4rEktA7
         /m5thEajnG2uVweFw+IOEBWsdJy7L5BhrV0LWyDA9mdcZcke0uBjTzcMVp4YK6SG78k+
         61uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749485002; x=1750089802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLWa8pfmRBA0MCYaPm56slHNdbjbr5WNg/DtpiVizww=;
        b=LzO+lXdxzYyfVBQ00XJRm5z8dj+mlcfdj26CzTAX0nCznp2ZHxScASxFaE+TWDAGxs
         +AckJkFlZuQ/LwQ5B2pkIZmVdOrLstpI3keYK6tP4a8P9l9GmprQNO3KQaNr9dtIArCf
         uA0awEwby+JUI9OlpGSmira9+mOK60uCKtf9r/kv0ZeN/S7rposX/jQXM3JmwrX0uig0
         s80/fD1OolLBEIDhXxN5uAnyfqt20po9mn1b0Oa6WRQWibSrnR2IpXZhFkkzhZByDpwm
         L4qKY79sbpo51PMLi7b88oqLvXdkzVbxAyv43itQtNVE786/J1AR0HW/2/3WYT9bn+X1
         Rhfg==
X-Forwarded-Encrypted: i=1; AJvYcCWWbQoRs5a6gV0fVmKAYPDMBD843ItXhA3gfaNe7BtPlwlNAq1/QW4jlB28hYMlB2V/gO6fzorlRGlcKWZCta2Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxVIAcmbmIwXFy2/K7Vt/otYh6BZfXsiQTV56GM+T/2szjd9JGG
	xSDNsgvG7f5jczJ1ZvlAsdL2HYBfKYZ2jbbJuicm4opr7kDzxxvcq7zi+JKE7kNkapo89DMhKlf
	XUm88Z/5nwly4xltswchhWkqPUI6dzZ0=
X-Gm-Gg: ASbGncsg9gQpIs4palxIkDiHXUmM7ZKBVD6kth43jw0jfBOMKXnB1ypm8o70iPZd0PJ
	j3ig9k5bSX5o1rO1wj12GMcTccEKwJN59XliL2nHdoGvhgbC+EGkwNf8nMthKNqoyj5CqlY20e4
	PEbgPwQcROVLzQcFGdTNwvyw6dFlXplXE=
X-Google-Smtp-Source: AGHT+IF8YB2n9mCmYPR48pr+o1aUFiaTFY5AD9mJhNaEKQ1/FqOU/CjUow2q+WRwE9E4U1hY1d1vM5OnXCj2EM4U9jY=
X-Received: by 2002:a05:6902:1005:b0:e81:d2c6:814e with SMTP id
 3f1490d57ef6-e81f077a159mr173187276.8.1749485001629; Mon, 09 Jun 2025
 09:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250609140643.26270-1-stefano.radaelli21@gmail.com> <ca71a8b8-88b8-4d81-a17d-1b46e10e55a9@lunn.ch>
In-Reply-To: <ca71a8b8-88b8-4d81-a17d-1b46e10e55a9@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Mon, 9 Jun 2025 18:03:04 +0200
X-Gm-Features: AX0GCFuCh9zaVJsj5GtkuGSyeDwmhGTIAn0kUEeZIZink-bLJ3BuuR0gMcCu7GA
Message-ID: <CAK+owog8_f=s24NCbasLiNZw_zErqNpozU8uQvKdYbi=FKcVTA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mp-var-som: Add EQoS
 support with MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_090323_127258_70A206D2 
X-CRM114-Status: GOOD (  14.14  )
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

Hi Andrew,

> +                     at803x,eee-disabled;
> +                     eee-broken-1000t;
> The commit message says it is a Maxlinear. So at803x vendor properties
> are not relevant here.

You're absolutely correct.
The at803x,eee-disabled property is specific to other PHYs and has no meaning
for the Maxlinear MXL86110.
I mistakenly copied this from another configuration without considering the
vendor-specific nature of the property.

Thanks for pointing this out!

Il giorno lun 9 giu 2025 alle ore 17:17 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
> On Mon, Jun 09, 2025 at 04:06:42PM +0200, Stefano Radaelli wrote:
> > Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
> > integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
> > MDIO bus at address 4.
>
> > +             ethphy0: ethernet-phy@4 {
> > +                     compatible = "ethernet-phy-ieee802.3-c22";
> > +                     reg = <4>;
> > +                     at803x,eee-disabled;
> > +                     eee-broken-1000t;
>
> The commit message says it is a Maxlinear. So at803x vendor properties
> are not relevant here.
>
>     Andrew

