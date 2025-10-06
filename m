Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D643CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 21:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVzR1DgPe9BUIFW8MNWiSHTN1ZRCn/9VkxlBgo5O74A=; b=C/Gvfxde41yLS7zPg1YtPnamYj
	XHV0oNVkRJRlQKzASLPcqxgUBlF0ZFt3u0CheJZ7HmrBlakMC5+dQrf2+1LKa2o75k9QJBrspDpDa
	9MvY/KwE6kgKPST/HLAlIO7fVGaSRBCFXlzQMSeMDaYcnr/BQ4PScOHEXZaphhTQ0ML39F67OREXP
	6yk757DW3TEZ27FN9gGcmRMkemLQc/I9yWSf/eCQCkDL/MSkocjltivHbpozms5h2lFMkhCmP/ckw
	+RCk0TbM2QWK0xO1szQ7pG0IX32pEuWYoOHw3MfS4NgBIdtIMyByPyzNYgdcE1QCz206VHStvVMFS
	H2taz46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tD0-00000000stQ-0Ln4;
	Mon, 06 Oct 2025 21:57:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tCy-00000000ssx-1iOl;
	Mon, 06 Oct 2025 21:57:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDA5E441B9;
	Mon,  6 Oct 2025 21:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D717C4CEF5;
	Mon,  6 Oct 2025 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759787847;
	bh=oC0jqHVnHIvEcTI9DKySEPRWFpYU6+vKH9z1AzExQOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9TeKt4yls+RcjonUeLIfc4nzq9BpZ/xAa4Tsum8c84bh+xiKAn+qAk+9ySOO5m6q
	 yeTdAULdjrDiHQ3LH1uPvLJOhDQH5uKcpgLsy/bu8Rcmo8sAHVH0UXJkeXz6uV+EIV
	 LC7oMdtcdrdsDSnsh4zBLk/c+oEwO1H8zN2/jRzIGhsW9C+MkQE3u5lXlwn8d8Q5yH
	 tyu5WCPqXkEnASGPZ+KEcQ/PCHhHF3BniA6WLJqEdVOnG6pSAhNTWAcmKIt9synyeE
	 KgvAwmr6oSGz+PyfxsaG0U3W+1m7K0F9z0MUqO3GoXwhkiy6SNZYhG1Y1P/Jq18YIe
	 l3TAez9/04AgA==
Date: Mon, 6 Oct 2025 16:57:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	John Crispin <john@phrozen.org>, linux-mediatek@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v4 1/4] dt-bindings: crypto: Add support for Airoha
 AN7583 SoC
Message-ID: <175978784599.652158.16607714695009330937.robh@kernel.org>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
 <20250929114917.5501-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929114917.5501-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_145728_467316_1C7ADC22 
X-CRM114-Status: GOOD (  10.04  )
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


On Mon, 29 Sep 2025 13:49:12 +0200, Christian Marangi wrote:
> Add compatible for Airoha AN7583 SoC. The implementation is exactly the
> same of Airoha EN7581 hence we add the compatible in addition to EN7581
> ones.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/crypto/inside-secure,safexcel-eip93.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


