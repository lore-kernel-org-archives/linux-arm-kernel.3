Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4F8E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXWjOzH5UzEYw27TDmJ11UEwxNrIrh3j6oaKp86+zmA=; b=XNo05x1ZLC4yiIgyLKSQzXRGwY
	VG6cRx5EtXbIBOIGavIJXlXPQBYnzo8ljjd+azF6FHv+76LQRXboaHJcbqQ7J3w0nNldOvsSA+0yg
	SLXLeYIi/knzxBY/Iq+h0KOhlWQDmnk1OwuHOq8VFlHXv5r0dp5JZuAuR19hlAEQKEtlJ+ff4EnvE
	Y/ahY+Ow1fkgpQhz/yyTaPYloHY3I/3frIJb6p3dMOxTgcKKrpuq4zNmTVsO4g6MQRfcjcSlq6NCv
	0DDuiQuAK4exIwfvFOFsr/baV3e6/Ykv/xE3ZZwHOX5SE0xMp0lqtdUqselPVU0x+f5sxQDBNLVlQ
	QYoy8hQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVImK-00000006VmI-2PG3;
	Tue, 07 Jan 2025 23:14:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIl7-00000006Vc0-2oUx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 23:13:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED71A5C0F91;
	Tue,  7 Jan 2025 23:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A1DC4CED6;
	Tue,  7 Jan 2025 23:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736291592;
	bh=Do/168fsFw6i80h2fR3YzMw5FE9OseaEDLt7XS3HU7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpvIv3gvmHkpEVhnNyN37lX3TxNiebJs1tHfvBdm0G1eeX0t4GC7nnRsRoB+jCF6U
	 8YjvgIye0yGn1ndJ+hDTT+RnJJZeNboOru3+3jHg7A+ierFyLCkCzgdRfjyqnuLdkX
	 drGMJ0FHxB/3GWIWzQ4Moj3LGfdg1JXVilAeJHIGjnEEhWDRP60H43Wt2wWWIrQLSs
	 BRuiPpRBy94Hn0tW6weXnf54+bcu5BfzwXLgzLaj49cvvyGvqAth642gSMS+JejS+j
	 hj4OdFu47n9KCunxQjIogQnds/pm1TmtgIL/6imDVnrlJ6cDzanK7j8Han8EJAU2NC
	 RIpHEzG19CDZw==
Date: Tue, 7 Jan 2025 17:13:11 -0600
From: Rob Herring <robh@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: minyard@acm.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, ratbert@faraday-tech.com,
	openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] bindings: ipmi: Add binding for IPMB device intf
Message-ID: <20250107231311.GA1965288-robh@kernel.org>
References: <20250107162350.1281165-1-ninad@linux.ibm.com>
 <20250107162350.1281165-3-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107162350.1281165-3-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_151313_795748_E3F32498 
X-CRM114-Status: GOOD (  20.25  )
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

On Tue, Jan 07, 2025 at 10:23:39AM -0600, Ninad Palsule wrote:
> Add device tree binding document for the IPMB device interface driver.

Please mention this is already is already in use both in a driver and 
.dts files.

> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../devicetree/bindings/ipmi/ipmb-dev.yaml    | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> new file mode 100644
> index 000000000000..9136ac8004dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ipmi/ipmb-dev.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IPMB Device Driver

Bindings are for devices, not drivers. Drop 'Driver'. It's a stretch 
that IPMB is even a device, but since there are already a few users, I 
guess we're stuck with it.

> +
> +description: IPMB Device Driver bindings

No point in a description that just repeats the title. Please expand 
this. For example, AIUI, this is for the device end, not the BMC end.

> +
> +maintainers:
> +  - Ninad Palsule <ninad@linux.ibm.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ipmb-dev
> +
> +  reg:
> +    maxItems: 1

As this is the slave end, I2C_OWN_SLAVE_ADDRESS should be set. So:

minimum: 0x40000000
maximum: 0x4000007f

Maybe 10-bit addressing has to be supported too?

> +
> +  i2c-protocol:
> +    description:
> +      This property specifies that the I2C block transfer should be performed
> +      instead of SMBUS block transfer.

This can be more concisely said:

Use I2C block transfer instead of SMBUS block transfer.

> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        i2c@10 {

'i2c' node name is for i2c buses and this is not one. 'ipmb' is probably 
fine here.

> +            compatible = "ipmb-dev";
> +            reg = <0x10>;
> +            i2c-protocol;
> +        };
> +    };
> -- 
> 2.43.0
> 

