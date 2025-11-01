Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86776CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 12:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQvbdhiXZZph0YAYJiNdm8OJtzwwngVKL/B8nmm12Vc=; b=QLWyjuKYwg2uKtQtbcI6jrZ6pF
	3LbqHwhAHNKbc25ebUWrRauYuRYVJcy2tXqfr493ei/2eLWqPtxo+VGg+RrBXyuyNQd2Tkkh4ggBS
	YKDbvWhtsQBbhytr+eNQgfh8aOFguIVKAr+eYFzxOGqe0IH5CzVy3hznxuMcpqCEEkILKct+niL3v
	Bs78UjqTTZ2QfG/sDKilTCB4bBd9vAJ3aS4a9xmr7Jfh8F7w4rYf/eHZkfcO0/KH9TE457xG+26mr
	B4bc+hu6VRIp3rCZx3kGmLsusFiGohuILUnf5URGGvV11YRaHlyk/T8nNQorgpKzAzUMkXe56n5h+
	7FrHspIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFB4d-00000007kPE-0Uw1;
	Sat, 01 Nov 2025 12:51:15 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFB4a-00000007kOZ-3AtW;
	Sat, 01 Nov 2025 12:51:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id CBA4340E0A;
	Sat,  1 Nov 2025 13:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1762001463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fQvbdhiXZZph0YAYJiNdm8OJtzwwngVKL/B8nmm12Vc=;
	b=bzkZ44vfgDZOcAzzR08beda9GaadarJtptSNqvAwy8aIv4HWsvMPJ2+iZS/50wypTQTy7g
	dNeURtHLT34G9vAf6hfv7SShnBj8ghs//nLo74Cojy+jm/gqQw3fWIACg+7caq5tPVhLbD
	w7yLteKmYySaEdjZeHK58xpNH4WUX6aMQUqAr6ueN0efIfjSiwMWkZVQzAdlftiynd5/hx
	uALokfjnoBno9fktxvRo+cSv/lY6xL831ktF5Dt6rbtaTCl5hKaaN5eVQvJBcAMzu2vrL9
	4Yk1UFSJq4jovHfYGj78G3rOS+BQ5+1on/cmmcnIJOmIMcaSuAIy/dCr2LATEw==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <10751338.nUPlyArG6x@phil>
Content-Type: text/plain; charset="utf-8"
References: <20251017073954.130710-1-cnsztl@gmail.com>
 <08911ae2-fef3-432d-a236-d820c9cb67ac@gmail.com>
 <5af928c4-4b6e-489c-ad39-26cef3dd7473@gmail.com> <10751338.nUPlyArG6x@phil>
Date: Sat, 01 Nov 2025 13:50:59 +0100
Cc: "Shawn Lin" <shawn.lin@rock-chips.com>, "Tianling Shen" <cnsztl@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Grzegorz Sterniczuk" <grzegorz@sternicz.uk>, "Jonas Karlman" <jonas@kwiboo.se>, "Jianfeng Liu" <liujianfeng1994@gmail.com>
To: "Heiko Stuebner" <heiko@sntech.de>
MIME-Version: 1.0
Message-ID: <e52de2b5-bf10-ce0e-66b7-66b1c46525f3@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= fix eMMC corruption on NanoPC-T6 with A3A444 chips
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_055113_126051_85DD2222 
X-CRM114-Status: GOOD (  23.26  )
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

Hello Heiko,

On Saturday, November 01, 2025 12:54 CET, Heiko Stuebner <heiko@sntech.=
de> wrote:
> Am Montag, 27. Oktober 2025, 18:34:25 Mitteleurop=C3=A4ische Normalze=
it schrieb Tianling Shen:
> > On 2025/10/20 12:44, Tianling Shen wrote:
> > > On 2025/10/20 9:53, Shawn Lin wrote:
> > >> On 2025/10/17 Friday 15:39, Tianling Shen wrote:
> > >>> From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
> > >>>
> > >>> Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O err=
ors and
> > >>> corruption when using HS400 mode. Downgrade to HS200 mode to en=
sure
> > >>> stable operation.
> > >>
> > >> May I ask you to test another patch I just posted to see if it f=
ixes
> > >> your issue?
> > >>
> > >> https://patchwork.kernel.org/project/linux-mmc/=20
> > >> patch/1760924981-52339-1- git-send-email-shawn.lin@rock-chips.co=
m/
> > >=20
> > > Thank you for the patch! I will ask my friend to test it but he u=
ses=20
> > > this board as a home router, so it may take a few days or weeks t=
o=20
> > > report the result.
> >=20
> > Hi all, sorry for the late. My friend has tested this patch and it =
works=20
> > fine after 50 times dd operation. A big thanks to Shawn!
>=20
> So I guess, we don't need the patch reducing the speed anymore, right=
?

Exactly, the approach of lowering the speed of eMMC to improve
its reliability is no longer needed, thanks to Shawn correcting
the DLL=5FSTRBIN=5FTAPNUM=5FDEFAULT value in the above-linked patch.

We just need to test does HS400 work on the ROCK 5 ITX reliably
as well, so the previous lowering to HS200 in commit b36402e4a077
("arm64: dts: rockchip: slow down emmc freq for rock 5 itx", 2025-
02-28) could be reverted as no longer needed.

> > And hi Jianfeng, I found you made a similiar patch[1] for the ROCK =
5 ITX=20
> > board to lower down the mmc speed, could you please check if this p=
atch=20
> > also fixes your issue?
> >=20
> > [1] https://lore.kernel.org/linux-rockchip/20250228143341.70244-1-l=
iujianfeng1994@gmail.com/
> >=20
> > >>> Signed-off-by: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
> > >>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> > >>> ---
> > >>>   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 3 +--
> > >>>   1 file changed, 1 insertion(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi=
 b/=20
> > >>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> > >>> index fafeabe9adf9..5f63f38f7326 100644
> > >>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> > >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> > >>> @@ -717,8 +717,7 @@ &sdhci {
> > >>>       no-sd;
> > >>>       non-removable;
> > >>>       max-frequency =3D <200000000>;
> > >>> -    mmc-hs400-1=5F8v;
> > >>> -    mmc-hs400-enhanced-strobe;
> > >>> +    mmc-hs200-1=5F8v;
> > >>>       status =3D "okay";
> > >>>   };


