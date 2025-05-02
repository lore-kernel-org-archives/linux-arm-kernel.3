Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBEFC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 23:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VaA2EBR23Gg0uiDxj4kInUKcjTT6f0pzmHykuc41O8=; b=USK3BuTJpBCyVxillvoc2gU+tN
	oSW0Ab2Cld9dcD0A9bqeQRY6mXMrX4sFDb7fby+UfEaYW1AdoMMMzVlvHoDi8QU3WOSThLnaGVdt3
	53tc+jZUC/tWAmkW1E/hazXvQtNWymcgF+YT7YDLAA4yX5xMutFQbW8Qk/gCriJQKowZZegSfmaOZ
	x0GiTe0ghsr96Xg/Tap1tFyd85/wcU6dxJyNESn7DwRkrp4HFpxn2netBP18hhvIEirMnZCjPF5Sa
	OsxpZioKsWoBTTx4vDdambexFOOURQK2yUD6r2GlwqYoyXde4BPIqZM9Rd1QmmPVxrfkehiLgPB2X
	1lY8dMwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzog-00000003E2O-18za;
	Fri, 02 May 2025 23:29:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzml-00000003DtT-2rgl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 23:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 003946844F;
	Fri,  2 May 2025 23:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F84C4CEE4;
	Fri,  2 May 2025 23:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746228433;
	bh=Hnnqy6HQL4YnWgXmdwGS2nXyeFF+0Q2siOEdENo0eRE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=O5/hYGlwnpYBhK7zltWWNWHhyUeP4nWKOb1C/zslmwVclYQGqN7i9vRYueYPJhR6Z
	 ehCV4KMCIeOFP9Mo/bg+rsW9biuZRwxeCKWW2S+jOU4w5sVLk/V7DfVi5EAWo8qvCw
	 jqy/lMlsXljitEhZE1/VFuopq8tvskoO36k761OqopeQ6swptHOaIEvHuc71cLajiO
	 QgQDkzJkFlJ7lv7YuQInJnfbN7VA3AkKMupfDwWfL8x0vAoZHqsSd1/M9lIQgSzrpA
	 qgyDmokeEB7X1UqUOvlIIdZxbezW/WLVEd2bpe4b5R8g3UpWrzm5xWCwdER7zRUBp2
	 RRpGSX7AlHVuQ==
Date: Fri, 02 May 2025 18:27:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org
To: Alexey Charkov <alchark@gmail.com>
In-Reply-To: <20250503-wmt-soc-driver-v2-1-8c774ad84d47@gmail.com>
References: <20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com>
 <20250503-wmt-soc-driver-v2-1-8c774ad84d47@gmail.com>
Message-Id: <174622843145.3029685.15692022572710133575.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: Add VIA/WonderMedia SoC
 identification
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


On Sat, 03 May 2025 02:04:23 +0400, Alexey Charkov wrote:
> VIA/WonderMedia SoC's have a chip ID register inside their system
> configuration controller space, which can be used to identify
> appropriate hardware quirks at runtime. Add binding for it.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../bindings/hwinfo/via,vt8500-scc-id.yaml         | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/soc/vt8500/via,vt8500-scc-id.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250503-wmt-soc-driver-v2-1-8c774ad84d47@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


