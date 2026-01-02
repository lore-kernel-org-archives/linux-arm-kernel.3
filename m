Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAF0FA3734
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 11:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HI9/nMVpOcUkZTNNwY+3xQDHuaB+3VVB+uhisAIxriE=; b=YR4pSJ9LdehWr0QWIHy6fGpq1J
	SZ2YRvpcyVPepptBRntvBAaWdrE1YoudhSqCNO2qZlB4WA2+News6Ae+VuZOptao2jqJJijAT3xG5
	4eK8GKKT5uJ5Vbpd2LWly69kd7aErCU8CMoLKsihqO1G9XJzEg/jnu0K1xfps4sRIAFidALW7SM94
	ilLj8j/iq4XaJ1ErDnop8Sive/G3X4H5gbQhq9WH8vzZlPv5D/3Q8xEJw8wHfvhR6xa/yrvWdgGDq
	XHXD5STeQcp2T7EArC2QcJ9HqVKg7gKlDQAfcusEtKiouHEz1ulwjnRpd7OqUQy4lnL65JyGhu/4/
	MnffAsZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdV0-000000089JU-0OGs;
	Fri, 02 Jan 2026 11:39:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdUy-000000089JI-0LFl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 11:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42D4160017;
	Fri,  2 Jan 2026 11:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C93C116B1;
	Fri,  2 Jan 2026 11:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767353955;
	bh=D7x2+MlJTJopSk/N8pBc8Qbs3BKNVmvRcJVrdtF4XQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKN7FheybVdWyw/4a0Hc1ZRpGUlsTpwZKRJvZDIz93nvq9aKsjRqcgxabZOH79tBs
	 7Riixoxnfwhc1uKBMzoaaoHWE16fQYhLWjfjTfvOEnbuNEFAmawp+c4xy3uZKcwEHn
	 V1q48bt+C0So+tvD19B4SCCxViCg66c6vwdy0CiGq8mA/FBcgdHZBn6eO4tTl7uOiA
	 AIelWp1WObnZp8ehX4OxaS9+9j2hKloyjsK099UYkMYrBVDYeLSFWt+wowt64GzMP/
	 QGactYkon+csaT+7tdKFUlgRQQ/GTkbKUWd37gSeRDdodRDgw6ae4jGrBovairhqM2
	 E1aqFh9Wh5IaA==
Date: Fri, 2 Jan 2026 12:39:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <20260102-masked-spirited-labrador-33eae0@quoll>
References: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
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

On Wed, Dec 31, 2025 at 10:29:18PM +0100, Marek Vasut wrote:
> Document new property arm,poll-transport, which sets all SCMI operation into

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> poll mode. This is meant to work around uncooperative SCP implementations,
> which do not generate completion interrupts. This applies primarily on mbox
> shmem based implementations.
> 
> With this property set, such implementations which do not generate interrupts
> can be interacted with, until they are fixed to generate interrupts properly.
> 
> Note that, because the original base protocol exchange also requires some
> sort of completion mechanism, it is not possible to query SCMI itself for
> this property and it must be described in DT. While this does look a bit
> like policy, the SCMI provider is part of the hardware, hence DT.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: arm-scmi@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: s@mean@&t and limit poll transport to mailbox/shmem only
> ---
>  .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index be817fd9cc34b..f4bf4173c5c7e 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -146,6 +146,13 @@ properties:
>        this platform. If set, the value should be non-zero.
>      minimum: 1
>  
> +  arm,poll-transport:
> +    type: boolean
> +    description:
> +      An optional property which unconditionally forces polling in all transports.
> +      This is mainly meant to work around uncooperative SCP, which does not generate

Also not wrapped.

Anyway, you described the desired Linux feature or behavior, not the
actual hardware. The bindings are about the latter, so instead you need
to rephrase the property and its description to match actual hardware
capabilities/features/configuration etc.


Best regards,
Krzysztof


