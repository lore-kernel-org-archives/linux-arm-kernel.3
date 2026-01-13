Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCC1D2F33F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgxXVC2FsBUN9t3WEgWwzTWuclM5HhRFteoBQ8njGPI=; b=m806lxIT+qDjU7DMF8ZBQ35Mk2
	Qg3VnSNy3UeYC9DFvmanqvItj97pbW8VtlexBCWd+Qa6Yl8SKbTbEMV+3Y83mOGG2BsLDfM6jdxJG
	ho1Kq96Qs/+fMentR/1dN1gOF07hCxkBGmQ7QEF77k6LzmET4O+zBK3kZV5gyzcYypoaXDBfc3yj0
	viD3CdIvgRHVK3b1Vm90ntgZRldke4UMkvxBd39xDG9Jx6q0swMa412uP7J6m+KlV8WU1zGqd5V8+
	EhyGOKvUB3p+BqUTYcFQHwYaE5Ptk8cvpKhY3Iqnk9MNkSqrM/nDGTrIldcvuxyShzqQN8wCMZxpO
	ddiZQeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfh7E-00000007SQj-2XYQ;
	Tue, 13 Jan 2026 16:19:32 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfh7A-00000007SQH-3i3F;
	Tue, 13 Jan 2026 16:19:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id D66D3417BD;
	Tue, 13 Jan 2026 17:19:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1768321163; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sgxXVC2FsBUN9t3WEgWwzTWuclM5HhRFteoBQ8njGPI=;
	b=dkQBUFnGXLxGcBL1IwTitewtzZlr1MF+dr9gAvL+Rgv4zAXinS/wHcs3mc4RMR6rEzW8FU
	Y6qYxgljyojIpsBQdri/tSMkvRqOgE1SpHyTILD+sIQbeGERw7yDNJZh0Us4wX9WdijpLJ
	kp7ptijvu47Of3UZW9CC6J2pLB1oswc91cO2Cb0rWRgDdZyaoDYBmLq6fa28gaSNsIJNUR
	nCLi/hQlY7n9xQzLqDNe5LAvvNw3/Pi4pphNSccAAR1RWklFA734zq80Z7sdwZ/n9eTJ0T
	QrAJ9sQTKxJSw4d6dTofRaj6mxXC5Yu1jXHtBvZWixKbIYqJB2/YDv0wkiPlmg==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20260112141300.332996-1-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <20260112141300.332996-1-jerrysteve1101@gmail.com>
Date: Tue, 13 Jan 2026 17:19:17 +0100
Cc: heiko@sntech.de, pbrobinson@gmail.com, didi.debian@cknow.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
To: "Jun Yan" <jerrysteve1101@gmail.com>
MIME-Version: 1.0
Message-ID: <3468aed9-c760-fe0e-5c5f-4b03129873fd@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= Remove =?utf-8?q?hdmi=5Fsound?= on 
 rk3399-pinebook-pro
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_081930_939930_41B536EE 
X-CRM114-Status: GOOD (  16.00  )
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

Hello Jun,

On Monday, January 12, 2026 15:13 CET, Jun Yan <jerrysteve1101@gmail.co=
m> wrote:
> According to the Pinebook Pro specification, it lacks HDMI port,
> but hdmi=5Fsound is wrongly enabled.
>=20
> This fixes the following warning:
>=20
> platform hdmi-sound: deferred probe pending: asoc-simple-card: parse =
error

Thanks for this patch!  I'd suggest that the patch description is rewri=
tten
a bit using the standard imperative mood, and without relying on the pa=
tch
subject or the patch itself for establishing the required context.

For example, it may all read like this:

  arm64: dts: rockchip: Do not enable hdmi=5Fsound node on Pinebook Pro

  Remove the redundant enabling of the hdmi=5Fsound node in the Pineboo=
k Pro
  board dts file, because the HDMI output is unused on this device. [1]=
[2]
  This also eliminates the following warning from the kernel log, which
  also gets emitted on some other devices with HDMI ports, caused by so=
me
  other reasons that are still unclear:

    platform hdmi-sound: deferred probe pending: asoc-simple-card: pars=
e error

  [1] https://files.pine64.org/doc/PinebookPro/pinebookpro=5Fv2.1=5Fmai=
nboard=5Fschematic.pdf
  [2] https://files.pine64.org/doc/PinebookPro/pinebookpro=5Fschematic=5F=
v21a=5F20220419.pdf

As described above, getting rid of the quoted kernel warning is actuall=
y
a nice side effect, so to speak.

> Fixes: 5a65505a69884 ("arm64: dts: rockchip: Add initial support for =
Pinebook Pro")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

The tags should also include "Cc: stable@vger.kernel.org", to have this=
 fix
propagated into the stable kernels as well.

> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/a=
rch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> index eaaca08a7601..a6ac89567baf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> @@ -421,10 +421,6 @@ &gpu {
>  	status =3D "okay";
>  };
> =20
> -&hdmi=5Fsound {
> -	status =3D "okay";
> -};
> -
>  &i2c0 {
>  	clock-frequency =3D <400000>;
>  	i2c-scl-falling-time-ns =3D <4>;


