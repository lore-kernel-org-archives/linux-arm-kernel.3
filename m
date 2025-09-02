Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAAACA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqixcjsZhlfl6uKrhVCPBxlqCy34X0rBKN3+98rdgHQ=; b=UwCBxxLMWz3DFXXWkOiOtpb4I3
	c5SaSWHco5M1Xkh62wHxXqCrknVS9setATF/nz8QPnCtlAsARQJvuTQctrAOE7kP8UJjzfch/lfhw
	VIKe7llNnzwbROfyIvjCMYV5+48Zy2Q21IsBvgeh5lCBStvG7Y+dKC0kBUjisQi60xiyJJaqjJ1x+
	SEBIPlc1qWb+qwHgvYVajbCVLuU5gGEE3QdxtHAPRTll8yNK3ZOwDTm8vi5w8jdcEBumaQxyh6pH7
	PCnJwNNClR1CL19NGKiKewRfOLMaEsbnLgzYldiHxzgwmqOXEH6ln14AJjaHtH3ys/T8EUxrBNRXF
	WzrV8IOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLrw-0000000FrAQ-3VnW;
	Tue, 02 Sep 2025 07:55:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLpE-0000000FqKn-1qSg;
	Tue, 02 Sep 2025 07:53:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2651F41A9A;
	Tue,  2 Sep 2025 07:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64829C4CEED;
	Tue,  2 Sep 2025 07:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756799588;
	bh=riQZiJZ4exUI8JW+1R+cAI/RIVX8pPtYIePY0YIjLsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dw/QA4iuLCsV2GfTsBLU+q7zXIGmkBCLfJNQC89MvqZra4FPAbOmsMl6Q7Iz8cwbw
	 4PDHfFYokehXrp8huzoiWiL6X6NJiXL/tCtfpnCERdi2Xic4+ba+JytNJpPcFin6ba
	 hjnW014cTeZC8WsmPlrK5WBpG16uS3T6mEVdQje6SWzma+XO8yszw95Bi1ZPsYRum3
	 F3tKcY5MTYL1DZurIQ6lDBhuSidLFORmn4YzXz99wOfGYwwmiveWWlmlVEYBwgg40M
	 h0V+3lnpTJt+VLmCTB1GvWF3+z3f6SNinTHJ3U63jeOwLF16/YLaJlOXRvX/ibuBwH
	 gjdEiFRUpVF2g==
Date: Tue, 2 Sep 2025 09:53:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bhelgaas@google.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org, 
	kishon@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 04/10] dt-bindings: pinctrl: aspeed,ast2600-pinctrl:
 Add PCIe RC PERST# group
Message-ID: <20250902-wakeful-sepia-gecko-eeba05@kuoka>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
 <20250901055922.1553550-5-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901055922.1553550-5-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_005308_618406_D81C27DE 
X-CRM114-Status: UNSURE (   8.49  )
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

On Mon, Sep 01, 2025 at 01:59:16PM +0800, Jacky Chou wrote:
> Add PCIe PERST# group to support for PCIe RC.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


