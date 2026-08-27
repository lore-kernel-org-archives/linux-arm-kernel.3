Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B31CC61DC7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JC8KEH2A5MaBWTLPjH1KEcQphE7kFFAbdhvua3h0dxM=; b=0QG41wXNcF5n8ZjVkphNDUYiDa
	iunBlm86o1p6nTpYLRXyWw7SPBBMuudWB1RgEDjzvWzlm78Vu+Tgkv/KpOuZCNWCOdX1Dp6iu5DEi
	vG02G6EQnVTJZ4K8X55QDLEscwKYNlRpqgqGaMIVR3nttxuKCUYR85g1iNTJRpB6kL15H03W5KDhK
	abbPyA+OwNy1e7cN6F4TNJTeuM9OYmdldeU12RFsOGHkA02mVM3V+ed4pqDUpxXyN61IHYf+sFy34
	ltnCObJ9fQzpYYibvwiC3w3jHseeUI93ioPdrjSTw9VkciANUooEHCfb5PGB/wdNUkLpGJyp2EEka
	xH/ZvAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZ5j-00000003wxR-3tab;
	Thu, 27 Aug 2026 12:20:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZ5g-00000003wx9-3UUJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 12:20:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2876D408AE;
	Thu, 27 Aug 2026 12:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6301F000E9;
	Thu, 27 Aug 2026 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787833220;
	bh=JC8KEH2A5MaBWTLPjH1KEcQphE7kFFAbdhvua3h0dxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ns3c1dbgik71leiI5OFOgqECUIefVwx/zRnd6jyWTbatex/odpR1+VaXlszUnQ2Gz
	 +Oc1OMOAS+mMgDM+HVN8N8q4Rq858mfCFiFs/XTZfwlnx+uuYcYMBkEr7t+vHGr7i/
	 3bIp+aBVOQtpxadtjMEoJR0aoh5pTydMhZlUhEZW+4X9jmK+oP9iATtr77WsZX+I+l
	 tD6rg9A4+diFFnctSArK3/GBlDNIe6DrQwBbHc5ckdLqaugZefKMG2koXa/vgeNH1B
	 1rY1hp2+4lYToz7u5eOIBhnGonlqlBUvZ8a1d8tBLc+CtmH4LdAsz7kMLaH2cvjHKT
	 ThEaoKXn0Y3vQ==
Date: Thu, 27 Aug 2026 14:20:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
Message-ID: <20260827-predictable-mauve-catfish-3d5ad0@quoll>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-6-196e2b306368@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-6-196e2b306368@oss.qualcomm.com>
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

On Fri, Aug 21, 2026 at 09:38:59PM +0530, Hardeep Sharma wrote:
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,kuno-aggre-noc
> +      - qcom,kuno-clk-virt
> +      - qcom,kuno-cnoc-main
> +      - qcom,kuno-dc-noc
> +      - qcom,kuno-mc-virt
> +      - qcom,kuno-mem-noc
> +      - qcom,kuno-pcie-anoc
> +      - qcom,kuno-system-noc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:

Missing minItems. I asked to open other bindings to see how this is
done. So for example you took qcom,maili-rpmh.yaml. What do you see
there but you do not see here?

Best regards,
Krzysztof


