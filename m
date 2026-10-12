Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C476FCA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goq+JeHIaRhlCLADmOhVfg9jBpIH59a4o5nfeW4t5k0=; b=fGkjy3SQZHdDHO39NYfzejjLlB
	MUbBzCcgZFdr/GfFt4kIiuACifg8J1Seg2YF8Th9uKEI2wSmGehPshuuxZJrFhkwr8bs9akEOpZi9
	10SyJJ3UaZTlgG9OneXZGxcgGEQCkU21+8lT/RQo4UNlHpInV6xU59k+yxISuMyACp3zSoRCGvKKE
	IfE56xoXw4ZjVG/Im19ZB/mveplAjhfGsqj2SL45UXnQI4cEOD5zS4n+QssGExypN5g9u31ty54qG
	6i5bW+FC9hcBRNjO9s+mcj5Er8MnrEbIP65prRl2MwEICjBxStHnsWPNREUGszuDy/nrL0bkYcXrA
	oSOU+T3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGC0p-0000000A1Zv-2rN1;
	Mon, 12 Oct 2026 09:08:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGC0o-0000000A1Zf-1oxf;
	Mon, 12 Oct 2026 09:08:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70C7360DAB;
	Mon, 12 Oct 2026 09:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5A91F0089B;
	Mon, 12 Oct 2026 09:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791796081;
	bh=goq+JeHIaRhlCLADmOhVfg9jBpIH59a4o5nfeW4t5k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cFJcVMsWKwWrwG2WSeEddAr+C5puvHsl0QWEUiGCwGtadC23C7OeusX33uBRdc/Tp
	 fzIHdehL/zlfEvtyrVpFSTGkxz5VyM7Txn6jgTXIICH8d0EtxDoLnCfEpYNbbObgdt
	 UzyRMlWZeVegRPRS6LpEjua4yb9nqFnDJt7tb07eGGK2Y269QqMf7GHzZPm1cpeUw1
	 q/JYvNIr5kAbeSwmPO9L3VHa9wkuLtCyT2HxejVLvynm15H7dexZhkJgxl0vYaT9Sg
	 iBMZDlZkAJFA6IFKEpepWY0xRnr5YOfhMsPlzrkMTUolP2bZZtYbaK+Yx4+ui6tjpR
	 P9XPCbFMMdCGA==
Date: Mon, 12 Oct 2026 11:07:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Velkov <iav@iav.lv>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Rosen Penev <rosenp@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: pca95xx: add onnn,pca9655 with
 nxp,pca9555 fallback
Message-ID: <20261012-cuddly-pastel-stork-1d11e5@quoll>
References: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
 <20261009-helios64-pca9655-v1-1-673ee4432650@iav.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009-helios64-pca9655-v1-1-673ee4432650@iav.lv>
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

On Fri, Oct 09, 2026 at 08:45:36PM +0000, Igor Velkov wrote:
> The ON Semiconductor PCA9655E is a 16-bit I2C GPIO expander that the
> pca953x driver handles as a PCA9555: both entries of its OF match
> table carry OF_953X(16, PCA_INT), and onnn,pca9655 has been there since
> commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
> pca9655"). Document it with nxp,pca9555 as the fallback, the form the
> comments in armada-388-clearfog.dtsi and armada-388-helios4.dts ask
> for. The I2C core tries OF matching first, so the fallback form
> probes; tested on Helios64, the first user.

Last sentence is redundant. Patches should not explain standard Linux
mechanics.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


