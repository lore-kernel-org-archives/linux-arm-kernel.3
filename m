Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16C5C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3k1yr4GslKpTzf5lqnCGMcEjSghKmBJjnIvXsOuWCc=; b=LcrG4OLp80AVXjoX2aR0TULo/r
	uDFYLnx5IC03Tl6TQWLzDj1FWNF15voEheM9oR/U0X6Q4bjHMdG/2GJJf5QLPFgFr2jr7IXnDiZOL
	+J4VzIHgTlj3F5OsUeuZ1RWxpvvVK91p3vZT/0DeN5tHZev6Pwj/Rx+nRIGH2zLAu4fyCTJb1JTI8
	0LzZKjbUmY/knVR1B2aqdYj1l9HXl5tNcKe82A7djpD5CqrER2WJ0aQm7ctZNsWqo9vxeYd7Taxnr
	Xs4IqRXuPzQ+Qa5M19K3JirH41is0OLdm75wRTkvdRtHfc+ocF4BAfaQMLMGgSaV9a8oc8kfulHx2
	9Ol6fADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPxEO-0000000FQCU-20Lw;
	Fri, 13 Jun 2025 05:45:36 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPx6b-0000000FOXa-43Gq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 05:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749793050;
	bh=m3k1yr4GslKpTzf5lqnCGMcEjSghKmBJjnIvXsOuWCc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mAUilWM21VC7VSJqWG0x27cxIkQzvrwFDSVB5KSKvDE9cRXOzAys05cSFQ0cOXawd
	 IgOPWk7nlVlI3B8Ovt9CMgQps65zkZ3WyAnjRUiRhamZjUIZ+sVyNdg9emdwGzYk5a
	 8hvwEeYNdivCAuWWNeYndziLQeHNjfRRE0ZuzRQ/CRdQteb+PK39YJGQR5MHwGhicq
	 B7lBcvGfmNrYMZVMVBQSSfVX1UZhUU/1U0JhBdcnUnvMDYGecwE9OVDQUUbg3HvC17
	 KgE2RlbyhioHPG78vPgk/xjs7BEnFiOocWdLH/hSRF0yx6f3+QAcl2soQ1wVPYHMVX
	 p7JKPApw5UHpQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9C11E680F3;
	Fri, 13 Jun 2025 13:37:29 +0800 (AWST)
Message-ID: <6a51eda96a7ffbb228ec08877a4f6649413c9bef.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/1] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200 UT3.0b platform BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Donald Shannon <donalds@nvidia.com>, "robh@kernel.org"
 <robh@kernel.org>,  "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "joel@jms.id.au" <joel@jms.id.au>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, Ed Tanous <etanous@nvidia.com>
Date: Fri, 13 Jun 2025 15:07:29 +0930
In-Reply-To: <PH7PR12MB72826C4B588D08923A512E91D774A@PH7PR12MB7282.namprd12.prod.outlook.com>
References: <20250611013025.2898412-1-donalds@nvidia.com>
	 <20250611013025.2898412-2-donalds@nvidia.com>
	 <67c89ca729669f55e2659ad8070a154c59ef83db.camel@codeconstruct.com.au>
	 <PH7PR12MB72826C4B588D08923A512E91D774A@PH7PR12MB7282.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_223734_193884_C68D0335 
X-CRM114-Status: GOOD (  12.13  )
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

On Thu, 2025-06-12 at 16:59 +0000, Donald Shannon wrote:
> Hi Andrew and Krzysztof,
>=20
> The difference in this device tree is adding more GPIO expanders and
> changing the networking.

Can you please include a description of these differences in the commit
message?

>=20
> Would it be best practice to create a new device binding (in this
> case nvidia,gb200-ut30b), even if it is just a slight modification on
> gb200nvl-bmc? Or can I reuse the gb200nvl-bmc compatible string and
> avoid the yaml binding change all together since it would share the
> same drivers?

You can include the aspeed-bmc-nvidia-gb200nvl-bmc.dts file and
override the nodes where the differences lie if that helps. There are
existing examples of this strategy, for instance:

   $ git grep '^#include .*\.dts"$' arch/arm/boot/dts/aspeed/
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dts:#include "aspeed-ast2=
600-evb.dts"
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dts:#include "aspee=
d-bmc-ibm-blueridge.dts"
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dts:#include "aspee=
d-bmc-ibm-rainier-4u.dts"
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts:#include "aspeed-=
bmc-ibm-rainier.dts"

Whether or not the differences warrant a separate compatible - I'm not
sure.

Andrew

