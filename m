Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A1AC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 20:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2U2cUyn/uK7/+y8yr8gyghlNU8PH5KerGI7TPqKuu8=; b=vFn5pizXJefgsl5AaQMuU0qbFh
	U7wGmRdXDmiPyKH5eV3qmn7ZdUVgDDn/xUGkBJuSM8ce4pVO0QxpPsFJDUKDAqWNLcq211Lhv6H7E
	h4foP/wYb32g3B5S+F+BFKlUqpEE7Z1SQV+NJDYb5kU39ctF80GjdMWAOeJtvWweREjXAL6wgIATO
	63i7GugEokzOWGxOmrsKtv+qzicQ1m+I/zl3WGTvVoK/ZLEFsli1JJ+p87g8nN7gBRwfbpeUyTPjn
	fbIA1YiCqsaOd459Kl18GqfafZvnPvLLRzhblx3bRbOWP1tESS6BQx7h1hhAyVvw3uecK74/v7i/g
	pfUru74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aYt-00000003GTU-0O0k;
	Fri, 04 Sep 2026 20:30:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aYr-00000003GTE-2OpI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 20:30:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B389F401F6;
	Fri,  4 Sep 2026 20:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D12D1F00A3D;
	Fri,  4 Sep 2026 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788553856;
	bh=Q2U2cUyn/uK7/+y8yr8gyghlNU8PH5KerGI7TPqKuu8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=D8kFMqmIALGzBe/uazGT3txbGKSxweOppc+FozSoqxNx/ZQYfV7SoONCHXt2RvmzA
	 wnxsIKpzlmX6dD3vnpDK6I5Kz7Rerp7b5v1Se/rjHQX026l3P3Dq+U535JwCFtHofd
	 VngsQM8KokzswiIDB28U3XMIvju5YygYwlXnb4jHPYlNGXc9NnPvcnGT7eW4jze50F
	 7q7+r252QdRMoCvkpfTLMS+znCWddQ6DM56JZhWpU8RRK5W77OIoWCHlRWESNWf4ag
	 6oWOqY72Wgsgpnkde7MC8z7Mi41p7LV0MD1zWYMgIOxdMAoWgcPDrJqPgqgMlVDEUI
	 h+miLVLYXUPWg==
Message-ID: <f73a94c4-80a7-41b0-9671-d9b6ea436174@kernel.org>
Date: Fri, 4 Sep 2026 22:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: arm: apple: apple,pmgr: Add t8140
 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
References: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
 <20260904-apple-a18-pro-initial-devicetrees-v1-2-0c25401d165d@cyberchaos.dev>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260904-apple-a18-pro-initial-devicetrees-v1-2-0c25401d165d@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 04.09.26 21:49, Yureka Lilian wrote:
> The PMGR blocks on the Apple silicon A18 Pro SoC (t8140) is compatible
> with the M1-M4 SoCs. Add "apple,t8140-pmgr" as A18 Pro specific
> compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>   Documentation/devicetree/bindings/arm/apple.yaml            | 11 +++++++++++
>   Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml |  1 +

There's something off with this commit, it's doing two things at once 
and the description only mentions the smaller change.

Sven





