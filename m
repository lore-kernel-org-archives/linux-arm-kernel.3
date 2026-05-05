Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D59CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NayYgMtDF6eMt5wHcIeABn7hW6nMct4NLsdgagcCG4=; b=ZOMYcWddFVdlCa8udcRqIpec0N
	lqnh45FH+XYTxrISHmIO8L3k6FrTlh9QWQKClrDCOo7xyAxhSWB4dxq46qBwZShMgijkS4z5DRXXJ
	WfP4ETLmFkxOS4AkXubwutcPLR9ec7RGIOXcbL13b1zSqtIp0i7jStMx/yNVsBe6fxrVL8o11o+Z4
	lRPwraD0egCmiMbHw03QvBjL9a1IBbRPeS3dJww+RH+7rP4RjcFiqrk0ouopl+KPzkC4ZhWJLjluq
	SUxRHwLxWa5qieOwv672jY+JXoTL3V1hjcL0JVVZxDzfuMOPN7k8JlHdynXi4kNr+Tv9c969snW++
	Qre75Ong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKPA-0000000H9eV-2A9n;
	Tue, 05 May 2026 18:22:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKP8-0000000H9dm-1xaa;
	Tue, 05 May 2026 18:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+NayYgMtDF6eMt5wHcIeABn7hW6nMct4NLsdgagcCG4=; b=BPhLWpWMSlCd4dQZCMXdrt+E7g
	U1rDZPA7oP8C9wFmkslYXlBEXjttrLKH2kfJai9yOkEmtTdYNfYKr1rTnDBjABxU1J/bTgrwlzNcL
	f0ZPFAEU/wVkrAGPAK26DUonBOQ/Z6y5ItfE/LIYl3b3IIVz373YiN8xj8dociyLc7KuxMBKSwAK4
	feBoo+ybUh4W6huGMs3Mc5308LZOwntKCM6g+OLEDsM3PMm06N/D7C9mNYQYv269On8iKsQo+we6i
	AXrTS3V6IrgMfMVb0r00TDx2cD60z5diWQYRPvuxHqnrlJKkQvRT2Rumx/oBDpzOKrR7vygkqeqlH
	qWzHyiLQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Gray Huang <gray.huang@wesion.com>, Jimmy Hon <honyuenkwun@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 nick@khadas.com
Subject: Re: [PATCH v2 5/7] arm64: dts: rockchip: Add HDMI and VOP support for Khadas
 Edge 2L
Date: Tue, 05 May 2026 20:21:52 +0200
Message-ID: <4540610.k3LOHGUjKi@phil>
In-Reply-To: <CALWfF7K+g0sYLDQ9ROo1nGR9EADK44kVKQ_x=zonWD9eJLMDng@mail.gmail.com>
References: <20260429063712.2150938-1-gray.huang@wesion.com>
 <20260429063712.2150938-6-gray.huang@wesion.com>
 <CALWfF7K+g0sYLDQ9ROo1nGR9EADK44kVKQ_x=zonWD9eJLMDng@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112158_502645_3317F4D8 
X-CRM114-Status: GOOD (  12.28  )
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

Am Samstag, 2. Mai 2026, 19:19:58 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Jimmy Hon:
> On Wed, Apr 29, 2026 at 1:38=E2=80=AFAM Gray Huang <gray.huang@wesion.com=
> wrote:
> >
> > Enable the Video Output Processor (VOP) and the HDMI TX controller
> > to support HDMI display output on the Khadas Edge 2L. Also, enable
> > the associated HDMI PHY.
> >
> > Signed-off-by: Gray Huang <gray.huang@wesion.com>
>=20
> < snip >
>=20
> > +
> > +&hdmi_sound {
> > +       status =3D "okay";
> > +};
> To have hdmi sound working, you'll also need to enable sai6. Similar
> to the update for rock-4d
> e6066edc9413191479b05596ba06c40908f44e22

I've already applied the hdmi+vop patch from v1, so if you want to
do this, please do a separate patch.

Thanks
Heiko



