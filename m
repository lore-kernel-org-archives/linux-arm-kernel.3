Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84390C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 07:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DbR88mMe7lh9mbFQex/gaxf8EjJ7wEyl4UEqQjuDD0=; b=DVV4k9wlg75lxTiY7gC9nW2cJa
	x/UnVHmPdx/esug1jraxzUufgI+lT0AgzcfAtN2LI0ZhixEa6L8PyDENkTj9NlktXFSNZUWWKWP3P
	yayVNIa5kUe2w1tgf0B7RvCM8GjAh5uXx7pq6nUU5dAZmcg3dFfIf06ZdxeDg7D0yTq2sMV8JwByi
	vrKp4m+1Kl1w+rxA9ecBCd7H0LXJtCPrnP2yPMLtyWR6gnCsfmRIGF749GWkTQQKYTRm14UgstBla
	9f25UR+WjQW4fQq4ev3SA9P6d0rN69vbuAA9ntGFjjjJzD2i1w/u5zxyVdUuspoM13l9lhnYn7Ie2
	72fD76IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvT0-0000000HZ4f-1aei;
	Thu, 08 May 2025 07:14:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvOJ-0000000HY5O-3rJV;
	Thu, 08 May 2025 07:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 212C8A4D485;
	Thu,  8 May 2025 07:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D888C4CEEB;
	Thu,  8 May 2025 07:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746688198;
	bh=RrwRtaujjlqJpIgcXtqqvO+THEkQ26LzURxmJEZVRD8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=PHUON7AE9iEwY4EReMGouzh8o4Xx3NEVh1B3niBALfu93L0I1ZeEBBxRkmVQCo71P
	 yYHulapgtsDqfZAEoi6oXb3FV35XThgJhiI4G4xEt37OPJYaoUB1PexJZr/5LwScE9
	 XJseyi7K7OLnNmO+GoGG2onANkWJCoDjkp5ZBq5hWrm9yjaAmcHPtmpi5XsZrjNjOh
	 w0nbRR+nv/EZq9AdfrsAR47j51d5g6dGLnqr5vVIdfmXZ9cEGPcdy7NfErMeilz2of
	 T+KcaV2SPlNGcoQ1z3JK3W7Pg572JpINQ9JrtRc3M1rgKE7ZafmuyCBlVpVkJuIgOX
	 d9DTGaPjoGgng==
Date: Thu, 08 May 2025 02:09:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-serial@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 xavier.chang@mediatek.com, wenst@chromium.org, linux-kernel@vger.kernel.org
To: Sirius Wang <sirius.wang@mediatek.com>
In-Reply-To: <20250508063546.289115-3-sirius.wang@mediatek.com>
References: <20250508063546.289115-1-sirius.wang@mediatek.com>
 <20250508063546.289115-3-sirius.wang@mediatek.com>
Message-Id: <174668818993.3553950.2026638570584322328.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: serial: mediatek,uart: Add
 compatible for MT8189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_001000_031706_441B15E1 
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


On Thu, 08 May 2025 14:35:41 +0800, Sirius Wang wrote:
> Add compatible string for serial on MT8189 SoC.
> 
> Signed-off-by: Sirius Wang <sirius.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250508063546.289115-3-sirius.wang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


