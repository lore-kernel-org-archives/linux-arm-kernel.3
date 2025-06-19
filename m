Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A442C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKt8A6+QjYnjFL3np6K20XlH4x7ehiuuzMqxVDQaqE0=; b=EDHviw+cgWWedF6GEuAjaq2aDd
	L8R+QUsJdr/jHIpcpa4wdmp0qwnPAWenxYyd5ki9fs0LtqKNqGZjg69tfDisogOctFNjUrOQRAzdn
	piFnK6oNYqWDMAeyNHe/9B7GSAKoc7Vw/jNQ/LDwzf7bgi/Ff9T4OBMvBCF8wPIt2oA+foZIpeRxG
	pbMHbwYBIucftQTJqQuIEl+I4Fihr8Sy/HeBzoGp061a9poplzzpE1RLe2orErEFrMPyTkjYdLjUs
	63YsoOAQkIFjcNNrbGflQYV5TNbebuboc/0ROq0VpFGp1r/sowFWeNwRu2t6WjSzl1CKrjVPSkg/O
	P+0F8gFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSMC3-0000000EFZB-04hg;
	Thu, 19 Jun 2025 20:49:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLc5-0000000EBVB-3SNW;
	Thu, 19 Jun 2025 20:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=lKt8A6+QjYnjFL3np6K20XlH4x7ehiuuzMqxVDQaqE0=; b=0nF/Qs58MprQxQpPF81gdBhcaM
	ZiPwdbLNIv9i7HdS7fcXKCxdpfc1ap8teHa7zc20uFIgBjGOkJ8YWr5BSc+n1ae3FATDOrzK7wPBM
	fg/gJjxdhtGgMywi3Sbz9+IRBBR8mTOndTBfiE9Vd1ephKjaeN6ThPY8UK226SvDhHu37wBWAzcuh
	3O9+SlEoKGaBsw5DuMCjcEeX1ny6eb8odrrp2e3cbUUbiJFVf+UH30FPG+9Lussjfa9DJ8kh0xvUu
	FWVolb6GLAWqFAs4zg8hvWQAPfMX/RXldvaxaCzwP4gxN4Z4Z9Rg+ut3x+Cl6CfyhM56P5+uNVMDm
	HytK+xPQ==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSLby-0006tx-Lj; Thu, 19 Jun 2025 22:11:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Michael Riesch <michael.riesch@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588 variant
Date: Thu, 19 Jun 2025 22:11:49 +0200
Message-ID: <17533727.geO5KgaWL5@phil>
In-Reply-To: <8ba2f458-4a66-44f6-8528-4654cfe379ff@collabora.com>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <0f2b8934-9b3d-4913-b734-b4fe7f0c7d0a@linaro.org>
 <8ba2f458-4a66-44f6-8528-4654cfe379ff@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_131157_864975_B71BAC86 
X-CRM114-Status: GOOD (  22.15  )
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

Am Mittwoch, 18. Juni 2025, 08:32:25 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Michael Riesch:
> Hi Neil,
>=20
> Thanks for your comments!
>=20
> On 6/17/25 11:31, neil.armstrong@linaro.org wrote:
> > On 17/06/2025 10:54, Michael Riesch via B4 Relay wrote:
> >> From: Michael Riesch <michael.riesch@collabora.com>
> >>
> >> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
> >> Add the variant and allow for the additional reset.
> >=20
> > No names for the new resets on the RK3588 ?
>=20
> I left the names away because TBH I don't see the value in them (in that
> case).
>=20
> Downstream uses reset-names =3D "srst_csiphy0", "srst_p_csiphy0"; and
> there is no better description. One could guess that the second reset
> corresponds to "apb" but this is just guessing and we would still have
> to guess/find a proper name for the first reset.
>=20
> Amazingly the mainline driver does not seem to do anything with the
> resets (unless I overlooked some implicit magic). Downstream does a
> simple reset_control_{assert,deassert} before configuring the PHY. Now
> if the different resets are handled in bulk mode, does it really make
> sense to address each reset individually?

it might not make sense now, but possibly in the future?

A binding and the attached devicetrees are meant to be "forever", i.e. a
new kernel _should_ support all those old devicetrees you throw at it -=20
if they conform to (at some time) established bindings.

So while all drivers might not need the specific resets now, you don't
know what quirks you'll have discovered in two years ;-)

And instead of trying to update the binding and then carrying both the
new and the fallback code for the old binding around, why not do it now.

Then when you find a need for a specific reset, things magically just work.


Heiko



