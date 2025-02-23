Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1881C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 11:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1F1E1y8NuxyZ+7fbd/EuKMjcFWE3h+KWzyWGiy8pDUQ=; b=KCTFKT18k2K4MzY9HDYQvIqL9D
	BgJLeK6yuhqG3BD9gb3L2soKHYk9cfbuZH7/JYpl828bz+uJJueH7y7q2bgqCHNdSLq41YW166Y7g
	y/7Rq57cEY8OINMz6ZsNOKFw92sM0gCvdYf1CB+FlyGPxHexcJacjAfckAzqYzX97uDxb7y50Qpuk
	ZYv8KS/PLZ+qIfS0a+j/KZuBjfxOOEoaAfzzQlumzKn7SCR5YjLkPBtzz+06+tXualkFtDUm5AIZI
	fs3YXNTlq9nMQ565myptd9Hgxc9nCTRUsVGWmItqNkxwIOaNYEaJjFBFT3wJ4Bs4w98HXhBKKyndA
	7NozqU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAN3-0000000B0Nc-3RhU;
	Sun, 23 Feb 2025 11:42:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAFE-0000000AzLG-3ueE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 11:34:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5238B5C6558;
	Sun, 23 Feb 2025 11:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561A8C4CEDD;
	Sun, 23 Feb 2025 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740310440;
	bh=r3B2XKtHika1E6YlhyAhjpbDcp+3BKHZQcf8cFHxtx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHc07aI/cOs6xnSiH19djvhV4PFy8CAhy91dsyHjSEuIedINzBZJA5uJeQQCKG1gR
	 jVmnPRxz/7eMTWxdy3QzZlU0lzVA4tNqxrZzheRkEovEpH6xgKR0bQS/pl4OhFOTYS
	 6gjuWpDr7SVKpmnUkQgut4i00cBfo7n33l99qStjx8ZlyeyjgBsajTsp8gt56OvM8g
	 sC6GstDJLYYGw4xXsxmRXmGCHZU07XAY9Mh04xlhz3suU5mW5lzDYN8+RXZ4+M89Xv
	 uMF16iIYIMItKra3HXlfmmIIekLSLhJDNFeE07YbDkqIu487XxgRc4xUM3WB+rJ0PX
	 hWIpJqLk9OAYg==
Date: Sun, 23 Feb 2025 12:33:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: dt-bindings: Add qcom,qcs8300-camss
Message-ID: <20250223-observant-auspicious-basilisk-d78ba9@krzk-bin>
References: <20250214094747.2483058-1-quic_vikramsa@quicinc.com>
 <20250214094747.2483058-2-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214094747.2483058-2-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_033401_084443_26BE2035 
X-CRM114-Status: UNSURE (   6.36  )
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

On Fri, Feb 14, 2025 at 03:17:46PM +0530, Vikram Sharma wrote:
> +properties:
> +  compatible:
> +    const: qcom,qcs8300-camss
> +
> +  reg:
> +    maxItems: 21
> +
> +  reg-names:
> +    items:
> +      - const: csid_wrapper

Why different order of entries than sm8550?

> +      - const: csid0
> +      - const: csid1
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csid_lite2
> +      - const: csid_lite3
> +      - const: csid_lite4
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +      - const: vfe_lite2
> +      - const: vfe_lite3
> +      - const: vfe_lite4
> +
> +  clocks:
> +    maxItems: 26
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb_clk
> +      - const: cpas_ife_lite
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: csid
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy_rx
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: icp_ahb
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 20
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid-lite0
> +      - const: csid-lite1
> +      - const: csid-lite2
> +      - const: csid-lite3
> +      - const: csid-lite4

Different naming than existing variants. Keep it consistent.

> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe-lite0
> +      - const: vfe-lite1
> +      - const: vfe-lite2
> +      - const: vfe-lite3
> +      - const: vfe-lite4

Best regards,
Krzysztof


