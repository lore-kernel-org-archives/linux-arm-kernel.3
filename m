Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCB0606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o5HHa0z3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L1huyh48
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r/DKQmEszb+fcqdVEHRUAZxDtolo0S47qmYDkLTGymw=; b=o5HHa0z3brkROgWRnqIDQP1LfY
	DwZ5PjR0c2BcFBnC+o6phlpupqoTCQ+BtvrWkM0HAJSod4JTan0Cg7qdX24/Ju77VjkmyZ+BjJmR2
	HBv8ogmM8HElEpl8bWrADOJmAvuHYl1wIKxVf8BXujkexEOdcp/W+hmOceJNWGikr6vnaAT/t4mej
	5fj0P7tpE//iSTIul15hZjEcYOC9w5huurMElRZ6+W9S8PI3iwArjpXSACXll3LWllqqfQ+94lYPQ
	EH7yc+6Hn0XQ6M1TFSCbUQimBmu1OzrpmZVgctyHMwFFZv6y4p/rj2flwXqTwbyk9eRZfYuL8JWo1
	U7vstgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpE4-0000000GA8W-2juG;
	Mon, 02 Nov 2026 10:25:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpE4-0000000GA8K-0fL9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:25:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4A0F41477;
	Mon,  2 Nov 2026 10:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05AE1F00919;
	Mon,  2 Nov 2026 10:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793615115;
	bh=r/DKQmEszb+fcqdVEHRUAZxDtolo0S47qmYDkLTGymw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L1huyh48LDn0IwZByWYNzUrr75dn2edhjHhyJj3XzPeZs7UGxN5GTtSGcFPOQPpII
	 LhXBBJt3Y87Wqr4UFB9nqh4pqIDR1B+lS4+ifXKK6HX41oeoAf1CrYUpcMh0e4oSIL
	 NMY3PdIToLqenSpXG442/tZlmC731hqD2ik4QFYsJvdLDD/XulEajap0RodYGvSTVp
	 O1zaBgto30XBaNsXcLD9wPRQhw0OYKMpdV0UZcVhhWVmSuo4L1i6VkOrKjtMY75hyw
	 ayqTVzdus8nfQaJAaWmpqTsH0VYVsj7DjZHyRkQCWs9NV5ZtTxHADEi96UJsekmbw2
	 tj39mtfLyC5fw==
Date: Mon, 2 Nov 2026 11:25:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] dt-bindings: stm32: add binding for usb2phy1stp
 clock on stm32mp25
Message-ID: <20261102-festive-private-serpent-be2d8b@quoll>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
 <20261023-ups_mp25_clk_update-v2-6-398d348ea8fd@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023-ups_mp25_clk_update-v2-6-398d348ea8fd@foss.st.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 06:43:22PM +0200, Gabriel Fernandez wrote:
> Add the ck_ker_usb2phy1_stp clock binding required for USB Host (USBH)
> low power support on STM32MP25.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  include/dt-bindings/clock/st,stm32mp25-rcc.h | 1 +
>  1 file changed, 1 insertion(+)
> 

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


