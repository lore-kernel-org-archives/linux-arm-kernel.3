Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40F8C2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9G2KX65Ab+9QthP7hU+dGSKLgGHDZbANHAkXoqK6ZJ8=; b=NIGf/IuulzAP2zh4gjfGh0qlTx
	qTaxv3LKI6oNAArCRN9TLkl+ajPNZF+evjxY2Tfe6GujwpTjZDTwYfjQ7BDkIuxcdSLP2EiU3d5xX
	MQlKF+FLYHe3Rn9P28yJuBNI0qYwAG5nai/iTJCAi5KTyAZ/U60gVBMoPquFQLK9AXPndoFFlEWtp
	75V8imt9ZCO38fJX6GoAvsXeIj0ajx5xr/Jhn9JR1zrsgxkdlC1E3wqykGvuWbbKUOT/jb8VF3qPs
	1IvRoxhGrUrCloqJAha9an5XH65D1KxRrwpDiRwx/rH7PS5rAZo8indzzhM98+pLPzGYnK1QKdr3C
	mjR4y38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRwK-00000009LuA-3kFx;
	Wed, 12 Mar 2025 19:40:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRua-00000009Lal-45DS;
	Wed, 12 Mar 2025 19:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9G2KX65Ab+9QthP7hU+dGSKLgGHDZbANHAkXoqK6ZJ8=; b=0w6DVHcP8Ff1NsM8gB7G2O7rSU
	nQacEOXrojn9wRema8yOaO0egRFn0zuygBNIDCIswibMncUt/Ng/CbZMssdRIr0SUNRuaCzpzM29q
	XeddB38hzG7sGIPAS8eRvmEe2nFPKCSKh+CZkRnxyCfEeyUnQGDdWBevdPv5EEQiJhvEIWMxqpWRN
	E4mna9N2wg8wb9UFCaFND4cWatp12Cb8WBQYbPile+C6rOoG+m3IbpoQ7FZBxXIe97x0zpGZhUNnk
	UrxT6va3aKF91llsyjHRTr6XNcOtEqmJH4spBOnz37Z2PfTSzzp38OZPb5XHW+9pUfJf7BRcCdlZj
	eXLPSZVg==;
Received: from p3ee2c254.dip0.t-ipconnect.de ([62.226.194.84] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsRuS-0001ql-MV; Wed, 12 Mar 2025 20:38:32 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Wed, 12 Mar 2025 20:38:31 +0100
Message-ID: <7779050.EvYhyI6sBW@phil>
In-Reply-To: <b7d8d385-81ee-4947-ab8f-1da43843464b@kwiboo.se>
References: <a5ec9062-ca57-4748-8c0f-fb5b9c75fa28@kwiboo.se>
 <20250312143515.1225171-1-amadeus@jmu.edu.cn>
 <b7d8d385-81ee-4947-ab8f-1da43843464b@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_123841_031799_15EB0827 
X-CRM114-Status: GOOD (  27.07  )
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

Am Mittwoch, 12. M=C3=A4rz 2025, 16:00:00 MEZ schrieb Jonas Karlman:
> Hi Chukun,
>=20
> On 2025-03-12 15:35, Chukun Pan wrote:
> > Hi,
> >=20
> >> The pinctrl-names should be changed to "default" and not "active",
> >> something you can fixup or do you want a patch?

so yes of course the pinctrl needs to be default - simply because
that's the only pinctrl state mainline supports.

But judging by the fact that you're discussing working vs. non-working
below, can you please check if we should drop the patch for 6.15 till
that is solved?

Thanks a lot
Heiko

> > Sorry I've been a bit busy this week and forgot to send the v2 patch.
> > In rk3528.dtsi, the uart and upcoming i2c nodes do not have pinctrl,
> > so I prefer to remove them.
> >=20
> >>> Unlike other SoCs, pinctrl-names need to be in "active" state,
> >>> I'm not sure about this, but otherwise the pwm-regulator will
> >>> not work properly.
> >=20
> > BTW, setting the pinctrl of pwm corresponding to pwm-regulator
> > to "default" will cause kernel boot suspended.
> > Sorry but do you know why?
>=20
> Not an issue I have seen, do you have any more logs or details? E.g.
> what board you use, full regulator node, do you have operating points
> defined etc.
>=20
> I have runtime tested a branch at [1], that use pinctrl-names =3D default,
> have vdd_arm and vdd_logic defined, also an opp table for cpu and gpu.
>=20
> For E20C there is a commit to enable the vdd_logic, however without gpu
> enabled and a mali-supply the pwm-regulator is initialized to
> max-microvolt by Linux. Have instead updated U-Boot to initialize the
> pwm-regulator's:
>=20
> ```
> &vdd_arm {
> 	regulator-init-microvolt =3D <953000>;
> };
>=20
> &vdd_logic {
> 	regulator-init-microvolt =3D <900000>;
> };
> ```
>=20
> [1] https://github.com/Kwiboo/linux-rockchip/commits/next-20250311-rk3528/
>=20
> Regards,
> Jonas
>=20
> >=20
> > e.g.
> > ```
> > vdd_arm: regulator-vdd-arm {
> > 	compatible =3D "pwm-regulator";
> > 	pwms =3D <&pwm1 0 5000 1>;
> > 	...
> > };
> >=20
> > &pwm1 {
> > 	pinctrl-0 =3D <&pwm1m0_pins>;
> > 	pinctrl-names =3D "default";
> > 	status =3D "okay";
> > };
> > ```
> >=20
> > Thanks,
> > Chukun
> >=20
> > --
> > 2.25.1
> >=20
>=20
>=20





