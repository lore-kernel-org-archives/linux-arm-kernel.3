Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9574EC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gd04OOLTcUdYHILu/YZcz4ZXhF6ZSYvXhUuGSBvshcc=; b=XCdl1eMeHw2s+dDs7ol+RXr9/I
	PglS4OD7sE8Lgrd1QZvf+bx0v7OJ/Tt58FFFZByD2YgQQqcHnM/GrSG0iLDnY7SXTivJEWuMHM0CW
	T0aJpX89KlBC3QlNPnNpOerT44lY3y27FyldoHdbh5NuXg5Kd7+il3CBsxniGCkmtyis4X5+A00sS
	UH92mipP/HrGQSrwsOKiiKxGRooA1NSKO/4GgpnGYQP9YKuy/sRFUo4EDGjDIsYWBDVCYfRoQ3Wws
	N4Soe9nFrOVRlFoTyqadUsnPm21adE/Y1LxWRi+hSp2DsTIaT6q1YzmLkc65y9ajhBq/xtWkona9s
	bxxhdReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpTl-000000063m3-0uuF;
	Fri, 01 Aug 2025 13:07:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhon1-00000005qVO-2JGE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754050990;
	bh=Gd04OOLTcUdYHILu/YZcz4ZXhF6ZSYvXhUuGSBvshcc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZMk4dJjUxi6IG69VDUmWevwMoCDLVrpBpl0bX8BtOzJMQIDWF7f4Kqn1fX+sfVs/T
	 yfgr1vkYrPUM4+HvbUSUI+PVSMnVdGDphw596c4IhvyfJuSiFjaaogUiCylb8+Br7T
	 wDQy77GwuxortMCiNCINpjJZhI6v57wlUH0uGbStMcA2ekAZrM8x4DvILEDEELd40V
	 AlZf9HlinXae4zySR2nZzGPrPf2RcO81n7S/p89n2drl+FjC3GQRBfIpdZF2xkVhWU
	 zszQ9TlNusXc4avQbBrcWEGlld+vi0Q0MJqsC0sL4syYmmEZi2agxQKimMCjPBPIxJ
	 Ow+02NjsWrFPw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8F85cf092D4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5919417E0DD7;
	Fri,  1 Aug 2025 14:23:09 +0200 (CEST)
Message-ID: <e65da901e52067b22ff463cd886a3539d11da88d.camel@collabora.com>
Subject: Re: [PATCH v6 13/24] dt-bindings: media: i2c: max96714: add support
 for MAX96714R
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
Date: Fri, 01 Aug 2025 14:23:08 +0200
In-Reply-To: <20250716193111.942217-14-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-14-demonsingur@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_052311_736561_84A95C44 
X-CRM114-Status: UNSURE (   7.90  )
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
> MAX96714R is a lower capability variant of the MAX96714 which only
> supports a fixed rate of 3Gbps in the forward direction.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>=20
>=20
Reviewed-by: Julien Massot <julien.massot@collabora.com>

