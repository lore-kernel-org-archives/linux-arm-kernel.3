Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D18AD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 05:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zt1X1IcZPRAdEgh00iL8e6/dAz/J6p6qgR5VZMG7S4w=; b=ap0gfcmDqMBbe5TsgwH4u0TghA
	ZdJ5vJx/hHWNsxi6fDXeUmMdCjxpsNcGr/cb2IszecUJDxsiDq/NwSPR5gYoWzZX1GI3a2GWyAdnx
	m9+jO9IlB4fL2IawPWnj2RBF536Cfgkizwonf+Nu0FY8pMIW+zDzorRtLtrJsfPukt+epTGLcJr5e
	52Bqt/h+I3abPRvgF/tFi2Nb3M4GAAoTCvbw8yxLRHqhYAFNLo5d7a09SYYAx56WAAl/UDkDGeNId
	xer+JXfwKEFZUF5mvE4ZGFgWQ5rr0wHIbdjg8o+UOHq0qWTPE+4i6Lne+WnbyFDVCi3wqtncpAtXz
	gX8JDcNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQfq5-000000069VK-1ENZ;
	Wed, 03 Dec 2025 05:55:45 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQfq2-000000069Ui-3UHY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 05:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1764741331;
	bh=Zt1X1IcZPRAdEgh00iL8e6/dAz/J6p6qgR5VZMG7S4w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Wuy1YbS0Wa5ljm3DHFmlc6wSh1Mw9H59CYdGUMrhUfSqSXtQ26sbz9vuECfFgBW5g
	 qFXss1OOAQc4nKjr2VuU1G5KaLodBe2J5Rk7POyVMXMmjDRrl/BGJCw40eitHomkmz
	 tEQsvAVWA8WC36VVzCfWBTDBCLI2iJqw5wlKrPCPMKpEeCOrD80K0G3LPbyT14QfXV
	 mWFv3LBwDF0MF6JSNtctvhWKaB8C3QTbQuTvnocx1aPsNBs6IDae2AUnEKgYjjS22u
	 /irKXOvwFVkwP9inl2tyqZmRaZV3omq4Ou5AEo22mmOLbdI/51ofTykz30jxSDDy4X
	 Z5ja2MpHpnKIg==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F03137B6A2;
	Wed,  3 Dec 2025 13:55:30 +0800 (AWST)
Message-ID: <64349026443d6178487db34233d24478821a1ca1.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] dt: aspeed: clemente: move hdd_led to its own
 gpio-leds group
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: alex.ts.wang@fii-foxconn.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	george.kw.lee@fii-foxconn.com
Date: Wed, 03 Dec 2025 16:25:29 +1030
In-Reply-To: <20251127-leo-dts-add-shunt-resistor-v2-1-c77dfbfb826c@fii-foxconn.com>
References: <20251127-leo-dts-add-shunt-resistor-v2-1-c77dfbfb826c@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_215543_085921_EA40E4EE 
X-CRM114-Status: GOOD (  11.64  )
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

On Thu, 2025-11-27 at 17:44 +0800, Alex Wang via B4 Relay wrote:
> From: Alex Wang <alex.ts.wang@fii-foxconn.com>
>=20
> The gpio-leds driver requires all GPIOs in a group to be available;
> if any GPIO in the group is not available the whole group will not be
> created. The hdd_led GPIO is only present after standby power is
> enabled, which can prevent other LEDs in the same group from being
> created and blocks properly setting 'bmc_ready_noled'.
>=20
> Move the 'hdd_led' node into a separate gpio-leds group so that other
> LEDs are not blocked and the 'bmc_ready_noled' flag can be set
> correctly.
>=20
> Signed-off-by: Alex Wang <alex.ts.wang@fii-foxconn.com>

I've applied this, however, I fixed the subject so it has the usual
'ARM: dts: aspeed:' prefix, and added the following Fixes tag:

Fixes: b5dd16228216 ("ARM: dts: aspeed: clemente: Add HDD LED GPIO")

Andrew

