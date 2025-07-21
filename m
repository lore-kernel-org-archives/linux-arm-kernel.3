Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A453C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 10:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68No7jCvgrHhrDWDtj9tIKTF+raSx3BousAIp1vCxUA=; b=C0a5VwYAGRryTO8hvaB01cyBWs
	hEIFh7AKQHudOHGO94z5lWVyCwvhue6LQ+aaVX7mlmu11+VCoqmxztR0wDOLC+lGbVe0NmRjyJYq5
	dWzjAjCgba6S5n4hUBDnTgdLYlwZy0c+tDP5YVC3IvpVSuzYNjKgU0k0ZYE212HvFBWp0C5u+Sw45
	zakFnQh0ULDKTxx2xSWm2t0w/TdGiCMsT49yWEq4hD02S7x3QIp6J+f9tx6e6pC7YZVCtd0CkTKly
	1YBlK+RgQo/ucQN/wz4Oyo8+DkguIuJ5XtipEWIZgwbVjgWw4OmbN1sMJhmFgyZSun3TcuKIn2QPm
	UriEDzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnje-0000000GxUw-32Ua;
	Mon, 21 Jul 2025 10:27:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmzL-0000000Gpxi-2Nzr;
	Mon, 21 Jul 2025 09:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1D3F5C55AA;
	Mon, 21 Jul 2025 09:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3524C4CEED;
	Mon, 21 Jul 2025 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753090754;
	bh=WiX27AOv2yJA6I29GkVHqgcg0Ip92T/WuBgZC4cMNIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFbUl/kxNIxSfbroWuxmNrYXHBY6cbd043RehTih0N6YlDU8z3nYFZFxnx5alRma/
	 rdrzMnQwtP7aWh6aD6zYFFWtbx/Da4IivlgGYFPIM4ysKMw4VmSncqcl7S2YuNRLPQ
	 2ZUwVutqJHVVaACubFZ3bD9+MGvRKHcSVhH+3hFEp8ANiPgGVI2lorsyuzGu1qfpJ+
	 DMOpwuMWVNEo8uzFSiyJybSduIIElsHdardzTAkUv38BzfPqxeD9/HxA69nc378rhz
	 YT75eeq+35mW8Fh+uVcpogyuBvBxiuhByWJgfemwexQ7QwBGvtqa8sPzkXckJtylZl
	 Us6PNM5B12+qQ==
Date: Mon, 21 Jul 2025 11:39:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>, 
	Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: imx8mq-usb: Drop ref for
 fsl,phy-pcs-tx-deemph-3p5db-attenuation-db
Message-ID: <20250721-imported-quaint-crayfish-d4e44b@kuoka>
References: <20250721065424.4192351-1-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250721065424.4192351-1-peng.fan@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_023915_651634_0B46F834 
X-CRM114-Status: UNSURE (   8.45  )
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

On Mon, Jul 21, 2025 at 02:54:24PM +0800, Peng Fan wrote:
> Address the device tree check warning: "phy@4c1f0040 (fsl,imx95-usb-phy):
> fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'"
> 
> And dt_binding_check reports:
> properties:fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: '$ref' should not be
> valid under {'const': '$ref'}
> hint: Standard unit suffix properties don't need a type $ref
> 

I already sent it, since I did the change in dtschema...

https://lore.kernel.org/linux-devicetree/20250627-dt-bindings-db-v1-2-d5c7072acbee@linaro.org/

Best regards,
Krzysztof


