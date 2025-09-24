Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56798CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 02:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4+vMC3mMORtvsHhkWNQq4UX2Am1Y6Z4F6Rf3tApsxQ=; b=UyEw431zuvh1TSfpolGXLjSde4
	nfFuNtvE/mkQ8sddVD/LTi6TQfJCOv8a4/I45ZPAT6bbsBYqg3f3xndGwsLkfEvZmW7bVUEXpbhXs
	+hdCoND+SOZIaBJfSyubz/NJARKDaahQTrjpO2kMVwC8ioBRP8/aj0Tp67PpeSlcu+SVPmPVFfBtY
	JnDf7BsTGAgsvsV8Ol/vSA1qe+FuuMJ6FSwQ/Ot/iGb4Srh7gSndzaOokqMrsiLwc3sVtDa9FQ2E4
	L4M0ju8ZkmU8woN73b6kkMRDUqvg9GGo72ox4QaHYf7RJr1+O1wqeT35LEjQ3Gh3ZOmLIxeAWGm0Y
	u8putUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1F0k-0000000FLbu-3W7d;
	Wed, 24 Sep 2025 02:13:38 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1F0h-0000000FLbY-3JOx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 02:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758680013;
	bh=B4+vMC3mMORtvsHhkWNQq4UX2Am1Y6Z4F6Rf3tApsxQ=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=A5MwtSpk99lhf+43cgkAKPPojgLx74pqY+r+UQSh4x/5AiKNOiHZgfCH2HNZ4xHL/
	 PO4mbROfKEipns/AEsgGIC3OVbEwfj+7LkRhufn7AijYUfXbqTFgdS2/0HRr8m+l3n
	 Fa9OOm0nJK+5zUEQmCfsOAC/CJ3YySS+tqc7M3xul4f9p9/9D2rdkXv0b/X68vX6sb
	 8jNkuIzkI8J+3K/oQYMbUN4cOyFp1ifU89pCZ7b5fZKDYWg985Hxe1CB4wDowxEJj+
	 FCxECcS1NSweh+r859CgR+ADCcGoLCRUaJKMqQF9pZo3kLAPqM81ihaVQyerjjbPmW
	 PL7hsmRlFRX7g==
Received: from [IPv6:2405:6e00:243d:a853:dbe5:4849:b82e:5665] (unknown [120.20.205.123])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E7AED647A7;
	Wed, 24 Sep 2025 10:13:31 +0800 (AWST)
Message-ID: <9990f63e533c538ca95c3a2bd3401d27f031c330.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/2] Add device tree for ASRock Rack ALTRAD8 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rebecca Cran <rebecca@bsdio.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 24 Sep 2025 11:43:30 +0930
In-Reply-To: <2cecaf0b-9fb4-49f9-a346-ea3f44627a15@bsdio.com>
References: <20250917180428.810751-1-rebecca@bsdio.com>
	 <dd660ce0388afb61e476f164335600f3fc2b1fb6.camel@codeconstruct.com.au>
	 <2cecaf0b-9fb4-49f9-a346-ea3f44627a15@bsdio.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_191336_023115_C2A02BDD 
X-CRM114-Status: GOOD (  17.63  )
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

Hi Rebecca,

On Mon, 2025-09-22 at 14:47 -0600, Rebecca Cran wrote:
> On 9/21/25 20:40, Andrew Jeffery wrote:
>=20
> > On Wed, 2025-09-17 at 12:04 -0600, Rebecca Cran wrote:
> > > aspeed-bmc-asrock-altrad8.dts:578.16-581.6: Warning (unique_unit_addr=
ess_if_enabled): /ahb/spi@1e630000/flash@0/partitions/code@400000: duplicat=
e unit-address (also used in node /ahb/spi@1e630000/flash@0/partitions/tfa@=
400000)
> > It seems odd that the partitions intersect. Are the offsets correct? If
> > they are, can you add comments to the DTS discussing what's going on
> > there?
> I'll delete the code partition. I added it to make it easier for my=20
> script to flash both TF-A and UEFI areas at once.

Okay, thanks.

> >=20
> > > aspeed-bmc-asrock-altrad8.dtb: gpio@1c (nxp,pca9557): '#address-cells=
', '#size-cells', 'gpio@0', 'gpio@1', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5=
', 'gpio@6', 'gpio@7' do not match any of the regexes: '^(hog-[0-9]+|.+-hog=
(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
> > > 	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yam=
l#
> > This one needs fixing.
>=20
> I'm confused, because in the existing device tree files I'm only seeing=
=20
> 'hog' used in the &gpio node, while 'pca[0-9]+' is commonly used as the=
=20
> node names for pca95xx devices.

The error above is referring to properties and sub-nodes of your
nxp,pca9557 compatible node, rather than the name of the node itself.
That said, node names are preferred to be generic (e.g. gpio@) rather
than specific.

>=20
> Does the gpio-pca95xx.yaml file need to be updated?
>=20

It depends on what you're trying to achieve. At v6.17-rc1 no other
devicetree in the kernel defines an nxp,pca9557 node as you have here
with gpio@ subnodes, and neither does the gpio-pca95xx.yaml binding
allow them. What caused you to add them?

I expect what you need to do is remove those sub-nodes, along with
#address-cells and #size-cells.

Andrew

