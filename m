Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0B8D66BBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 23:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=An/dh+69Qe8AwBl8yL4PiDoDvRHbBVKuX7FThD3xgjQ=; b=ygVmoIzv2FgaNnqNT0efSc7nsX
	dOHbXftuGAbx7Mt0hkr7wJakeyG/IhzoG0niZNaZGVKGTVBQZZDP0E2HhMojUjCYPO0UUQLylDKCP
	AK37s91p+MKo8+exPtOB9s3IQpalu1CIF/4kN7AjDCIaQWT50AapvgY5z6umy4Gr+KnrWvSL0VMka
	1v9KbEQAuZn3w05PJH3zs2NSE7sFNruRK5eaSiOB44NU+DkzlAtCZ9dkE5cUk+1hFRzwM+KVdY5UL
	G6q5UdZGZWIDw9M+sMl2B4bzaTLG/4h0FU2362ei8B0z0RR+kj/q/b1ZI2JJGapWLw8o3TVgZnVvl
	CL9Qxd6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0qf-00000007Wfg-11ZY;
	Wed, 17 Dec 2025 23:22:25 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0qc-00000007WfF-2ns7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 23:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1766013738;
	bh=An/dh+69Qe8AwBl8yL4PiDoDvRHbBVKuX7FThD3xgjQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K7Y/10ajRzQlraz7ZqT1w/H9LjiCA+lN7D2OeigeMyRx/h9qWxYJ+t7Ga7sF6s6lE
	 JuoqWMvhAtKETdchtH0uoqjp/xeYsIf8+wZd0Opf8yWW9L4x9T8FX2fnk/VOimrk2v
	 P0nh3zB7Fqj2gWIpOo2T6krP8J/GeMDA4gMHceEQziJEreepd1Sd6SRPDxxwe2hliK
	 wKaND46MneavZvLex98rDYA0vvTpTUhzHMkTIJlI53KI9V5J9sMukvsid/YNJmxqw7
	 KVZ5Nnb/2vRR9lfvoK8zCSAZOFeeddl/4Y4UfoY6ojSRFqA9/wewBQ2YbSxzNY96hd
	 0ZU6R2vEzO1qg==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 080947C1B2;
	Thu, 18 Dec 2025 07:22:16 +0800 (AWST)
Message-ID: <bc0904e4742cd04fb49b2d39ee2c0f72f28c1c4a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm: dts: aspeed: add an alt 128M flash layout
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Thu, 18 Dec 2025 09:52:16 +1030
In-Reply-To: <aUM5HcEs0OVrDO1w@molberding.nvidia.com>
References: <20251211-alt-128-layout-v1-1-100f57d2bc4a@nvidia.com>
	 <61f561d95af86a46f1e1075df39e1ce0f1324098.camel@codeconstruct.com.au>
	 <aUM5HcEs0OVrDO1w@molberding.nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_152222_927523_CB067C13 
X-CRM114-Status: GOOD (  19.20  )
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

On Wed, 2025-12-17 at 15:13 -0800, Marc Olberding wrote:
> On Thu, Dec 18, 2025 at 09:29:44AM +1030, Andrew Jeffery wrote:
> > On Thu, 2025-12-11 at 13:35 -0800, Marc Olberding wrote:
> > > Add a 128M layout for the BMC flash chip we didn't boot from.
> > > Including
> > > this allows the user to write to each partition on the alternate spi
> > > chip. This dtsi follows the existing standard of using the same
> > > layout
> > > as non alt version and prepending `alt` to each partition's name.
> > >=20
> ...=20
> > This may be fine, but please add it in a series that also introduces a
> > board that consumes it.
> >=20
> > Andrew
>=20
> Ack, I wasn't sure how to handle this, since the MSX4 hasn't merged to
> master for upstream yet, its just been merged into the openbmc tree.

I've applied it:

https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git/commit/?h=3Da=
speed/arm/dt&id=3Df28674fab34f07fff9612c3f390d3699bfe8ed90

It will be part of v6.20 (via pull-request to the SoC tree).

> I can either just hold off on this patch or update the msx4 series.
> I'm assuming that including this in a patch targetted to the openbmc tree
> is a nonstarter. Any thoughts here?

Send patches based on the bmc tree's aspeed/arm/dt branch (i.e. the
branch containing the commit linked above). Your work is going to land
there anyway, so no need to strictly base your work on Linus' master
branch (though this is generally reasonable when there are no other
dependencies).

Andrew

