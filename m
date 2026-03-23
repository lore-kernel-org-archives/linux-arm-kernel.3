Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1B2F4610C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8D3w7stqz7TL+CD/vsOMXfCejNGmY766QYjl+SsmvBw=; b=jyHfICHEoi4d94HPBs//JiF/IC
	HZmpZtz9MyRsqD84Y+7/vdgilNA2c6zOlyM/56qB8H1oZNGLZXURPKZnHYjSmYCEC9ByspDwOnf45
	vyFFioXhYUqej0RZBKRYJJB5jtnir63xahugfU/kDt5l/4nQS4GuczuLXXfe2HsxbPmENukKLlb0z
	eAs+FW7dHXiz0kelStIH/23j81XLj1OOjKqMidMvDCbguCxM0iGMrnAxEkBewr/Dj4LKIovIZgqIO
	jrs9ngLKCAl//bOLTj8n+GQVZPHWOeoF/7H9Hjyn+y/JYC3PwkjFG5NSo6Dnz0q9N55z07p6n/CbQ
	6oJZfr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fGb-0000000GoYF-1E8C;
	Mon, 23 Mar 2026 13:24:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fGZ-0000000GoXp-30kl
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 13:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=8D3w7stqz7TL+CD/vsOMXfCejNGmY766QYjl+SsmvBw=; b=XGmP3bq19lIw1/bJro4zCJa8Pv
	KGKE5XdLpm+UuCzuWHVumx8rzFQu3xK6344l1ZGF/z7zfhfZlnnPcSqTFv3N/AMv9qEbwlcz+5lYN
	Kbwfhx7NDFC/4nIBVUVZeL5punyk0TdApcSpxLl1jyL0v7j60T14slarGVRPwkoGwNNeG/U74RYnG
	Rw1/jYZlki3q3s1xOUoF6XAba6lE9C4Ne3jwcE2yl4G2FaC2wbiainD3/veYi0vk1wva7m1srSdL+
	5ZzEWWckmxtG8Vdu2tMBHzRh+iKG/kXNGXs1KE+T3Zx/jaAJ+JWsUeL8mBHUsPCfMNvt62DfMRcqI
	yQUrmtFQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fGW-00000001b0u-2IvT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:24:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F58F442D7;
	Mon, 23 Mar 2026 13:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBD5C2BCB1;
	Mon, 23 Mar 2026 13:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272256;
	bh=yrsAO96whaggG9rvgjgOdIWNmDJNVbOszVkiTUcN9AE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SoF7E7SrTyvmSwzXVD60JKAftzWuicZny0+4m7cMrgQV/s1AYPTTOMjLiT80YAdKZ
	 q+kXT04vd28vOyqcdhfI6gHfPk4gLj4D4mUQkSSY97NK7XiyZa0c59IDy+RMdv3zqf
	 dI44jDH4WD/MLFPh2+I1teRqGAOaq0YZ2lhM7i5UXjniXTnKAUj5xw0nmo0xj9fc1f
	 fV2xvH2NsgQWKjRrcxjL4ub/ptoKOubCVV+aeiiVkDM+P93J0nkF6kSBJ8Qtzcg5oF
	 NT1PqRLAVvbWSAMhkSFV1LOqwufF8UU1pIvyJIFBveJNB4NUzmY1MNS+V0AGPqwJH3
	 NiiQcqYTVLNIw==
Date: Mon, 23 Mar 2026 08:24:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, daniel.baluta@nxp.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Guenter Roeck <linux@roeck-us.net>, Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>, linux-watchdog@vger.kernel.org, d-gole@ti.com, 
 m-chawdhry@ti.com, simona.toaca@nxp.com
To: Eduard Bostina <egbostina@gmail.com>
In-Reply-To: <20260323084616.10469-2-egbostina@gmail.com>
References: <20260323084616.10469-1-egbostina@gmail.com>
 <20260323084616.10469-2-egbostina@gmail.com>
Message-Id: <177427225351.450652.11241524058858520002.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Convert TS-4800 to DT
 schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_132420_825444_09DA14E6 
X-CRM114-Status: GOOD (  12.48  )
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


On Mon, 23 Mar 2026 10:46:12 +0200, Eduard Bostina wrote:
> Convert the Technologic Systems TS-4800 watchdog timer bindings
> to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
> Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
>  .../watchdog/technologic,ts4800-wdt.yaml      | 46 +++++++++++++++++++
>  .../bindings/watchdog/ts4800-wdt.txt          | 25 ----------
>  2 files changed, 46 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.example.dtb: syscon@b0010000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260323084616.10469-2-egbostina@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


