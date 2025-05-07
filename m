Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13911C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AV+Ka0ghT60Ni80lSH36dlQfcwviMBQ0Aew0ZN84vs=; b=XC4yhb4+W1ThUJqDa8y27ALQfg
	UdCRxpRG5435a2JWIF2ltiB6zXyUibaGsbknHRBlu8OWG/ke2fDaEh0I1r69C/wnMcjWB6KkclBJg
	Bqhkp3+mRZ66iZOuwEuYmAlzPkO9dYm7gK5fEdVEXARE2PeC7Y1p3eg66Di4ZRcBklk2yxuuGA6Dn
	ywZbMws0nnFPkPoJGNRfZ2Edfv1XE3mo+gx8CuixBVvE+nr7UuzuMZaPxcddTV/gyqBhzVnWksO0f
	7h/RnEVjrlH9yue/ENSgyiSDZzGIeYAubGmt0uE5qTgK9foebm6mAOnLU8Zsdyo103xYJwTBc4rzj
	JmegUUJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfvS-0000000Fowe-0qUh;
	Wed, 07 May 2025 14:39:10 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfJ6-0000000Ffyf-1b1N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:59:34 +0000
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AC57711401B8;
	Wed,  7 May 2025 09:59:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 07 May 2025 09:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746626368;
	 x=1746712768; bh=0AV+Ka0ghT60Ni80lSH36dlQfcwviMBQ0Aew0ZN84vs=; b=
	kdB6uo86SqBD2Of7Loe2W8jte3R9KTMIji0sbq4Mv1Ty3/t0j9B5V2JaZJjDxVT2
	KMyJTUsD4uBaypLwhftF7iiWoMlZHQ/6bt+6ZvqKYQnQNat5rGX5xVpUoNG2TrPS
	7REBks3Ppkp69CmBLtoV10tB6vNwfDlfMGqn6WeXoT/wESfxUmv+rsdE9KrkjBbs
	eZamRfMBFCB47S9l0GAuJRKkbxe9U7RDPT4+XVQMT6DiTRoRZcGi2QmO5BK9pMfy
	urNsIDTHgycB0K6RbUN3tMFKGj2OL6xx4gKhD55fXeELmnBt/piPZehfhInYHblv
	ja9qMa+g65ytdvIPkMAKQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746626368; x=
	1746712768; bh=0AV+Ka0ghT60Ni80lSH36dlQfcwviMBQ0Aew0ZN84vs=; b=u
	7XMX9l6e+g8yUvuOG025+Z+JG/iv6oKLPhCfHPFvN9B7/ZSRvGShMrvnBvRWZjMs
	2a5VToA/4EqOH6IEIuEnOM2df/PCzFI5vpTSWo1h07qg4E6LW+k0rf9P42VkXd1O
	3ehnr9jnOv3mPeFLftLE8iSHuD4g6Pmdd+264KUDpGWUimWUW476YTbVSUKqvsZ6
	vV1mYX5wOOk4mcUxN5QTcklxdyBLjBSPjMZPd8keDRw85jjOFiCOCgZ0mX6Hv7hZ
	SwFQhyZs3QS2YZxiW8A0ggtlY6oVfcpN2382Of363FR+CEMgS/qYz3dEw1H9gWcs
	nzgmKXtPTZTLVEOLCeUhw==
X-ME-Sender: <xms:QGcbaDJ5U54NwX75wOEnIg7d1QfCeLqjHnrGdKAbh-9AV6FaSxsVdw>
    <xme:QGcbaHKie8ZPCAQ5RzhuJsqcJx0QxprflIf5tXt0jZ9oMxTj5B3Nimw1s-RdsZJBz
    O9wrRkhMk_Vrup80Oo>
X-ME-Received: <xmr:QGcbaLvuDiuQMWbeV0_XZNZmpdMxoXYtjOv5iPH3f-mEW6tc-Fbly3fWoAwGUjy6nTJrjXd6O5QRCqAAOiY5PZeAWu6xpRyn1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejtdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehff
    dtvdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrgh
    hnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghn
    vghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:QGcbaMYTH0NLeR5KJ5EvTLDq9xuQWjS7zhZNkYbTa_a4HUFrDz2noA>
    <xmx:QGcbaKYTy6qmGVa-Bk47FO_1oeOAyfUxnKWoIO8ovomgmF7g2GravA>
    <xmx:QGcbaAAeDb5NLgj2aTVPfQpM0cNu3ZriYtPM87HglTVr6KQQhjQggA>
    <xmx:QGcbaIZXJ8_hL_xqwJ1AkqsYI-qTRuac75CN_CDZJL7wh1FVrMFNwg>
    <xmx:QGcbaMxD-3oxVp98VYl9mbPQcaL_Dwql1iL3UKx_WtC6YvicA8tIvGO0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 09:59:28 -0400 (EDT)
Date: Wed, 7 May 2025 15:59:25 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-single: Improve Ethernet
 TSN description
Message-ID: <20250507135925.GA836326@ragnatech.se>
References: <367f10a18aa196ff1c96734dd9bd5634b312c421.1746624368.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <367f10a18aa196ff1c96734dd9bd5634b312c421.1746624368.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_065933_278449_1863CB33 
X-CRM114-Status: GOOD (  17.01  )
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

Hi Geert,

Thanks for your patch.

On 2025-05-07 15:31:55 +0200, Geert Uytterhoeven wrote:
>   - Add the missing "ethernet3" alias for the Ethernet TSN port, so
>     U-Boot will fill its local-mac-address property based on the
>     "eth3addr" environment variable (if set), avoiding a random MAC
>     address being assigned by the OS,
>   - Rename the numerical Ethernet PHY label to "tsn0_phy", to avoid
>     future conflicts, and for consistency with the "avbN_phy" labels.
> 
> Fixes: 3d8e475bd7a724a9 ("arm64: dts: renesas: white-hawk-single: Wire-up Ethernet TSN")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v-6.16.
> 
>  arch/arm64/boot/dts/renesas/white-hawk-single.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
> index 8b4d313ad173cd3b..4ddb70e525c0532e 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
> @@ -11,6 +11,10 @@
>  / {
>  	model = "Renesas White Hawk Single board";
>  	compatible = "renesas,white-hawk-single";
> +
> +	aliases {
> +		ethernet3 = &tsn0;
> +	};
>  };
>  
>  &hscif0 {
> @@ -53,7 +57,7 @@ &tsn0 {
>  	pinctrl-0 = <&tsn0_pins>;
>  	pinctrl-names = "default";
>  	phy-mode = "rgmii";
> -	phy-handle = <&phy3>;
> +	phy-handle = <&tsn0_phy>;
>  	status = "okay";
>  
>  	mdio {
> @@ -63,7 +67,7 @@ mdio {
>  		reset-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
>  		reset-post-delay-us = <4000>;
>  
> -		phy3: ethernet-phy@0 {
> +		tsn0_phy: ethernet-phy@0 {
>  			compatible = "ethernet-phy-id002b.0980",
>  				     "ethernet-phy-ieee802.3-c22";
>  			reg = <0>;
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

