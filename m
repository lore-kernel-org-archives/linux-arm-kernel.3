Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5474EC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ctnh7XOPMGVk2IZrW/Ta1WlXE7f9Ym6yFflqG1mSww=; b=KhjawkSaVGKdqk7zpPE5LHBG2C
	HESkVOYL82ALJqyjRlu4a8rdH18B7VSDvL++TSBZTY/5cxC/7MwkGUzelJLkFDoXRR4X8zrWL8V9p
	g7RhhTf0qCOEG/6p8kwgYgADrLNLDn6Lp3vx3ozSUPsBg4QRgcWqTZJTnxgmhE76hP3lTW6M+/fd6
	QtLq3dCceEyhHIHJE7TeH5zvPgcf3YhDFKHv9K9Xjh3Q8hZd66Fh+JK9V1lX7XIMIJ9007B6DWPcE
	Z/Q8P9mLncMVA8vhyZMY9z7xjtqq9qSvw29oV40rvnGVDJWx89SievfPKK04hQhCaNvVME/P+E6cs
	eTl0k1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVM4-00000009vis-1Hku;
	Mon, 12 May 2025 15:46:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUzm-00000009rQr-1B58
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:23:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AA895C65D9;
	Mon, 12 May 2025 15:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397C8C4CEE7;
	Mon, 12 May 2025 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747063389;
	bh=bTluUh+XxqovVbRY+Sbpmqom/EmKfFvjwLJ8AnpA5YA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iY74upwZEVgnMWkd6DFuihA0PhEb03hzXLjWuL6d6mEXu5y2mDo8EZyjD2jy+9w+Q
	 2pb1yePe6EczYRs2HXQKPr9ElYKqReLG9dbeDJYfd0y8njYBizl3TOmHtEWya6v6MC
	 eM5hBveawqia8ow+DPKHr84/PfOvxFgMH/HI/BX/6bsECCREbU7YBgxsdtg1al7fZe
	 r08yz0Q8gq4i1bnie8vmGLBcbk4f9mzmnUxNk6kt/SPkxwqT0i0oGTRb5qR976Bhsb
	 iiIb/v7kck8BDKVDdQXc1fmYd4wkAC1SRRAR4y83o5GM58UQtzMwwrDgLL5l79mWIu
	 LiMVwdvCOqCGA==
Date: Mon, 12 May 2025 10:23:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v7 01/11] dt-bindings: net: ti: Adds DUAL-EMAC
 mode support on PRU-ICSS2 for AM57xx, AM43xx and AM33xx SOCs
Message-ID: <174706338693.3372878.17398563182195678411.robh@kernel.org>
References: <20250503121107.1973888-1-parvathi@couthit.com>
 <20250503121107.1973888-2-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503121107.1973888-2-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_082310_363443_B3D8D28D 
X-CRM114-Status: UNSURE (   9.47  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, pratheesh@ti.com, basharath@couthit.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, rogerq@kernel.org, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Sat, 03 May 2025 17:40:57 +0530, Parvathi Pudi wrote:
> Documentation update for the newly added "pruss2_eth" device tree
> node and its dependencies along with compatibility for PRU-ICSS
> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
> 
> Co-developed-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> ---
>  .../devicetree/bindings/net/ti,icss-iep.yaml  |  10 +-
>  .../bindings/net/ti,icssm-prueth.yaml         | 233 ++++++++++++++++++
>  .../bindings/net/ti,pruss-ecap.yaml           |  32 +++
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 +
>  4 files changed, 281 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
>  create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


