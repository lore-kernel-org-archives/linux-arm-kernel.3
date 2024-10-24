Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089DDCE8E78
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 13:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOTsGCvjF5y8NwPgxb6XQ2iIp8aB6jMs36WT0XHRDXA=; b=yHO23/dfnWdE9/1YbRb6dQRON2
	fblTFSYWkU6h4Se3IsNY4g08Izyo4KgwoHB5f3tlBhSQXJazcwJauACPP5TED7z6FcdafssBIdgQs
	9LE8F9MTN/BjZivN170xWXzZbL3Jy5tt0S5TYVtDCS2VKYuEHSD2tgl8d86WxaBdlkvJvlXjnVGw/
	JxJyLrJ842ypPkoEWnzYJCrIj5IOrkYik6Z7qTcvsDrXUCzekrvd64x0hRqefvCoHUE6PZ8cRWz8w
	lLvFUNOKrVxHbJhGvy8OuhaPoY26y1Q8W1/yiUpZfdQHSdz3rE4IPodA6HtcK6rKqA8UX4seoYjCv
	kk6prqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yD6-00000000a36-05k0;
	Thu, 24 Oct 2024 13:49:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3y9x-00000000ZVe-0ghl;
	Thu, 24 Oct 2024 13:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D8FB5C5FDA;
	Thu, 24 Oct 2024 13:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE3EC4CEE3;
	Thu, 24 Oct 2024 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729777551;
	bh=ysaebKzqz4XXZimRWbG9UPVLLN1JN2MVZiCwi9rRVUM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=hJZbzmraRElTGj4KBom6GeCanhFOrtyiiz4Av4mm37YQgm08e7xJeXdowMAeUrKwN
	 OIr3+hJ/ughyyiPztWDSFEIus2G5qEpLvKQae7NId4tYMZgh9XbF9X6vN0q7QnDrFk
	 zrMtEwNLzdObM3qsTNT8ZNV2RCulL0/cZADvpKtbRZenAQD2bYRFPmne9tXKypxrbO
	 GxvsSJwreM0+TK5b9MG82mQaq0bp+jmUDDMCQHudtEMPrisod10+kLx0tK47MmJeS/
	 0h9sBep6NTNBshN34uWpdQlQ+7bRN9/PKUm7i7zjE/xPEFdqjHRMsQlclm3kwRmp+7
	 nSdabjxBxSC2w==
Date: Thu, 24 Oct 2024 08:45:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Karl.Li" <karl.li@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Chungying Lu <chungying.lu@mediatek.com>, Karl Li <Karl.Li@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20241024092608.431581-2-karl.li@mediatek.com>
References: <20241024092608.431581-1-karl.li@mediatek.com>
 <20241024092608.431581-2-karl.li@mediatek.com>
Message-Id: <172977754868.100447.11555196771647688261.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: mediatek: Add apu-mailbox
 document
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_064553_266861_500CCA23 
X-CRM114-Status: UNSURE (   9.48  )
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


On Thu, 24 Oct 2024 17:25:43 +0800, Karl.Li wrote:
> From: Karl Li <karl.li@mediatek.com>
> 
> Add apu-mailbox dt-binding document.
> 
> Signed-off-by: Karl Li <karl.li@mediatek.com>
> ---
>  .../mailbox/mediatek,apu-mailbox.yaml         | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.example.dtb: mailbox@4c200000: reg: [[0, 1277165568], [0, 1048575]] is too long
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,apu-mailbox.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241024092608.431581-2-karl.li@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


