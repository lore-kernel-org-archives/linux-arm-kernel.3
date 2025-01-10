Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FA5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 13:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVsMzVieHTIOrNbvOMfvelHxO8lTDQWrOTcGVeRSltM=; b=d2a7ki6usvk+8/GuttIiXd1meI
	51ZagJPoE53eY3mlvFSZGIIAo4XrZ8FVFhDlYTPDyCKIakbxT7xbAo4Cyd+9xT1xeee81AwNube6U
	strvtcYoLKtUAtaeofTSbBuHhOPBbIteTCYf/hX8y1zHdqZPss3NGgP2lgvKyfXLGrSk5cjL87SKv
	OSDHPGNpNkwbxlThtJNOuY/GdR/6m+79ZpsRnUEaXhOO0m2Jx1sSLPyeER1A+E7/zoo96og01dcRD
	eT+Q+ImAyGkqqy7NVsDdh4WzfDJr9FaPJALVoFqMgqJp9Ql5KiSKXOs3o0FHUEn/2/mrWKi7ymWIV
	Q1ldS4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFHp-0000000FW5m-0IdA;
	Fri, 10 Jan 2025 13:42:53 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFDt-0000000FVQj-2Jo0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 13:38:51 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id C62181140138;
	Fri, 10 Jan 2025 08:38:45 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 10 Jan 2025 08:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736516325;
	 x=1736602725; bh=xVsMzVieHTIOrNbvOMfvelHxO8lTDQWrOTcGVeRSltM=; b=
	J0E0EWKGu3DBaapBXg7wBcycPvqq723/TuH5HqN2pb3gVOGhqODELmUi7IHk0BdT
	sHw7Ug39KYCDI8j4QG98Wtps9GL5igsrAPjqv2exkm3r6usLohPOvD5QzxI3Mm2i
	BbAzs9RJHihh7W3UtllKHMU/Lu+XolkRACVChHgNujN5lR37hRF6o9xZed4K8jF8
	VHkYo6LCLZ1qAArO83VTI/r3RDeI25Vqwb/kCg8WqrOdAsyyAp5vZ0OJ1/xtSKBg
	/dxZoxCYrQpd7IPCW/FolQLNIZrAiGS5tpYNEMrH6WzUuOT26LYFqN4JpG7Ud14U
	bb7ULy31H7Vwzys5qLvMyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736516325; x=
	1736602725; bh=xVsMzVieHTIOrNbvOMfvelHxO8lTDQWrOTcGVeRSltM=; b=h
	iRw9MwWEHjCogHAkVvdUBDBJWdd7hH97iY0Rni8wdGsmwa2+V0OlDpdvwRj1ZxIV
	dATlMdH2Hdl/jXX3zP31SkH7Y8bSpbejbf34llK9VTwFHBzKWzFDFONTITAob9Z8
	x3y3BLy3a10xjLygLLpz85dw5p/23FdlL2fwf08HK40ymm6KsmuH7TtIborObllo
	P2rreDcymuJpGH+9bs0PNiS6N58puYId9RtgTrMVxdBplPAh+wbpO3j2mZHHZx5a
	mU7x1KF+DGhDmygHUsnqVYaRbwbaFOnCCU5M1V/6eMMPl5fkvhlgnmauWyFF0Lub
	eR2pfuUrAY5TtgomcN4BA==
X-ME-Sender: <xms:5SKBZwk5W6cNdTlfdmOIUfVOi5VqxVPN4amk4QwRzEy0ifZAXk1Bkw>
    <xme:5SKBZ_16V-F6thq2kQPO-4zAjIFTWbIwgl99lNhLkRy6QeSxiPjGg8Yh7DsRa2LAY
    j-sqf8ii1IevdbqxC8>
X-ME-Received: <xmr:5SKBZ-oDW0kPnHASjPf6m1eVj0Q5Ox25BGqER9UfOKg_cW-yjC1t5o39vebZ0JgQqU084IdSvnc8Q4EBpmiPdr1OxdaTT5myNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegkedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhi
    uggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomh
    dprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:5SKBZ8lS4M0PnRRfE4U1TgbMYc7Dun0oWQyiy6qiE4EsBPCqwgntyw>
    <xmx:5SKBZ-2Zcw43psGPmpOJQ20THOaFeo_PiSAAXQngSQ_lLzQpDMZRbw>
    <xmx:5SKBZzsU5vCj-J-Rpn1NLHjI-PySmykbzKcOX1iY-cUab4KTWmytrg>
    <xmx:5SKBZ6UwJYuMVxYPzCYjVhhRRmxz8qZyAacFZ1WToTCNz3_ElV8PBQ>
    <xmx:5SKBZxRPzODnY2zeK96Qmg6Bb480_J-o8RlayRF6T5__4wWJ8kh_aW21>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jan 2025 08:38:44 -0500 (EST)
Date: Fri, 10 Jan 2025 14:38:42 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: gray-hawk-single: Restore sort order
Message-ID: <20250110133842.GD308750@ragnatech.se>
References: <4f3e057b9a73d7ee7ff073f51bb9a4c30bdd0c84.1736506813.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f3e057b9a73d7ee7ff073f51bb9a4c30bdd0c84.1736506813.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_053850_486050_356FFBFE 
X-CRM114-Status: GOOD (  14.88  )
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

On 2025-01-10 12:05:09 +0100, Geert Uytterhoeven wrote:
> Alphabetical by label name.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v6.15.
> 
>  .../dts/renesas/r8a779h0-gray-hawk-single.dts | 38 +++++++++----------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> index 18fd52f55de5b75b..d58f64d927feb17b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -233,25 +233,6 @@ channel1 {
>  	};
>  };
>  
> -&dsi0 {
> -	status = "okay";
> -
> -	ports {
> -		port@1 {
> -			reg = <1>;
> -
> -			dsi0_out: endpoint {
> -				remote-endpoint = <&sn65dsi86_in0>;
> -				data-lanes = <1 2 3 4>;
> -			};
> -		};
> -	};
> -};
> -
> -&du {
> -	status = "okay";
> -};
> -
>  &csi40 {
>  	status = "okay";
>  
> @@ -292,6 +273,25 @@ csi41_in: endpoint {
>  	};
>  };
>  
> +&dsi0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +
> +			dsi0_out: endpoint {
> +				remote-endpoint = <&sn65dsi86_in0>;
> +				data-lanes = <1 2 3 4>;
> +			};
> +		};
> +	};
> +};
> +
> +&du {
> +	status = "okay";
> +};
> +
>  &extal_clk {
>  	clock-frequency = <16666666>;
>  };
> -- 
> 2.43.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

