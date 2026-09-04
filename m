Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEA8C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iy22q1YzKGiQPGN9B1bpmbrGTjC/sYmYXe5uXN4aXJo=; b=DrZcTkpjiLnoT+yWqVgtucDWvf
	kH4N775b+U1YH94eziPxDMcDSYVvW1lrH0jXhYJoPwNJmrFAYc6TqvyNe8npXPTGkGuEVLgXSufos
	XMKSODSDZtEjNtB6sOp+92JQntbyWPVsJt3dFBIYx0SwHFANclBB0CiInPTiwwuXqJ1hX+g0sFEWH
	K+VFiRX+Ni+3Pv63dCIrssTTqa/QVoC9Z8ew/gph3UDXIsaCvkv6Z5jRjyqAzjFbS7LMjFnOI/dLn
	CkasV2pVBEai5VAIJGf/qSaH2V3DZ2JcCGTo3WcvjngyvlEiKJqUYd7lFdHumk8312hN5AwnJanba
	09Ad+Vnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2V7z-00000002QFv-2di4;
	Fri, 04 Sep 2026 14:42:51 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2V7w-00000002QEY-3Sok
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:42:50 +0000
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97e9fb0fc58so360118241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 07:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532967; x=1789137767;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iy22q1YzKGiQPGN9B1bpmbrGTjC/sYmYXe5uXN4aXJo=;
        b=c7GPvavhaU9yv6GwIUnIfQ0RahV1yMdXgIt1Fsru3Ef4Unsf9O/m2iLoadV9ecL4v3
         XWxceHhD/7teFfb5bPs61V+jTa4iIZp0e/gcSFgfubC8a4Ts1LAHv3iEzuS9nzpzx/AR
         yBj2w0QOFTFQ7NQMvKcqAxU8cskPP2JpUeeYn6f8u02fIEL8kK0jyX28c+Be/7rHFWiG
         WksXlmJCuoWkaGVkbV4bwxruSRq0jT1QuaVblyXf2PS+F+ME/QxvU/VvayqK5sqkKM3a
         YEInEJQuQexAOSGdktfLtz9Cnl///TzwxBwjETNdAIhcMJWvlEaXVX8tiz2RtJAvzNAK
         /ngQ==
X-Forwarded-Encrypted: i=1; AKwUvByEkQUi8+T165EefCAqGBspOYnXovZsipxENmfShuyAVKjjpe+svkpWJzOOCEUC9xpxagz0YjGXDK7HUWkpmKXa@lists.infradead.org
X-Gm-Message-State: AFuF++mSRkuDJgX1iS+7cl+2KqOZ7g7CrpFI3JvfPujoGS2HR9tPvyAw
	bjwRbuExQuMHcjT5OZg5OjgzB0FwbP2HVHuVi2Z8XRhuw0GIA+Cj3PB5d/lQPTvXhsk=
X-Gm-Gg: AYBFou2Je3xiOGUvyRY4eBZqLTEMv4mJ7FM0+4ujjB513wVMvbU/MB9WTIzyP39HalV
	WWhzCM8cduAWDEL2ylAu0v1WS7+d+svJr+Kpizq5zLPibBa1Zofw9qJA+CErDkjDIHFdGpfmVY0
	j4eA4wQvRs+hTFvWO9YUz8dhnk/8H7yRs8LcX2u+KeO+CRUrGw+e6ZXVzbfvSAlDUnUSyIRS55Y
	Se+JQQ4iXsDediI0F3xItg542/gUq1Y6euAwz3E98ZVSAUV4js+/MDphRbCc7V7mlnZQetTmsA3
	BEoqoLAhzsnYsW0yuI3Af/AKnfk84Rdh6oyAXawbwSnyBJHypyXXh2kyx8pSszXxxJWb1H4XEX3
	rrDd+UwD567MLhpjElokhyLkUMjoUvm01cO+Rx6XL8yocHXYygdO7RU+I4yUt4Tghu0bAWSEoew
	OLmPXgDYSx/71Ydg0eR3hMzxX4Bz2bhcWCmOHyh6rv+Vcql2lx9vepvfHzzPpb5r9yZAaI8ty9Z
	9LvYYvpvSIfSHed+DAast2HYA==
X-Received: by 2002:a05:6102:e0c:b0:778:721:53db with SMTP id ada2fe7eead31-78a4a4ca11amr1747119137.0.1788532967092;
        Fri, 04 Sep 2026 07:42:47 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b19369sm1907892137.9.2026.09.04.07.42.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:42:46 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-963f63fe025so398176241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 07:42:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzPtyoK66BirZdTT0ziLfHV6VYa239pfsO4WKR3O0yxHYaU2naInmFKlbYuUf55x0ZlF8Xk7k4fIrnndL9BttLi@lists.infradead.org
X-Received: by 2002:a05:6102:2d04:b0:785:eb33:87a8 with SMTP id
 ada2fe7eead31-78a4a883885mr1900429137.4.1788532960799; Fri, 04 Sep 2026
 07:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <2cf42d7ef9b452efbab3007ec2c2340cf87adbbf.1788338320.git.geert+renesas@glider.be>
 <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
In-Reply-To: <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 16:42:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_u1ticUomZffY8iU2GoWgyTNDPaL2O6KB7yucr47dDA@mail.gmail.com>
X-Gm-Features: AcwNN1WAkp69Or55f6uh4v6WhdtMEG7Qz9QclhM1mQOZ0FBl4cYNnC9KwnYi2zM
Message-ID: <CAMuHMdU_u1ticUomZffY8iU2GoWgyTNDPaL2O6KB7yucr47dDA@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r8a78000-cpg: Add
 renesas,scmi-firmware property
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_074248_872402_F6287FC5 
X-CRM114-Status: GOOD (  31.19  )
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

Hi Sudeep,

On Fri, 4 Sept 2026 at 16:03, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Wed, Sep 02, 2026 at 01:29:17PM +0200, Geert Uytterhoeven wrote:
> > On systems using the ARM System Control and Management Interface (SCMI),
> > the Clock Pulse Generator hardware registers must not be accessed
> > directly.  Instead, the SCMI message protocol must be used for inquiry,
> > configuration, and control of clocks.
>
> Why is this node needed in the devicetree at all or why is it not disabled
> so that any driver in the OSPM is not probed at all.

The node is needed so the corresponding driver can bind against it.
The driver takes care of remapping DT hardware descriptions to the
abstractions offered by the SCMI firmware when SCMI must be used.

> > Add a "renesas,scmi-firmware" property to distinguish between systems
> > with and without SCMI, and to indicate which SCMI firmware interface
> > provider to communicate with.
> >
>
> I still don't see the need for this if you disable the node, so still

The node is not disabled.

> NACK. Sorry if I have missed some discussions, please present the information
> as part of this patch in the commit log if not the actual binding itself.

That's why we have cover letter, with links to previous versions and
discussions.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

