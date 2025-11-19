Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BCFCF2588
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPnh4647l0Ye1/fWlT5mBsuMOhFdOEN38ARA/l13Q8c=; b=Wswilrfl4llvyo504yrC7XblR2
	q/SQg8uNmU5nfwGoxIQPPIU/LXAGbZjct14U9ar6OwNaxA4TJJVcp+lbYj+vUex77pgtlnKXfcXfH
	oMveFzYR1beXHHfl61qw389Xoh0mRDuEw5deVSk5Hp3PjvTtUR+MhHYxHIPVxjN+f8uquqSQjaTF3
	Z8SsxlwBsGHrN5BrFirQfz1LBwrVsd8YZTY46lREzslugbMlKkdQqwNz/c0TeD2GpNhTr1ap/cZKs
	Dk2SdLPTCUWlKk803DbLyfBxzQ7vV4L/d1igyX/lPVXsUSQjJEIhO+onTDdlARC54VUl88qLJnArL
	Rz/obvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLbyV-00000002eDZ-1C9I;
	Wed, 19 Nov 2025 06:47:31 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLbyS-00000002eCo-3tZm;
	Wed, 19 Nov 2025 06:47:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 85BDF41281;
	Wed, 19 Nov 2025 07:47:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763534842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VPnh4647l0Ye1/fWlT5mBsuMOhFdOEN38ARA/l13Q8c=;
	b=yLXwecfEvsrN+fPShQu7pUzx54NBsWvHHEU1/ZnbH64PmSCnxxv2fH/dytG/OADsSPgYMK
	0hoG5iNr1Hb165RJJNzTHl54ImwWEEKSd1MRWrmqwEMkBdgPTRshpDj7Xpq0HduR2NHx5j
	gYro03GRO19FOv5cUlSNC0tBRw5DWeiKckTIenGGhp3v0FXTQniVAzNOK6Fa1kyPYIHV4z
	hosgJERLb/tD0pZNHvE734+iu7aOA2ZjQ8JeFbso/g/6JjjVKEllL7/yO6y60n9uwgOo8C
	IHzWsNLam8jJ9fxFMXhpga9tsROqnJvVELN7Fs/KTDlKWvQTcOiTc6MRrLXzbA==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <0c224662-b3c2-4075-8b68-c0ae27421ba8@rootcommit.com>
Content-Type: text/plain; charset="utf-8"
References: <e4cd11d0-463c-e707-5110-6b92899b1ba3@manjaro.org> <0c224662-b3c2-4075-8b68-c0ae27421ba8@rootcommit.com>
Date: Wed, 19 Nov 2025 07:47:20 +0100
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Message-ID: <3c96ee6b-dca7-1a0a-792b-f8c165ec997d@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/2] =?utf-8?q?dt-bindings=3A?=
 =?utf-8?q?_arm=3A?==?utf-8?q?_rockchip=3A?= Add Asus Tinker Board 3 and 3S
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_224729_225904_9430DC75 
X-CRM114-Status: GOOD (  17.51  )
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

Hello Michael,

On Tuesday, November 18, 2025 06:27 CET, Michael Opdenacker <michael.op=
denacker@rootcommit.com> wrote:
> On 11/15/25 01:52, Dragan Simic wrote:
> > I'm sorry again for not mentioning it in my earlier responses,
> > but shouldn't this addition be specified like below:
> >
> >       - description: Asus Tinker Board 3/3S
> >         items:
> >           - enum:
> > 	          - asus,rk3566-tinker-board-3
> >             - asus,rk3566-tinker-board-3s
> >           - const: rockchip,rk3566
> >
> > ... because the introduced .dts files define the actual board DTs,
> > by descending from the common .dtsi file, while they're compatible
> > in the sense of the 3S board variant extending the 3 variant.
>=20
> Actually, "make dtbs=5Fcheck" fails if rk3566-tinker-board-3s.dts has=
:
> compatible =3D "asus,rk3566-tinker-board-3s",=20
> "asus,rk3566-tinker-board-3", "rockchip,rk3566";
>=20
> The failure is:
> arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3s.dtb: /=20
> (asus,rk3566-tinker-board-3s): compatible: 'oneOf' conditional failed=
,=20
> one must be fixed:
>  =C2=A0 =C2=A0 ['asus,rk3566-tinker-board-3s', 'asus,rk3566-tinker-bo=
ard-3',=20
> 'rockchip,rk3566'] is too long
>  =C2=A0 =C2=A0 ['asus,rk3566-tinker-board-3s', 'asus,rk3566-tinker-bo=
ard-3',=20
> 'rockchip,rk3566'] is too short

Oh, I missed that completely, thanks for running the checks.

> If I understand correctly, to keep the=C2=A0rk3566-tinker-board-3s.dt=
s file=20
> as it is, you need Asus Tinker Board 3 and 3S to have two different=20
> descriptions as in V2:
>=20
> - description: Asus Tinker Board 3 items: - const:=20
> asus,rk3566-tinker-board-3 - const: rockchip,rk3566 - description: As=
us=20
> Tinker Board 3S items: - const: asus,rk3566-tinker-board-3s - const:=20
> asus,rk3566-tinker-board-3 - const: rockchip,rk3566
>=20
> The other solution is to remove the "asus,rk3566-tinker-board-3"=20
> compatible from=C2=A0rk3566-tinker-board-3s.dts, which is not a big d=
eal in=20
> my opinion. In addition, if some code turns out to work only on 3 but=20
> not on 3S, though that's not expected if 3S is indeed a superset of 3=
,=20
> we won't be stuck.
>=20
> I can submit a V3 along these lines.

This should let us keep the "asus,rk3566-tinker-board-3" compatible
in the new rk3566-tinker-board-3s.dts board dts while satisfying the
validation properly:

  - description: Asus Tinker Board 3/3S
    items:
    - enum:
        - asus,rk3566-tinker-board-3s
    - const: asus,rk3566-tinker-board-3
    - const: rockchip,rk3566

I'm quite busy at the moment, hence my delayed response, and I also
apologize for not running the checks on the above-proposed solution,
but I think it should work as expected.


