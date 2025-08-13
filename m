Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE9FC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 06:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7BUrhaHlE+9M6miAsWQi4bAbzafiOq8uvLGBAzIAq4=; b=CgTDeLwP8d3smNeMFN5AMq5rM5
	XaNXZPYEj7fK9Fs1YtbK4etNkMxa40BkgbRcZ/7La8Ur7Lu0UDyJb9wdrvCkPOjmuZvwGZDwEoxLT
	5oza8rIRknV8pQQruUxPHKicupL4GvKiH1mNoyMTbeBXFdb8K7+1CeM9TUsgWtNM0TC9+j5w2TmY3
	vctJnDe5J5UCpIya6PHp6VqxBlDWoKHUiknhL8XLfiSKdNR7esctXENH6GCK3ryvhcd5PT1Qs6s0m
	nmQEcaEYFKLghk3M1/mIdes6XUTys7BTZBgoUkiWBWN+9CnPEegTNGJc6353FfBSrEz+UE0F1r4Rt
	FS5POTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um5Cu-0000000Cp3B-2kPj;
	Wed, 13 Aug 2025 06:43:32 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4rh-0000000ClrH-1BTm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 06:21:38 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c1yv037m5z9tqW;
	Wed, 13 Aug 2025 08:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755066092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7BUrhaHlE+9M6miAsWQi4bAbzafiOq8uvLGBAzIAq4=;
	b=HzBv5nVGPMRSRR+YMjdElj5iR8abwMaCcLgwvslaKMttaQtz7TZWp0D012lWeiC0mBQwP4
	iEL5a34Oq95fDINHh55H2Gp7jkqaaQDR2IoY2pokHWu4pSBw6ljpXomuBNJb3QZzNPkOnT
	XR9ZatcRvodI6+Svxi0KIw4EICZ1PAc7PEuURzjEL8lObPgg4eaARKRYl87L6chkacD1Jn
	JDLK3BkUw1CijUJOVH3FsvTXVTTft2t35KdDYvwZwlKvtai6T28u7VZEJMocO+eKxPJMW7
	ekajwyq1V5ZRzZsCgN/IcnmItCdxb0onu8FoR+FwzFm/AszAdNJ912RsSsJJyg==
Date: Wed, 13 Aug 2025 08:21:25 +0200
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next RESEND v17 00/12] net: mtip: Add support for MTIP
 imx287 L2 switch driver
Message-ID: <20250813082125.7ccb3089@wsk>
In-Reply-To: <20250812185044.4381fae8@kernel.org>
References: <20250812082939.541733-1-lukasz.majewski@mailbox.org>
	<20250812185044.4381fae8@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-META: uwo1t4bs5scuz11ixqc31chge76m7mni
X-MBO-RS-ID: aec305653413cba275c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_232137_502644_5BA01768 
X-CRM114-Status: GOOD (  14.02  )
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

Hi Jakub,

> On Tue, 12 Aug 2025 10:29:27 +0200 Lukasz Majewski wrote:
> > This patch series adds support for More Than IP's L2 switch driver
> > embedded in some NXP's SoCs. This one has been tested on imx287,
> > but is also available in the vf610. =20
>=20
> The arch/arm patches don't apply to net-next any more.
> Perhaps we should take this opportunity to drop them?
> We will really only apply the bindings and the driver code.
> dts and arch/ code need to go to the appropriate arch maintainer..

Ok. I will remove them from the patch set and resubmit to arm tree.

--=20
Best regards,

=C5=81ukasz Majewski

