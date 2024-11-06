Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58E1D40D14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 01:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=watOJLeGoDB14565YBy+IKs8wDfaHZ6TrC/KzkJefD8=; b=gyAlOT1xR34EdB77BxghrHzJM1
	cAIVX82mgRtCZ1/yJQsFbdqUw6+7cqZJGNRG+P9Iau304AYnNCXTbWWbuxCbLHEBmcYYtBV0UHq0M
	R7m11f3u9Q2swJoraAhwp97ZKnS5XrR2kPtkqWCSrlYHy1T9gfkwwzVo14aMcHH99JI6vfPExLYe4
	oXoZw3nkKdJVyKm58m3+tGSXOIsuiROGQ9VuLm8H8QSWLVP8X84xG9qQwBKWoBVPc+P/WdMifcWwh
	W04fNjdmYH4pXT4OUHsMETg7J8fogyYcNvBvHFka6PQSpRJs4ODLvbzQq88H8yZtYGetNPYF5hLT1
	Og9Zz2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8UUe-00000001H8Y-3LSw;
	Wed, 06 Nov 2024 01:05:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8USn-00000001Glt-1qEA;
	Wed, 06 Nov 2024 01:04:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75928A417F5;
	Wed,  6 Nov 2024 01:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE90C4CECF;
	Wed,  6 Nov 2024 01:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730855040;
	bh=zhM6vqHjfi+pftDL2hfAzLwcx4gXUVTO4LT/M1Ol9Bg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K5P7VrIxhkuDTsCWr5HRnTQ6CGxUuSmMICcukT57bBx3SHaSXL1jB2UleNPcNzetY
	 1F0KNV3nfe57Fv448Bn5QsvWOcF6ikg28GxxeTvDrDaDFJ/czsJxpv2pF//eeKQSIZ
	 CdOV5g1La5tzrW04ZTlkT1Bh3TN+qRLJLWY0Wg0EzaX9irf+XIGaDBGz0nw59OAmTR
	 Y0WzgfH2nOPOJMnnUrZoI66jG53z6HV91YO7JdI8+vlD5ix2M87lAukPFabJ1W45qE
	 X5CNqn2NyQ+mDb7TfwDF3QG7nXE6RW7WNYTqUP7LTfQqEcwX/fgdGmyfv5n5Avtv4L
	 BY+KTBIL2WAkw==
Message-ID: <063709c4c06e230055134a115ee91e14.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b6a264f8175f7c825b97aed63fb277a9.sboyd@kernel.org>
References: <20241104153108.3053932-1-ivo.ivanov.ivanov1@gmail.com> <20241104-lend-lark-ab46a268213a@spud> <0198082e-19a2-48e8-ada1-a7edaeddb73c@gmail.com> <b6a264f8175f7c825b97aed63fb277a9.sboyd@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: clock: actions,owl-cmu: convert to YAML
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Date: Tue, 05 Nov 2024 17:03:57 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_170401_580988_91A274D9 
X-CRM114-Status: GOOD (  13.43  )
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

Quoting Stephen Boyd (2024-11-05 17:02:20)
> Quoting Ivaylo Ivanov (2024-11-04 12:19:57)
> >=20
> >=20
> >=20
> > On 11/4/24 21:03, Conor Dooley wrote:
> > > On Mon, Nov 04, 2024 at 05:31:08PM +0200, Ivaylo Ivanov wrote:
> > >> +    soc {
> > >> +        #address-cells =3D <2>;
> > >> +        #size-cells =3D <2>;
> > > FWIW, you could drop these two if...
> >=20
> > I see, although the point of this was to keep it the example as close
> > to the original usage in s900.dtsi as possible. Anyways, if a v2 is
> > needed, I can do that.
>=20
> Please resend with the fix.
>=20

Just drop the entire soc node as well because it doesn't help.

