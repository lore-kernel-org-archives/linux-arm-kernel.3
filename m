Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFCF606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 05:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=38p7u+gP;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=prTvNw0e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MiVht9ym0EURv1bddnJJbI5enBTslXQ1JEWYlf28Cto=; b=38p7u+gP2yHI8M
	2NLni1MpZ1bnkV4APMtmla/vpgRV5tQwDOsCURSoT2SRHeNmzWBkC1AHs8H8YAeCPAg1pDDTwF7tq
	m4YjffyUVh7+Z1wp1R9C9uUb/8qI2jd2HtkHOMo0v80sDIHE+UPuCTJ+gNILcPDDOPn68fRytrnLg
	CltfQO+uQgoHWrfz5vqaDlQ9gKmD/HtKbPzyvdsumYOc8ZUO7K/zQ8ghDtFQV4xt6HGJKP4xDtBXJ
	/kPO+Kz1Bvth0ZnULSdSAdlVkHdI089ZOyrLEdX3iR2cGsJ5WbIZXv9X2XJs6pQIyTToBIGLoyeDh
	h9te+gKRd2jHM/79MQ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKUPV-0000000HSpa-369M;
	Sat, 24 Oct 2026 05:35:17 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKUPT-0000000HSor-3Bhe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 05:35:17 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jBT9m5Z5pzKnCD;
	Sat, 24 Oct 2026 07:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792820108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MiVht9ym0EURv1bddnJJbI5enBTslXQ1JEWYlf28Cto=;
	b=prTvNw0enYprIWmGhaUdr7P6UZhA+faYgPuaALUaN5kRnUv5IOQZXOpqRtooY2lDAjCSP1
	7Vpi3t81dZta8GKCcNAj+qBQ0oEuqO/ft8xClKZvXGUHAhg0CJ00xyLWulOlIDLn5TWZ9z
	rDxV8v0zN3isDvgThk8CJ3jZflJPxvmniS2D8z3mmiGWcYm+LRy+x7exPXgqV7lH0nlcXG
	DHPRW36n+VLby7NhHJo76mMt838CfUfpE9XO91XL35NNk7dKNcS12AUoi0d03MzkXcG9V3
	hNgIUS+wSCdgRbsqH/iprgRu10tHbIQMu11ZPjV5QlYEix+YxjnTh2vqceqfmg==
Message-ID: <d870c163-8d90-48c0-bae0-5f6e0e38c5bc@mailbox.org>
Date: Fri, 23 Oct 2026 22:51:33 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a78000: Add GPIO controller
 nodes
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm
 <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <cover.1792776697.git.geert+renesas@glider.be>
 <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 67d5bdyjkzczox9iyuyt8upuxs5tyx3t
X-MBO-RS-ID: a841861d307c1214dd9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_223515_956803_FA810683 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.3 (-)
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/23/26 7:50 PM, Geert Uytterhoeven wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Add device nodes for the General-Purpose Input/Output Ports (GPIO) on
> the Renesas R-Car X5H (R8A78000) SoC.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes compared to Marek's original:
>    - Use hardware clocks/power-domains/resets instead of direct SCMI
>      references,
>    - Drop gpio-ranges properties for now, as upstream lacks Pin Function
>      Controller (PFC) support.

Is that ^ OK ? If so, good, TIL.

The rest is

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you !

