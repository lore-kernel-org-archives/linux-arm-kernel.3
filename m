Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DBEE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztL+3jjbt8YLKR1VH3qo/9HI257nxn0XWmd3sCYfyOI=; b=MkCE/UlDXGcQnb2ezN5fDeGV3V
	D9of6LceMhOnOgMc3WI1lUg8wc4zqHtvZR7OTA9Fm3b1PCa64RvoH3nny+2anmSt4JO92VgNRwpfA
	552+WeFQxQvbF9nOp25tknHqZ/6YctzRTxzs74SOJDrtRhRdMJB6al6r/LGifE9HZhpsA04Po+NOD
	fwsAQ/NAdit3FzvMOZJ3uyFwfJhcaZ4nlvheONlbKIyEQzCyQgN7WLH6qpzHpsWK8cXXX0fMq3MZE
	HXRNHtoG6C7ChDdpUupIFMLQqcUDvV8RYdz8AXqfjuBVjlYk5FnE+P5OTnshQDrlsYJq9x2RiC3Fy
	rz8FERBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBUs-00000005Qhh-0B8n;
	Tue, 07 Jan 2025 15:27:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBTc-00000005QQD-328B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:26:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A35735C63C9;
	Tue,  7 Jan 2025 15:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07739C4CED6;
	Tue,  7 Jan 2025 15:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736263599;
	bh=XLhFtGuCY7Ucnc0+mL9iU40HruI6bI2yyylWOOmbdBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNClHMxv6p/dLY5+H6IrLV2GgRuM3AJ/jXNOKbmh33jnrWRFFQTJRzGLC7ksuXZVr
	 JrlJdHSYeddVvb2snAryytnQjmfznMiFcphfrjgxlkW0pa54qHmm9+ThhTd9PkCyuC
	 DVF4cOdR4Vmgj6qG1I3IMwUkw5ueHEEZd5vZoU7TCDjToaHxX7vAMvMwlgNJ4yKEY6
	 5G6Av0R9yKRrRBIQF9QEx7XhWVNDsGd2jD5RTXNjInIuyjIHhlBh6sYnc7844RBc4e
	 3RTjNz891V50dItetB3/UFc6WIu/IjqkjjZIfJebKUq4PuAopbtQEeIFsS4dSFy38n
	 4D1v16/V6aZog==
Date: Tue, 7 Jan 2025 15:26:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 5/9] arm64/sysreg: Update ID_AA64SMFR0_EL1 to DDI0601
 2024-09
Message-ID: <9e93418d-ef66-42bb-b276-9f92da2596fa@sirena.org.uk>
References: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
 <20241211-arm64-2024-dpisa-v4-5-0fd403876df2@kernel.org>
 <20250107151323.GA7368@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WU010yCTaQZA793v"
Content-Disposition: inline
In-Reply-To: <20250107151323.GA7368@willie-the-truck>
X-Cookie: PIZZA!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_072640_806928_232E041E 
X-CRM114-Status: GOOD (  13.82  )
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


--WU010yCTaQZA793v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 07, 2025 at 03:13:24PM +0000, Will Deacon wrote:
> On Wed, Dec 11, 2024 at 01:02:50AM +0000, Mark Brown wrote:

> > -Res0	27:0
> > +UnsignedEnum	27	SF8MM8
> > +	0b0	NI
> > +	0b1	IMP
> > +EndEnum
> > +UnsignedEnum	26	SF8MM4
> > +	0b0	NI
> > +	0b1	IMP
> > +EndEnum

> afaict, bits 27 and 26 are still RES0 in all the documentation I can
> find...

They're in the 2024-09 XML release here:

   https://developer.arm.com/documentation/ddi0601/2024-09/AArch64-Registers/ID-AA64SMFR0-EL1--SME-Feature-ID-Register-0?lang=en

which was current at the time the series was sent but I see that they've
been removed in the 2024-12 release which came out later, right at the
end of last year:

   https://developer.arm.com/documentation/ddi0601/2024-12/AArch64-Registers/ID-AA64SMFR0-EL1--SME-Feature-ID-Register-0?lang=en

so we should just remove these.  I'll respin (or should I do it
incrementally to save on re-review of the rest of it?).

--WU010yCTaQZA793v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd9R6kACgkQJNaLcl1U
h9D72Af+M48CMQ4TIZD35lakuJUDfvdH5F0JSqhHzYmkjf4C8IuujOjIMolmgRbc
ZVBjkcuQj6Q89kTchmXRgQ5msV9oDWEZht9yXHpg26dRcRYxIBI0dOC/knLGJSji
HMA4+I+lxNv0GU+nAW7nnNjkqZ8NmsSP9YPGmp/cSDtShgg3yUiNE1jwh5PWwK+D
5qKhNoowGtcoILJg6EqRooDviDutHZmmgfH+MxnoV5jnxhQWWeQgeNXs/lP3615F
M91mZMSCYmGzlqvdkWBq8byLYqBbqBLeceJ/xVOcVzrIc7HsMXVPBiCsp+D+4HmK
uohnU4LbTo4AJZv5QR0/BH/Cisw7PA==
=lqNc
-----END PGP SIGNATURE-----

--WU010yCTaQZA793v--

