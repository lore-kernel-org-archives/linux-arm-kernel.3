Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C903BE77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYXk78DguqmWey11v7mAxjM3xS6Ls/etqK8HPTlNkGQ=; b=CttSQNrqLGfRgeGJniOAOZwgx4
	zfyDT8l/MZKelzwKOtndDLtwyWaSiVRkv0p7saxKh7WPODe+ipomAkOluPsOZyN5XC69ZL/wzWcKG
	njEpK5i2Ibx9j1ufB/GCcnpclRun2k2IE2pnvOmAhkGqs0e5+ijmUbxgsafNKh/7j70ln9FKWfXxI
	Xo6CnEO042vSwLQbQRNphTi+yEk64l7AJKH00qB4ywZ+47Qj5dhUduzvL8pxHGuZiYITUX+tWaBzs
	Q+2V22o7JHFKkeNmeKCVhwno+zJfuLYZg/o4k4gOzRceQgnqpf/+NiAvCAs/VaflgslE7i9AbhUhM
	wVYHCu7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbpa-00000002I5P-1CNZ;
	Fri, 06 Dec 2024 17:09:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJboZ-00000002Hv8-0i4l;
	Fri, 06 Dec 2024 17:08:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 782A2A4439A;
	Fri,  6 Dec 2024 17:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDCAC4CED1;
	Fri,  6 Dec 2024 17:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733504906;
	bh=oYXk78DguqmWey11v7mAxjM3xS6Ls/etqK8HPTlNkGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JD20P7A8yotk3HVF+vGps4oaX4LMTplnWL83uQ0SKduxvxwnumqO79NxHgNtTCGTl
	 29nW4iip3nvYrCU3faOcHR4ZBDaESDr7XPH6W2BU5Tcpx7ez6ZiZquIsPDhvJpNH1l
	 YoYm9Ss1l/N6VnC+3Jwje5iteSQDSWDDdjZ5sAQjtkpvk57WdU4nt8ZrMjlV0K/Xiv
	 2NSegsbNQIdayAJDScIlHFIu96GJsfH/hjrZLCQhHYFjkgl9odnAHw41FJD9JQ4S2M
	 g4kPV8Y/drHLI8V1WZsH0JZb3LSbryzYh/ZvDSTy/LwvvcF540aB2Be+5fxVw7Ec/U
	 +LUwbtnbIcaDg==
Date: Fri, 6 Dec 2024 17:08:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: rk3188-common: add
 PCLK_CIF0/PCLK_CIF1
Message-ID: <20241206-quadrant-gliding-e28b79c09c2e@spud>
References: <20241205182954.5346-1-val@packett.cool>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+WMJfWqySBiE5lAc"
Content-Disposition: inline
In-Reply-To: <20241205182954.5346-1-val@packett.cool>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_090827_267195_4995C6C3 
X-CRM114-Status: UNSURE (   8.75  )
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


--+WMJfWqySBiE5lAc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 03:29:35PM -0300, Val Packett wrote:
> Add missing clock IDs for the CIF (Camera InterFace) blocks
> on the RK3188/RK3066.
>=20
> Signed-off-by: Val Packett <val@packett.cool>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--+WMJfWqySBiE5lAc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1MvhQAKCRB4tDGHoIJi
0gXmAQDcyyvFy3KyiLq5R+rlrAMICJX7YrKsc+OvE2KCmEcTNAD/fhjjqAfa//QL
2SeKT/q6t6QTbe+vLT7yJIe7e8Mkvg8=
=L2tt
-----END PGP SIGNATURE-----

--+WMJfWqySBiE5lAc--

