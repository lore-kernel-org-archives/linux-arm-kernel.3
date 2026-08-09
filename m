Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B445C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdkVaGxQ9WXK8ISzY26/7j0yy/WLWXIs5Q/P9RAMv4U=; b=WHyxxTeJ8fLe/DpZCfT+66Y0KJ
	gbszJl1ocX1O5YotGszQDIsnf0IC3GY23cpPjA8xWyOsnFOY0OFjwrst3j+U+3ytctm6LODTh3HRI
	vN1bT6lwaR8G+/Wa54A+g+xiO0cZQLAQVyJBI0IkDOva6kRagfjIy1XzXCeJ4f0RKh80mN2fkcLKT
	MsBIjRAISPByAsUBPiSVkCY4fobqINXQx4bxH2jX57s18YsaWnLk+/I+vAfp8oqFUK7tpR+VR5BSx
	zW8UKjsadguoA36dVONFJzSCFdd0RI8GLY7qvt7Svp8TElL9zW635E4J/t8fVi9vGjdASxYzp/G9h
	aKPbl+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt75Y-0000000AWzX-0Igy;
	Sun, 09 Aug 2026 17:13:32 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt75V-0000000AWz3-2tCm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 17:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Subject: Cc: To: From: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1786295608;
 bh=sdkVaGxQ9WXK8ISzY26/7j0yy/WLWXIs5Q/P9RAMv4U=;
 b=ny5z0xwXITBGAIGrWi1n18JPR9+SDeWGrr6Of43/oewh6ZJ5Ry0dNKw1Qll5bz783s8seSgj+
 msHYQz3PZktSQey3zZJUXa9MyvdKrSGCDZWrNI0gy8WxWLh8hpfrIhjxlwuBX5J2AHkliAKJBkH
 VqCu477AMtuiFAJAmrmRhX8aKGdl4FQlQbNGUhtHVB9NXkGVyT1dCDAqi1i2t79FLUxNmL27Oju
 PpX6HE2SQYFjVsEbtEMLDsp2QP56sz9yyfqOsumBCMO/IvyXq+n/TIMhGHlsPNbPLsvJuVN+Oy6
 l6R9kZJldHgnhBCSNUK7zUa/ShXavqMbTYTJt1DL+46g==
X-Forward-Email-ID: 6a78b531430e5f5f6cba74ac
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.13.10
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 09 Aug 2026 13:13:18 -0400
Message-Id: <DKKKXXEMIO2G.LN1EYSEBL8CD@ubuntu.com>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Joshua Peisach" <jpeisach@ubuntu.com>
Cc: <asahi@lists.linux.dev>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Neal Gompa" <neal@gompa.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Janne
 Grunau" <j@jannau.net>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/3] reset: Add Apple SoC CIO reset driver
X-Mailer: aerc 0.21.0
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
 <20260809-b4-cio-reset-v1-2-4f33777d9b4b@kernel.org>
 <DKKHHITWR3F4.390HXQFLQR8X5@ubuntu.com>
 <7a170485-b349-4502-adb1-3ce6217bc435@kernel.org>
In-Reply-To: <7a170485-b349-4502-adb1-3ce6217bc435@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_101330_174155_B66AC0C1 
X-CRM114-Status: GOOD (  10.83  )
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

On Sun Aug 9, 2026 at 11:20 AM EDT, Sven Peter wrote:
> On 09.08.26 16:30, Joshua Peisach wrote:
>> On Sun Aug 9, 2026 at 8:16 AM EDT, Sven Peter wrote:
>>> Add a driver for the reset of the CIO (USB4/Thunderbolt) blocks on
>>> Apple Silicon SoCs which has to be deasserted before their
>>> co-processor can be booted. On t8103 each port comes with a dedicated
>>> register page while t600x uses a single register with one request bit
>>> per port shared by all ports of a die inside the PMGR MMIO region.
>>>
>>> Signed-off-by: Sven Peter <sven@kernel.org>
>>> ---
>>> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
>>> =C2=A0drivers/reset/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +++
>>> =C2=A0drivers/reset/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0drivers/reset/reset-apple-cio.c | 182 +++++++++++++++++++++++++++=
++++=20
>>> +++++++++
>>> =C2=A04 files changed, 194 insertions(+)
>>=20
>>> +
>>> +static int apple_cio_reset_probe(struct platform_device *pdev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &pdev->dev;
>>> +=C2=A0=C2=A0=C2=A0 struct apple_cio_reset *priv;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNE=
L);
>>> +=C2=A0=C2=A0=C2=A0 if (!priv)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 priv->variant =3D of_device_get_match_data(dev);
>>=20
>> Might be a dumb question, but does priv->variant also need to be
>> checked? Because later priv->variant->pmgr_child is and I *think*
>> it could return NULL.
>>=20
>> (Or is this not necessary since in theory the device should only run
>> this if detected... so this should never be an issue?)
>
> You might be able to get this driver to probe without a device tree node=
=20
> by manually forcing it with sysfs but well... play stupid games, win=20
> stupid prizes.
> Adding the check is just two lines and doesn't hurt though.

Meh, not worth the extra lines of instruction. FAFO for the curious.

