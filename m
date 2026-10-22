Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6477A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HojSJa7k;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KwSQQtqo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ie1pPvJMakPAm4rb89FtuuQgGo/VSL8u2Kf+jvYHoX8=; b=HojSJa7kxmYClW
	V848Se2f31KTTCwycjOSaOcMTFY0Ivu7nsubnewhoUbHTB2J8MvrgIzl45rZaa1ZNEdk0pvgLI9bT
	TbLbtIsdTN9JtFDlqKRtYlOV6HIjWetUy0ce+pOYDoMUsU8iOMF3MnmBB2+UYhH3359C+WWvCl4/c
	uBBnIrOMx1mubouWLxAYMQz1GU+J0uLHP/EY3H0vtj3UVEjzLQ65eKMHyCAPvnk6k/Sbc2lABurH9
	Xqsv4druHc6LhNf/DEVZc+2oOWVUhsEX47MBfS1XOurJNm2RKWuAv9xdVguf03vUVDzJNUqM9Fd8m
	z7iQD/6PVafkyyW934vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsKn-0000000E7VC-28y8;
	Thu, 22 Oct 2026 12:55:53 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsKj-0000000E7UF-2vGF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:55:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5C211074F8;
	Thu, 22 Oct 2026 14:55:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792673742;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Ie1pPvJMakPAm4rb89FtuuQgGo/VSL8u2Kf+jvYHoX8=;
	b=KwSQQtqo2qkosmaIZx0XCCW1gYlWle2x4UycqLi8YUXO4i/u/JlPHO0zU8J5Uol4eGyQfR
	2NguiXgOpK2PrZ6l4u6ahrMmbNPSKN9rl1y9+ifu8D50ltBWEiGS70p8RpwO03KjbqzH+x
	3LkcfpuVyRW+3b6PPYabuBPayoUL5bpYS0YKkre6BYFRHpneksCYgkOAfkLS7EnKpH+Xvo
	7nKhJ6QOwN0C+U89/ZrmH7S/NMOC0br5aXe4jLHz+DXdsR76a0Wvu5evE2urDi90vCLiON
	tpqZuLNWPXlZ9XkGC6HjdmOT8zLzPEvwjZ6WYHaQh7sxTto+yBfT9Fbs7nq4gA==
Message-ID: <944b492c-e88e-4069-93d5-84b0d3c0ea2a@nabladev.com>
Date: Thu, 22 Oct 2026 12:45:10 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB number
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 kernel <kernel@dh-electronics.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <20261021134435.17350-2-cniedermaier@dh-electronics.com>
 <3ca82faf-dc5a-4ef7-ad8a-f6273b3e0388@nabladev.com>
 <75107c033de14aa19a21f3b2fc66ece1@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <75107c033de14aa19a21f3b2fc66ece1@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_055550_768585_A37AB552 
X-CRM114-Status: GOOD (  12.85  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 10:59 AM, Christoph Niedermaier wrote:
> From: Marek Vasut <marex@nabladev.com>
> Sent: Wednesday, October 21, 2026 7:21 PM
>> On 10/21/26 3:44 PM, Christoph Niedermaier wrote:
>>> The PCB number of the maveo box isn't 525. Change the
>>> number to the correct number, 625.
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
>>>    arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>> index eb0b91040110..bb82d97f9d84 100644
>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>> @@ -6,7 +6,7 @@
>>>     * DHCOM iMX6ULL variant:
>>>     * DHCR-iMX6ULL-C080-R051-SPI-WBT-I-01LG
>>>     * DHCOR PCB number: 578-200 or newer
>>> - * maveo box PCB number: 525-200 or newer
>>> + * maveo box PCB number: 625-200 or newer
>> Is the rev.200 correct , or is the base board still rev.100 ?
> 
> Hardware rev.100 was a prototype that was never shipped and
> is not compatible with rev.200 or later.
OK

