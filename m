Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F933E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrhJ08F+g99/pDpHcc0SfE5usAMSb6pyknS9o1Vrtpc=; b=A4pHp/S0Dd1Q+gwxPqn1/SwtvO
	FOlTiVdkAPQ+vPCDrWkbWhwur9UPXn2XjsuhOnW3sbJZKAJihnFHO4qjEsQSSPMPA4s+JEulcOm2Q
	NW1Qy/EKZx1KYJe0cUJF+pqQJqxR33SqmR2nbgNo8kJYnEjga/08xsoridc1giATAUHkvm5KfyKsz
	3mmGa8+t2/XIUXVUEpoYu1wkLywlvon4zcXxJE9dGucdzWGX+We1tErNIlXk0EfS7unPvJ3q7K2mz
	05rs9KQSkEHJKr/bPF/aWjZZrSPfirQUtGTRcCoP44s4I+/lD66ejMa4h4WkxZm3EIsUsvNrGbiC1
	B1bpiIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVY2O-00000008yk1-1eIj;
	Wed, 08 Jan 2025 15:32:04 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVY19-00000008ybh-3OnX;
	Wed, 08 Jan 2025 15:30:49 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-467a3f1e667so99361201cf.0;
        Wed, 08 Jan 2025 07:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736350246; x=1736955046; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrhJ08F+g99/pDpHcc0SfE5usAMSb6pyknS9o1Vrtpc=;
        b=Smfd0mx1/O/ZFW/3Be8NCH8Mdp1PT+svuaCYIbErg/1fj9PFoizHnS6D07tkRu7BZm
         JwYtTMD5zmkvvAosAWicplhVH0tC7CjsKL2Fzn1aFjNRemSb1LR2R6Vo0TwIQUNPKjEb
         +h9D4bba2/PoSSA70rS+AcME5jVwnql6yNafJcD2+y+MDgeJYwC59S6nToLbXZSC9Tpf
         h6aLajT0CFjiWwUMQ6hB+wNgO7/Ebcoh8j8uhNnuQpUxhVbruDWGaZL1bDgnb01gh0oP
         veVXm2aiWbJY7oxey9fpW+oGJAfajfwpcQ0tLoNsSTRKSK3sfnosC6IzoVK8WPskE6hA
         e/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736350246; x=1736955046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrhJ08F+g99/pDpHcc0SfE5usAMSb6pyknS9o1Vrtpc=;
        b=rxFMywgdWfD1p69K2qbKX4l6p5EU5YxlVNCbImUztq0F2rqy/4YF2DdbCznsQaooMx
         vKijWV/OIbij2QLxSOnpIixyZSFmM+dT+aX8yF4v+Mf91FKU2YjjkAv1Tc2VEbmx1fyD
         i6u0/PENRBRd5NyECvPBWeQ3Rdaoja5zdIE59PpkDvatB8ss3KfDHrRK4dRCRzH/lug7
         sfTMhl/fIImfzrIHdgxXZ4QEAGsD0kJR1kAUJGcSjOmHcJFuaKRrFqzH3Z6v8/Letifi
         2BYt1KpwSuzluf7SaMqPINHWxOiyjV0oN5sr+L9rafpMUjddFxwd8+3SYtv4xk6QfBsW
         VBvg==
X-Forwarded-Encrypted: i=1; AJvYcCVaUdglFfdNq1kt540g0UBCGDY0oTwUFJlrzE//97yzj1weJkYXhtwbgM8TYxu1pzvFbd7tSQ2cPe27XNfJ5/jO@lists.infradead.org, AJvYcCX0ZquPhmHq8QEnxgpZqO4/zX2AvtvQe4hLO42XN5iEmcSbl/7pChfgZdv2ve9k1KHFlr+zZlz0Wl0gcNJt8iU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFx/nQP1n+qb59G9L2haa8RxltOlG5Dag6Kkuiod9PvxZcHN6O
	hVXif0beOBGp/J9zx2ov4cqBdIxZo7pxlsbC23iLKa+6dOu4q9ZwWzrrLd3OxoEe0wVj0khRf28
	Ck4qiSkPl3q9Aiz0COqOIze74tz4=
X-Gm-Gg: ASbGncuEV5XTDOXA8GZC6G18AqYVvU6uMdVsWfEiW+yXaEQOmzW10sabY6IeMtSw3P6
	pRRlzdDLJpN8CZOpp5LEA2QR6l+fBTOrr/vsBvp2Lf0Arb9VIkA==
X-Google-Smtp-Source: AGHT+IFKoNRB02f9LEFBsjP1jngmLgnZ+gqmlVlhb4sD5ormVLieH9nwZeRMYU+GK1pDFpGelYsoVARAQOsSY3XSoak=
X-Received: by 2002:a05:622a:144e:b0:467:81ef:1953 with SMTP id
 d75a77b69052e-46c71079ec7mr43270661cf.7.1736350246055; Wed, 08 Jan 2025
 07:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20250108-rk3588-h96-max-v58-v2-0-522301b905d6@gmail.com>
 <20250108-rk3588-h96-max-v58-v2-2-522301b905d6@gmail.com> <1950286.IobQ9Gjlxr@diego>
In-Reply-To: <1950286.IobQ9Gjlxr@diego>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 8 Jan 2025 19:30:35 +0400
X-Gm-Features: AbW1kvbaSD6420vb9Z-krZSCK7YnPn-rkLl-OwWfP77vCyeVbOh_HhHdHm1BmrY
Message-ID: <CABjd4Yy4Qd1rD43u3B-s=HxVBnaQt7fSgP9NFY2YeY0eKMESvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add SPDIF nodes to RK3588(s)
 device trees
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_073047_849155_E725A3E0 
X-CRM114-Status: GOOD (  17.79  )
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

On Wed, Jan 8, 2025 at 2:01=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.de>=
 wrote:
>
> Hi Alexey,
>
> Am Mittwoch, 8. Januar 2025, 10:09:07 CET schrieb Alexey Charkov:
> > RK3588s has four SPDIF transmitters, and the full RK3588 has six.
> > They are fully compatible to RK3568 ones. Add respective nodes
> > to .dtsi files.
>
> While it may seem that way, we still want soc-specific compatibles,
> to future-proof this.
>
> I.e. going the the
>         compatible =3D "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
> way, so that now things can just match against the rk3568, but if some
> fault emerges later on the code can be fixed with the DT staying just
> compatible.
>
> The spdif also has an example already for all the spdif variants that are
> compatible to the rk3066 [3], so it'd need another "items" block for thin=
gs
> being compatible with the rk3568.

Hmm, if we are to believe the driver ([4], [5]), they are all the same
as the good old RK3366, which in turn is software compatible to the
good old RK3066. Same seems to apply to RK3576, given that its current
.dtsi just references the "rockchip,rk3568-spdif" compatible.

Does it mean that the binding needs to be restructured so that the
required fallback compatible ("rockchip,rk3066-spdif") applies to all
variants? Or shall the existing ones be left alone, and just RK3588
and RK3576 added inside that "items" block?

Thanks a lot,
Alexey

[4] https://github.com/rockchip-linux/kernel/blob/develop-5.10/sound/soc/ro=
ckchip/rockchip_spdif.c
[5] https://github.com/torvalds/linux/blob/master/sound/soc/rockchip/rockch=
ip_spdif.c

