Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5512C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 07:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDvrRTEFuMCLtbPLEccOAzjUpJZIlgtMil5cTFgU7EA=; b=o846pI9UbzM23yAAvwaBV0bM0s
	JiYhBm/lLDPuxsiHyB80pW7VJedH2HD9GdXG1v/Cx/QhiomzelwLVOMcqSFFlzpAiQXx5OY61vOoN
	QbrVv6cuY3hjXEN+08dWjEu6u5VKpdZFmsWdEoBqQd+3rmM7AvcCPxsYwpl5PJPhUs8/gim6rPqIK
	/a7cO7wvbOEotW30tW/6EaPgEGrODmmSYVvE2as5yaa9ce05qPvA/OeBb5QokwiB6VthxQNTnKnsa
	GZ5TWafauq3bYkx5O1bIW9ggW+RHgLzef+av1l4z6SSAVtWpWzHYte1RdpH1v2SvJr1oaSStZ5JpM
	CQKY1Nsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCjO-00000009FWC-3ehL;
	Fri, 25 Jul 2025 07:20:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCb0-00000009EZE-2mHi;
	Fri, 25 Jul 2025 07:11:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7F39601DC;
	Fri, 25 Jul 2025 07:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B42CC4CEE7;
	Fri, 25 Jul 2025 07:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753427517;
	bh=NIrSmkNaqlrDP1N8LHUNlwi4EoCzvpR2Fghdour3+lI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5DjHfnLxJRHxrPjixKz9e3HA4B5jay/iIi78te15+dbbNIE0kXL8+FKl9usFF17H
	 hAyffWg4KLQWOsMgfLORmx9/b7N2uUrlXzbivw7rMtDcUphHTjr9GvssiRqDWArnaZ
	 +vgPEilcy1tEERdqMPT7SZlKBiJy/OuTEQmufjIJv+falGZ9toEzooVaRQALQs587P
	 8OX7gJrzRuWL4bneig6TgESlt7wUYZ8El/1dMOhJUzD22CJ/Z+oHqxqj8umMYS5Nfn
	 StEOFycqJoRP376PkhQ7dbRiTk9AluSEuQB+X1uR9qr7hNNDOX+oLX0+C2Vexiy8lE
	 5UN6/xybxXzWw==
Date: Fri, 25 Jul 2025 09:11:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/7] dt-bindings: net: airoha: npu: Add
 memory regions used for wlan offload
Message-ID: <20250725-amiable-strict-pudu-5cce71@kuoka>
References: <20250723-airoha-en7581-wlan-offlaod-v5-0-da92e0f8c497@kernel.org>
 <20250723-airoha-en7581-wlan-offlaod-v5-1-da92e0f8c497@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723-airoha-en7581-wlan-offlaod-v5-1-da92e0f8c497@kernel.org>
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

On Wed, Jul 23, 2025 at 07:19:50PM +0200, Lorenzo Bianconi wrote:
> Document memory regions used by Airoha EN7581 NPU for wlan traffic
> offloading. The brand new added memory regions do not introduce any
> backward compatibility issues since they will be used just to offload
> traffic to/from the MT76 wireless NIC and the MT76 probing will not fail
> if these memory regions are not provide, it will just disable offloading
> via the NPU module.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/airoha,en7581-npu.yaml    | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> index 76dd97c3fb4004674dc30a54c039c1cc19afedb3..f99d60f75bb03931a1c4f35066c72c709e337fd2 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> @@ -41,9 +41,18 @@ properties:
>        - description: wlan irq line5
>  
>    memory-region:
> -    maxItems: 1
> -    description:
> -      Memory used to store NPU firmware binary.

I still do not get why this cannot be kept backwards compatible. I
looked at your driver code and NPU offload support RFC, and they look
correct. Yet what stops any future developer from changing:

	mt76_npu_init(mdev, pci_resource_start(pdev, 0),
		pdev->bus && pci_domain_nr(pdev->bus) ? 3 : 2);

into:

	ret = mt76_npu_init(...)
	if (ret)
		goto err...;

? Why would anyone NOT DO such change in the future?

I think I asked about this last time as well - why you cannot keep new
entries optional (minItems: 1)?

Best regards,
Krzysztof


