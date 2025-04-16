Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3943FC369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 08:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QB4w6r8owO4Bb0m5tcn046y0Jgd8/AvOYokKG/K6tmA=; b=hVlDMJzjclssuUee01eVF6r6uK
	1gmUoOEsAjoe5Xws+zsaLG2UyUoZa7/hawkOi7D0E56dLCo+tM2UgaoAEcOmGK8ayzRyk8T27wfp2
	hIiMltBQFsWEn4o9+FBfTf4vjMy7T05DSVLhBPU54VouSKbG+ddH1+CpogXzrZUMZrNx+NawFtnyT
	jyckvlg8EAgE4b4eHyQUamkQpeK/Qg96DhpRuXKPyIAmgnXBUGwRC4ff6PKEbSRJAX+d4TEFmzr9z
	SYSxqcIIVah3irUHlyheyM/mCrEzEwZk96VooZkgnKj+bVkDChmgh4TWH+36QJqz/ZHymGCLHwbIZ
	5HIKPqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xjm-00000008jbm-2bIU;
	Wed, 16 Apr 2025 08:03:14 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xew-00000008iZl-35gw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QB4w
	6r8owO4Bb0m5tcn046y0Jgd8/AvOYokKG/K6tmA=; b=MvcOO5hzdI8eBgKgmURd
	jgyKt2mivgEVksW4Byp5EGtGLCpmJJnf71YP67o98TuZNUGt1liI8eM3j7sCUsxf
	NgYTjEkS99eDtav6hF5WxcWj0syq3d9Hv8LiVGURCJwtoVzDzEtOnkB4LQC3CT6K
	z50u/HWNMD/no5CwTZTnKz12tlKRQChvWW9WoTExvqj+SKx6qVEMZQCPyAGtq7F8
	uexsqA6Dlb34jQzFXg/HMTNKHcQTW+Qmtm2/R+RId8/7o3w5DQD3T+5kBXwra/1O
	NfGakzswIDZkIafzge1fxTT9IgsiJif7K4jm3OzR8dVMEgzChC/PtxTc6oqPjqeo
	Bw==
Received: (qmail 625012 invoked from network); 16 Apr 2025 09:58:10 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2025 09:58:10 +0200
X-UD-Smtp-Session: l3s3148p1@KWRypeAyKJYujnsq
Date: Wed, 16 Apr 2025 09:58:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Alexey Charkov <alchark@gmail.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 5/5] ARM: dts: vt8500: use correct ohci/ehci
 node names
Message-ID: <Z_9jETTOLcm6xoc_@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Alexey Charkov <alchark@gmail.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
 <20250330193833.21970-12-wsa+renesas@sang-engineering.com>
 <174478928969.20468.13803674314386256291.b4-ty@linaro.org>
 <bd011058-1d39-4334-8b2c-40f085366cf3@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xcer6L9aSalqn0Cx"
Content-Disposition: inline
In-Reply-To: <bd011058-1d39-4334-8b2c-40f085366cf3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_005815_642500_FB18FC8B 
X-CRM114-Status: UNSURE (   8.31  )
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


--Xcer6L9aSalqn0Cx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I assume the rest will be picked up by their maintainers, but if after
> some time (+2 more weeks?) there is no update, you can ping me so I will
> grab these as well.

Will do, thank you!


--Xcer6L9aSalqn0Cx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf/YxEACgkQFA3kzBSg
KbZkBBAAnrntkbWNLY0+3cOgTJUzY1ufGVPXzoS8bZfIAdUJa0ZBQCPS68ug+4t9
WRxYdx7uNH6YnRjas+QHPbQa/WX+QYf39NYr3NMlDpI1pfOe+coGzcX+f2QkhS+R
AFpMWXRQULzXwgGYw2bIgUxjvKFRLwePjpU7LYRrqt/9QdBACLqX6o2dS/87XFwS
KJqGZ5Bg4Z3hokfbYli8f2ISPQ6/Jw3j2rU8vuneQq2QVxPvUL2UrC5ds1qdN150
0w0OpYCdsjJiVgLNhCAy7b8GxHEiRFJw4j41HdQTZZv4hkjVFHLg1WK3CYvlB5qH
rNQHeSb6t1ze85FpOfXV3rAVrA7Owc3MbvwQ7NKPC0F1p0wFvy4YAROsGVPbPYIu
qySNNi+rubjGyTgd9s695qPN0oXZvitxIwS9JbX8w2ptbQSJ91nzf59swFK3OKFc
LgQ4FaHk3lHsE3I9S6kI77q9K6v3OhHZM698jfNRyG6g3cuKnIqzZ2di1Pcwad/9
w7f34UVmGmFdYCbDwrrBbtPHUznX3LVr2EgykM1imIegJQ7fAMGhO4Jgdpl/YEYM
O8wmu2dNAU2qdRaFYgd79DVxQjY369RLZEUIgx0nOXCNrP7shKGgERn3z1z9yyJm
V3QK7meAGSTr4r/Gu+88YzgQjjWASwNEoXSVPZ5gKwosSMHkyp4=
=hR7w
-----END PGP SIGNATURE-----

--Xcer6L9aSalqn0Cx--

