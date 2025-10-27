Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AA6CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 18:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNoZEKs9Jg0ddWQ/rYT/Dj9yW6JSQLSPRrnwijVeGws=; b=ote0hIMgI3d6glsZq5I8vvt+xs
	eoieLF405k7Gd8+7Zh49WW/RrBdS70LWXs/6wGuCQL/PS3WG2c6kD9843ClJLdI7i9tdhGddVZBhd
	+SvGvPskry0l14j2gYPjOVaAWkAivmL8FHNBSn8M1a8biUCwGXaXQwW0HRh4N0ZnQoxYoqyaebn+6
	W5BXiq0UXNHy2E8sAUPPRnUBp2H8N9Y9+6k3k+yaEYSkxlQe6YrRAUZD6eTXC4q5P1Nm4uYzvmE7b
	ToY8aPpgCAjOLS4FHDdYEu7ACfhftCh5J5CUCuRjnGPKL3+F648JVDQgLcnv+IEAeNMAYkoAhZqRf
	4DFW7O5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRbx-0000000EVrf-1His;
	Mon, 27 Oct 2025 18:06:29 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRbu-0000000EVqz-0kdw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 18:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1761588384;
 bh=rNoZEKs9Jg0ddWQ/rYT/Dj9yW6JSQLSPRrnwijVeGws=;
 b=HUTQt7flup4EuJ+ysPhxPwjlOECrhf0OxdtIh4hF0y7q5FW3OyCNmSPgd6VrRKkAs91D0nCmd
 RZiRRmXDNyiSR/jHdP7zZJRo6+i5X6946RWqakhgxB8rMAM3QbiEUjJf6Qa4CSX1H+r9mcmccdK
 ffqV4FvvkwXUubJIGPBmI81wDTPoIRVsOfl0PZw0IoHf65g5FGmhBQYqTKSzyKjRA4YhnmEmwZ6
 eNirGkI8gxUsWwxveEYQ3Dblp4kVCbu4qc86g4YgyS0kZuxC8dmRPGZ59eom+7Wz3skeoOxd7Gq
 7pJ/u25EdMFrpVN6Hr9gjSNzKxvVTrUAunOjnintwB1A==
X-Forward-Email-ID: 68ffb499e1d8d448afcc7519
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.4.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <60a1046c-437e-400a-8e2c-391cd471c358@kwiboo.se>
Date: Mon, 27 Oct 2025 19:06:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: Harmonize regulator formatting
 for Pine64 rk3566 devices
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>
References: <20251027154517.136976-1-diederik@cknow-tech.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251027154517.136976-1-diederik@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_110626_634891_FE846516 
X-CRM114-Status: GOOD (  16.57  )
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

Hi Diederik,

On 10/27/2025 4:39 PM, Diederik de Haas wrote:
> The regulator node properties in Pine64 rk3566 devices were formatted
> rather inconsistently. To name a few:
> - 'name' was sometimes put at the top of the list, while at other times
>   it was (mostly) sorted in alphabetical order

Personally I prefer to list the regulator-name as the first property, I
think it makes it visually easier/quicker to identify a regulator with
the name prop at top.

I typically try to use the following prop ordering for regulators on
board DTs I submit (and review):

- regulator-name as the first prop (to quickly identify the regulator)
- regulator-min-* before regulator-max-* (natural order)
- regulator-* in alphabetical/natural order

Maybe this preference just comes from a long history of always putting
id/primary key/unique identifiers at top or beginning of data tables,
classes, structs etc ;-)

Regards,
Jonas

> - 'always-on' and 'boot-on' were sometimes at the top of the list,
>   sometimes not
> - 'state-mem' nodes sometimes had a preceding blank line, as they
>   should, but sometimes not
> - other properties seem to have been added to the end of the list, not
>   in their alphabetical/natural order
> 
> So harmonize the formatting by making all properties sorted
> alphabetically/naturally. And harmonize the formatting of the
> 'state-mem' nodes so they all have a preceding blank line. While at it,
> also fix 2 incorrectly indented nodes.
> 
> No functional changes.
> 
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
> ---
> No outright NACKs and one positive response (thanks!), so here's v2.
> 
> Changes in v2:
> - Found more regulators at the beginning of the pinetab2 dtsi file
> - Missed a 'regulator-always-on' on regulator-vcc3v3-sys in q64b dts
> Link to v1:
> https://lore.kernel.org/all/20251026153805.107774-1-diederik@cknow-tech.com/

[snip]

