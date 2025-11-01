Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76F6CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 11:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/+9Nrg/MBKOyjOA2O+fnXbPaDve8v5ZbqMCiqeCxKE=; b=fpjV8tWnSQj8EIUp2507v53479
	QX5ko+GUPJETTCUaEDbw7Uc9UO8/e5qLY1L9ScQ/T7JLGp8y68UjJeM/SW1SorycOKuhBYmJZ6O/6
	6R5W/JWarAoUiPwTZHbxLI73BF1c3/b8b2lyIQWAuCzyFX2kjfwE+wRBVOkOqyWHOl2evVAWlfNoU
	ylz+Uz08MWelcuzCXYXUxNly68slURDiUW6YcPXPBLzxyAo3YCJjnbNsgo25eD49aeYxK4kSxiA00
	MKubeyqVVDJQ8N1OrDR1XyQJwTTFdXd/A7qZcgoEJ+NkncK2EQp4aul2lBPYdsBzk05zxxFjH7lLR
	NDWkUKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFABQ-00000007JgZ-13Q1;
	Sat, 01 Nov 2025 11:54:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFABN-00000007Jg7-2DHm;
	Sat, 01 Nov 2025 11:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2/+9Nrg/MBKOyjOA2O+fnXbPaDve8v5ZbqMCiqeCxKE=; b=vBFn4pnkphDuozK5iAz9y8k4E4
	l5Rk/WmLU/cMVmO4oTd5xthvniS2QfDBF5scMKSfVkaPyVEXrUevzYFw8mGUGcPSgdLB6m9vAw7lE
	3yYX1wd/CdVCYJlvwFqodjOgNkWhtfa1rC64UCZG+zqeLKhNZz9QbS7egZdf9ITJJnH/yEg4vVEJx
	1Q6tL++wkVXm5jAoAFl3vHxvhP4IVa/O/i0RCUGOZn4bG++Lw1f/LPUHbX6gU3S3OuA4tgB9gI4JS
	XGzKWfsPt+VkalK0ndUKpt5SZ5RRm22bLwmVaIcTb3cjXXDiY+WbgjuBhv8ZAk+qjzDGHKTmXGaM+
	xhCyyjwg==;
Received: from i53875b80.versanet.de ([83.135.91.128] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vFABL-0008PQ-Jz; Sat, 01 Nov 2025 12:54:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>, Tianling Shen <cnsztl@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Grzegorz Sterniczuk <grzegorz@sternicz.uk>,
 Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6 with
 A3A444 chips
Date: Sat, 01 Nov 2025 12:54:06 +0100
Message-ID: <10751338.nUPlyArG6x@phil>
In-Reply-To: <5af928c4-4b6e-489c-ad39-26cef3dd7473@gmail.com>
References: <20251017073954.130710-1-cnsztl@gmail.com>
 <08911ae2-fef3-432d-a236-d820c9cb67ac@gmail.com>
 <5af928c4-4b6e-489c-ad39-26cef3dd7473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_045409_641418_861BD2D4 
X-CRM114-Status: GOOD (  24.86  )
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

Am Montag, 27. Oktober 2025, 18:34:25 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Tianling Shen:
> + Jianfeng
>=20
> On 2025/10/20 12:44, Tianling Shen wrote:
> > Hi Shawn,
> >=20
> > On 2025/10/20 9:53, Shawn Lin wrote:
> >> Hi Tianling
> >>
> >> On 2025/10/17 Friday 15:39, Tianling Shen wrote:
> >>> From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
> >>>
> >>> Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O errors and
> >>> corruption when using HS400 mode. Downgrade to HS200 mode to ensure
> >>> stable operation.
> >>
> >> May I ask you to test another patch I just posted to see if it fixes
> >> your issue?
> >>
> >> https://patchwork.kernel.org/project/linux-mmc/=20
> >> patch/1760924981-52339-1- git-send-email-shawn.lin@rock-chips.com/
> >=20
> > Thank you for the patch! I will ask my friend to test it but he uses=20
> > this board as a home router, so it may take a few days or weeks to=20
> > report the result.
>=20
> Hi all, sorry for the late. My friend has tested this patch and it works=
=20
> fine after 50 times dd operation. A big thanks to Shawn!

So I guess, we don't need the patch reducing the speed anymore, right?


Thanks
Heiko


> And hi Jianfeng, I found you made a similiar patch[1] for the ROCK 5 ITX=
=20
> board to lower down the mmc speed, could you please check if this patch=20
> also fixes your issue?
>=20
> Thanks,
> Tianling.
>=20
> 1.=20
> https://lore.kernel.org/linux-rockchip/20250228143341.70244-1-liujianfeng=
1994@gmail.com/
>=20
> >=20
> > Thanks,
> > Tianling.
> >=20
> >>
> >>
> >>>
> >>> Signed-off-by: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
> >>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> >>> ---
> >>>   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 3 +--
> >>>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/=20
> >>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> >>> index fafeabe9adf9..5f63f38f7326 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> >>> @@ -717,8 +717,7 @@ &sdhci {
> >>>       no-sd;
> >>>       non-removable;
> >>>       max-frequency =3D <200000000>;
> >>> -    mmc-hs400-1_8v;
> >>> -    mmc-hs400-enhanced-strobe;
> >>> +    mmc-hs200-1_8v;
> >>>       status =3D "okay";
> >>>   };
> >>
> >=20
>=20
>=20





