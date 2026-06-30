Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F417C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 19:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6zQg/xYPMDSyslhP1cR6EBRnEfcHERRfBEW1QaonUY=; b=YS/F5huA5rCdWSW9SyoBUxefy7
	UMp1v6kZzVbzjKk+xLVRGqNbXs60yPCzljQ5x0HlTKk/dzixaDELkMRbblLEEQo7JsHeb+l5MaLva
	eGJTZ4spAkH4wLwjCI0AlTMK5ou3+R/Au+67aK/sk7DiYE4y7S6g8GFM9r7gh5VZHfWTe/nyjKTzH
	3cpVDWBPzp59hNl/xoRrZGncEo7IPY/ozL/uxOhxCYu0nzcDnFRRg7e1OIG5ZobAofV3RfMFp0zAu
	pd0ZKMrmWwbz6jCRbL6ZocmegK/SJ1G0ohnAIDF9y58HS1EKHQeZeBlBkJKdCO2tZzGpA7W59DalY
	8xFJclEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wedh0-000000004wT-1gBU;
	Tue, 30 Jun 2026 19:00:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wedgy-000000004vB-0oQ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 19:00:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EFA740D71;
	Tue, 30 Jun 2026 19:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184A11F00A3D;
	Tue, 30 Jun 2026 19:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782846019;
	bh=v6zQg/xYPMDSyslhP1cR6EBRnEfcHERRfBEW1QaonUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l6kYk+dnADxcNvWjIOprBPyqXQ1Y7XsBT+lzOvhvysjLNr1mIEqKRCG68oSxfkaur
	 X0rloWC/ZFjJoyHs5SDaizxbD1rft6y8ChrzW0kNjSEVmjZwFxQO3UDXAkhcC7LBQz
	 fSpGz4JN61ogW7irKbWjNPEjTPF+1rg9TlFjvstBrfqd3ji61Txsv9s7AvkX6AKZeu
	 QQNAWj5aFqut8OdrYnOcvm8v1WNFWEck/e1SFv1ftvEStTX+C/RHjNWTBZLdftqBBl
	 AddU5rpiMkBIuZCF82Gi+V4gLHO5rezVcWCciMRAL8yqgCEvTaSWV4YEJD3Uz1TBH1
	 jcYYAOz4KuJxQ==
Date: Tue, 30 Jun 2026 14:00:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: mmc: st,sdhci: Convert to DT schema
Message-ID: <178284601784.43252.5393908816899610396.robh@kernel.org>
References: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
 <20260629-st-mmc-v5-2-3cf0e639bff8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-st-mmc-v5-2-3cf0e639bff8@gmail.com>
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


On Mon, 29 Jun 2026 16:26:40 +0000, Charan Pedumuru wrote:
> Convert STMicroelectronics sdhci-st MMC/SD controller binding from
> text format to YAML DT schema.
> Changes during conversion:
> - Preserve optional 'icn' clock and 'top-mmc-delay' register region
>   via minItems: 1 on their respective properties.
> - Conditionally require reg-names when two reg entries are present
>   via an allOf if/then block, preventing silent runtime failure in
>   devm_platform_ioremap_resource_byname().
> - Constrain max-frequency to enum [200000000, 100000000, 50000000]
>   with a default of 50000000, matching the driver's behaviour in
>   sdhci-st.c.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
>  .../devicetree/bindings/mmc/st,sdhci.yaml          | 105 ++++++++++++++++++++
>  2 files changed, 105 insertions(+), 110 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


