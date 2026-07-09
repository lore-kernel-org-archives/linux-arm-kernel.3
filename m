Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0958C44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36b8H8C5d8xCfDp3UaNB3wNcVTtCzGBrEnzYSQk1yMU=; b=zl1g6Yctw8ztxbKF+WUMj6eYVl
	Fl9AHM4MW65vo1wuuVQjK286HSHoAcvSYXkdFv8BIpzoV8YA4Y+wAilyhD7pOc7mIIJ26sVVjkZmw
	iLDG8tYWo8L7FUXSyKfIlrEBSJIEnCtA+vue54oXiizwEpwD3/m9ALgdo+4DNQiXxEqukerwDReaF
	jM6tS3NVO69N5RZphzCG/seayY/R3pVMtVPi46MOTUefvZahhIPMFtSna1nCqBejZjmr+bFaXWuxS
	3184A++a4qYR9hglN3R7ZTAHS+wf/42Pdx6GISFwLlR0Xdp9MkoVuUSagKf2EwChHU9dilHfvPrNY
	MsNcEBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhuq-000000016rL-0G3w;
	Thu, 09 Jul 2026 06:07:20 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhun-000000016qf-1lZL;
	Thu, 09 Jul 2026 06:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1783577226; x=1783836426;
	bh=36b8H8C5d8xCfDp3UaNB3wNcVTtCzGBrEnzYSQk1yMU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cCfKfgncEAuSlZqAq4s8IHmC+Io4q0gH0nyONnU9wiuFpHDPdFTclJoWYpquyvHjt
	 yIgt/lxIA6k+QwRoQvbhPGn3PTRIujDSX4YCWCLFH/rC3+B0OiNUXcfMNzCvHY8q5d
	 5asIuw4/O2rQGeXz5tQDQwFwmejAcwmiTD6I3aQu9uN13IwlNLSBQ+LR03zetsAcad
	 sQGdcEItr8Ej6DOjOlCN5HxEj4SYUDtLWY0Nmoh/M8gMapEsj4flMLz5LquLAsMVmB
	 f/ovYdSbTUmham6xeddhJh+9339/6RHoTHWWRvc3wVv1cpmoMOw0MCA475GZoovrnN
	 PMtZxp/52WY6A==
Date: Thu, 09 Jul 2026 06:07:02 +0000
To: Lee Jones <lee@kernel.org>, Jonathan Cameron <jic23@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v4 3/4] mfd: mt6397-core: add mt6323 AUXADC support
Message-ID: <UV1EGIwox4bkh8ufCFb4GS_Pafo8bovmSI9jzRbQunz7AzjHnmItA-lLCPeeIxOLMoS3douarVEpoTF7DVffFJUcXZTdGTQ6-dfAYdomwak=@protonmail.com>
In-Reply-To: <20260708211056.GB1727174@google.com>
References: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com> <20260623-mt6323-adc-v4-3-299680ad3194@protonmail.com> <20260708211056.GB1727174@google.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 2e5f52e3bdeec32ab13894ebd60e7725e6f99467
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_230717_619569_DF097FCC 
X-CRM114-Status: GOOD (  11.86  )
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

Hi Lee,

+Jonathan

On Thursday, July 9th, 2026 at 12:11 AM, Lee Jones <lee@kernel.org> wrote:

> On Tue, 23 Jun 2026, Roman Vivchar via B4 Relay wrote:
>=20
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > The mt6323 PMIC includes an AUXADC. Register the AUXADC in the mt6323
> > devices array to allow the corresponding driver to probe using compatib=
le
> > string.
> >
> > Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2n=
d Generation)
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> >  drivers/mfd/mt6397-core.c | 3 +++
> >  1 file changed, 3 insertions(+)
>=20
> Doesn't apply.  Please rebase and resent with my:
>=20
> Acked-by: Lee Jones <lee@kernel.org>

There's a slight cross-tree conflict. Jonathan has already picked
patch 1 and patch 2 to the iio testing tree. This mfd patch doesn't
apply because recently merged mt6323 efuse patch (bde6556744888).

The iio tree doesn't include mt6323 efuse patch, and there was some
dt-bindings merge conflict.
Should I rebase on top of linux-next and send mfd as a standalone patch?

Best regards,
Roman

