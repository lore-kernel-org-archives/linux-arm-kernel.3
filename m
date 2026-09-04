Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D55C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSvx0dH2njZ5k/zFksKTcMGlm2nSFiXEvYGqs2t+ybA=; b=g0ap8LLpg19+WtJLcuEpOrmPjN
	T1Cm/MfW+c5K1PqdMSV7d4CTjGQXxu5+rkLNsBF2qLWvnfj+IGKlMGktPSNsUI9tQxRw86SxKeT6j
	IHaud6llfaMaNtGleg6U3GiOWFB/D705b868CjJjjgiNop6OWO1D+srAlhv/rbU3Wp4d44EPURcLW
	qOaF02HHejNNGPIadetJ2eqz4FZML8P+I35QYJKrihYR/TDd6OGIQpu/nqY6uEY4Z2OtfHD13inEQ
	Wa/lKfvu4surTQ5dqyDDfj2iOTSXSI1Jb2gZQiL4eag8WqscqrThEPcBv6ZG3CdLiQODYZdJsXxjU
	y2N9tsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9p-00000002Fuk-0rdq;
	Fri, 04 Sep 2026 13:40:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9l-00000002Frv-3gw8;
	Fri, 04 Sep 2026 13:40:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A204E42A85;
	Fri,  4 Sep 2026 13:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30ECF1F00A3E;
	Fri,  4 Sep 2026 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529237;
	bh=qSvx0dH2njZ5k/zFksKTcMGlm2nSFiXEvYGqs2t+ybA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=QowOtgL77QVimOnRTCXdrXfBmc83w2GgoSYbfiQsdp3TRdT91e55tt8kx/1SgoDZf
	 pYNfEXF6S7V7fC3mwvN3h3Rb0DV1yWA78Z4Mb9wMbLE9Wm5rNpNif2I8jwEa6IQIWe
	 DGs+x+85+VhP1QxBX0nbHxwqZw6O9E1ZUiDuMVsxaJZHhuw9iV2ctqk/Lr9uPPAte3
	 UWrl4r3lKO137HOaZROWzS3MsWvMeZd2ibAwVNP0fsnDXHEK21emIQDdUXhqSCvzFY
	 Tfde95Xpix+MOEZW+rAWt0a4TuF6dEDnmTt0Ml3/UoMH7KQOtlpK4QhF50FPVlsQVD
	 eemSoxeSsWt8A==
Date: Fri, 04 Sep 2026 08:40:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, stanley_chang@realtek.com, afaerber@suse.com, 
 bartosz.golaszewski@oss.qualcomm.com, linux-spi@vger.kernel.org, 
 conor+dt@kernel.org, cy.huang@realtek.com, devicetree@vger.kernel.org, 
 broonie@kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 jyanchou@realtek.com, james.tai@realtek.com
To: Yu-Chun Lin <eleanor.lin@realtek.com>
In-Reply-To: <20260904031252.244280-2-eleanor.lin@realtek.com>
References: <20260904031252.244280-1-eleanor.lin@realtek.com>
 <20260904031252.244280-2-eleanor.lin@realtek.com>
Message-Id: <178852862340.96570.7431727982828977183.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: spi: Add Realtek RTD1625 SPI support
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


On Fri, 04 Sep 2026 11:12:50 +0800, Yu-Chun Lin wrote:
> From: Jyan Chou <jyanchou@realtek.com>
> 
> Add DT binding schema for Realtek RTD1625 SPI Flash Controller
> 
> Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../bindings/spi/realtek,rtd1625-nor.yaml     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/realtek,rtd1625-nor.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/spi/realtek,rtd1625-nor.example.dts:18:18: fatal error: dt-bindings/clock/realtek,rtd1625-clk.h: No such file or directory
   18 |         #include <dt-bindings/clock/realtek,rtd1625-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/spi/realtek,rtd1625-nor.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/linux-dt-review/Makefile:1717: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260904031252.244280-2-eleanor.lin@realtek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


