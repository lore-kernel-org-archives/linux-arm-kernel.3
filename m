Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD2DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBtwJEtR7c4Gx2bZe+JGBHok6YmQDDsKPLZ25GJ7tjw=; b=aoPx7+oOrWU7pN/k5dZcqkdt6c
	agoN0bVJ5T/uFh0e3SqEf2JKAj2TtJS+INmuSr0UwT6WeF5Qp3IYMs1DX0ZrgeovXlL9Qf1U1SMNk
	tykI2vTfkhxC/iMDI+kXvQEGp3cYDLOQOuZa6C59T41pOH8TKRZHP3fKoePSskZC9yl1WvMfy8lTF
	DR8Qi/dyX9BFshDX552hbahLUbNZB1hiAFqM10JxBjGUkF5nSCN6FF+UYe9iGTAE6V1sIq3dDRsVw
	KBEsZWkl+lejxDdV7PL39HyJBBbu/0c7SLdDbDLJg2944wp34H9wjWr2sQkZ634XOym6d4MvlYk+X
	Vq6pzjNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rFV-0000000DEAF-3Y42;
	Thu, 24 Apr 2025 07:43:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rDS-0000000DDqm-383t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 07:41:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E75A1A4A80E;
	Thu, 24 Apr 2025 07:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F70C4CEE3;
	Thu, 24 Apr 2025 07:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480509;
	bh=Rln/ecTqDzkn2EEImME3bcgjSb5k+IMJNatHEmwxhhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+YPQDwbVqC5K5izTZgCEhSQZwQUnGXEytAmw5w0nUsFCOAFXP2mgq9RrqjPIK+vj
	 ahE/34DnCkqikBp83aiuRXd/AVE0u8U322NaOawJqKEzA2UmQRfYTtvvDDWej4NivJ
	 qb8sztCer8fPMaT/OOy06bjvgSRFVcxKGu6Ss0SahT3Qz/QoT7ZR3gAgzKIqJu6fUM
	 /DPTSTGbrywzU9F3QPOnMTUG1ODHQLsNgf5hyJTHaXYH0tBZV5aoPQRbcKsy/uVLaG
	 jDOYKMJUFq1gvPxBML7gouZZofEjf2MHdOLKrTSVqRni1CHJk4/y4BzjM2VqParikq
	 0mwKjX/blylnw==
Date: Thu, 24 Apr 2025 09:41:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Songwei Chai <quic_songchai@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
Message-ID: <20250424-silky-wombat-of-chivalry-42cdff@kuoka>
References: <20250423101054.954066-1-quic_songchai@quicinc.com>
 <20250423101054.954066-2-quic_songchai@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423101054.954066-2-quic_songchai@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_004150_847069_7B442384 
X-CRM114-Status: UNSURE (   8.57  )
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

On Wed, Apr 23, 2025 at 06:10:48PM GMT, Songwei Chai wrote:
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false
> +
> +    properties:
> +      port:
> +        description:
> +          The port mechanism here ensures the relationship between TGU and
> +          TPDM, as TPDM is one of the inputs for TGU. It will allow TGU to
> +          function as TPDM's helper and enable TGU when the connected
> +          TPDM is enabled.
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

You did not address my previous comment.

Best regards,
Krzysztof


