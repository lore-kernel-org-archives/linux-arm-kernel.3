Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D94CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KH51SDLV05//kaF4c9OyIlbgbmFjlPSc2TV/0Yjx49w=; b=s41YehurCxvz1lwuiyB3AzOmEt
	QHuOSPK4LgpKe6viOkkeVX3UW86QmKfn58xdHRJ2olpm0d3HiIRL+DZzEvY/ByHqvH2t90H6ccifO
	ELnhTA9erHuuqZ827LQJZpWQLeelEnjGI0y+/HNXxD6/gS47PJVzVvE5OEPwJBh3bDH1Y1gvbjEoh
	yw8EOiVtiuMt7hX22kz8lxVKhqz/yPD9DxrCapFEHfUF9/m4Ix5oVI1h3InD0ippQPDhoBsXHDiAe
	aNH+EThlKOcNjb9bWn0gHRK/c02JAP5HnLkwIvc7ZmFkGb2kgKMQSgYiGxkPQWEAkGqxeyuSEXBGT
	vJs7cGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSv1-0000000Efil-1Zf0;
	Mon, 27 Oct 2025 19:30:15 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSux-0000000EfhI-3i62
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 19:30:13 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9B92A14003D2;
	Mon, 27 Oct 2025 15:30:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 27 Oct 2025 15:30:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761593409;
	 x=1761679809; bh=KH51SDLV05//kaF4c9OyIlbgbmFjlPSc2TV/0Yjx49w=; b=
	mrYv1MBoyeJvc3XqFuzkS444IPaHMBVl5l6XC9shpyJwV2GoXc8Gz5idklsumjt/
	qXnPkaiPzGGy2Fg/GjnkG6KKVsmF9hO2qq1zWui/uUUVJ1RiJ9RoP4m3byXE/vFO
	00CtXIzLcHOLsP536s8e/iT8Z/o7auEDRQV7xE/HQIS7MKnvfJLUgNeFadRBHJW1
	B8tOp0tWEGD3J7btJ1V6YqEk9e1+zXbliDF+1h/fbbDb4ONs3RnTjPNZrL4geyC4
	CwcWHK9cfG6egRx2V3wpTteMeQ/DQIpp6qxDX8LvWS6BLTXrhhGoOndKxVRfbQT0
	s9xQbnxTFp8sWh99Lwn28Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761593409; x=
	1761679809; bh=KH51SDLV05//kaF4c9OyIlbgbmFjlPSc2TV/0Yjx49w=; b=Z
	wb4x3c/Nk9uOCRQc0r4nXJqpTNVpKcE6/y1jIrWdXLdiO95rFxX2QZnCc1j6E4JA
	9Rl/DwW5CJtGLFOuv08PRPGXZbXrUHtzNA/BSaDFCKbUVUsejYiV+x4LgC6H5Xhw
	QJP1Om0CTS3Qnc3iVO6zukz+MmmnNoUIjKPkcr4Dq49MrqXiK/TjgqIT5Z/o1t+x
	+EGvJp+QM503Ksm4w2UjQZE5WoSyuYkYQky8nXbePou8pSVIi1QmMHi/mVNvUgLH
	nL1ZH+4/SsswKieKINIgj/R5pILTj+Hlr9dgGUm3cdiNKe6lKHPCdTPTiJnY1bC3
	zwpyawhfPn3hHr/IS/EZg==
X-ME-Sender: <xms:Qcj_aIczRwkjoau1-ChC5BTK-TrmjbKLmJA9zFLBmAm_y9V-WsBSlw>
    <xme:Qcj_aKrwsY9hLrQDti-eVZhPjZigWcj_Ik8xDlfw3iR-QzeQiUiDZatgMN3Bwe-Y0
    N8cQKaUjUCVBZO2r8oN5M3HqNjH3PpfbcvzWnhuodM514Pyf1VQ4Qw>
X-ME-Received: <xmr:Qcj_aKMwux4lsIOnU7ug8dHh6JCLz5yVqtA8Lv3FkeJzRZVZs6Y6WI-VNuZAyelUw4BnvFdWF4wyhQjt4soBkEID41J6eIs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduheekkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrghilhgsohigrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    ghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Qcj_aFgOduvt8YIcUhKHFZ1SrVsy2RzdcpLFRdrdIVI6jmqj1MiODw>
    <xmx:Qcj_aFtk7U5NoCF2gQBxzEgq9WA_KYj8c5gJyRNK5niezG5OivzfWw>
    <xmx:Qcj_aBh-loHtjVPEg2r7lPgQqpOr859WFeu9e9sbbNN_8g9YI2Rnow>
    <xmx:Qcj_aDYYm8xyi91aqWbSjGnzH_B6zDZkbuhHGLwYq-cj-6OxHp_dzw>
    <xmx:Qcj_aD-W74irlF7IuokXH8n5wqyezPQ6I4oiuVxLzFz_p9vigMpq6S8w>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Oct 2025 15:30:08 -0400 (EDT)
Date: Mon, 27 Oct 2025 20:30:06 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Fix full-size DP
 connector node name and labels
Message-ID: <20251027193006.GB365372@ragnatech.se>
References: <20251027184604.34550-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027184604.34550-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_123012_312998_20AA006E 
X-CRM114-Status: GOOD (  16.28  )
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

Hi Marek,

Thanks for your work.

On 2025-10-27 19:45:53 +0100, Marek Vasut wrote:
> The DisplayPort connector on Retronix R-Car V4H Sparrow Hawk board
> is a full-size DisplayPort connector. Fix the copy-paste error and
> update the DT node name and labels accordingly. No functional change.
> 
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> index 0e36a1b96b83a..f4181f6020203 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> @@ -119,13 +119,13 @@ memory@600000000 {
>  	};
>  
>  	/* Page 27 / DSI to Display */
> -	mini-dp-con {
> +	dp-con {
>  		compatible = "dp-connector";
>  		label = "CN6";
>  		type = "full-size";
>  
>  		port {
> -			mini_dp_con_in: endpoint {
> +			dp_con_in: endpoint {
>  				remote-endpoint = <&sn65dsi86_out>;
>  			};
>  		};
> @@ -412,7 +412,7 @@ sn65dsi86_in: endpoint {
>  					port@1 {
>  						reg = <1>;
>  						sn65dsi86_out: endpoint {
> -							remote-endpoint = <&mini_dp_con_in>;
> +							remote-endpoint = <&dp_con_in>;
>  						};
>  					};
>  				};
> -- 
> 2.51.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

