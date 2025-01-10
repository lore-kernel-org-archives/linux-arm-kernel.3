Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B48EE7719D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAwWD/T4MOyZUPt+o+iUAqDeL/G1BwsvQHyDyyfHt7o=; b=jdiWaFYg8iu+bnO1va/uThmXty
	CVQg6MJrIp7nNsYcQPUpFHTtFtNuxa20rfC4ofhyMbB+Q0BWILP8qhu91ntNaH+lGLvDxoaNn8ULN
	2YrF4pagAOBgexE4/McZ+fzG/jbsS0X8eV8wGENHMvNopk9A8LoB0Sn1u1qxyeZ+00BwqGL4gZtzK
	bMpPBZI3To03qdLOCglEXIB3UZI2s3Flbo1vANfR4YKdyrzfXIwi/GrvHGakXyMSa9Er/A8USH1di
	CRe034iECGefr+Ul2CYIj/4qGDCtxdjJx07VSSiUP3ymSoTC/wyksK5Nf2F6MRFER8fb5q2yycwY1
	VOjEIy+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFYC-0000000FYZ5-1h6R;
	Fri, 10 Jan 2025 13:59:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFSv-0000000FXU8-4B77;
	Fri, 10 Jan 2025 13:54:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8F9AA41FF0;
	Fri, 10 Jan 2025 13:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91C3C4CEE0;
	Fri, 10 Jan 2025 13:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736517261;
	bh=c33XsyMYg3lCZo4jpADv7ET+BOVPEFjhz4yMn/jPl1A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KWqV6/vE7KQCJgNFRcquCgrCjHRe/7On429TF1/YwgJ8uyH8LgGnzoxu9h2hPB+np
	 eV/ArpXirzOXk2MpJjQ5k2WU4XMN2dCN1XuMVoBPAKP83DlDEDkR2NThlO8HSZDfVW
	 gA5KluAc59Ylpw0SuzcNDGBrYLBFUSQgkS0qaYo1N/3f+8+p2K0uIW4KkrNMi2w/oy
	 xW2oqZPse7R8vvCQYlX3fQDuPhwc4OH0wc0+4cIe13QQwrz7xXQwh7alaDcRZLcsUR
	 2eEEyMV/pjQr7ARpnoAagABg7tVVjjDWNP1H9LlIK8PpZRx/wKuoR4S0PLhydXrnA3
	 DEVsj+JcmLydw==
Date: Fri, 10 Jan 2025 07:54:19 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
 devicetree@vger.kernel.org, singo.chang@mediatek.com, conor+dt@kernel.org, 
 sirius.wang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 krzk+dt@kernel.org, sunny.shen@mediatek.com, chunkuang.hu@kernel.org, 
 linux-mediatek@lists.infradead.org, fshao@chromium.org, 
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
 xiandong.wang@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, treapking@chromium.org, 
 p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
In-Reply-To: <20250110123835.2719824-7-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-7-paul-pl.chen@mediatek.com>
Message-Id: <173651725647.2671771.14303040035335565076.robh@kernel.org>
Subject: Re: [PATCH 05/12] dt-bindings: display: mediatek: add OUTPROC yaml
 for MT8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_055422_096087_BB5B37DB 
X-CRM114-Status: GOOD (  13.06  )
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


On Fri, 10 Jan 2025 20:34:01 +0800, paul-pl.chen wrote:
> From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
> 
> Add mediate,outproc.yaml to support OUTPROC for MT8196.
> 
> Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
> ---
> The header used in examples:
> #include <dt-bindings/clock/mt8196-clk.h>
> is not upstreamed yet.
> 
> It will be sent by related owner soon.
> ---
>  .../display/mediatek/mediatek,outproc.yaml    | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250110123835.2719824-7-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


