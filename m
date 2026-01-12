Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B561D2503F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/al0P732L/og3jdqGor9t3lBoCQ/uX7BhVeOm6+zIlw=; b=iWwwRWlhZMbf5kEcz8Rk4EtYPd
	a0+w9qVbenwJ4475Z+CmWDx3vvuAwGsyzc44cVHLtSk+ht/hfFDbZ4xyUWnzeHQbw9w95h+jtcQRJ
	Ix05h/e0g6PeQFkOqJ9rT22V33x/4zhGaQzMzRC5toq6ksbkbcvKjEsOqaEV6LPPysCvwvdn/wgii
	RWvCOLRv4T6fdbneWydxLkMgwO8p67ebAcVojUiMw3t45XYLq2TeuImcpHl+u+/+ti3dtCW6cWO1b
	xp8XS+nGvnxzRsn2oKKAoDqg21lGANGocU7F9pz5IEpTUhHut7dh9jaUUkT9cen6B9ySACYkMhsDx
	bvSQHMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCLu-00000004sfZ-0d9o;
	Mon, 12 Jan 2026 07:28:38 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCLs-00000004ser-1rKk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:28:37 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59b8364e4ccso3008730e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 23:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768202914; x=1768807714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/al0P732L/og3jdqGor9t3lBoCQ/uX7BhVeOm6+zIlw=;
        b=nmbR4cIKWblWfqbK/DRb3P7MMX3nwobPEadPYnVESbJPtQrcTmin1hp3itT7iAqvca
         LX9Qz2SdnChQzKsL1n2q5MAVn6cZBoX1QI3YsMTnKDyAVltUQK+Bf6YzjPj0595ULfvx
         ar/kK50mMnvv19io2VrdS7sRtGXnm5IDl0ydA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202914; x=1768807714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/al0P732L/og3jdqGor9t3lBoCQ/uX7BhVeOm6+zIlw=;
        b=Q032F0k7krY0jxTP68GeOXDo6rg0k8Ocpa5zAwXQpEbEHZoJMxvyj2jiCbUsPJ4uHl
         KYvFJUrtcJdyftAhgdqy26ht1KKapE+tVFLOgg5yTfAKvQvvNlUhsYVJPlRiXiT4PeV6
         NLMAsVaejfi8U11vaA0mFn8WRozvNEWOtL/m3K6eP5uuV5QTg2BUA1YmzudUTqxMJ0Ld
         HIX/oW6Mmj0kLjIdvt9UaCbnJSC/dk5vC9c7Fsd18kmZVgjPEcd04cS/+Y3qPzfgQxKa
         a9g58msF7KXftiqQbKwaW1BluzK3xZ89wYYzNLVIeHo21tXFVfZpXtRaE3r2YvOkyBpn
         SGyw==
X-Forwarded-Encrypted: i=1; AJvYcCWOMa8ReZUCa/V0OZppkEiRLsV9aEUFacIjfiybNakse2cxeOlXMG5u11SSkPXU23zjllZYLR+Ln2wxz0cIB7ui@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3NgdrclasatvmEXJfmJpa1/xsq0ebS55y9C1uVs+HYgiidEhO
	DtVEY29dUR2MzWPr8/ti+VF0EPVCZlUcRi8U5uxitU4hR2LV0ROS9yLCrh9BiUtfhmlasEy+eGL
	TfIVoY2j89n4XYnof2iZhWc/A/vyGHp92Frl41mN/
X-Gm-Gg: AY/fxX4sMiGQ1vFL2/e29rObs1MpM5dZxXdR1GfTElpisuvZue+jpR8tJQfrkntjoS/
	SF0IKnUf34rbjKTFPGcDP+5HQSuf2M1dKHZzOsAg0T3ROOWL6Mw2bclipg0R5+wmpR6Xt1BCIh8
	PYvu8LdixcBbJPZvrgMrbGNenYpvhaUlYiJmdVxjC+H4sxo3Md2U3LWyYz0bmPOYEqN5kUuCSmE
	K32u0nPjodxSHmAT911WpwjFjNF49T4EJd6ANxQ7Hv7hBMPrtGBRPwaUcf1W5K6caqdR2hWbUjI
	t7PDqD8xejR693fIpI39qKUB
X-Google-Smtp-Source: AGHT+IGMwy6DQKFlVywYqY1p1e6uprSqkxqICel2tbPSMKWFuPJXPyRbKkq2UeKMJs7PxPYan4+ENRZ4rgeXEWRIvrQ=
X-Received: by 2002:a05:6512:3b85:b0:59b:7b59:a4a3 with SMTP id
 2adb3069b0e04-59b7b59a4fdmr3780571e87.17.1768202914583; Sun, 11 Jan 2026
 23:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:28:23 +0800
X-Gm-Features: AZwV_QiB5ptUV19bOdXdm9RPLXnLOlfR_HO5ST_wuq0ulRnSOTzymqRKhyICJhE
Message-ID: <CAGXv+5HtoJbt3QWK2+J5wP38EfnQZGB_KUtc5MBDN5UL6xpJZg@mail.gmail.com>
Subject: Re: [PATCH 06/11] arm64: dts: mediatek: mt8183-pumpkin: Fix pinmux
 node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_232836_488929_C95EE1F2 
X-CRM114-Status: UNSURE (   7.88  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change all of the pinmux main nodes to have a "-pins" suffix to
> satisfy devicetree bindings checks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

