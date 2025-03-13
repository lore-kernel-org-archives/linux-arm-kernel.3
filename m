Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31042C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNNzZN9gjwDyj+Z3Fk26GR4WukaLyWbTvb06IUuzu/0=; b=k30Cm5ob+beS/G4nxi6IFsjmNo
	t53Lg3zU+YRmoGRJC8C3X+WGrA/5uAVRfA0OXarJIGictVptg++8yKpPDZV1gb1FKACwH/Ha0REbF
	Qp+KsEuEtm+IDhjMCi61lrHZyHblnSKJ7pkofwuNxPGdhd21OXhyF95uId0W4U4fi8N7wM0C8vYHl
	gT6ESvqcIAxQqpi1aaPcaOnZFZJjLTv17Aj8nxvfaYLrIJvl7IaYhDwEbexCCxc+ucbuwL38V527c
	LB21tSFaK4zmdDTvFszeVoA+00kDWeLk/2v+9tMc0KHpKaKtAN04+Whf2VKhjPErtHPXbI/KKnoqV
	NJ2vx9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdup-0000000AY08-0owf;
	Thu, 13 Mar 2025 08:27:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdsL-0000000AXaC-1bXQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:25:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75B08A46452;
	Thu, 13 Mar 2025 08:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEBAC4CEDD;
	Thu, 13 Mar 2025 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741854308;
	bh=tP7pYcJ7IaS/Md1BK9deqaULsuj+tHBEOo4Z7ziQAkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NL/EN3ETQnY+Lz19/9hMJ+OGvvE3x/RWN3cE++EjFWmiPKO2VWc17YDgkqU7jHUhZ
	 akNjOqPnK/HBghunrcZXXkWXN3tnq37IF33FljFlzOv6ne9wX3CNFqmTi5e942R2yi
	 CczyHgyQ+o+nuF57BGEK25KVtBcxhn8V7zJ3qxgmWSniA968DR3M90meO5LKQwX75Y
	 LDPe7AnucVsGwLxJaacHVdqW3isQj4EjfXPWD5uXBdqSe7v6MSCQys7sEoBNv70Hq4
	 J2fqzNAWKTtE33cnG6TsabQzsnu58qMCexpuhWG7H0l4bsov8uXYrTa6ZbHJyIb3UH
	 gdkeK+qdUIewg==
Date: Thu, 13 Mar 2025 09:25:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Message-ID: <20250313-mottled-quoll-of-vastness-3f3c6b@krzk-bin>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-4-ebf4b9a5e916@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-qcs615-v5-mm-cc-v6-4-ebf4b9a5e916@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_012509_493027_E83EA4AD 
X-CRM114-Status: UNSURE (   5.62  )
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

On Thu, Mar 13, 2025 at 12:29:41PM +0530, Taniya Das wrote:
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'

Also no qcom,gcc.yaml. Why?

Best regards,
Krzysztof


