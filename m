Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B85CF6488
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 22:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNNyzAvT37GxfbD66hG6BtD4VOfte8+FRmctAE5cf0A=; b=H1ir8ynZU+IpWtxaHgqHzMjkqF
	zxxjyWwzpjCfkcnU/E9a+df32AhE8rQNDNQ/lTQt1Dx6Q2op73AUAlqIAIomUfV9r7owcxxwKYV5G
	JmkKktyHMsUDafZ0smfM29JgVvSty0WlUquNUE4Tah5ki/q96Pbaq7HMqY4ifamU8vrfEGMJjm5f5
	a9wBRytIn0A+EgcG68Mu7NA/NYN3mVpUJqArfNgZM7brXq4XQpkJ7BAh4HyWMQe2s46IiYIwqhpvc
	XtCLEzsnzfmtZ+oO0El81Qb69groDWQD4eiLMNF5CJuddiREOSy2IPhRTaQ/VavdCyaiHRxrKNCnR
	SRywx31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLqrM-00000005o6L-3u4v;
	Wed, 19 Nov 2025 22:41:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLqrK-00000005o5w-2oMX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 22:41:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 184E54171A;
	Wed, 19 Nov 2025 22:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0ABCC4CEF5;
	Wed, 19 Nov 2025 22:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763592065;
	bh=621P0U/ZMt9tfYhYpJzFH9MENbuLn8U74VwfdbaCPcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J6nhLkGsqbguAOhXecSgsGeAmS5FWmPuncCmtlhyfugKFhj4ajks8EEEfm6I2n12s
	 85/HMv7UNfckOzrYLWFGN/4fh4McgSbveXPT+BX03o5hwYrHo0CYjzXgVlHoizRmGs
	 LGEksWxWWBPskpE2YaglnX9OvbYv+b/szfG0L2Rn6QZLkdBClnHgBLwmj0AV0h9kpF
	 GnF2Iz17WrlWEXzyOJ/+EYr0lHQ+YjV05Tv0b8MgPMAMGAruWq//Vua0vm5rzYpZ94
	 we/VjSi2R1VClnL6MFdBCDa5FeDqPAzHpO007LFlJm0v43VqS+K5TWrpVO4vV/gCVO
	 I0T2b/JvorY+Q==
Date: Wed, 19 Nov 2025 16:41:04 -0600
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
	pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net,
	david@redhat.com, mhocko@suse.com, tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
Subject: Re: [PATCH 25/26] dt-bindings: reserved-memory: Add Google Kinfo
 Pixel reserved memory
Message-ID: <20251119224104.GA3371358-robh@kernel.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-26-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-26-eugen.hristev@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_144106_753600_97DBDBE2 
X-CRM114-Status: GOOD (  18.51  )
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

On Wed, Nov 19, 2025 at 05:44:26PM +0200, Eugen Hristev wrote:
> Add documentation for Google Kinfo Pixel reserved memory area.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  .../reserved-memory/google,kinfo.yaml         | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
> new file mode 100644
> index 000000000000..12d0b2815c02
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/google,kinfo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Pixel Kinfo reserved memory
> +
> +maintainers:
> +  - Eugen Hristev <eugen.hristev@linaro.org>
> +
> +description:
> +  This binding describes the Google Pixel Kinfo reserved memory, a region
> +  of reserved-memory used to store data for firmware/bootloader on the Pixel
> +  platform. The data stored is debugging information on the running kernel.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: google,kinfo
> +
> +  memory-region:
> +    maxItems: 1
> +    description: Reference to the reserved-memory for the data
> +
> +required:
> +  - compatible
> +  - memory-region
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    reserved-memory {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      kinfo_region: smem@fa00000 {

Just put the google,kinfo (or google,debug-kinfo??) compatible here and 
that's it.

> +          reg = <0xfa00000 0x1000>;
> +          no-map;

You don't need to access the memory?

> +      };
> +    };
> +
> +    debug-kinfo {
> +        compatible = "google,debug-kinfo";
> +
> +        memory-region = <&kinfo_region>;
> +    };

