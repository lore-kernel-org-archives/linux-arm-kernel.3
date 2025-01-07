Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65954E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+/XHKlm0uDWaGNf90vFoVIJ7tDwFWEFaxqH+12MDaI=; b=s6S4KbqHW0+WqPHG+rBFo4/dQV
	aQ46ynk0k8UiM2x3HryRJBpc6tMn/3b540NyMwobr9MXJdKZ29Jbfw9unxkgd8W1ca94j+UQmRc/Z
	3yzb42lIp8v6A1cpuSPyzJ1VEO1yczeAoQbACC4RCXOnoeS25vjht0tSjPQoDlojuIROo21B6Rznm
	fQtCKOfPYwlEzi8ApotM11Ho9C6zI6kWzdXunH3wWlG+gPxFMILwWM4KgoUJuazObIT2wDB7tyVqm
	mGfV1F7cxyX4IKSfFsJRf0cJnw8/6ybiMfc56PB43L1d4igYEmnTjJw5G4t7OqxQWRLTUEHEsaz78
	0g9o74zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCbu-00000005fbx-0tP1;
	Tue, 07 Jan 2025 16:39:18 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCNn-00000005brT-2F8N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:24:49 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E0C281140096;
	Tue,  7 Jan 2025 11:24:39 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 07 Jan 2025 11:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1736267079; x=1736353479; bh=3+/XHKlm0u
	DWaGNf90vFoVIJ7tDwFWEFaxqH+12MDaI=; b=M9ouyZU7OxAYdpAtYZDUCD9BPU
	fkATgBp7F+ak/a/vC19pFscf/A5FKmkZ7yLvTb2NKz1FSetCPAlW4D6yV+BHNmCU
	F9/2bag+l7hUS8tOFZYv9Lzzsv2xVXugyM8eXTD7SOuz4VEaIuwYJst4hwtsYx+J
	2EBBbNNq70LhQ+JZO22HZ/5SKEND/jLcmnzuimerYe056sp0XxrJf6g5wa94pko3
	8UB0vsRSiCEQXgKSJxJs9ZNg3DW8SzWIJmzl8OP0QkntMj6msX+9m/ordQV58OTZ
	KBLje+4tYforzbtYVBhep32iTcuQsN3NUMYNIhyBZOfffXyS6r1/jKmvlnNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736267079; x=1736353479; bh=3+/XHKlm0uDWaGNf90vFoVIJ7tDwFWEFaxq
	H+12MDaI=; b=ITI393vwW+TCUpi3M/bOvD56LCvDfpnRjuKb//ChvuTYV0WGLOB
	5YuO8E/UPW0NTF7NEAkcTP2jj5LlzU8lMBYahuwSrd7j9DdOS05lUuIniegWsyUv
	vaJwf4RS51bJ02sFBb70r84CcLX4UqQ2Hp2rD2G6HYwuCb81yPiAjBNYHAC0Voyz
	CpJ+J7kC+5UK8syPswP1YaDqpojfeHIKz0UAVfvaSMWbKqW49mgMDzVKZb5OALLO
	zocXCBRwCycIoIFL2WVBoCoNu0kj9CPPqmAV+wIQSMtG9IldrEbnzU5dYVSY+ncX
	cIWdiqnp6dJxcgSKk6atDcD3GzF8a3oIkVw==
X-ME-Sender: <xms:RlV9Z9SJYKjh6p5FdooEkexQpJ-UaY4KCxTinCCXQcS0t-nV8qTTCg>
    <xme:RlV9Z2xDVZwHUVbqCk76FvffJqFE-HWzYIC0oxQC_45ZjHkfsNeZzX4k_P188AVEe
    0A_h8lhleyE8dhVJt4>
X-ME-Received: <xmr:RlV9Zy0V0fHkJpDBnfWkESqpVkabgs_U2RgLySVB0mUdXff5bAC0uBQaIg4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegvddgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmsh
    cuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpefgkefg
    vdevgeeukedvgeegtddvjeevgedtffdvfeeiudfhteelvdfgvdduudffjeenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghpth
    htohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifsegtohgu
    vggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphhtthhopeguvghvihgtvghtrhgvvg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhk
    vghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlih
    hnuhigqdgrshhpvggvugeslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
