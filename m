Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97246CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 03:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BT04am3Kehc9aOs97jW5wTodqgxSkKf04K5hJUaJPzg=; b=dMPVbGsBlAFNqJ0ota3fr86X6S
	NNCIh5Yu4BpnhgpnKuJNekw8k4ApvdcrHDBIZh0XrXacnUwJFSanon81B8G4e/m8vkgYO7s7/ynwi
	YU2ede7FaXPf1vNxpRQYyOf/pLmsZex5+teFFytbrylNJOZeFhWGZmUClSCns48GMPbQIGkL7uRSI
	e3Oc2zGvNGTlYonazylVGMpmvgVoTpqf/i4UCT7ccrVyt0yBXk/7Hff/1CO/ObJxBuUO6PmxhqSiw
	rw1i0znRYb6R0VlfryZfNb+Je0y/WeZ++l0kEs93BWXoiWRGVYIUudx5ifVp7/zVtoTeBV+hN+qu4
	lPYQsR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKqMj-0000000FOf3-1uBx;
	Mon, 17 Nov 2025 03:57:21 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKqMg-0000000FOed-2ToO;
	Mon, 17 Nov 2025 03:57:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 8855841196;
	Mon, 17 Nov 2025 04:57:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763351834; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BT04am3Kehc9aOs97jW5wTodqgxSkKf04K5hJUaJPzg=;
	b=ReNdiVpeKrbgcSVmskmDotomCmwdsUx3+lrrU0N+K8oOwEV3dkiVyZQcohUTzaGNKRKgtk
	hYQeg1FoGF3ALHk6FnHSjPCylwzuNmoOROB/sIR2JgkwXRLPXXJyUkt5FtZYGs+l++rLVv
	j27F0p/AQ+LZm5JvqnMmp5we99oF8L1vBwyYj3OerttrRhPqqNq28yIBRY7ClbHIy/yamE
	lR4bThz0szV2dhvXjmty4JyC/IAItlWzSNa3kC+Md03xB4Z+TEZSUL5NgqEoLHZzudlAPP
	3yKvBIVIkDFCwAh8mhmlshQ5zUoBjFMjc8AkyMspHhP18woVqWhU4LspaHFCRQ==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <8f3cc1c1-7bf7-4610-b7ce-79ebd6f05a6e@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
References: <cover.1763197368.git.geraldogabriel@gmail.com> <8f3cc1c1-7bf7-4610-b7ce-79ebd6f05a6e@rock-chips.com>
Date: Mon, 17 Nov 2025 04:57:11 +0100
Cc: "Geraldo Nascimento" <geraldogabriel@gmail.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Johan Jonker" <jbx6244@gmail.com>, linux-rockchip@lists.infradead.org
To: "Shawn Lin" <shawn.lin@rock-chips.com>
MIME-Version: 1.0
Message-ID: <257951b7-c22e-9707-6aba-3dc5794306bb@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH 0/3] =?utf-8?q?PCI=3A?==?utf-8?q?_rockchip=3A?=
 =?utf-8?q?_5=2E0?= GT/s speed may be dangerous
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_195718_884200_FAFA1352 
X-CRM114-Status: GOOD (  12.24  )
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

Hello Shawn and Geraldo,

On Monday, November 17, 2025 04:42 CET, Shawn Lin <shawn.lin@rock-chips=
.com> wrote:
> =E5=9C=A8 2025/11/15 =E6=98=9F=E6=9C=9F=E5=85=AD 17:10, Geraldo Nasci=
mento =E5=86=99=E9=81=93:
> > In recent interactions with Shawn Lin from Rockchip it came to my
> > attention there's an unknown errata regarding 5.0 GT/s operational
> > speed of their PCIe core. According to Shawn there's grave danger
> > even if the odds are low. To contain any damage, let's cover the
> > remaining corner-cases where the default would lead to 5.0 GT/s
> > operation as well as add a comment to Root Complex driver core,
> > documenting this danger.
>=20
> I'm not sure just adding a warn would be a good choice. Could we tota=
lly
> force to use gen1 and add a warn if trying to use Gen2.

I think that forcing 2.5 GT/s with an appropriate warning message
is a good idea.  That would be like some quirk that gets applied
automatically, to prevent data corruption, while warning people
who attempt to "overclock" the PCIe interface.

> Meanwhile amend the commit message to add a reference
> of RK3399 official datesheet[1] which says PCIe on RK3399 should only
> support 2.5GT/s?
>=20
> [1]https://opensource.rock-chips.com/images/d/d7/Rockchip=5FRK3399=5F=
Datasheet=5FV2.1-20200323.pdf

Also, rewording the patch summary as follows below may be good,
because that would provide more details:

  PCI: rockchip: Warn about Gen2 5.0 GT/s on RK3399 being unsafe

Or, if we'll go with the automatic downgrading, like this:

  PCI: rockchip: Limit RK3399 to Gen1 2.5 GT/s to prevent breakage


