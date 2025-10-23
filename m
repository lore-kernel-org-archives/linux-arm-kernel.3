Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E11CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hOVfqUV1yYU+C0SkOE5hTPkmi8lzs5MjCNqqGYDRVs=; b=yHPPWzqoQN/blaBEpQvkeNnJzY
	8DCGVaWgVHHNaXpc4Cbv0a2UwHyHuSVZQ6rvqZMgaScGVwnpFQ8SdHx3iMQ6jteQFpZ+FbMUcPg++
	pgfAVtK15OU5T74R7a9O0yL9xoAQ+xhxp2ofXsp9o2LawCmbHvqSvuhHNSlunKaFmbWZvxZckZVFU
	VIPlfzsdE9zlIDy3iKh+cNzvlnOoXhZLvJgZ1rDPutXQxs+oovvd+iVJcc8Gpg8JPrvE6mA2ZBIk+
	O0PhkJUnB3PW8V2OrBBfqDy0gg21EBE561QkUJARfg0rK0GKPpFdRVCNMiVGMN1u31SGDhoJ0ADsI
	ydCbxNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvBQ-00000006LGY-1wlp;
	Thu, 23 Oct 2025 13:16:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvBN-00000006LEt-20cv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:16:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 489C71516;
	Thu, 23 Oct 2025 06:16:36 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DB983F63F;
	Thu, 23 Oct 2025 06:16:42 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:16:39 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_061645_642597_C2C3AC9E 
X-CRM114-Status: GOOD (  21.63  )
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

On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
> Document new property arm,poll-transport, which sets all SCMI operation into
> poll mode. This is meant to work around uncooperative SCP implementations,
> which do not generate completion interrupts. This applies primarily on mbox
> based implementations, but does also cover SMC and VirtIO ones.
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
>  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index be817fd9cc34b..b53754a318ea1 100644
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
> +      This is mainly mean to work around uncooperative SCP, which does not generate
> +      completion interrupts.
> +

Could you please clarify which platform and transport this change pertains to?

Introducing a property that enforces unconditional polling across all
platforms is not ideal - particularly if this is intended as a workaround
for a platform- or firmware- specific issue. Such implementations often get
replicated across platforms without addressing the root cause, leading to
wider inconsistencies.

It would be preferable to scope this behavior using the platform’s compatible
string. This approach ensures the workaround is applied only to the affected
platform and prevents it from being inadvertently enabled elsewhere, unless
another platform intentionally uses the same compatible string (which seems
unlikely).

-- 
Regards,
Sudeep

