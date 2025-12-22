Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04639E674A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIp/UwT1ukgYhBEE+L8xIDZ0mrAdvInVqlAbyQDVXto=; b=aQUnheKusNea8TgYsRs362FH0F
	E+vSjtPhFPwTQovvRlrDCdONKYOj/E5qcJUfCAtlXXSZGNHApCcIkupxhmPh5z/ldP9A9p48buV7w
	IEeG7iCQquseIP3W/rl5f2s3oiPdhzdA8AxzFsac7TTzftBupYaZEx5Hqamm0MmK1IQydjNWeUgmq
	f/pHo7zKsTfZ+cB62xChaTCzm5U57cQFlfr4WtfhL1XPwGi05/bkle38dIu4JfPocu6azxjvV83ID
	qyJykxuFPaR0fzrBZim5xZdsanoiwKATlAhdKkrch0CdZMkO3CtlRihNcfBYNKAacVRdA9c7P5nHY
	6ED+uK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfEV-0000000Dkin-3dNx;
	Mon, 22 Dec 2025 12:41:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfER-0000000DkiD-49bs;
	Mon, 22 Dec 2025 12:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vIp/UwT1ukgYhBEE+L8xIDZ0mrAdvInVqlAbyQDVXto=; b=Xb9+ukEqRoYiOZV+Jj4NrtRYVi
	cBCR/H+pxxaNLfeXG8gNjtuAwmzFfHi4LpRuWOjVnnE82P48AWzBxEnCZbDjKzj+jx2DDrNSKGmWO
	RvSIBa5ut+fPbnPl5gKPLovH92Zba3MjmSs5YBs7UBxYu0JeeVS3trpvNE5Z30BtbVs4/omnd1ZX4
	0jph7KSv16WfDQuYgMbX/vqPIHcYed6A3avRPtwQgAz7zNkZ/sEOvHdU+U2+oHQ27Go965Msj0S8U
	qOCyytjGdoQ93CFPql0HJrRNi/4OyvcZewXZR2GbfduOXT8BCtVIkr6+gVJUPaHeQCnFzi2fQiyfw
	BP505BBA==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vXfEO-0005U6-94; Mon, 22 Dec 2025 13:41:44 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: enable UFS controller on FriendlyElec
 NanoPi M5
Date: Mon, 22 Dec 2025 13:41:43 +0100
Message-ID: <119070978.nniJfEyVGO@phil>
In-Reply-To: <CABjd4Ywc-L0jvXwk253MDZwgN3srY6WQ5EhoKZ6wb+Hae376_A@mail.gmail.com>
References: <20251201-nanopi-m5-ufs-v2-1-ece9c0ee17c4@gmail.com>
 <CABjd4Ywc-L0jvXwk253MDZwgN3srY6WQ5EhoKZ6wb+Hae376_A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_044148_107922_81677B28 
X-CRM114-Status: GOOD (  19.63  )
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

Hi Alexey,

Am Donnerstag, 18. Dezember 2025, 15:05:39 Mitteleurop=C3=A4ische Normalzei=
t schrieb Alexey Charkov:
> Hi Heiko,
>=20
> On Mon, Dec 1, 2025 at 3:35=E2=80=AFPM Alexey Charkov <alchark@gmail.com>=
 wrote:
> >
> > The NanoPi M5 board supports pluggable UFS modules using the UFSHC
> > inside its Rockchip RK3576 SoC.
> >
> > Enable the respective devicetree node and add its supply regulators.
> >
> > Link: https://wiki.friendlyelec.com/wiki/images/9/97/NanoPi_M5_LP5_2411=
_SCH.pdf
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Changes in v2:
> > - Describe UFS supply regulators
> > - Add link to schematic
> > - Link to v1: https://lore.kernel.org/r/20251127-nanopi-m5-ufs-v1-1-0d2=
8d157712c@gmail.com
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 27 +++++++++++++++=
++++++++
> >  1 file changed, 27 insertions(+)
>=20
> Would you mind pulling this one, or do you have any reservations?
> There hasn't been any discussion, but it looks like a pretty simple
> change, runtime tested and schema-tested.

Your patch fell directly into the dead-zone between -rc7 and -rc1 ;-)

> +	vcc1v2_ufs_vccq: regulator-vcc1v2-ufs-vccq {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <1200000>;
> +		regulator-max-microvolt =3D <1200000>;
> +		regulator-name =3D "vcc1v2_ufs_vccq";
> +		vin-supply =3D <&vcc5v0_sys_s5>;
> +		en-supply =3D <&vcc_3v3_s3>;
> +	};
> +
> +	vcc1v8_ufs_vccq2: regulator-vcc1v8-ufs-vccq2 {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-name =3D "vcc1v8_ufs_vccq2";
> +		vin-supply =3D <&vcc_1v8_s3>;
> +		en-supply =3D <&vdda_1v2_s0>;
> +	};


But where does the "en-supply" come from? For the life of me, I can't find
any reference to it in either the bindings in the kernel, nor the dt-schema.

Can you please point me to the part of the documentation where that is
described?

Thanks
Heiko





