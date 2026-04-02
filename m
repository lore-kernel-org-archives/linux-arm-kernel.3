Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B88D6AAE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 15:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azq6rPccAYyL64s6PaPux04RMnp/m4vA3aQmA1PwB+s=; b=vP+yKP/S70/CT4fVJqGrRV4lrS
	8p7+wBuE4H7yHefDGfgETjIJA6jk9H1DdjmP8vCJ1zt2XB2zzJ33lFp3JZOEe97gE8+ndulu8+Zp4
	sekL6Wm1DnGZLRkO5sVhLYEmliOHNOtrV7WpgEfs0nw8nDsGw1ZY3+zTLWTaOWKANCcEmYQCmTgC2
	gvDEwXSOvkXsKk/A7pIaSNhdb2eQHYNN4yi8xCFSvTD/sNaCbFeJUQioQjP2t5ayPgGWkRiPNCYD4
	PkAt0jRtkTs9uoEgOpxVeCiRwF4YRp5eu0CAhYRN/vuwf80mAU5At+1By8kvGP5NJli/7IKT5sQxm
	AE6+4txg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KDk-00000000SYJ-3rsQ;
	Thu, 02 Apr 2026 15:44:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KDj-00000000SY3-2phQ;
	Thu, 02 Apr 2026 15:44:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3ADA600C4;
	Thu,  2 Apr 2026 15:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3684CC116C6;
	Thu,  2 Apr 2026 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775144674;
	bh=azq6rPccAYyL64s6PaPux04RMnp/m4vA3aQmA1PwB+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qfZF8LlDV9jK3dpUo3HHmQlZoKNRx+stidWv4GnjXhJGBbmrYY3rw0ySLBYNCZMX1
	 PK3vbmAAw0shZFe0Nysg1lpOGjYbTXcmRo32x28NpBoTejPSafLosWQ3cjxScnyjAX
	 qGxcoJWePsoAIegg/WqhAHELGu1ZnLwumbMjv/0z7df18+8XXwrekoyUdX8Y2n7wDQ
	 /fzZgh0nECyfcvKTzQh7AWr66CO8byr6J8NmhwXNKiFwVokCePb7Uib7eOaraJsoMT
	 ItqzEOVSDRzqoScDdkRHUacP6+WRHkfKAyXmqq7UdkJW8nrNATWmgzC9/J2++ptHCM
	 hJJIYhXli2x0Q==
Date: Thu, 2 Apr 2026 17:44:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Shiji Yang <yangshiji66@outlook.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] pwm: mediatek: fix mt7628 register offset and clock
 source
Message-ID: <ac6OYRkiDt_OJVcp@monoceros>
References: <OS7PR01MB1360282ADC135931ECCAD9AF6BC74A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nosq6hqdgk23uy6t"
Content-Disposition: inline
In-Reply-To: <OS7PR01MB1360282ADC135931ECCAD9AF6BC74A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
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


--nosq6hqdgk23uy6t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 0/2] pwm: mediatek: fix mt7628 register offset and clock
 source
MIME-Version: 1.0

Hello,

On Tue, Feb 24, 2026 at 04:51:00PM +0800, Shiji Yang wrote:
> This patch series fixes support for mt7628.

The series looks reasonable to me. It would be great to get some
feedback from the Mediatek maintainers, though?!

Best regards
Uwe

--nosq6hqdgk23uy6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnOjt0ACgkQj4D7WH0S
/k7wcQf8DbZttWvtDRcy6Kuni91T0fY9QIk0I7HqCTtpHmiHKQsMxqGuvRQkvyj0
d2jN+Z35x0m678C62gahQj4PQwoAD2TimRMG8l4JakiHG39GugFef1ntXqISIUdR
BX+kx+mplwRhrLjCgsGPnM7EWUvn6cEpVrGis4EmU4nca5bbWeN6ZU6qtrsMDUBf
j7F9ipxoCD1f6bQyBy4pe859OOJcSO9WXyLSE9uHSH+vs+tKWILtRMow8sEcf5QG
MLrpWSMR3r3FhMrfmdNJC+F3xG3yCR7x6zxAxi0ZZ8WdS1VJK9AMMAIxVdwv6RuH
7IEs9OpqV4yZaMawC9f3kVhlRkPuWw==
=MxUZ
-----END PGP SIGNATURE-----

--nosq6hqdgk23uy6t--

