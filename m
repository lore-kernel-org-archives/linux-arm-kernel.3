Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44052C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2NGSYf7+2iRNFwDTh4G5mvP9nux8x3hGc1zZpL4N/A=; b=d1vt3LbggY1C73rEGTpgZLMJ9/
	plXLihd+w0yxseJxhwLAMuRLHtgH/lQFH0ciehNKG++MMzovdNKlTYLYrX30YQuKd4Ij1Phu0kYJQ
	DpytNYsfGVrPIY3d6s2/A5YFlbDSPRQRjfNfdhbKwQC7/t4zKYrOqFBy8W4130tEMdzG4XhJw7wbE
	TLFvLK7lgOunlsZE82hSSrhRMl0sZLEG126PeA2RcrkeAA9G1901fEf6TauwhmqhKIMMSX/3qgVca
	p+sJ2M3bhRrcHuyQFnISwRwCq9W7okm6irOlZl40uXdqx1g/eHkHK2JOAH2KasdFpxMe2/Ozz65jr
	qbh5EZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzA4-0000000BAwf-1ZJP;
	Wed, 15 Jan 2025 08:54:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXz4b-0000000B9NJ-10oo;
	Wed, 15 Jan 2025 08:48:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D68EA4170C;
	Wed, 15 Jan 2025 08:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3E7C4CEDF;
	Wed, 15 Jan 2025 08:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736930904;
	bh=fOXw5fOyRt7kI5Izd5k38cCPtug2wf6DvlV5sjdUlDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uA/vsMSIDCY6rLfEq8TQ9XgQbg1CNxSMkghiE6jRdMUYtJcHkF1jev4UFzq7RxlG5
	 cNy6+NTHnMzJ8cahf6NuzV1scc0AiA5IImn3W8FH2cC9L2+TF4LJk4RGTuODeQ04GN
	 UV6hqUrDAFlz0m8wSWNRkTiDgkvfJVgILHtSlLSA207CvmwPP9nk7ppwgRgGXrQzx4
	 1y5oFK+CUbvageMfCFni/T358jX5Eto7u7/iNTh4gsGy/gauNPGl0T+ZpJpG5vO1m4
	 i+MwtUQtv2o7Xqxi+EDCPTi+M9PGW6nSoDaD3MfGEDfpCkZx09G4TwN6anhG/uAkp4
	 JS1hd9D1/BJVA==
Date: Wed, 15 Jan 2025 09:48:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	linux-mediatek@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mmc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, upstream@airoha.com, Chaotian Jing <chaotian.jing@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Add eMMC for AN7581
Message-ID: <dvt3zgjfliu22uyvxrmuteiet32gb5qdn2u6fh3xw6qp4xohw5@vwtkrgsh7asm>
References: <20250115073026.31552-1-ansuelsmth@gmail.com>
 <173693027082.3240418.16772447316188600820.robh@kernel.org>
 <67877449.df0a0220.cdd29.8807@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67877449.df0a0220.cdd29.8807@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_004825_383770_9981EC9A 
X-CRM114-Status: GOOD (  19.44  )
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

On Wed, Jan 15, 2025 at 09:39:34AM +0100, Christian Marangi wrote:
> > dtschema/dtc warnings/errors:
> > Error: Documentation/devicetree/bindings/mmc/mtk-sd.example.dts:104.31-32 syntax error
> > FATAL ERROR: Unable to parse input tree
> > make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/mmc/mtk-sd.example.dtb] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
> > make: *** [Makefile:251: __sub-make] Error 2
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250115073026.31552-1-ansuelsmth@gmail.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> >
> 
> Hi Rob, I think this fails as the CLK define is still not merged as said
> this patch depends on bfe257f9780d8f77045a7da6ec959ee0659d2f98.
> 
> Any hint how to make your bot work with that?

Don't use the define, but raw number or just some fake phandle.

Best regards,
Krzysztof


