Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D61C83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4zu7QbmXte1P2SQJdaH4pB0/f9917aYAT4OPJcl7ws=; b=DEsow6uQGTHnZuR6CkOBMq9UaZ
	5TRk6//yzEKYgB6rSSJj/Qg+prXh8hWP82RXZK0o5ThHh/xPLVuafBGxkrON8EKTCurC08ofgw+sV
	kyvOF5THGJMwOJ2sfrHkAvrXc8oHarsfhWHav5gRPSIEWc53IHud5qRW/7H3eqKzSv//eYB2Vthrs
	PsIsdAs5sFOu8r+VbNgLlibv097NurwagTheqfg8k8A1NfgY1R/JoqJCn1PNviiIfBU3giJ2ovFWR
	0605HXCe2jaONwtetzNpVIXMMeCGyfsFeAb5jkgSh52wP2odnVj09pH0CPQ+sAzaornPRdUAjn7NL
	YoKEGzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl79-00000005yHv-28w1;
	Tue, 15 Jul 2025 19:14:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhmc-00000005d2j-3XjU;
	Tue, 15 Jul 2025 15:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F13B61466;
	Tue, 15 Jul 2025 15:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97554C4CEF7;
	Tue, 15 Jul 2025 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752594089;
	bh=R8XLWjxO7fHl69Hs/rVWyMH3nTI1Ns7HGV/NkxCeO28=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=A4a+n1qJd1RCESFWzOIErYHAyrk9sWqkEKMvrmiLTYqnZ6YqrRySamxZamxGAT1IK
	 oXyj1fMTE+FmZX++Nh1ffZg5BqjEWM9Pd719lKyZP2S9PHC0rqt9/bSgTEbO61I5mN
	 p1F/Da9p1CbSVohQzJ7LhOU8wJf/dbd7AI05aPuk6/yFitniYNHVG8syNqpv/OmJer
	 STsZBBB05SZtujS8EBi5t7SBJ3Q5Y3O1X722O/AAy/DxvBP2b9uLMdTaKnAUcdQRdt
	 QSUFrY5aKwWPLiJjavORjypumuVVkLSkYPqBm65hAxJNHstlqsDP7CcDrsmOZ9HuIh
	 2nlzlaKq5CLfQ==
Date: Tue, 15 Jul 2025 10:41:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lgirdwood@gmail.com, krzk+dt@kernel.org, broonie@kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 lee@kernel.org, devicetree@vger.kernel.org, wenst@chromium.org, 
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, matthias.bgg@gmail.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250715140224.206329-6-angelogioacchino.delregno@collabora.com>
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com>
 <20250715140224.206329-6-angelogioacchino.delregno@collabora.com>
Message-Id: <175259408681.1379973.6795919680744045079.robh@kernel.org>
Subject: Re: [PATCH v5 5/8] dt-bindings: regulator: Document MediaTek
 MT6373 PMIC Regulators
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


On Tue, 15 Jul 2025 16:02:21 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> MT6363 PMICs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6373-regulator.yaml  | 174 ++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250715140224.206329-6-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


