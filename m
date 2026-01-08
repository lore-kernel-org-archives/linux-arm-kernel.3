Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48511D185ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKwnCkr1ZX0v7pILRqsV1pAJx1PdTheuXP8rVv55P5w=; b=nxrXMuZryTZskY7sjCvhzWhyAV
	34CXz12KjxHCgzReFq6HUmRSZzrQ9TjW49XzZbrdiUY2Cdgp7kjvx1E3KF9XR6oal2DNl57QKPr7F
	J7Sf8SRBFlAldjqluUt7FesToefV8rs7krjeAHWTnagE1f745cgj4bOEpaEzuZ6XRwR1DsX1TnI/v
	LDOKweY/EPxbZDb8AtH2ORFwiyhwRO+f5nmzSUtT5XnZUAYWty98nM0f/YbBSXPaOJk2dMCq1ekdn
	0I1QGnmQuAUeSBbNdgriAjVCKVH1NJScfypWJjOQ5H/ySCVxCKP6T5c8/emiPE6IZ2ndmF22ldeN0
	8OJE6ayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpJW-0000000H2ML-0UII;
	Thu, 08 Jan 2026 12:40:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpJT-0000000H2LM-1isr;
	Thu, 08 Jan 2026 12:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D91444262;
	Thu,  8 Jan 2026 12:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FE8C19421;
	Thu,  8 Jan 2026 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767876026;
	bh=g8rW71nJKgp3ELmmfnnyuEMXLvCZWj1pOr+SOf92ZPc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Hcn62jzyajIv8HuVtK5cuHKrKkmRX+9TueZ6Zzaj/42oTxVwR/kO0Yt6AdPC8fHx1
	 4JpNYRXT8Y8SCVGq4oadCZryu51+7wr4PCgX9DBMB9j+V6DVbgwaEZfd7siscVJTvA
	 Bo2Ys4eP//eHIQoyazz9eBi68OiGKlSNogy44CAGdfNb+Ktm7amLfSnE05tnKiby0l
	 vdUdXk2vC7mjIiCsu2Te2Ng2GwKH0Ap6gZV6oL/QUR9GY5EWObUh6wHxesRC7SX35y
	 efOyz7yM44k0iaD5GHvi3zNt6vpMmsNMs48dfy+KsVQf28jgOEEZ1TCwZy0eBII+WN
	 qmWuUW5QGZR4A==
Date: Thu, 08 Jan 2026 06:40:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 davem@davemloft.net, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 herbert@gondor.apana.org.au, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 conor+dt@kernel.org, sebastian.hesselbarth@gmail.com, atenart@kernel.org, 
 andrew@lunn.ch, matthias.bgg@gmail.com, gregory.clement@bootlin.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260108110223.20008-3-angelogioacchino.delregno@collabora.com>
References: <20260108110223.20008-1-angelogioacchino.delregno@collabora.com>
 <20260108110223.20008-3-angelogioacchino.delregno@collabora.com>
Message-Id: <176787602550.3796160.16323970790591047960.robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: crypto: inside-secure,safexcel: Add
 SoC compatibles
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_044028_028201_F9BDA4EC 
X-CRM114-Status: GOOD (  10.12  )
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


On Thu, 08 Jan 2026 12:02:21 +0100, AngeloGioacchino Del Regno wrote:
> Add SoC specific compatibles for the SafeXcel crypto engine,
> including one for the EIP197B used by Marvell Armada CP110 and
> and two for the EIP97IES used by Marvell Armada 3700 and by
> MediaTek MT7986.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/crypto/inside-secure,safexcel.yaml           | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml:16:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml:20:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260108110223.20008-3-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


