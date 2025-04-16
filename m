Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A198CC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqFZ3KA+ZN63wPVKsBzniUO/ptQK4uo1wi9JSM/pBeQ=; b=qJInRBVTKR4T1d8T3PMrPI8H/k
	GOlEIGKOiVsL4RJs3UyfO1oAwKZ8NjbxXSSAYsRU7gtMnTNa7jk96gVjhvWUmHxyc7/Z5FBz+FzPR
	monFcM1i/ylP4XfhHjDOwvSL0BdwnmenYKRaGQTRXcDGwvZaTmzBVwnJJ5JEjgq6WMUz/EQ2RgXS6
	bjFSzMTyO3IfuWIa2sj3vTqdZbOSWegi1bh5XMO0CUI8rv0sbKPLd6b9dpBHYVfbQF/UT5jgwODFY
	0TL4Ax0CQVirxogf6zcjZ9i084L1mIZzKGRMjyHMv31haZVpalV4LlrCshnSAPkOUt6KtlvYcu8xp
	5Frzmu7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57Vg-0000000AZ0l-2NZ4;
	Wed, 16 Apr 2025 18:29:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57Ho-0000000AXOW-26tC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:15:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C482E5C489E;
	Wed, 16 Apr 2025 18:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F175C4CEE4;
	Wed, 16 Apr 2025 18:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744827299;
	bh=Hl+qE6e1hKPx8LvF4MK3eS/E9KO8+f/r4ccwLgLC7yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDXQykB/D06KZRTLdQ5o3lYgLD9XD2kpcCUzEUq0WlKoy6aBuC6Prsz4Ylho53i6v
	 f78bXvCgXVR3oq/TaGCGzBaxJv/4ehH5zTTmDWMMyTj+cUEdrMAFyQWbTT+KdK+VRC
	 EA8/5cT9lsWaL+iQsJxuGZir4uJjEe70XyIQ2zS1Rd3yZZCTYCgU9Q9kcI1UUA2jNP
	 eoBdwsxrGB5vOfXWijmxYLapyg7GBvmuVsZtcIXf+x4ZEvphEmRwQGfit9jxVk9KLf
	 cef6OEKm7p7/SrZZ9PNdgG10jgR9KcMSL7GhTF67uZD2kc9bpKqI/eKvRct+1VyYio
	 Y2eHuYW6fdjnA==
Date: Wed, 16 Apr 2025 13:14:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: media: convert imx.txt to yaml format
Message-ID: <174482729735.3601453.17180979927666632350.robh@kernel.org>
References: <20250416154729.3424617-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416154729.3424617-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_111500_634138_52383FD1 
X-CRM114-Status: GOOD (  11.96  )
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


On Wed, 16 Apr 2025 11:47:27 -0400, Frank Li wrote:
> Convert binding doc imx.txt to yaml format. Create two yaml files:
> fsl,imx6-mipi-csi2.yaml and fsl,imx-capture-subsystem.yaml.
> 
> Additional changes:
> - add example for fsl,imx6-mipi-csi2
> - add irq err1 and err2 description
> - update MAINTAINERS
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v2
> - add irq err1 and err2 description
> - ^port@[1-4] to ^port@[1-4]$
> - add port1 in example files
> - update MAINTAINERS files
> ---
>  .../media/fsl,imx-capture-subsystem.yaml      |  38 +++++
>  .../bindings/media/fsl,imx6-mipi-csi2.yaml    | 144 ++++++++++++++++++
>  .../devicetree/bindings/media/imx.txt         |  53 -------
>  MAINTAINERS                                   |   2 +-
>  4 files changed, 183 insertions(+), 54 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/imx.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


