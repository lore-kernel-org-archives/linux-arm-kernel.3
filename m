Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6035DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 23:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lgpd9qSYbSO27cTLVVtK32TzSRP1yS2DhHPZv759j/0=; b=SyzC9aDy0rGCcC+kXyTe9XCfJw
	ufjHa+Mhvit3fsOUs4XYtfEHgd4KLkG1MHKj7tLXl9N7QJLKOrkcW2dRoBkmQn5Xbz1l13tYGw2MF
	vxZNYxM/aDce/vxuvLq3QBkK95kVBDHHAP/Xp1hWwKmrwTKKjdkubt02uFmE+4YL2GrRURtosaaAL
	qVNzT9Zw2wxrUjMUN00ruZCnBWTfSYTL0NJSbFRUx38EeElQXT4uGsbPQ2WGw0ncgOiiqzo2zyTCb
	XvkzCbSzox34SDjTWLOv4f0GK3LG2cdIdxYDnMw+33cQIKwu/Q3PL/HVlZdpzpDvrIjh0NiN/8OAJ
	swC7YktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqoU-0000000A9sg-1rg9;
	Tue, 14 Jan 2025 23:59:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqnF-0000000A9iP-40z1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 23:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9B475C5944;
	Tue, 14 Jan 2025 23:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29BAC4CEDD;
	Tue, 14 Jan 2025 23:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736899077;
	bh=qYcadH5zTVf6YXQcR12gkpEXX8NXXimDRL8MXEYl88I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jxngMlvI1aMH7uwkSNtEMSo14UCuU2hwadYpy8TGifVRhFKGYRXkjD8bHJaeDuGjp
	 AeuWNlEeSkWvTVqZZHSyoVuIEOfWATWVpJfr1CTZkPcPUqxjNsTEQhSov8/KnowEL5
	 CvQg9E8qJCtw9Il4ZjD2H2I9Cqly4JEQPTspsZBthQy65l6WPXtta9EFp6hG+9UKnI
	 m9DFyGiLnsMunIEMMhHIEgusMkuF1M6leSBraIeKhJCHqf92d865JChCjeNBvTyU4f
	 cdFhJabsFOTtH0IsfqAktwOWynpwEd9PBgziJ0YRbPkQaTNAXtDIM5zA+LO6T1/lM/
	 pTET4Szz1XfIQ==
Date: Tue, 14 Jan 2025 17:57:55 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kuba@kernel.org, netdev@vger.kernel.org, andrew@codeconstruct.com.au, 
 davem@davemloft.net, edumazet@google.com, 
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 joel@jms.id.au, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
 minyard@acm.org, eajames@linux.ibm.com, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org
To: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20250114220147.757075-3-ninad@linux.ibm.com>
References: <20250114220147.757075-1-ninad@linux.ibm.com>
 <20250114220147.757075-3-ninad@linux.ibm.com>
Message-Id: <173689894057.1969633.10540050942005147267.robh@kernel.org>
Subject: Re: [PATCH v5 02/10] bindings: ipmi: Add binding for IPMB device
 intf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_155758_039209_F85C8A2B 
X-CRM114-Status: GOOD (  11.99  )
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


On Tue, 14 Jan 2025 16:01:36 -0600, Ninad Palsule wrote:
> Add device tree binding document for the IPMB device interface.
> This device is already in use in both driver and .dts files.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../devicetree/bindings/ipmi/ipmb-dev.yaml    | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dts:24.32-33 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/ipmi/ipmb-dev.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250114220147.757075-3-ninad@linux.ibm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


