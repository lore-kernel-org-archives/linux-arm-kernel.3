Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5D1C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 14:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Jg5NzVH9x0e/UrqCaECe5kEEmmSbvsrq491+SQEdD8=; b=QLAXpoGEttqd6ph1ZT5QXfL5Tb
	hzvalZhmMcpw0IUx3akX+PNyzs3m2ejvyjUPKiZTsqAsjCszvvmD4WI1Q/VZuyzqvplC3PR8lm0JB
	YcdChI2HXJdPfurud+1c5BHVkZt+cnA+TuzjiRtUtiPX7jlgMfkqWZtdFRrX67p1OMRydWAbFzBic
	FwSHrh8WmmOrxz34Puo8U03UUxJnxc0m6rbJoCJz+Uy1gEv1ogxvnyu8aHa4PTnzOATrMZhzjYnmo
	5nMOgjs7AD2gMjiN1Hz1HW6VaUuAUvuzehyA3T8wP2En5NpBeHd0WCn+ucVmO93ObqIhCQTcof6jx
	/it1CIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMoy1-0000000DY03-0Y4c;
	Wed, 04 Jun 2025 14:19:45 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMouC-0000000DXTS-0SV7;
	Wed, 04 Jun 2025 14:15:49 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4a42f28017eso11860021cf.0;
        Wed, 04 Jun 2025 07:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749046547; x=1749651347; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Jg5NzVH9x0e/UrqCaECe5kEEmmSbvsrq491+SQEdD8=;
        b=YZ01Eez4dD7tgYKEZ+KqLdxKmQ5/xnZVgsgIIw1uoa5oeQoLv99QMHp1ya+yTaewiD
         cBrvkjJYKmwP5upH381EZfscDRDIBMRP3zGQq3JuDuepjGpdnnhL4XorNrtJKDitLBzh
         U9fvh8y/MkXyG/X9HeWVdIEcBqvW7SyIi+6HdSDs+hR07svaSi20+DelBk1/eJGKkbRM
         iN2szmakdVPGHbOT6E13XhY15HohX6ATVgEHjewN9Wzuze5fmAJ0L5doPnvELlv3ecnd
         odGjUgOt5JCLXTL8HEYC/bn+LO9TI0sApSajagb5pDXoUj984j6BgnEcyqaLX1mgeolr
         HOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749046547; x=1749651347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Jg5NzVH9x0e/UrqCaECe5kEEmmSbvsrq491+SQEdD8=;
        b=Kx+MKKR/fxdceUHiSevrt2wByKysXwSgcQElM+iv6nyWLxak5zCRplSyHGdlDYFZ+W
         FMRyIQStK/i6RtNn4fKgmJ9mM+M2hrMriSmt7FzYBfRnubPIKPabP4meawSjzb0W5ksz
         LqF65KeHE6lDoUmOlYkAi13PbgV7gWlGHzNAVKe6+fcTRDz2megNXgjmb3MTdo0DR7Y3
         H9i/xDsVO5W8bPPHdYkpCuuh/cmYLMKDw4WqiZaSWQ7lb+dzXtlg9iMegerFTXr0E2zE
         1ABK5B2xnNIzS0K/G/ga6PIoNYFMAzVRVptWLEVYyYYhSzGyHZhkYtR5twQhIcN/wUd8
         ZmPw==
X-Forwarded-Encrypted: i=1; AJvYcCUOt/TfQ0Hbm0IsZ7a2k0WGLw3Me2CC1rVFjQag/E234/eX/3Yx/TFn5QuCK7A1/ldsmKfeYmbC6axv78ihJvUg@lists.infradead.org, AJvYcCVUG93U55w7Upk6mluRGJ/zqmU+mCFsC9C5ti8PDZ2c42iYlvf8WM5KLO4x1SOEB2q0RUuHbjpEVJrprYoTfOo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyptcrmd/rJu4nEtpvCgg0r+T+omB8WXSS5OuIn29Z/9AmqwFud
	yWYo/anU9JTr7aOo1NEKphpFsqHZd9wkTFnh0YClwD/Ks9BE0RAA/pAhxRKAgWoyOWi7ugMIfHT
	tAqlQS/b6qTPicrfpeR5abReVm7t2O8DLEqga+Q3r5fs2
