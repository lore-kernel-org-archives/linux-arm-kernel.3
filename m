Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA24C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 12:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubzGrW94MWhU2Fj0Rg0wOd3qcRVcxwxlTC0A4cHNNOE=; b=ru2DIDe7WXL2Xqgq9CoxAgbe57
	tgBWmLntvYaWFf3ua1m/ZJTRhFYLF5tUOHRuCBrMsMWxGjSXZaaKOVmJ7LP/iBdPx/slHHPknBFqo
	6symicQrZ4BGGq+EAcken3k0UAvP4qb2JnUOgpTYa6jwBU5hasfIiiKhxRjR76fGyyZcUD4va0tUa
	mmlBNqSMiauWsaWPDAsb3CY/RetNqY2gCBSZBpgCmsXDRQFal61zt4D3+R7G4+gmn5GpqKB/1QPFn
	lhPO+v9+sa0NjMKtp9dkbfDERCum69JtUcAfYsK661mhmeVsHwZi7D+4nR7qG/uq4ZY5O09xK9GuU
	mNQRwe7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoz3-00000005zNP-1sJK;
	Fri, 01 Aug 2025 12:35:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhokE-00000005oIB-2lRN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754050817;
	bh=ubzGrW94MWhU2Fj0Rg0wOd3qcRVcxwxlTC0A4cHNNOE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KcBU3NSwubUUuF9KiS/gQjFWpT21KyD6u2bv7ll3NLS4pb7kbzwbZFncK9IMCXLBB
	 mBPlYAZsmZjKeOX/i/zQwZMdIFNgIqWngHu1Xy9UawZFBMshodx1S7zJUlQKfdoA6f
	 rziJHy8oBrfuxEqGpbxtbD7HIuAcFNbaUZQyY2h8X3UyyUAuMjQ+KgfD8DosVl+gpr
	 Y+CBFo6J9qCqpAJ42Uz0znqdRX2MHl94cnryW+nJVSwFVUfoacRvMcOBOAWJXA5lAJ
	 C631lWnznDvdofbVGKiYC6BZLa41mIsWR+tVYc0LMFApbky+/L5owmH7s1hlJ6SL7t
	 m7jz7l5Mo0X/Q==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 421E717E046D;
	Fri,  1 Aug 2025 14:20:16 +0200 (CEST)
Message-ID: <b3efdf32df6a53f2d7783f2521aae3727fe1e59f.camel@collabora.com>
Subject: Re: [PATCH v6 04/24] dt-bindings: media: i2c: max96717: add support
 for pinctrl/pinconf
From: Julien Massot <julien.massot@collabora.com>
To: Cosmin Tanislav <demonsingur@gmail.com>, Cosmin Tanislav	
 <cosmin.tanislav@analog.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Date: Fri, 01 Aug 2025 14:20:15 +0200
In-Reply-To: <20250716193111.942217-5-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-5-demonsingur@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_052018_846981_509CD25C 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

On Wed, 2025-07-16 at 22:30 +0300, Cosmin Tanislav wrote:
> MAX96717 is capable of configuring various pin properties.
>=20
> Add pinctrl/pinconf properties to support this usecase.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>=20

Reviewed-by: Julien Massot <julien.massot@collabora.com>

