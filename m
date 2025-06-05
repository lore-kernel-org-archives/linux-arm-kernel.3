Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95D9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 11:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDizFze/hyxfmmFH+Z9n7Pgzu80dINVRGBjV8qhWnzA=; b=AkWPcV+nDuU5sKgjI17JePOP50
	gHMxMzZcLIlaML8ELtHlSq4iOpz11zmZmEmwtOuUGNZ4crt6jCO7b3+WM+xV/yg/dLbIICuc/oIw9
	2RGGy/6/Da4YXB0uCC90MkArIZ0RFDggjGB557SWRyKk8fp/rLRdOoqxXsIcy7IagpyI4tgQsB1tW
	3EnmKMojBRVtcEC2MdGc93oFZcYq/YYlz+cnl/t0sG3dAnAFMvIotoVtebakLUBDdU1/kUSlW7m1/
	yMiwq8Y6hLWdQ/AxrWmm3Al5S6BR4hAOXCIIp1MQoWhw/O4dcpNbOtxy2cZAOjOxZaY2DNBBFlyyr
	esOZ1OLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8tR-0000000FNDY-1Y7A;
	Thu, 05 Jun 2025 11:36:21 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8gv-0000000FLxT-18nv;
	Thu, 05 Jun 2025 11:23:26 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4a4bb155edeso9668631cf.2;
        Thu, 05 Jun 2025 04:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749122604; x=1749727404; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDizFze/hyxfmmFH+Z9n7Pgzu80dINVRGBjV8qhWnzA=;
        b=RYgnbj3Rbqqy4KqP52HZ+L5ewOUPJeyHe2qE4jxA1mf8qWgwlGnTHRiXQtMctQIf29
         lVRHQ/cxNnulcCYldEEIT1H+4buLpZPNyNk+YBu67YddmsGj0Kh7pfBWIOF+Coq88k+c
         maipLwlAs3LXkewbJ3963wdJxIAyBnf4C1xEVdkidQcDEpNs78lNg5m4ve0a1U0tED63
         gjRyyEQlyDY7eEUpBgKhL7eofNXhkHxhCBaKwFcz1Tmo6UxV7dcKFjONglaQv9B5fklT
         et4RDhMJMGXsK8oCuc6WO0gHTzox6NpVjHU58gMTnOaKnUDv/k9Qz0mUBz2uJZHcskT4
         jjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749122604; x=1749727404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDizFze/hyxfmmFH+Z9n7Pgzu80dINVRGBjV8qhWnzA=;
        b=RtTiNf+CxqyYb+a2/YApzv6CXIZJ6/TWEMstMPbX/ZJexDMcETeZQXJt3t+baISvbs
         V1TGkP9vHk+QP24o4omx9R3HM1p9umzALA5doIgxNWs+knM/1Uhzg/Yv74T8LhtieiS8
         CweJ4vBuiBvjMIRW7sq4Y/L2HF0rCBGyRnrfHGn02XeFAl1G4IB10fPpAGn1Jl6cLsYa
         ADiY55yr8Yt82mbhsEIly+BvNiXH0PwLnQgPqfB3ANtM/4SkUeuYZX2qCdVjqb5oOfmP
         ZWto5A9MAUlICO8+SUj527XhXQxNWYqsrbXmmjUFinHHzYAXItp+rFscERBFLVvcQEfJ
         xRXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV13GlgZSN2ZfLllsoNULqnTRaUU5ZfWN1zWiLLSIH8dlocguVBXBLcw3gn3KhgawdT1+RQ4cX86EfOf794PcI=@lists.infradead.org, AJvYcCXX5UbG4u2+dom4vcgWfIrYjZq2H2MbyU+2P+VRbaM4AIxTDYIIn0NideZIme8fdbtQdxo6yg6UuEVJMZzmA0n2@lists.infradead.org
X-Gm-Message-State: AOJu0YyVkiX+B8oDpH3ZGDEOxZj3VsBFV++EhN0NUiLRtqy2pvV1XrW/
	WgpT3hMdSND6vkwz/tXXampOjJ2oP4Wpiywgd72f1xWInNRVjzkzLDiioyvy+WPjOGUQG87db8t
	0VR3nGHvJhWDQhWhbyVpX4QsLzX836u0=
X-Gm-Gg: ASbGncsZc0EB49BVg9RVX7/BmDamh51Y6H7wrAeOhMNqsbCDK1tz9s8F2o6CakC+g9Y
	1bvl6mwhgOUKkNCfz38tuad6C7OKBK8aj6QBjIgNYbnBsk9C7h0Cd3VI9dMjCn/3xRWv8QzQR/E
	rKudXgr+AufRXeDOEv34cvUEHMNclBBep3xhl4Tcrf9g==
X-Google-Smtp-Source: AGHT+IFxaSe8SmfOVrKj5PzC+PDhsrX1HEfaz65+xtZxnKyLtWkEJUtGUuyZJdJWYe7NQXeqgh0Qo15kLkJ4vnPGagY=
X-Received: by 2002:ac8:5cd5:0:b0:48c:c121:7e27 with SMTP id
 d75a77b69052e-4a5a584733cmr119373931cf.50.1749122603602; Thu, 05 Jun 2025
 04:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com> <DAEK3EQVNWQX.24DOM2VICSGCP@cknow.org>
In-Reply-To: <DAEK3EQVNWQX.24DOM2VICSGCP@cknow.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 5 Jun 2025 15:23:16 +0400
X-Gm-Features: AX0GCFsY4gmlZjHIBycyRoHQVN5KjE-g17VnqUGnair-V8LWvXbVvGhXOwb0_dY
Message-ID: <CABjd4YzyGx60AeyxL049UrEFkhN_03+wHo64DLL778FimDvGeg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_042325_310990_D96B07C3 
X-CRM114-Status: GOOD (  13.09  )
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

On Thu, Jun 5, 2025 at 3:18=E2=80=AFPM Diederik de Haas <didi.debian@cknow.=
org> wrote:
>
> On Tue Jun 3, 2025 at 7:01 PM CEST, Alexey Charkov wrote:
> > List both CPU supply regulators which drive the little and big CPU
> > clusters, respectively, so that cpufreq can pick them up.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++++++=
++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..d9c129be55a0d997e04e6d6=
77cdc98fb50353418 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > @@ -207,6 +207,22 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
> >       };
> >  };
> >
> > +&cpu_b0 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> > +&cpu_b1 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> > +&cpu_b2 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> > +&cpu_b3 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> >  &combphy0_ps {
> >       status =3D "okay";
> >  };
>
> The &cpu_bN nodes should come after the &combphy0_ps node.

True, thanks for spotting it. Don't know why they ended up separated
from &cpu_l*

Best regards,
Alexey

