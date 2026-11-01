Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC3606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m4XGUH5H;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=it8yBbTg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WivfJu6j5FvBeEaYfT1DOBLsHkNjmaHo37wIRykRTug=; b=m4XGUH5Hqs2+Gu
	ZCQ6zhUi8u25sDZ57L/UShyIwqYGWeb6SivAZZOsGr4va0q0sGHHle4vpxE69Ugims/gKvNe29Cr+
	E6/250YjyueKdWvUd86JavvHUg3119H6ExXSxBkVgMSs7VXcNLWu37wcfKG0mEpnUzqRz7rA7Iktl
	l48cS9M3OiW8ihKFoxllaAnqyyPNWiG79OYubr6A+S24vOHqD4Uw4cqD4vf1i/0xmvFRWUk+cp522
	EpZOGsxFEVXvfGLN2AvbSo453PMQ2uRr5kwNhmBeP0edxLKVKGpGI/OzMQEyLMZty7vHca1+BazD8
	qfZV468nNOiDlKPAmNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNd9W-0000000Ev4o-2Emv;
	Sun, 01 Nov 2026 21:31:46 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNd9U-0000000Ev44-0gIW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 21:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=WivfJu6j5FvBeEaYfT1DOBLsHkNjmaHo37wIRykRTug=; t=1793568704; x=1794778304; 
	b=it8yBbTg0JjKQNsyD2M1IgC8Ou7pmHpP8bFdeamXe5arIr3vfyvlL0+NFMaYjVlx7RbEKpXKVcQ
	5Pw5G9Nh70YXMefmAsudZCkpW1pFvf1K2gsc+R1w10wtSsn7qY/KLfONME9ECf6z5XOHp/qA0nh00
	waef9m4MGzMfWfg931US3Gx7quoXvzeDgRQaIww+cFdHXNDPgPfmQ/Z3mnFvlrcaUVwQ9jj/3GSvB
	meWmDLBAGKiEYMwM9+v+GqHveSoSSynKuxyP9sj6dxt60DpQ1EC4r0pB2EYwJiNb7HxcNCL7woMY3
	mYuUuSALhi9NxGC9c34utaSmXYRMnqTUD3RQ==;
Date: Sun, 1 Nov 2026 22:31:32 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christopher
 Obbard <chris.obbard@oss.qualcomm.com>, Andrew Goodbody
 <andrew.goodbody@linaro.org>, Paul Walmsley <paul@pwsan.com>, Russell King
 <linux@armlinux.org.uk>, Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 8/9] ARM: dts: omap: dm8168-evm: Correct SD card
 pinmux
Message-ID: <20261101223132.5db52879@kemnade.info>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-8-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
	<20261028-patch-ektor5-dm8168-dts-v2-8-4544429251e2@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_133144_203626_82425517 
X-CRM114-Status: GOOD (  16.83  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 17:06:09 +0100
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> From: Andrew Goodbody <andrew.goodbody@linaro.org>
> 
> The SD card lines use external pullups and so the internal pullups need
> to be disabled so that they do not cause contention on the lines.
> This bug was revealed by correcting the effective bit mask of
> the pinctrl device. Use the correct macro for DM8168.
> 
> Also fix typo in comment SD_DAT2->SD_DAT3.
> 
> Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> [ettore.chimenti@linaro.org: squashed after fixing DM816x macros ]
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
> index 81450e15b889..a6d42766a496 100644
> --- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
> +++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
> @@ -45,13 +45,13 @@ DM816X_IOPAD(0x0aac, MUX_MODE0)			/* SPI_D1 */
>  
>  	mmc_pins: mmc-pins {
>  		pinctrl-single,pins = <
> -			DM816X_IOPAD(0x0a70, MUX_MODE0)			/* SD_POW */
> -			DM816X_IOPAD(0x0a74, MUX_MODE0)			/* SD_CLK */
> -			DM816X_IOPAD(0x0a78, MUX_MODE0)			/* SD_CMD */
> -			DM816X_IOPAD(0x0a7C, MUX_MODE0)			/* SD_DAT0 */
> -			DM816X_IOPAD(0x0a80, MUX_MODE0)			/* SD_DAT1 */
> -			DM816X_IOPAD(0x0a84, MUX_MODE0)			/* SD_DAT2 */
> -			DM816X_IOPAD(0x0a88, MUX_MODE0)			/* SD_DAT2 */
> +			DM816X_IOPAD(0x0a70, PULL_DIS | MUX_MODE0)	/* SD_POW */
> +			DM816X_IOPAD(0x0a74, PULL_DIS | MUX_MODE0)	/* SD_CLK */
> +			DM816X_IOPAD(0x0a78, PULL_DIS | MUX_MODE0)	/* SD_CMD */
> +			DM816X_IOPAD(0x0a7C, PULL_DIS | MUX_MODE0)	/* SD_DAT0 */
> +			DM816X_IOPAD(0x0a80, PULL_DIS | MUX_MODE0)	/* SD_DAT1 */
> +			DM816X_IOPAD(0x0a84, PULL_DIS | MUX_MODE0)	/* SD_DAT2 */
> +			DM816X_IOPAD(0x0a88, PULL_DIS | MUX_MODE0)	/* SD_DAT3 */
>  			DM816X_IOPAD(0x0a8c, MUX_MODE2)			/* GP1[7] */
>  			DM816X_IOPAD(0x0a90, MUX_MODE2)			/* GP1[8] */
>  		>;  
> 


