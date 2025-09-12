Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D88CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 07:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCCG/Pv0GCvODxzoO7x3Jnmfkfx8ryzX1LaxkzN5nYA=; b=CUiHvI6YSCXWPdbO9vlC4mu0OI
	gJgbD2ckZGWDuf8ifTlccE5LUe22OYigHzkhv8CgaERrh4gMQxGHUH/ySRN/VgrNSvIfW8v/jZgUh
	ET796xMLheRauR5Ta2QVy0Yz9rv9IWSABjgybX4Noehtj4zn7wRNQtKo7oBIWbSpX2zVVTHmQyg3f
	a5SmFlKgVQuJ2TZh3WsbogID/HcrGAtHpiugDaU9CZwHVFBR/vtzWtE2PxsArdbmvqegn1OCdsjXj
	Iq5XUaLRXbzM4f0BtGZcIUfDE1oxPGmg3og9UP/uvZOkztn4wMHGDU8DZn0hClh0qWxhXDUykJodB
	jT9j4aWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxpg-00000007XY1-0YTD;
	Fri, 12 Sep 2025 07:04:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxpe-00000007XXE-44u7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 07:04:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63372601AE;
	Fri, 12 Sep 2025 07:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85DD8C4CEF4;
	Fri, 12 Sep 2025 07:04:29 +0000 (UTC)
Date: Fri, 12 Sep 2025 09:04:27 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Varadarajan Narayanan <quic_varada@quicinc.com>, Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anusha Rao <quic_anusha@quicinc.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
	Devi Priya <quic_devipriy@quicinc.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Richard Cochran <richardcochran@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	quic_pavir@quicinc.com, quic_suruchia@quicinc.com
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add required
 "interconnect-cells" property
Message-ID: <20250912-nocturnal-horse-of-acumen-5b2cbd@kuoka>
References: <20250909-qcom_ipq5424_nsscc-v5-0-332c49a8512b@quicinc.com>
 <20250909-qcom_ipq5424_nsscc-v5-2-332c49a8512b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909-qcom_ipq5424_nsscc-v5-2-332c49a8512b@quicinc.com>
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

On Tue, Sep 09, 2025 at 09:39:11PM +0800, Luo Jie wrote:
> The Networking Subsystem (NSS) clock controller acts as both a clock
> provider and an interconnect provider. The #interconnect-cells property
> is mandatory in the Device Tree Source (DTS) to ensure that client
> drivers, such as the PPE driver, can correctly acquire ICC clocks from
> the NSS ICC provider.
> 
> Although this property is already present in the NSS CC node of the DTS
> for CMN PLL for IPQ9574 SoC which is currently supported, it was previously
> omitted from the list of required properties in the bindings documentation.
> Adding this as a required property is not expected to break the ABI for
> currently supported SoC.
> 
> Marking #interconnect-cells as required to comply with Device Tree (DT)
> binding requirements for interconnect providers.

DT bindings do not require interconnect-cells, so that's not a correct
reason. Drop them from required properties.

Best regards,
Krzysztof


