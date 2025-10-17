Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FF3CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4zpwLN+3JQ7ROYF5QsmOjc6s8D81bAV2/U0WYzrC58=; b=zkB6+kw9fnz7vClR/N80f9bhAE
	MbTcNQRkblZ/SrPExt09nMloQ0OBRq7LmbgOiTmsI0Xko3jOrscyGg5CYbBH55AevEEfQfE7uID8W
	QY1EsmjhhzbBXjKdLOPIOztLpgXEMUrYeGrdLCNt2xaLzWp1mADRn4MmH3Rmd7m9md/mR/5CTJBrH
	QJCsuHBJ5EgxIDHoUn+pX1xN9NfxOeM1VPKGSzemuE25voLlRxehv+ZtFTRU75G4TaL/NDahjGv5J
	di3gjRoJ5Cw5ll9/fOR9mjdoSPnjBXooMp7RdvUmEG9G4/T27cSdSFTZ+AF4wGDxu9pQ5u0ggxIYV
	S70QEExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9fsN-00000007508-3n8b;
	Fri, 17 Oct 2025 08:31:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9fsL-000000074zX-1TeA;
	Fri, 17 Oct 2025 08:31:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 489ED455C6;
	Fri, 17 Oct 2025 08:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED015C4CEE7;
	Fri, 17 Oct 2025 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760689908;
	bh=8JUiOrjDfOdA/96I1n2RoxKgJNH0r2C48Z5YYltnGhg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bSxYK2kDJV4zgONmPeuPitDLrbENAOcdwhHNI9fk2w0/zI5It/AVh5B3m2jkhK9S7
	 geXRz55eImzmjpiK8aUGHgF8yVZhmi8zxkgihRCKnMIWmnCqMFPZMUomGx2keiu7H5
	 TDWkfMaZgaKdT5MHSOx2Hxdy4ZoLUQGuBSytAwCdaVRGR9t5WY96tAUTsNsARIPvc4
	 OW4xweUoJtc4gGXNhSkQg3OxGtfijv6DD9W0NDlgC8MimW8fVppaqm3rUS8FdJehf2
	 nb8B/nVLpIqWKO4ZekSXkLFbOnMNF3onDdBkYeo+s/ZbYRqUkKh5JIYy6wGz8qdH3n
	 6benPmRb8/eoA==
Date: Fri, 17 Oct 2025 03:31:46 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: sugar.zhang@rock-chips.com, krzysztof.kozlowski+dt@linaro.org, 
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de, 
 mturquette@baylibre.com, conor+dt@kernel.org, huangtao@rock-chips.com, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-clk@vger.kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org
To: Elaine Zhang <zhangqing@rock-chips.com>
In-Reply-To: <20251017063107.1606965-5-zhangqing@rock-chips.com>
References: <20251017063107.1606965-1-zhangqing@rock-chips.com>
 <20251017063107.1606965-5-zhangqing@rock-chips.com>
Message-Id: <176068990653.1336490.3635831064787473495.robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: clock: Add support for rockchip
 pvtpll
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_013149_427461_2F3C58CC 
X-CRM114-Status: UNSURE (   9.77  )
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


On Fri, 17 Oct 2025 14:31:06 +0800, Elaine Zhang wrote:
> Add pvtpll documentation for rockchip.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,clk-pvtpll.yaml   | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.example.dtb: pvtpll-core@20480000 (rockchip,rv1126b-core-pvtpll): compatible: ['rockchip,rv1126b-core-pvtpll', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/clock/rockchip,clk-pvtpll.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.example.dtb: pvtpll-npu@22080000 (rockchip,rv1126b-npu-pvtpll): compatible: ['rockchip,rv1126b-npu-pvtpll', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/clock/rockchip,clk-pvtpll.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251017063107.1606965-5-zhangqing@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


