Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E6D606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LwazeG9U;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EDXT4l7E;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=U8UrzikZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoPKot+7OFfT2JTNWL87bj+n+ySvp+5zZLX5ffnAJSw=; b=LwazeG9Uic1SrB4jQHZz1BEKv/
	u/2SyedOD1yO+UiD21o1qEuO67qN0XPtSrwZ4pJjSlhInmmcUxHotXmFTMV9u7ryu9nMNE/ZeP++m
	JXFdetHiYKpgmcoIJuVVg52uRtNEOORx4oBR3DhZFSieCg4nr5Id9MOifnuzGGe2CTtB384w8o2QQ
	4oyPFgjk13QZbfjrGYHWRZj+0xMUTwKrj8XoKb8Qbj+KYYflmonZ0DbZiR3TzPQRe64EcLYfDGYrd
	p1TdkmhHOHFto3rYLcyipaJjR8DV3MrGq3W61FONU86lMf1VCz1piej39HZUwz4rBeqR9fAISGUgH
	brj0iiew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmci-0000000DVn3-0PXP;
	Thu, 22 Oct 2026 06:50:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmcg-0000000DVmt-0Oyx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 06:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YoPKot+7OFfT2JTNWL87bj+n+ySvp+5zZLX5ffnAJSw=; b=EDXT4l7E2OLM9C4wBkjrLsjCRH
	ZuPHvgZQGCCutaPLPWXahU6BZoMN+TINRyzLvUf9Uu0g0tNy77gTiq2w9a976ecmDqSSS3k8n970B
	CxxEDEi1mxqZDa61SK92Liuskj8oh9bFjMhuEJHBCN1fm8zjfrVYD2FKSLfBS1rwaTG7oe4FwrjDu
	sROX0O8H4/IKp04bv+OtJDbSMKeJQ03a71Dx7YGJlcgOHc5DzAZA2SVDW2RLXkQyhPty5iCdDOCCX
	fLc/Z57EFdAzqnz0Zie2NPXd/MjDoS/H0cIWMUNrRSEL8KA0W7uNt6YZZp2x7kZ5aS53AqyQu17nl
	xz52ncqQ==;
Received: from mx.nabladev.com ([178.251.229.89])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJmcb-00000006WqI-42qj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 06:49:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 285091064DB;
	Thu, 22 Oct 2026 08:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792651779;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=YoPKot+7OFfT2JTNWL87bj+n+ySvp+5zZLX5ffnAJSw=;
	b=U8UrzikZz0xZabqwk+QoTCrngKROX+XZlyNL7Ubml2HXtPTUdBa/4P+rpMgCEW47j2jXPs
	oqL8LBGnpUBp8zdNbqwadWIT8ZHt6LIstgvYjdiKH7l+m/aV6HvWytVOPIQLCYftUlVyP7
	qUyCDufkNwHJVGozYYsZnON8LFYQ8yS+Gz/kjWw8F+YshkeRKUN3saIha4kLMNX80N8Nze
	NLCeJvUMgIdvcjAq6Yzg5AvsGF4nGq8C/Oa9V24UbZo4w+CoK/zKUVrw/LOddXXzQYa+FI
	uPc5BSV6IX2+cROaESq3NReNxjH+nyQlEo/q3gwVov1g8MrnpnuVmB72U10C+Q==
Message-ID: <d4b9c444-a848-4b4f-9273-1c832db45fc8@nabladev.com>
Date: Wed, 21 Oct 2026 20:55:39 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-kernel@vger.kernel.org
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
 <20261021183704.GA1116319@francesco-nb>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261021183704.GA1116319@francesco-nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_074954_307136_6FE0A603 
X-CRM114-Status: GOOD (  16.82  )
X-Spam-Score: 0.9 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/26 8:37 PM, Francesco Dolcini wrote:
> On Wed, Oct 21, 2026 at 07:19:30PM +0200, Marek Vasut wrote:
>> On 10/21/26 3:44 PM, Christoph Niedermaier wrote:
>>> On the maveo box, the SPI pins are connected to connector X10,
>>> but no device is connected. The device "dhcom-board" was used
>>> only to test the hardware, but was not removed afterward. So
>>> remove this device to accurately represent the current hardware
>>> configuration here.
>>>
>>> Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
>>> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
>>> ---
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Frank Li <Frank.Li@nxp.com>
>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>> Cc: Fabio Estevam <festevam@gmail.com>
>>> Cc: Marek Vasut <marex@nabladev.com>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: imx@lists.linux.dev
>>> Cc: kernel@dh-electronics.com
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>>    arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 8 --------
>>>    1 file changed, 8 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>> index 047f7b2d8526..eb0b91040110 100644
>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>> @@ -60,14 +60,6 @@ &ecspi4 {
>>>    	pinctrl-0 = <&pinctrl_ecspi4>;
>>>    	pinctrl-names = "default";
>>>    	status = "okay";
>>
>> Drop "status = "okay"" too , since this controller will be unused ?
> 
> you can instantiate a new device on the SPI bus from userspace. up to
> you, but if I was a user I would appreciate to have it enabled.
Good point -- Christoph, is this the (use)case here , can the user do that?

