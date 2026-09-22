Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27951C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIY5yH05DRBBVTXJin0NIcOQciDWusw/HEhbfWiCtQ4=; b=XigpfdolspSWUIN10Q0RXGaYp4
	ZPS6vkwGtIwqG8v/NLlwJXttgIYtxUKSjoRfSijEHLyn/g5m9CQfwy3IEPVwkT0yHwqXBRZe6JfpW
	/mMJhQN882oM/PD7/PgXkgu4533RrgP/VVSRbLwAQafASTZVdqRxOQCMcSjR1bVIb4EZBpV69YUW8
	+qFub2Ej6GhoU7Ejh+MuHUfKQ/w2efaBqsgxDW0CPvjFlZNebY/0ZA1ZTi2RfQxnuCpDCPOniocXW
	BfCPN454gNJQ0tUn1Hm6FYQlBuhLETHOqz4CLnV9gtXBPYGUNHqzpywnArMX/zdOOfBpypLUJAvXn
	I6O33IPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96Zg-00000006Sfh-01Hx;
	Tue, 22 Sep 2026 19:54:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96Ze-00000006SfT-3ZiS;
	Tue, 22 Sep 2026 19:54:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2A3E60142;
	Tue, 22 Sep 2026 19:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D031F00893;
	Tue, 22 Sep 2026 19:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790106881;
	bh=LIY5yH05DRBBVTXJin0NIcOQciDWusw/HEhbfWiCtQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MDp4XriJpBWzGlcYzNGs+wlD37nINMLXUGG/z7kfdSGZVamN+TG8BY3Hz5F72fFJi
	 6DgHXzKMQ6AjuBXiQaRllPm/bb2VP38BPIHsXLtWex8dESW3SXgJ9igT0Ei9Qwy+vS
	 xzCd39q8zJGHgVvjTlSTgc16Ddyzcv1xgYQjw3nclRsCJjntMSRfil7BtZcI4XGT3C
	 5CkutOnqvCd4gz/YnVuE5unMxahhpkBQKS9THWnU974EX8V6j9UPAcRE4qt/BdR/Ux
	 ksp9NIr9/itwFSszzCx2HE/U/13dn+K5DHB5Flr5I5DqnOoDowBTBuY9oikSrKY410
	 hav0oC6/9NVWA==
Date: Tue, 22 Sep 2026 14:54:39 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: soc: mediatek: Allow pwrap regs
Message-ID: <20260922195439.GA806172-robh@kernel.org>
References: <20260921232527.3127894-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232527.3127894-1-robh@kernel.org>
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

On Mon, Sep 21, 2026 at 06:25:26PM -0500, Rob Herring (Arm) wrote:
> The MT7622 PMIC wrapper has a regulators child node. Add the child
> schema reference so regulator subnodes are evaluated by the MT6380
> regulator binding instead of being rejected.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> index e7c4a3984c60..79b755858bad 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -105,6 +105,9 @@ properties:
>    pmic:
>      type: object
>  
> +  regulators:
> +    $ref: /schemas/regulator/mediatek,mt6380-regulator.yaml#

Err, this needs the conversion. Dropping this patch.

Rob

