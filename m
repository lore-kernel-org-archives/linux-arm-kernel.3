Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05302D41178
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcDFS31au9qcPdLbViVvar0GyZ40bB3+m6qReZrPxAk=; b=iy+mrJMTBVIauAmWTEXOiG84vL
	XV05QT07Hsw8lrxY2anKOop0gyQQf1xjclPy6D3zKMxbikN2m1CGM6J7NV4E8YAA5kB4Fj3GFyEUx
	x9lupfNniqjBHIjeQ9ZYmobi0k41IiNZUjbYZYA8meoZaQCKMBfc0Pq/YcX0xJ0GUQaFnmvfB0dMo
	fwuX7qcvDyvGZFlkBIY+uDdhAyGltZWCgPfe/lsL5oco7poT34btNkdnKDSwt+yOu4H5fSANcP4TT
	QGtHVvnHahlcOgi2tzkyDu1WDo+W2qPCedfYbIdlSHYOTrxaVYRHyy0dW4tSg979SoNXCF6oSP6/z
	e8/0IQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLyw-0000000CH1V-1bwN;
	Thu, 15 Jan 2026 11:57:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLys-0000000CH19-1XTn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:57:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F6D8FEC;
	Thu, 15 Jan 2026 03:57:29 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDCFD3F632;
	Thu, 15 Jan 2026 03:57:34 -0800 (PST)
Date: Thu, 15 Jan 2026 11:57:32 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,no-completion-irq property
Message-ID: <aWjWLFi6xUIn3_GQ@bogus>
References: <20260115004921.548282-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115004921.548282-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_035739_810140_83CC29E3 
X-CRM114-Status: GOOD (  24.76  )
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

On Thu, Jan 15, 2026 at 01:48:56AM +0100, Marek Vasut wrote:
> Document new property arm,no-completion-irq, which sets all SCMI
> operation into poll mode. This is meant to work around uncooperative
> SCP implementations, which do not generate completion interrupts.
> This applies primarily on mbox shmem based implementations.
> 
> With this property set, such implementations which do not generate
> interrupts can be interacted with, until they are fixed to generate
> interrupts properly.
> 
> Note that, because the original base protocol exchange also requires
> some sort of completion mechanism, it is not possible to query SCMI
> itself for this property and it must be described in DT. While this
> does look a bit like policy, the SCMI provider is part of the
> hardware, hence DT.
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
> V3: - Reformat the commit message, expand property description to
>       explicitly spell out this is hardware description.
>     - Rename property from arm,poll-transport to arm,no-completion-irq
> ---
>  .../devicetree/bindings/firmware/arm,scmi.yaml        | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index be817fd9cc34b..46d9a0a9a0e58 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -146,6 +146,14 @@ properties:
>        this platform. If set, the value should be non-zero.
>      minimum: 1
>  
> +  arm,no-completion-irq:
> +    type: boolean
> +    description:
> +      An optional property which unconditionally forces polling in all transports,
> +      meant for hardware which does not generate completion interrupts. This is
> +      mainly meant to work around uncooperative SCP or SCP firmware, which does
> +      not generate completion interrupts.
> +

I would swap the order of the above two points.

“This optional property is intended for hardware that does not generate
completion interrupts and can be used to unconditionally enable forced polling
mode of operation.”

You need to update the commit message accordingly. We do not want to indicate
how this property should be used, as that is left to the implementation. The
emphasis should be on what this property indicates to its users.

Please update only if DT maintainers are also in agreement. I have just
expressed my opinion. IIUC, it is aligned to standard DT binding rules but
I may be wrong.

-- 
Regards,
Sudeep

