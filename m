Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FADD262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mo+56ot4Mgg4hIzQrB+wLbvM7WfSiDIFC8Wgrgljn0I=; b=CfCDd+YbCpiSTMHgu6PLfJAwvf
	KyRt2kzYYHUVSIzHUYyglR5cHW7UA84fMjdnKpos7okd6+3QiO9zV6lchbrxHG9glb8zcK76fdo2A
	mI0PMzNnB/H9IxtTP0jJ/ROuIqwEwDtOJkLXEuF0j4K4jOdVkdtO+PIkpuhe0Z5CtZ5jRkYZxXxTd
	4uGdCvfWbz0y9FjB3iY3xC6pW9kTyhEAYgfA31j6ahN4FNyDCajBLnVd2tP8OrIZgBVbshggPDOU6
	B+IdNfUl9OpDLiKIN5rFcec71AYknHwsMI6ckhrmckpi7QOIcTGhtHhbDgzxEK/FU1w0T4E5my9Ck
	ZK238A/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viT7c-0000000538E-11TB;
	Wed, 21 Jan 2026 07:59:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viT7Z-0000000537q-3iVr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 07:59:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E09D941B64;
	Wed, 21 Jan 2026 07:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3865CC116D0;
	Wed, 21 Jan 2026 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768982360;
	bh=B/7SxcFDchYAOxBFM3nekD6F3BNUoh6xpZYaOFcjPWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZddl4+40tnL7hWPWTaNGYdQMXa2Iw5iaLuiEt06W7iElk1M3kUOr+OXOXVx+SLuh
	 6ZemwgMGYVzfaH7MS9JcRXM4ZE6blUG8ZB8iwrRs0DcDft/A8L9S+eh2A4u91jvGG0
	 TZS7Sn24xKexfKOqcrX84UhWlZEJEcnjt5eeEPM3i0w1njHAEX8FkAohIwT8H17FSW
	 Sz6NxzyJclSwoct9qszl2ONMxltY9ItMshi0FcyIhD6fMy8vP2ILkQA2fKOU/l6rOW
	 PNttevoIvyYCZRzpkLo+xGlAgA5xdAe4Aao/LK/Atv3h/jnshApMG5Q+ZAsJCPJTsz
	 OFg02BDz+AhZQ==
Date: Wed, 21 Jan 2026 08:59:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, 
	festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
Message-ID: <20260121-uber-adder-of-radiance-0ebda7@quoll>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-2-shengjiu.wang@nxp.com>
 <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
 <CAA+D8APePw6BnRP=Wnw+zna+oc4_aoMWZewYC7yx-XYLBrSKbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA+D8APePw6BnRP=Wnw+zna+oc4_aoMWZewYC7yx-XYLBrSKbQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_235921_965994_A4D9624C 
X-CRM114-Status: GOOD (  14.78  )
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

On Tue, Jan 20, 2026 at 07:07:48PM +0800, Shengjiu Wang wrote:
> On Tue, Jan 20, 2026 at 6:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On Tue, Jan 20, 2026 at 11:52:07AM +0800, Shengjiu Wang wrote:
> > > There is no power domain defined on i.MX952, so make power-domains to=
 be
> >
> > There is no defined or there is no power domain? If the first, then this
> > patch is incomplete. Please read writing bindings part about complete
> > bindings. If the latter, then you miss constraints ":false" and commit
> > msg phrasing is incorrect (and remember that in such case you won't be
> > able to add power domains later because now you add complete binding).
>=20
> Thanks for pointing this out.
>=20
> There is a power domain on i.MX952 for the mix system of AUDMIX.
> But it is enabled by default,  AUDMIX device don't need to enable it.

This should be explained in the commit msg.

Best regards,
Krzysztof


