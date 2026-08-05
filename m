Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F16C55182
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 07:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8Pplx5QnU6Rr1kBPTcri9uayeJX5puxAU3cLDzc2Vs=; b=euO7Lsb6Xvk9QhhmWjYesCngdi
	pCCa86Sv2EKGwwyag4iCtdW169URtkANWvMOCoBXWXIx5gSzpREmf9A6khdVvzKhozbWi5jWD1+Jo
	UsgQM17U5mfytoDDb8iezucGZQgd0XH9epRC0JXt+Nzt0cy6ldvKNzHZq7tq4c5r5ouAdT6yEmD0b
	k6lNqOQNcM+ai5eaRegkansuqXdmdV9tcwtqbiWQyU3EOfkjoP654qGlJ4Cs/SSg3SVg01Sfj3nvo
	VQq1K8i86U8nzmKN/ov824hk3oGANXlqoQb2b4Uzn+CwGQLe6U2dalkfBtg53WJcsa1pjtpB1Atnh
	wBsM4eKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrW8C-00000003Q2F-3Rn4;
	Wed, 05 Aug 2026 07:33:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrW8A-00000003Q1v-2jIe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 07:33:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E717643A2B;
	Wed,  5 Aug 2026 07:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6121F00A3A;
	Wed,  5 Aug 2026 07:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785915217;
	bh=E8Pplx5QnU6Rr1kBPTcri9uayeJX5puxAU3cLDzc2Vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F5MLED9H9oiftWsSWmYwWngs/cNwLMNqjiFUrs55d7/+9LLdDJ8lMaBzebMm/SoJG
	 1ZHB6d8hz9XJqp/a12SjjwTXArbSNHAZkmgjgtSZv7FeiVXng4IuHYdN0QlMlVRa/B
	 Tw4E6wPq6l0JU6AXTvkw8LbOFD9/R4/f6P81LZq+LlTn+RQcJCS3iqorqfLWPRACga
	 i3B5UO2t9Xmz4Mrhzt6uqw1Ck8GmpJHPaQebJNbMeu9+zPVMWEavpoPApWuvWuJvVC
	 JFZn8q83Y2sFtpy148eBMQFN9w50r4kx+pCHH8hsYcywwkUlwOE9yuhHLERvj3axEH
	 qgJQAqsOTiBxQ==
Date: Wed, 5 Aug 2026 09:33:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: irq: sun7i-nmi: Document the Allwinner A733
 NMI controller
Message-ID: <20260805-subtle-clever-ammonite-0bdfce@quoll>
References: <20260731-allwinner-a733-nmi-support-v1-1-61e4a0825b20@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731-allwinner-a733-nmi-support-v1-1-61e4a0825b20@baylibre.com>
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

On Fri, Jul 31, 2026 at 06:09:52PM +0200, Jerome Brunet wrote:
> The A733 NMI controller is compatible with the A523 one. Add an
> A733-specific compatible string, with the A523 as fallback.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml      | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


