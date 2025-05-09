Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A7FC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWpu3LSAV6quqWtK13bHrZijgzMnk51vsRiFeYvV+2Q=; b=kL/atwZXxMWgaS8SpmbLrNGUwR
	0ESgcf59FZ7xw7ilDIR9YjHnlAPLewY9kjHK8rgYi8bupCAqRptVV6CHRzLqEqTF48HziZnsvazQy
	Wv1i4Sojo3SngZZzokvsVPdQ4v94waEZfJOzxw6USJc1Id3ppClj8QSwiZWrN7mQxRD3PzpSMLqgz
	owmBsiO6a4cNXXV31o72bTMOsJ4OnGL7Av5ZBdYdUFhDIrzN5/i6HUHSRvHNBvrgisdm1s6ATJDul
	/4VPJwSCQbxwop92fKMC+4fM+EvrSsi6fuUVGKZao7OhGcAM60Hm43H6p9Xjv2eWALbpwweS8P5NK
	H/9SdLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPKQ-000000041vM-216B;
	Fri, 09 May 2025 15:07:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDO2e-00000003oZp-33De;
	Fri, 09 May 2025 13:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1033B62A1F;
	Fri,  9 May 2025 13:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DC6C4CEEF;
	Fri,  9 May 2025 13:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746798331;
	bh=v5Uak0RcmfjhTO5Ysk+NhysPrBjg5pgA9cE1Hgd2gfE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iHMEwdP23ywmij2dIw06QIo1o6RyOrSI+/zsCUo5nDKnUyppRzFrGEvOZ5PXwhj/F
	 HMaL5F7Jd+nsTV2PeECplWgyg998OJc2hYhu0RYzRRzdUi39Hr7hZ+dEE96nl4KanE
	 Mf7qKeRNhFFHkUHpkgMbdpEu8el4vEHEb8cjcLbIVIQgBjPQyzPpQ+gRJkfsrexTkk
	 TJUd/vwH+S6QEvA2mxVyMV4q4QIXAlQYHgAU8eek2BOkuGqMFdCL1Cu4Im9S4Y4Asy
	 X5ALlmXBPwdgyXhNwqVPVZRU5vJaVnqW2yv3ewUpZm1hFQqcPjfwNokpZNt6FarIvL
	 nAxP6/23PbmFg==
Date: Fri, 09 May 2025 08:45:29 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sandy Huang <hjc@rock-chips.com>, linux-arm-kernel@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20250509070247.868-3-kernel@airkyi.com>
References: <20250509070247.868-1-kernel@airkyi.com>
 <20250509070247.868-3-kernel@airkyi.com>
Message-Id: <174679832782.3268212.14187145716217204354.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
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


On Fri, 09 May 2025 15:02:47 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Convert cdn-dp-rockchip.txt to yaml.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v2:
> - Rename binding file name to match compatible
> - Add more description about grf/phy/extcon
> - Fix coding style
> 
> 
>  .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
>  .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 158 ++++++++++++++++++
>  2 files changed, 158 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/display/rockchip/rockchip,cdn-dp.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250509070247.868-3-kernel@airkyi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