X-Gm-Gg: ASbGncuB76movurhVpJX8jOGJH1lD6Orb1mi4rT36UYuWHx22KMndlP5K0TThwSBrNx
	5aMbgqdzSOMnGEKtrv9rMmrmhAzYAhyRYcZr8Angls6LHz6ee5a7v2XZWIflTdkuRIQsUmQHwaV
	7I3nX/aotQuBAPf4Z14+4TWb4ePdka3nc=
X-Google-Smtp-Source: AGHT+IFyPdm7h42GRcVyPmAA4X8jANkDh7Synd5egnSqzeiSSM5/zmGzBDUZs3mzMIf1pwlRH506uMCvsx+yJMdRwm0=
X-Received: by 2002:a05:622a:4d0a:b0:494:7191:9f80 with SMTP id
 d75a77b69052e-4a5a56f2403mr53082581cf.16.1749046546628; Wed, 04 Jun 2025
 07:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com> <174904540020.3869609.29886103068021354.robh@kernel.org>
In-Reply-To: <174904540020.3869609.29886103068021354.robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 4 Jun 2025 18:15:35 +0400
X-Gm-Features: AX0GCFuFHM52cAYw2Dx-JD6z3McuUg4g7ERZuiqkBqoiRvc1ZSxeJSlSnxPNrig
Message-ID: <CABjd4Yzfy3A95EVXGh6espREMTpUOD=GoR3orxScmWJW85R3dg@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: rockchip: enable further peripherals on
 ArmSoM Sige5
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_071548_148583_F3AB8B04 
X-CRM114-Status: GOOD (  31.58  )
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

On Wed, Jun 4, 2025 at 5:58=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Tue, 03 Jun 2025 21:01:12 +0400, Alexey Charkov wrote:
> > Add support for the two USB type A ports, link up the CPU regulators fo=
r
> > DVFS, enable WiFi and Bluetooth.
> >
> > The bluetooth part might warrant some discussion and thoughts from the
> > list, given that it's connected over UART and thus not discoverable. At
> > the same time, there are two revisions of the board which have differen=
t
> > Bluetooth chips soldered on: Realtek based on v1.1 and Broadcom based o=
n
> > v1.2. I'm not sure if there is any way to determine board version from
> > software. Mine is v1.2, so the respective patch deals with the Broadcom
> > case only, but maybe it's better to move it into a .dtso and thus kick
> > the can down the road (i.e. make the user deal with board identificatio=
n
> > and loading of the right overlay)? Thoughts welcome.
> >
> > Best regards,
> > Alexey
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Alexey Charkov (4):
> >       arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
> >       arm64: dts: rockchip: enable USB A ports on ArmSoM Sige5
> >       arm64: dts: rockchip: enable wifi on ArmSoM Sige5
> >       arm64: dts: rockchip: enable bluetooth on ArmSoM Sige5
> >
> >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 135 +++++++++++++=
++++++++
> >  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  16 +++
> >  2 files changed, 151 insertions(+)
> > ---
> > base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
> > change-id: 20250602-sige5-updates-a162b501a1b1
> >
> > Best regards,
> > --
> > Alexey Charkov <alchark@gmail.com>
> >
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 546b1c9e93c2bb8cf5ed24e0be1c86bb089b32=
53
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com:
>
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: mmc@2a320000 (rockchip,rk=
3576-dw-mshc): compatible: 'oneOf' conditional failed, one must be fixed:
>         ['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too lon=
g
>         'rockchip,rk2928-dw-mshc' was expected
>         'rockchip,rk3288-dw-mshc' was expected
>         'rockchip,rk3576-dw-mshc' is not one of ['rockchip,px30-dw-mshc',=
 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-=
mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk33=
28-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchi=
p,rk3528-dw-mshc', 'rockchip,rk3562-dw-mshc', 'rockchip,rk3568-dw-mshc', 'r=
ockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-msh=
c']
>         from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-ms=
hc.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: mmc@2a320000 (rockc=
hip,rk3576-dw-mshc): compatible: 'oneOf' conditional failed, one must be fi=
xed:
>         ['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too lon=
g

Should be just rockchip,rk3576-dw-mshc.

Thanks bot, and sorry for the noise - missed this one.

Best regards,
Alexey

