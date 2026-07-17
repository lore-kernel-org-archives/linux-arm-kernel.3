Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059DAC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Sy6bLu9Q3NOEH8nZ+KczW/y7ldpRksGLq6zS2Mbwf4=; b=Meqv59DYYvjx6OvAOYY1n0g1Ht
	ljMrtTRNekZsmJXnRx5lhvhSSFyuGM3kKkXbpBUpHJVcBX0VcPNvaPwtLR9komkXs2bBJQM4OaIgY
	bSgu1+VLlLcWGnwBvotYtnG0zpbSGaO/srr4ys2/6QdXPEF9SVjSCyqs2w3SlERH7RQajHjqpNVml
	Jpc1cFEH4+RtveHcXh2jJOu5Xh6dbBQdjsniTZrHR69cVKrGsVnABMhuyRdcY6yy3+DatwiP4jMyN
	P82ueyFqKI3mPc/Kz9FWur8if3Rwd8UMqGbK52Ram7mBOziKFMW/K/1DU1Ee7RnhEF2P4i+LFJ9r7
	1O+cwU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke5h-00000001h24-3clM;
	Fri, 17 Jul 2026 08:38:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke5g-00000001h1W-1nsg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:38:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 31C9E417A6;
	Fri, 17 Jul 2026 08:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5243D1F000E9;
	Fri, 17 Jul 2026 08:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784277520;
	bh=6Sy6bLu9Q3NOEH8nZ+KczW/y7ldpRksGLq6zS2Mbwf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MlUgvP3LbouDsJKh3lNGWq26S6zD6qpcNMHht7j74BGZOhIqHvnqIz/xIZFQRsPKW
	 uWIdKk3cAUDH0/kFYiXF3TvXDR7y7ToEsMo+On3E5cVbXlP7ksOXEZ3/XX0R8j8+QK
	 8YbXUZD3kCG0DFErcfxU/5ym6p3/cgmQEqpTKfVJ2tpqUwqlWofmBSshnQEREY3LdP
	 WUELjNe1sRgb+ZrXZSIWShDWHRZRanyu2jdqThFu5M0mvJHvMXiK3eMyqRXsP/hJV/
	 PS1eNL21uTjUAqYwAtY++I+CyU0NKY11RMumQ44UkF52WEAkDeiOIx4Gr7pcJrY6fz
	 1kXzDqhf8fx3Q==
Date: Fri, 17 Jul 2026 09:38:35 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: arm: Add Live Firmware Activation
Message-ID: <20260717-lucky-gerbil-of-courtesy-162f0e@sudeepholla>
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706134455.132091-2-andre.przywara@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jul 06, 2026 at 03:44:41PM +0200, Andre Przywara wrote:
> The Arm Live Firmware Activation spec [1] describes updating firmware
> images during runtime, without requiring a reboot. Update images might
> be deployed out-of-band, for instance via a BMC, in this case the OS
> needs to be notified about the availability of a new image.
> 
> Describe an interrupt that could be triggered by the platform, to notify
> about any changes.
> 
> [1] https://developer.arm.com/documentation/den0147/latest/
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/arm/arm,lfa.yaml      | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,lfa.yaml b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
> new file mode 100644
> index 000000000000..ef8e250f2da7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,lfa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Live Firmware Activation (LFA)
> +
> +maintainers:
> +  - Andre Przywara <andre.przywara@arm.com>
> +  - Sudeep Holla <sudeep.holla@arm.com>
> +
> +description:
> +  The Arm Live Firmware Activation (LFA) specification [1] describes a
> +  firmware interface to activate an updated firmware at runtime, without
> +  requiring a reboot. Updates might be supplied out-of-band, for instance
> +  via a BMC, in which case the platform needs to notify an OS about pending
> +  image updates.

What does the below described "interrupts" cover or doesn't cover? Both
in case of in-band and out-of-band. It is not very clear for me.

-- 
Regards,
Sudeep

