Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6CEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 13:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+BSR2G0cMJ9Y7HcWPQWzV/6c0g6tf2URTDEKKAmo2c=; b=cLCwC7705sLfVPNBV2gBDBHayQ
	X9MWOp8Pn0Af5ehwdWKQwr0/2Lc8fDe3FQ56/3u+wDxnbNbJy0qbUPxBGSE94hl1A7L4hZqyrsZkY
	duP2gb6ghstHJk80gFz2BMu8ujc6YNqLsy+43g0ezHqhT+AR5U9zK448XCyPhzRh5zSTOjz93vItG
	DmbgruADSHsu2vXXyOtT2YQXdkxfJIDrlGVEOgnCBT04dskX8VnCQO0gmuu+jQ1GavZOK4ifUVNX1
	IEMpkUunSykwtZYFGEAWM9O/87E3DwCy2wYSZ+S/BkV8Na21/VsU2dtLEHLEG4tJWksKLnMLZIirq
	z1LPGV0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyDx-00000002nOY-3PTQ;
	Sun, 12 Jan 2025 13:41:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWy8i-00000002mNj-1ZCs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 13:36:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F8F35C4076;
	Sun, 12 Jan 2025 13:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22A1C4CEDF;
	Sun, 12 Jan 2025 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736688987;
	bh=QZcrZWvks66LVdzTQOYREinftqMEv37ZYZC7nabyMGc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WF1QK/k0pcSAWth0kTisAImgLfWO4kjyamVC+wBdQ5aXS9RpK99JQOxe1XQ9XlhDM
	 r2A7TGAxd7E5q+2k/436AK47nAy2G3MSUDZWGVlBpm9D/86Y0Vi+gytxE1Ov086h61
	 2bNAeak5aJEynjCo5mAVlNrYZ8pZIS1jJnMGl5kCTxG8dbWj//hYQuuyP0cGhQb30A
	 lN5MInbo46T9FhWyz7Sbli7+9h0WIKd/8rsIBwhGpTn/aRfsvbaOzOXNjjhDH8BiZG
	 9eigd+xnO6QXkfRabc7LX8ev9u42R+sEDP1INtwutJxUpko8MfOfc2RyV+YB1cNvQc
	 /pZCO1BBa0cyA==
Date: Sun, 12 Jan 2025 07:36:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>, 
 kernel@pengutronix.de
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20250112122939.988309-2-festevam@gmail.com>
References: <20250112122939.988309-1-festevam@gmail.com>
 <20250112122939.988309-2-festevam@gmail.com>
Message-Id: <173668898583.2984154.9988580107147542250.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: clock: imx5: Fix the CCM interrupts
 description
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_053628_457763_404B3C3C 
X-CRM114-Status: GOOD (  11.53  )
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


On Sun, 12 Jan 2025 09:29:39 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> On the i.MX5 chips the peripheral interrupts are represented directly only
> by their interrupt numbers.
> 
> Make the CCM nodes to follow this format.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  Documentation/devicetree/bindings/clock/imx5-clock.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/imx5-clock.example.dtb: clock-controller@53fd4000: interrupts: [[71, 72]] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx5-clock.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250112122939.988309-2-festevam@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


