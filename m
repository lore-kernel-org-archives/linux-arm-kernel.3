Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AD0C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mv8sfZsbNuXy8HpvmcyPTWZbajZCLInWCqjNzAr1TQY=; b=AlNM8abhcmQ5CpSioaanAlYsuF
	V8/wcXZHO7e+ccGB9exo94cks1/Uu52uYjPbki1ukDv8kI9escIEjy+ys6dxq8EqZQcV3PL4q58in
	FXYzk5o89yYeah9BDdbD0ZBzQpByXEFKfhAiwkXBTrrOpOTgJ49TfaL2E6SaoTQhs1vAKFxVCnVuS
	7ODoCXjKpSLOXVWlh9o0v94yIIhb/YDpObyxv3eXCrkyEdHEYKoNconzHXjbuKM0by2m0W6NCFtg+
	rh+kr3t0Weccjd1QQiJVs9TOOrjJvkeOW3nvUjBZ6bh31tRvWkLDJ4S+6Jg/5JpSVxhhwy3y61/SS
	dEMqqZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taI2Z-00000008TRB-0pzC;
	Tue, 21 Jan 2025 17:27:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taI0M-00000008TBN-16ri;
	Tue, 21 Jan 2025 17:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 550B25C4A8B;
	Tue, 21 Jan 2025 17:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05501C4CEDF;
	Tue, 21 Jan 2025 17:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737480333;
	bh=Mv8sfZsbNuXy8HpvmcyPTWZbajZCLInWCqjNzAr1TQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJM2RjjOEuytnCBUoX0xR2V+17hKtv7DBCF2//wj782/IR8GOc0Q925org/AmlUk7
	 kTBt++RDNxk9hUEt9NqGYDNeMKfsz3fuMerurUTxRyUzfyOzgFyUs5BDmRk5gO3F74
	 n+tj2KOLSPbVlyRwXr9kR+Q8B1vg59gaOSnt0FTlu2PuwbLD5QK3TCLTu2jOcQqKh0
	 EI74Zyq07xijfO0n7jATWCUV/v9U3KnhYDH9tqxzW8saqyzL1Hjhgzr6nh0KXJhFgd
	 CmAPwmJmEOqWHBIHxNXMXs9dNiyHkjrpRzM58e0h2QkNgrgV6vCpZOY9k/SP6B4EUb
	 N+ar9+2TFsARw==
Date: Tue, 21 Jan 2025 17:25:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: mtk-xhci: add support mt8196
Message-ID: <20250121-thank-catty-2a990676de84@spud>
References: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e+9Aubm7RzjHfXdG"
Content-Disposition: inline
In-Reply-To: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_092534_340820_E9BA4DDD 
X-CRM114-Status: GOOD (  11.48  )
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


--e+9Aubm7RzjHfXdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 10:50:05PM +0800, Chunfeng Yun wrote:
> There are three USB controllers on mt8196, each controller's wakeup
> control is different, add some specific versions for them, and add
> a new compatilbe for mt8196.
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--e+9Aubm7RzjHfXdG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4/YiAAKCRB4tDGHoIJi
0mH0AQDsIXcEb6Ul237gLkmPofWGZ9+utoDcEN+AGpxmsLFnyAD+LxoWLtPTgpoT
/iqCykPZpGp6Nl72HkV9nDdRbMEODQY=
=rPkF
-----END PGP SIGNATURE-----

--e+9Aubm7RzjHfXdG--

