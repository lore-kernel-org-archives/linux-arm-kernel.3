Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7CFC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejxJxjGKAAfQRBFmJWKeW9bc62PHTjH8bG/g1795Hcw=; b=UmU35il0wzLS+475hAi/yJ2HeU
	ZNAst0tNh4psnan7VFikXuWUnwM/ShoD9Qf8+5psDwDAjWa9xhRayn1g+TViH6fBaJqz3+Xk0SzF/
	7dkSIrMAhZbQwvItgxi9pkNJC1zDxfIbGGwzXxBjWpsNJPj6C/MFiNd3SvW9PrKpjqt9dKDqQmjJK
	LfPGnJ3il6ZKyIBWCRijIkSyOlufmofWI3nliC7+a/GYrwWwAYyibsYB6AZvT256VBTebvU1XotiP
	avCA+MOe5DFClOOwYZOO3nwflG9229lJYVG5S7tz+dQ7P5K40SvJccq+kEbYa1Kp+LOuGkZhTWHce
	anFKIn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbKo-0000000ESG5-47Bm;
	Mon, 24 Feb 2025 16:29:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbJG-0000000ES7z-05p6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 16:27:59 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmbIv-0005GS-HA; Mon, 24 Feb 2025 17:27:37 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmbIu-002csr-0G;
	Mon, 24 Feb 2025 17:27:36 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmbIu-000DzX-00;
	Mon, 24 Feb 2025 17:27:36 +0100
Message-ID: <b00aef9582e223a5770cebc714ad65168eab744b.camel@pengutronix.de>
Subject: Re: [PATCH v9 2/3] reset: aspeed: register AST2700 reset auxiliary
 bus device
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>,  Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 24 Feb 2025 17:27:35 +0100
In-Reply-To: <d5d90f03-3db8-4f90-baad-0be4f3d3e0ea@kernel.org>
References: <20250224095506.2047064-1-ryan_chen@aspeedtech.com>
	 <20250224095506.2047064-3-ryan_chen@aspeedtech.com>
	 <71cf8012-3b77-43de-b8ac-54c84a97f9d3@kernel.org>
	 <d5d90f03-3db8-4f90-baad-0be4f3d3e0ea@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_082758_060771_963498AC 
X-CRM114-Status: GOOD (  15.83  )
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

On Mo, 2025-02-24 at 11:15 +0100, Krzysztof Kozlowski wrote:
> On 24/02/2025 11:12, Krzysztof Kozlowski wrote:
> > On 24/02/2025 10:55, Ryan Chen wrote:
> > > +
> > > +static void aspeed_reset_unregister_adev(void *_adev)
> > > +{
> > > +	struct auxiliary_device *adev =3D _adev;
> > > +
> > > +	auxiliary_device_delete(adev);
> > > +	auxiliary_device_uninit(adev);
> > > +}
> > > +
> > > +static void aspeed_reset_adev_release(struct device *dev)
> > > +{
> > > +	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> > > +
> > > +	kfree(adev);
> > > +}
> > > +
> >=20
> > Every exported function *must* have kerneldoc.
> >=20
> > > +int aspeed_reset_controller_register(struct device *clk_dev, void __=
iomem *base,
> > > +				     const char *adev_name)
> > > +{
> > > +	struct auxiliary_device *adev;
> > > +	int ret;
> > > +
> > > +	adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
> > > +	if (!adev)
> > > +		return -ENOMEM;
> > > +
> > > +	adev->name =3D adev_name;
> > > +	adev->dev.parent =3D clk_dev;
> > > +	adev->dev.release =3D aspeed_reset_adev_release;
> > > +	adev->id =3D 666u;
> > > +
> > > +	ret =3D auxiliary_device_init(adev);
> > > +	if (ret) {
> > > +		kfree(adev);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret =3D auxiliary_device_add(adev);
> > > +	if (ret) {
> > > +		auxiliary_device_uninit(adev);
> > > +		return ret;
> > > +	}
> > > +
> > > +	adev->dev.platform_data =3D (__force void *)base;
> > > +
> > > +	return devm_add_action_or_reset(clk_dev, aspeed_reset_unregister_ad=
ev, adev);
> > > +}
> > > +EXPORT_SYMBOL_GPL(aspeed_reset_controller_register);
> >=20
> > No, you cannot export functions without users. There is no single user
> > of this, so this is not justified at all.
> My mistake, I missed patch #3 which uses it.
>=20
> I don't get why do you need to export this in the first place, instead
> of putting it in the clock driver, as usually expected. Handling child
> creation is logically the task of the device having children, the
> parent. Not the child.

Also, consider basing this on top of:

https://lore.kernel.org/all/20250218-aux-device-create-helper-v4-0-c3d7dfde=
a2e6@baylibre.com/

regards
Philipp

