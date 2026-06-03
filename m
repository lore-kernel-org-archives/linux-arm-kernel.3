Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07B2CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Atnblw3u+0+59oYj3/6rPNoCR3XUYN0HZoGIki7156Y=; b=BGj/L7ZlbIK9gNmrJhrKaii6iQ
	I5wETNsiuBtx4fDATpxGO8WMd6TXpSNhSUSGWxy65In9HJcov/B1L6DyrLatTgs53UNKBnKYZEHBm
	qSCPX1zy2vOxM42/m9u+M3y+paxw3qKHL4kOrv69JWVjkzWN0PLh4qtoSjkE7BctadjkmMaUEQN87
	GnXDbLGZ4T3Fl5gmdBqqSZoiJ5rizZ2MCY9V/RzeciIHkQVsjCwNMls7rU7t44qpjtO4Tv2tB6rf+
	gL7sP34TAwsio5pA13nK9yKR85OgTbwrmy8xpR3YhKxSLC6nYiHsdvohFanhRcnKj3/C4MALnoRP4
	WBxkm9Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnYC-0000000FQ8v-1lJp;
	Wed, 03 Jun 2026 15:30:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnY8-0000000FQ7u-1Xtv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:30:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C7DD1402DB;
	Wed,  3 Jun 2026 15:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0701F00898;
	Wed,  3 Jun 2026 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500631;
	bh=Atnblw3u+0+59oYj3/6rPNoCR3XUYN0HZoGIki7156Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c+4ezHQ/l8DE9qgvwLmzKdh+Q0oIJqz2dPlHaMlU2NhX94mv71O7XTWjtjWMtkXte
	 j5jolf1zF+yPVHV1CRxa5+OMxDHavx7RaYwBDO/W5YcFA6FZblcW5iogDOEGY/8LiF
	 vz24+rHjAXpzxivWn6EaHzIWwxgYeC6xoK4Ve3dc0cZg0rYBiwu/a3hFR/kFHzihFM
	 GBFvMAI9dSQsFcQiHwOiHrTjoMLwjF3bJfSjR4aWlX06FFfp2soHUtiVza2nZ50CqU
	 gIOdcCLsYWFA2nMvRolRAbm3yJ6S+EbSalSBIP0mZG4vKzePocwOhdNR+sL/ksMY1n
	 6VvusPV1tn0mQ==
Date: Wed, 3 Jun 2026 16:30:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	kishore Manne <nava.kishore.manne@amd.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: firmware: xilinx: Add missing
 example for ZynqMP
Message-ID: <20260603-recycler-copied-b9387a9ab0c9@spud>
References: <cover.1780499520.git.michal.simek@amd.com>
 <da152696e367eee8717a644d9303d27df1a3107b.1780499520.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OEj4Bn3ueDRLlxNp"
Content-Disposition: inline
In-Reply-To: <da152696e367eee8717a644d9303d27df1a3107b.1780499520.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_083032_423664_5F0C96D3 
X-CRM114-Status: UNSURE (   7.01  )
X-CRM114-Notice: Please train this message.
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


--OEj4Bn3ueDRLlxNp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--OEj4Bn3ueDRLlxNp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBIkwAKCRB4tDGHoIJi
0jiuAQC+o/oDdeA3mOii20jfihnzZcxChbwgO4sqzA0qk1FMegD/SBtPmGcjqHIm
x+QJ9PD4NMqs2PhnT21AfVROHTb5ugI=
=2Tsg
-----END PGP SIGNATURE-----

--OEj4Bn3ueDRLlxNp--

