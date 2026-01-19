Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7543DCCF2EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxSm0RT6/vS5ISeDyalVPSvK3rwkjosRSSjTO13ynmg=; b=QmRSW91llTgt658WS1Vzecbm+H
	fcLJZmVi/LBBJIRd/AotGaplTVfA2MF++AM8I8iCGh1gFk1FUcDHU06X0tzFtygKjWvKO+8alOvGD
	JDTCIj6gJxjPCyhfx1LFawceik21jXbEA/WKi5vzBM4ZjSU9ZujBZBFcH/El9Tswb+xKRwgXxvyUw
	oAFU7NCZDffGB+0zaaxymq6XB9V96cq3qi+50EAocTz+QMA5Gd6oPOd8PwHdi9pMqB1IFxGVTQpps
	kcUJTjST9No4DgyAPkJmTbedRpn9IYU3rhjODDkxc+0Re1+Lo0NkoljcKnSr9r5h7NmHKmzE4lGt7
	SSgt/pFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnYR-00000001uU5-0m5Q;
	Mon, 19 Jan 2026 11:36:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnYN-00000001uTU-3gUz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:36:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CFC760140;
	Mon, 19 Jan 2026 11:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9E3C116C6;
	Mon, 19 Jan 2026 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822574;
	bh=OQinx1qBrX1pwq31acCG+L+3NgEjuiriHQfON/AY/rg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Q7rEkfzGjUkdkLUMw2ZzG/zLwSm9pxB9UUK4Zq2Vvsh765XsoyJRENkSFrQycIObl
	 UjIhmRCXCsiKzSUo7mxsWiC3hBoe/LJfFTWvwXQwDC7XwSmACPI06b4qv+pSNrhOgl
	 09sixcXOxnbd7EGd20DKDKUmMchA9DpWntHdNA3XJaawRA65n/PaisNRh2vKd4JbFd
	 VYTqzJgFLx6mpYG4nfUQWGVtU4TAP1eEIdjwAYR/gcD/J52wMH26ARBt4Pqea5KzNP
	 3nz7ojLpYAQLVFUuiR90PbSI5WZ4SCKH/F3KkgIByMQSEUSMAwyA4bNzSqwQli6vie
	 prijfAz8KLjCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 12:36:09 +0100
Message-Id: <DFSJ9QN6U81W.19R0VFKTEFZKR@kernel.org>
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
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

On Mon Jan 19, 2026 at 11:40 AM CET, Bartosz Golaszewski wrote:
> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev_=
attr)
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>  {
> -	struct device_node *np;
> -
>  	if (soc_dev_attr->machine)
> -		return;
> +		return -EBUSY;
> +
> +	struct device_node *np __free(device_node) =3D of_find_node_by_path("/"=
);
> +	if (!np)
> +		return -ENOENT;

This should never fail at this point, no? Also, can't we just use of_root?

> =20
> -	np =3D of_find_node_by_path("/");
> -	of_property_read_string(np, "model", &soc_dev_attr->machine);
> -	of_node_put(np);
> +	return of_property_read_string(np, "model", &soc_dev_attr->machine);
>  }
> +EXPORT_SYMBOL_GPL(soc_device_get_machine);

If we want to export this, we shouldn't reuse the existing name, which is
misleading.

soc_device_get_machine() reads as if we return a reference count of somethi=
ng.
Additionally, it operates on struct soc_device_attribute instead of struct
soc_device, where the name suggests the latter.

Instead this should be soc_device_attribute_read_machine() or if we want a
shorter name, just soc_attr_read_machine().

