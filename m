Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C0AD75E5D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 21:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7WmZQHohNW5BD9XNmdo4vE5jOpgTiVsVHg7biXHXS0=; b=BuFusVYSP2PzFNN40lCHQ32ZLU
	DOtH7yGXLYAmz1HFsGX2PQw7YCdYgMbWK6LxH/haBKmYMEeUoswkdYz0rEeb2CaHN6syNVmWQaULt
	xqpwGp0WCEH8ZJNle5PSz1EIx+kMAeMSbos8evZ5gPg8sjqQylIAyfJaQSddRwtFGVTx37PWLGbOY
	k3Po9bXjk083DxK+jikxiRMYbKqphRoUBn6NBRyFi9+9oObNFDGFMnMrquIpDCiWUByk4PqMxo5zY
	a0CkyMAOUGqV1wMfL+JkGTxemC2vEhAlRy0IlKUsZ49uxL1yTfmsWq+eYjRn4m0PY/aUbkjcmM1vc
	kqYuBkYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFK9S-00000006ezk-03Pg;
	Sun, 24 Nov 2024 21:28:18 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFK8U-00000006eur-0rQl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 21:27:19 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BA7F12008A6;
	Sun, 24 Nov 2024 22:27:14 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A3260200464;
	Sun, 24 Nov 2024 22:27:14 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 5A97E203C1;
	Sun, 24 Nov 2024 22:27:13 +0100 (CET)
Date: Sun, 24 Nov 2024 22:27:14 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: [PATCH v5 13/16] dt-bindings: net: Add DT bindings for DWMAC on
 NXP S32G/R SoCs
Message-ID: <Z0OaMjw0A4OadZfI@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
 <173203348678.1765163.1636321988738538785.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173203348678.1765163.1636321988738538785.robh@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_132718_506388_1356AC3F 
X-CRM114-Status: GOOD (  19.61  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Keyur Chudgar <keyur@os.amperecomputing.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2024 at 10:24:46AM -0600, Rob Herring (Arm) wrote:
> 
> On Tue, 19 Nov 2024 16:00:19 +0100, Jan Petrous (OSS) wrote:
> > Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> > and S32R45 automotive series SoCs.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 105 +++++++++++++++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |   3 +
> >  2 files changed, 108 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 

Thanks, I will fix it in v6.

> dtschema/dtc warnings/errors:
> 
> doc reference errors (make refcheckdocs):

I have also noticed the refcheckdocs errors, but AFAIK those are not
connected to my commit:

 $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-   refcheckdocs
 Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
 Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
 Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
 Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt: Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
 Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
 Documentation/hwmon/g762.rst: Documentation/devicetree/bindings/hwmon/g762.txt
 Documentation/hwmon/isl28022.rst: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
 Documentation/translations/ja_JP/SubmittingPatches: linux-2.6.12-vanilla/Documentation/dontdiff
 Documentation/userspace-api/netlink/index.rst: Documentation/networking/netlink_spec/index.rst
 Documentation/userspace-api/netlink/specs.rst: Documentation/networking/netlink_spec/index.rst
 MAINTAINERS: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
 lib/Kconfig.debug: Documentation/dev-tools/fault-injection/fault-injection.rst

> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.

I have series based on v6.12 and I don't see there any v6.13-rc1.

> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

I rechecked with fixed indentation, no any error was found.

BR.
/Jan

