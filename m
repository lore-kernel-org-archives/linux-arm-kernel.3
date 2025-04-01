Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFC7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 00:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPokjJS6bZ7xjIKgUxLbF7tf4xmoAmvSOaiF5AsgPL0=; b=e+fTrgbTEPVYHW2Md2MiZU+3pg
	BudpOlqN+eglIHv1idwKxEkiIwiTz6KU56YAzARoEugs1NSJj5HLWplgzxdoa2L1IIXGvxQlu/Cod
	fMv/qjuOhVLhdYYxwHz5F3C+pPauqaB5IVXFouQQQS1xgDeaChjN10ef4dD3v1zoY8uiTMV7my2Dv
	EOV0MbwuvpOd0fcWQAMup5f3Mi97v0LMZmmlLYDCftInCCCv3UcI6D5yO7kAJ83poK+Afn/mFPjPd
	LQu3JjBQ0Z2plrfiwlnre3T+/aoL3jENUnrey7JAg5KJg9peqV07Mu6IhJf5YbNX5Fr6NbqMM2FTm
	fKWCdiTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzPtY-00000001gi5-1acl;
	Tue, 01 Apr 2025 00:54:24 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzPrk-00000001gax-0HmO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 00:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743468742;
	bh=OPokjJS6bZ7xjIKgUxLbF7tf4xmoAmvSOaiF5AsgPL0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VYP9JKfSVsK0aTMb6gR6csBopMOB3E6gwP/2VmBe4u9RQtCP7zmZHRTuTdCaDmlQH
	 t+MqgtQ8BTdWA4q4jZ6YB6kshqUgxEm/2jhkzlP9hMks0L8Ou2M7bjD80yFr5TMAuN
	 7dizjuCPdQINe6S+n1PPNXRHYCQeo1wbclTNplI5V8gGP74E35M++R5MSi+jxc3Jis
	 wseiy4ScWjvzxMwYtbLDyIWAD3f0Rn+1w1enAOZQDP63cYf70T6nSMRWU8szPeGgrV
	 dhsXkkCQxX448xBVMuA75/eIYz6TX+2E+lzWEDjme+2VUNwQR9vR7K7+5pL/9fKka1
	 tmdtsOu8sXuEg==
Received: from [10.194.67.88] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8BB8E7BFD0;
	Tue,  1 Apr 2025 08:52:17 +0800 (AWST)
Message-ID: <71bced05e26ae1a5f15a7335928f3f71bde143f1.camel@codeconstruct.com.au>
Subject: Re: Re: [PATCH v4 2/3] dt-bindings: pinctrl: aspeed,ast2600-pinctrl
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Willie Thai <wthai@nvidia.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dkodihalli@nvidia.com, 
	gpiccoli@igalia.com, joel@jms.id.au, kees@kernel.org, krzk+dt@kernel.org, 
	leohu@nvidia.com, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, robh@kernel.org, 
	tingkaic@nvidia.com, tony.luck@intel.com, harrys@nvidia.com
Date: Tue, 01 Apr 2025 11:22:16 +1030
In-Reply-To: <20250331171857.262649-1-wthai@nvidia.com>
References: <d0f7003c22e19c8fc7617610043edc7be925a180.camel@codeconstruct.com.au>
	 <20250331171857.262649-1-wthai@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_175232_313907_21B95DF4 
X-CRM114-Status: GOOD (  20.36  )
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

Hi Willie,

On Mon, 2025-03-31 at 17:18 +0000, Willie Thai wrote:
> > > Add EMMCG5 enum to compatible list of pinctrl binding for emmc
> > > enabling.
> > >=20
> > > Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> > > Signed-off-by: Willie Thai <wthai@nvidia.com>
> > > ---
> > > =C2=A0.../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > | 1
> > > +
> > > =C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-
> > > pinctrl.yaml
> > > b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-
> > > pinctrl.yaml
> > > index 80974c46f3ef..cb75e979f5e0 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-
> > > pinctrl.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-
> > > pinctrl.yaml
> > > @@ -276,6 +276,7 @@ additionalProperties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - BMCINT
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - EMMCG1
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - EMMCG4
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - EMMCG5
> >=20
> > What pin configuration does this correspond to for the eMMC
> > controller?
> > These groups aren't arbitrary, they correspond to the 1, 4 and 8-
> > bit
> > bus modes.
> >=20
> > You may have added this squash a warning, but I suspect the pinctrl
> > configuration in your devicetree is incorrect.
> >=20
> > Andrew
> >=20
>=20
> Thanks for your feedback !
> We want to exclude AC5 pin in the default EMMCG4 pin group, because
> that pin is used for other purpose.

Okay, sure.

> We define a new group called EMMCG5 as:
> GROUP_DECL(EMMCG5, AB4, AA4, AC4, AA5, Y5, AB5, AB6)
> The bus mode is still 4-bit mode.
> Could you please advise if we can use the name "EMMCG5" ?

Why is EMMCG5 an intuitive name? It doesn't make sense to me for what
you're trying to achieve. It's probably better if we rethink the
functions and groups to make them a little more fine-grained, perhaps

- EMMCDAT1
- EMMCDAT4
- EMMCDAT8
- EMMCWP
- EMMCCD

and then you request what's appropriate, rather than create groups that
exclude a specific function/pin (such as card detect).

Maybe you should drop the eMMC node from your devicetree for now, and
add it back once we've sorted out the pinctrl side of things in a
separate series.

Andrew

