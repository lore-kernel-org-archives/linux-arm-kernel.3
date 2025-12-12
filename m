Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4194D4336B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 04:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0s+SNqNTn6JsMyHWbWuq3lWpcz36M9TZbWZ0BWrKnAY=; b=iVOUkO6IoijaTvnu9/M5FPlzui
	SkZ6wYR3ZhUB6GEX8kqlw5mEH9/n4aFp2gOBktMH61Um1xkzdEJET13ZhlmkMBMADwaVe8QoStyHE
	URzM1x9YpUR3/qEMeZOogdQV08MgihJ02qTQ7OmUZTjRN9Z//0bhFqffHiZvj3wTBwI7EIYbCclG4
	5fKCJfy8YTCRkBwYktOqwOPQQaYtodqdVnXTLv8q8ohtFAMOP0Ej0MpWgJuroI7EKVuqDbYjv3pAc
	H+RLq+sG4G6l0I+J1o4D6U1f/Y8Cb2cAuvnuDzbOt6Yv6QYu1llmx7/onqsdun7HS6QtNP+ZpgxTG
	CwmeI5Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTumO-000000004aq-28jT;
	Fri, 12 Dec 2025 04:29:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTumM-000000004aQ-1Gkk;
	Fri, 12 Dec 2025 04:29:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43BD843218;
	Fri, 12 Dec 2025 04:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C535C4CEF1;
	Fri, 12 Dec 2025 04:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765513757;
	bh=LaOkItnKNcq6MgUwAYjwgRn5Y3c91Y+l9HvH31lqiMw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RSAlPP7k4sSTJ8onslfWRG2uW+5erx4X0ijJtf1jPcDjusjm+RcqBtc2Xh54WnJqg
	 BhbLjBVMVoKtqPyYY1tw8JMgAB9BsMJ/mShRB5BEkIYpFMz+7fRtxFJKCtGbIrBdJ0
	 ge3xlGxN/VLKlGgf5MfqJobMiSTi1ZJ4GzbvYk9+3EgWBXsUrUyme1RANBOX/0JZFg
	 ZWoW7hrL+tq8ShffSSD6odFWMsrBp8FntYl36mmGooRhrB8aI3Dbm7HLPvQ1+M3nYE
	 uXtxPWC5HIkcHMndfXGrbcLvNRNyEJCXBoJ6cDclw0tN9bwQgTJ8w4RjBDAODmtrfc
	 2I/aWKCLMo2dg==
Date: Thu, 11 Dec 2025 22:29:14 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Xiaoshun Xu <xiaoshun.xu@mediatek.com>, 
 Vince-wl Liu <vince-wl.liu@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sirius Wang <sirius.wang@mediatek.com>, devicetree@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org
To: Xiaoshun Xu <xiaoshun.xu@mediatek.corp-partner.google.com>
In-Reply-To: <20251212031450.489128-2-xiaoshun.xu@mediatek.corp-partner.google.com>
References: <20251212031450.489128-1-xiaoshun.xu@mediatek.corp-partner.google.com>
 <20251212031450.489128-2-xiaoshun.xu@mediatek.corp-partner.google.com>
Message-Id: <176551375433.2514847.16610029422866924600.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: soc: devapc: Add for support MT8189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_202918_388391_3EAB6E59 
X-CRM114-Status: GOOD (  10.92  )
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


On Fri, 12 Dec 2025 11:13:42 +0800, Xiaoshun Xu wrote:
> 
> External email : Please do not click links or open attachments until you have verified the sender or the content.
> 
> 
> From: "xiaoshun.xu" <xiaoshun.xu@mediatek.com>
> 
> Add compatible and vio-idx-num attribute of MT8189
> 
> Signed-off-by: xiaoshun.xu <xiaoshun.xu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/devapc.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml: vio-idx-num: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251212031450.489128-2-xiaoshun.xu@mediatek.corp-partner.google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


