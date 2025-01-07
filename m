Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4DDE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gkFFLzzDG1L/33tUrIZ7IbRLBj2EoYvSSWS8ENRDhM=; b=ydBKlhtEfQNi0G++7RfY2oqFb9
	PvyMa+0hLgt8vhxU38EuFDsu4fM1B5ExoYa8wr8jBuINb8Mr9cr36LHM9SIMqDfvYnblaIdCBOwSL
	n07LTDlPVz9nAJnf4n5AYLJ9P3X0FQELw5wKORJOmn3Tuw/3FKmmUycPuiuU1Om04bSIJ8UPBuOQS
	8dXUwN3/DVttHhfF8+rHlhpR9W4STampF/9qgGLUJfXaJYg8lLtUh6pdwLUowJgOKkDvjgWygABm3
	C2taIbsXIgcKFzViBOGTUKSWG8SX3VipSQdHACU7s5wr4wrHvWyezmExxyUgZj7piXOVIbfy/0nHw
	+JTZ12IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVEF9-0000000613c-25LP;
	Tue, 07 Jan 2025 18:23:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVEDu-000000060xC-023V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 18:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85225A41B86;
	Tue,  7 Jan 2025 18:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A9DC4CED6;
	Tue,  7 Jan 2025 18:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736274156;
	bh=nQt0n0t3yZF3lcbbDEr06Sl/D9a0HeRqKxRgtUlA08I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Y8Uox00V0JqdR041OQIfsDcEnXxckrrsxU+9GwVzlDW75rqIbyuwc/gSpA/1JFEws
	 3ILKwoSAbMHiK6q+Iy3iIFE2ZQjba3dsgC4QqqMM75IE6xzfd4M60L6bnC9h1XIFg1
	 813GljNv7DbP7qomTalL0jq0xCVsBLhgbGSYgF/KDvjt0AHRm8tCZ6XbXBp4b9pbvd
	 0S3rmZzcpycYu2LROF9Acl6tOjSoiztCEzw3vhQ5m4VNcIiys9FUBjEUb9q5YIH1Zt
	 33dBBdWB559MFABnYDCYlXp9p6tO0t2X3CPRa02N8NhghE31+7ZQlMaOfWcirRZxuC
	 tIbd6/eNeyYsw==
Date: Tue, 07 Jan 2025 12:22:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: eajames@linux.ibm.com, linux-aspeed@lists.ozlabs.org, 
 netdev@vger.kernel.org, kuba@kernel.org, minyard@acm.org, joel@jms.id.au, 
 andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 davem@davemloft.net, krzk+dt@kernel.org, conor+dt@kernel.org, 
 ratbert@faraday-tech.com, pabeni@redhat.com, 
 openipmi-developer@lists.sourceforge.net, edumazet@google.com, 
 andrew+netdev@lunn.ch
To: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20250107162350.1281165-3-ninad@linux.ibm.com>
References: <20250107162350.1281165-1-ninad@linux.ibm.com>
 <20250107162350.1281165-3-ninad@linux.ibm.com>
Message-Id: <173627415580.1273439.8070481995690256439.robh@kernel.org>
Subject: Re: [PATCH v2 02/10] bindings: ipmi: Add binding for IPMB device
 intf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_102238_170483_37DD2FD1 
X-CRM114-Status: GOOD (  10.27  )
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


On Tue, 07 Jan 2025 10:23:39 -0600, Ninad Palsule wrote:
> Add device tree binding document for the IPMB device interface driver.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../devicetree/bindings/ipmi/ipmb-dev.yaml    | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dts:21.17-30: Warning (reg_format): /example-0/i2c/i2c@10:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dts:18.13-24.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #address-cells for I2C bus
Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dts:18.13-24.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #size-cells for I2C bus
Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dts:19.20-23.15: Warning (avoid_default_addr_size): /example-0/i2c/i2c@10: Relying on default #address-cells value
Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dts:19.20-23.15: Warning (avoid_default_addr_size): /example-0/i2c/i2c@10: Relying on default #size-cells value
Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250107162350.1281165-3-ninad@linux.ibm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