X-ME-Proxy: <xmx:RlV9Z1Dea5_OSCTwNOJegcT-Z_vLR8l8RdK9CPdJhoLJqBCVyjSFAg>
    <xmx:RlV9Z2hMrViWT7lcy3j733YtpkOOuTnZDkjM7oLF626LnPPngbvUIA>
    <xmx:RlV9Z5qUNZX4Dq7JQiY3ALEDtQuw5mB06Ccqs-LHH_sWmVf0PXMzBQ>
    <xmx:RlV9Zxgz6Kc0utIRFErPCP6RuC_bEZlTNh1mDGyh8FgSllnibUs1vQ>
    <xmx:R1V9ZxMzdSuo3mUY3FpoR03yjUr-RLfJGpb8vl1jiFv9-b-_QoNWwA-I>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jan 2025 11:24:38 -0500 (EST)
Date: Tue, 7 Jan 2025 11:24:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: yosemite4: adjust secondary flash name
Message-ID: <Z31VRZg2LTd36S4n@heinlein>
References: <20241218212458.3050775-1-patrick@stwcx.xyz>
 <e3279e0c41259f165a0cde0195b196f416ac566a.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PAVj/NgUE1LkrRTU"
Content-Disposition: inline
In-Reply-To: <e3279e0c41259f165a0cde0195b196f416ac566a.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_082445_103204_58D27697 
X-CRM114-Status: GOOD (  11.12  )
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


--PAVj/NgUE1LkrRTU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2025 at 03:44:04PM +1030, Andrew Jeffery wrote:
>=20
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0status =3D "okay";
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0m25p,fast-read;
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0label =3D "bmc2";
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0label =3D "alt-bmc";
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0spi-rx-bus-width =3D <4=
>;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0spi-max-frequency =3D <=
50000000>;
> > =A0=A0=A0=A0=A0=A0=A0=A0};
>=20
> I'm hitting conflicts (?) when I apply this on top of[1]. Do you mind
> rebasing it?
>=20
> [1]: https://github.com/amboar/linux/tree/for/bmc/aspeed/dt

Sure.  It looks like someone elsewhere changed the spi-rx-bus-width
which is causing the conflict.  I'll resent a rebase.

I'd like this backported to the openbmc tree also.  Not sure which
version is best for that tree right now.

--=20
Patrick Williams

--PAVj/NgUE1LkrRTU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmd9VUQACgkQqwNHzC0A
wRnm6Q/9HIRQVMEheGRvQkFPPiZna4IbkT/Z2CMi7dI/wcwY2Pq3IMVZEBpuUGha
XE1lgC0wJUgeNRMZtR/FlrTOz5PMMhPyfZ6HuqmnZtxp9Gn6ABnIJA8VeTIVx1Px
immzzeMOgIFBX5Fa882qv3Dt/gdES6OK0Atz/iNTml/wBpXgEkfJRglGfzoKvZQU
L4RSg/97uRmMFjfuwExu9uqRcx6Dm9KRaCyLxnPphyeMYJh3ZDMD8O6FzEuq7IWA
20x0LwtNkLcRXeFCh35qtUpHeXUsAKrieTqCv4B2MvLH3ULHUoOYQEiyjsNl4/nV
rip++J+YuLli3l4ASsO3Q7nO5LDN8aFZWcN75KGhfADizDLx/mABSvVIgi4TVKC4
oaMiGylQJPtNeylH0Q1M3c7Bxiu6ZkzQrZwxyo9vhrxpSLYdXWLj3lLAlxkr1kJE
JJelTjLSaq6hrYElLRS52h1/uGa/PlRIil2LJ+y8kHRaAkD4XAj2+tyhNiFUaOww
A7XQCQhzkbxpdt3Sx9BkK1O9jUo+B9xQNxU4jVutVK89gz9o3vFgCRG7D+LTxxZP
6+2oNprwRqivfZxpO4fX1CtlXc1oP2AZax0kvwyX9mHlWiIpKQz+fzfoQRz8Nx6W
ZVbOW7hAH2n18B0fmCyuqcuMGAk/bDiSJAWcPON42gfXteuRHHc=
=KDov
-----END PGP SIGNATURE-----

--PAVj/NgUE1LkrRTU--

