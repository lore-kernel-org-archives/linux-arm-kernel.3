Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B7CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEGdG7sx/eFV75l6M7SGCQ9M2dojZU1mlGbkVhDuNAc=; b=RPRZyRtCaf6Pc+wPHcPaHVDabT
	x3tC1UE/BJcBZqqvQvjTM0/UgOs/FxF/7dBCKSYMbZFJQ9KmDPX5TGXwj+h+CGbn2IqeyhjbhaKnD
	C1kJqTyN6HqlT3E7rAkTr6vbQMxSDhVWR4HI3+EddoVHrLlWTYEpTwD+wU1ws//RM2R+z0D9Ed7SH
	UWkWgZqimBcSguXVmgppTx8SV9cLV/Niw5SwVlEfU+GuEv2EDE6lrU/lB6TMoTAeXBw6jVeBD9nLH
	hQ5lL/oM5eed+J2ekYLVYXWQinzQHN6OmGm0k3HJzseEHpdSCDOrLAt7IPg+PedmyGKfA0+43BTqC
	ShIsNt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjUj-0000000DG0G-2yci;
	Fri, 03 Jan 2025 15:21:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjTU-0000000DFZ8-2S6R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 15:20:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6DEB45C6459;
	Fri,  3 Jan 2025 15:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B2CC4CECE;
	Fri,  3 Jan 2025 15:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735917631;
	bh=QJINj3uN3/eTOmdWL3Jhcy4fbhqx0x7mEEplwLDUQRs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DxlFbgShUl4VcEtWCFIolbrtYDaZkbka7Uuu41+w2t5k8cyFu6FzOBN+KMYnje50/
	 wn6EkE8lD2nUxSkDdAUCZU/ljyRDclasGVMrCqMr0RKWOZGaf9G9rHPhbBIUDHCz+L
	 urCH8sroLQF7N18DzW4UoCuyRww/8RRFzojXmHn0+cd4heRVvX1TGjiiKSW299TnrO
	 vFN/XwvW7aq/hx281MnxGZpAwriyTSOEHnk4HIbpkZJ+cl9T0YmKaBpZqcnbpXvmX0
	 RUhcaTLyHShysn6OBEcqMB/MyrAKpX+Js0i5i33a4vhunBsrhtbtT4sWUHUc3VHqGB
	 e3K1CB68IgmVA==
Date: Fri, 03 Jan 2025 09:20:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
In-Reply-To: <20250102150508.3581-1-lukas.schmid@netcube.li>
References: <20250102150508.3581-1-lukas.schmid@netcube.li>
Message-Id: <173591745697.2305265.17487385995864491959.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_072032_669439_E4163CCC 
X-CRM114-Status: GOOD (  10.94  )
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


On Thu, 02 Jan 2025 15:05:04 +0000, Lukas Schmid wrote:
> NetCube Systems Austria is a company that produces embedded systems
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y allwinner/sun8i-v3s-netcube-kumquat.dtb' for 20250102150508.3581-1-lukas.schmid@netcube.li:

arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dtb: pinctrl@1c20800: 'gpio-reserved-ranges' does not match any of the regexes: '^([rs]-)?(([a-z0-9]{3,}|[a-oq-z][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$', '^vcc-p[a-ilm]-supply$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#






