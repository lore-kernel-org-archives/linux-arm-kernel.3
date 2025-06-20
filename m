Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1D5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 06:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeuYZMsC9WsSiMUpmqqe0M3z0iwrxrWn7R8Czqja7Co=; b=Je0stWFbZfD/sQWRSQ9JUam73o
	k39k9KDclI7VhJ+mJM2S7xO0NWrilb9/hGtd+3ynGH0ZbpqYtLQ1MvrPLoL/zfDjAveb6WlSJvWRO
	VYuQdXa9aHGZmUrfVWxaEu1GbVybIqBXOZQM/algan1nbFp7xtn045vzzzPQfDGN8y9hUlROZuE0A
	9ZJue4+PMjb5bMUwtQ8R2Ze7c6ifcFiFym6pWQARoYFLPE7YQmj48DClyla8vPJx1j9W6ruYBn81u
	l3XPjlcYdzBN615ah8DulPDO213wYXRwb54rvZ3fciX/NTTzPqTTwxgrKk+8Vxs3nREzMmj5oG/gL
	hrWf4Nuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVEZ-0000000Er6E-2y5K;
	Fri, 20 Jun 2025 06:28:19 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVCJ-0000000Eqwu-0gQe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 06:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750400750;
	bh=HeuYZMsC9WsSiMUpmqqe0M3z0iwrxrWn7R8Czqja7Co=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KXifEzUgUP5oogEUgfxYXUvo0+ZE4B6Y5AjhwTwC0AykM3w1FC+7pF+jUWSMhzefL
	 CivXgonieQSyHUacztzurorFb4fwwccraax9Co1aXrXO6nuhh0NNBmhPqvfaWTZdof
	 SPZHhVJmY9U6ePBcvZWfHZjsC46HUTXbBhf6SffmywGIztUrqb/+dKpzmCDZThHs0f
	 wBHMdv6ljIYj+KEulcdDMQmqfxqi++QThGq6i+pjVphzUPvpGBwNCPVCZKumLyVBpk
	 7WN+lIe3s/FXcT9Pbd5Y9tTQntf9e4iXVpxbvy6Wxyo2ws8jgJYWMhpgyxEFy4IOqc
	 bV7vT2roNn1ZQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 44C7664426;
	Fri, 20 Jun 2025 14:25:46 +0800 (AWST)
Message-ID: <8120f04c23f14ac48671a0af45838536a4600e98.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2]
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, Leo Wang
	 <leo.jt.wang@fii-foxconn.com>, Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 20 Jun 2025 15:55:44 +0930
In-Reply-To: <20250618-add-support-for-meta-clemente-bmc-v1-1-e5ca669ee47b@fii-foxconn.com>
References: <20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com>
	 <20250618-add-support-for-meta-clemente-bmc-v1-1-e5ca669ee47b@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_232601_085111_3853603E 
X-CRM114-Status: GOOD (  11.59  )
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

Hi Leo,

The patch subject should not be the path to the affected file. Can you
please fix that? Follow the lead of other patches that have recently
touched the file.

Thanks,

Andrew

On Wed, 2025-06-18 at 17:40 +0800, Leo Wang wrote:
> Document the new compatibles used on Meta Clemente.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
> ---
> =C2=A0Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index
> 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71
> 403f897681a98 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -81,6 +81,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - asus,x4tf-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - facebook,bletchley-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - facebook,catalina-bmc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - facebook,clemente-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - facebook,cloudripper-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - facebook,elbert-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - facebook,fuji-bmc
>=20


