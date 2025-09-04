Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DB1CA101C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4U5L7M8kRh0hbg8HUZAutq8MxIjcVXXhKwv7rp5pUU=; b=D04eqLBG5aDiMc3OoJMhYkl55H
	08A33awrX+TiWc9wUJ6T1Wtz/CF4anbDNK6eCdZGQhgNAN4piCFgEYWK1TON4YCFhkww8DEcsZXlp
	k8xFWRaSdL91CNTlS8mYHFA24S4wTipYRaX6K9JmC3F1rMOK49dQvDPL23wzDAJwuTnO4U2XxD/SR
	0YJKv7hgo+095SUvXrR+WqCKbKpNV/dlunzFOGHSodO5EYO1D3VlVM/ZYgSXhuvjbWY8QJTZcTp3b
	7tMGQ36fvYpAjb8cBOl0LaY8BUfmR+c6vdK2O5n1DxyXc5bvccyCcLyF1RPjK9dcWeVoDFs5fSGde
	6tKTgt4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzA-0000000E0pz-0X9e;
	Thu, 04 Sep 2025 19:51:08 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuA7v-0000000BvkI-3JCW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1756992944; bh=B9a9wo6oepcTyW30agfxF4Sjx593rtVckWJYfpXHpeM=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=CNiHXeS1qxRRhlrs8yZoC91F4n7vsZoBpZ+lnsIqhOFY9EQk9moNVZdk54TeX0ykK
	 bTLWTailgirVuzqNrjb8tudlxHEiS2OHREugW1qu404UZLuUWeX+ihjwMPIIV82WiC
	 QMAL/OUkVUtox08lYutlio7Hy72yr6Hf4eebMp11Lw1GJTSpAUlQWt0Gp6vYxhmHav
	 GpB8uzBX+TPocpviT24cdXfIzFAheeUS9f2bF+F13d/5mSYtr9jM5IWEJ/KqFRvQKw
	 J+XamfD/EypOtNGQqydP06oS1judL9LGGZumOyUX64h7XjK0Pi/xG3db7Wc9i8XHhr
	 /eWGHfgphSEeg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 974D23D1F86;
	Thu,  4 Sep 2025 13:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1756992944; bh=B9a9wo6oepcTyW30agfxF4Sjx593rtVckWJYfpXHpeM=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=CNiHXeS1qxRRhlrs8yZoC91F4n7vsZoBpZ+lnsIqhOFY9EQk9moNVZdk54TeX0ykK
	 bTLWTailgirVuzqNrjb8tudlxHEiS2OHREugW1qu404UZLuUWeX+ihjwMPIIV82WiC
	 QMAL/OUkVUtox08lYutlio7Hy72yr6Hf4eebMp11Lw1GJTSpAUlQWt0Gp6vYxhmHav
	 GpB8uzBX+TPocpviT24cdXfIzFAheeUS9f2bF+F13d/5mSYtr9jM5IWEJ/KqFRvQKw
	 J+XamfD/EypOtNGQqydP06oS1judL9LGGZumOyUX64h7XjK0Pi/xG3db7Wc9i8XHhr
	 /eWGHfgphSEeg==
Message-ID: <147ba109-684e-4490-887a-54f7efae1d03@mleia.com>
Date: Thu, 4 Sep 2025 16:35:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] ARM: dts: nxp: clean lpc18xx DTB check warning
To: Frank Li <Frank.li@nxp.com>, Arnd Bergmann <arnd@arndb.de>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
 <aKiCIZf0eG2F0nvr@lizhi-Precision-Tower-5810>
Cc: Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <aKiCIZf0eG2F0nvr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250904_133544_638941_E41EFE75 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_133544_638941_E41EFE75 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

Hi Frank,

On 8/22/25 17:43, Frank Li wrote:
> On Sun, Jul 06, 2025 at 02:46:56PM -0400, Frank Li via B4 Relay wrote:
>> There are 3 dt-binding patch wait for pick.
>> [1] https://lore.kernel.org/imx/20250617-hound-of-improbable-intensity-e7c3c9@kuoka/
>> [2] https://lore.kernel.org/imx/174916907717.3619367.3745642154654809311.robh@kernel.org/
>> [3] https://lore.kernel.org/imx/175087864578.2055525.4510390315154712025.robh@kernel.org/
>>
>> lpc18xx related DTB warnings reduce to 0.
> 
> Vladimir Zapolskiy and arnd:
> 
> 	I asked shawn, these are not owned by him.
> 
> 	who will pickup these patches?

I'll do it.

I'm preparing a few more changes for LPC32xx also, and I will send a PR for v6.18.

-- 
Best wishes,
Vladimir

