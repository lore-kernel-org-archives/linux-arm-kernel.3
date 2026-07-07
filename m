Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2974C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voMpL70AuboIi4CDiB3QSpXFK/WpnZyUWS7zISJ+zLc=; b=xs/9imRykQmhDlLYIFviwD/+l/
	7rwiz3GBW2B27ZeMwSZMHpjNC0GowsBJRHi8rxua+vtzNe+ubgke4f6KEP1lDZSe+3OGnFROdt0aA
	vI3Aw5DQmAL0+IWwQOUU3p7CLEoyO///kvPNEqybfT2pwjmnp+JxLUVt+2wNnAf64eF820uOzevP4
	ypyzl0+5cJULOhgfHOz5wZeIFcAnJqKxiIlGFsy9s4QDqb/X9Lg3EG+j3zTvSRrUuhldpIM8zOSCq
	bABuy5tWF60Vw9nkN3PEQofE4+KstxsQl6NWNqFFAnCZApVep0Y9Hso3LTX58yIVYRa5gN770QyFx
	RPVOGmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8Wp-0000000FRiL-2A4Q;
	Tue, 07 Jul 2026 16:20:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8Wo-0000000FRiA-0XwB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:20:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC50F42E16;
	Tue,  7 Jul 2026 16:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18F61F000E9;
	Tue,  7 Jul 2026 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783441209;
	bh=voMpL70AuboIi4CDiB3QSpXFK/WpnZyUWS7zISJ+zLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AqDc6/VOt/2ze79Qs7Acc0lDf9Txhy7EyKA6PtI6u6+VTnL+5fKkYaxt9bjdgpazb
	 SjDl5WH3rD6LhPNJSIwVFi5j4KmPlRsfacEBHUBISTSS8SW3IxJD0eomqxWiO5uVsc
	 Qxx+YIz19N3LzdQ7ewz/X3j0BCtHlZmupAqrNc6h0Unc/WkZTSfxTVK3rI54/6g21E
	 O6IXMR8eefujIayMlR3k5U2BRdOYQgx3rqoWrwR17syGAa7b6qv1x16Ce7b0Q5i79S
	 3FQZ53fMMXuZGeeLyDVVRBHtu6fFiE0NP2DsERPvsLHd8M5284IhXXFQn7bEJda+ud
	 busQRtlXGsWGQ==
Date: Tue, 7 Jul 2026 17:20:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] dt-bindings: xilinx: Remove EDK/Ethernet references
Message-ID: <20260707-gigahertz-vibes-548284d27e01@spud>
References: <40767504662d6461553db77465230e25348c69bc.1783413127.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w5+ShyIjTjEUl7tU"
Content-Disposition: inline
In-Reply-To: <40767504662d6461553db77465230e25348c69bc.1783413127.git.michal.simek@amd.com>
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

--w5+ShyIjTjEUl7tU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--w5+ShyIjTjEUl7tU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak0nNQAKCRB4tDGHoIJi
0qlIAP0WR5H9xqegLtBx4iXO81pPXIa+01xUhkE/b4wUXwW7jwEAph2IdwZzID7W
c8FPL+6bXOjtPZMIa1ZXcVonNy8wuQE=
=s0DY
-----END PGP SIGNATURE-----

--w5+ShyIjTjEUl7tU--

