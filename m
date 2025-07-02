Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0347C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6LHKJnFmkBVfaBNVA+PvTt7RpUyjAiBsMwJT2t+Fhg=; b=Ql6quZmOeHNCgJTa+xjQ8YTEwJ
	D50z/2giYlAAhvbo6euqRcjEdfdy0/aE6t6qPwUTU7uaFiILNSfh4vNFlf/rFlvs8eoXxKdnqEN9a
	Ax+Uzww40mKTxOAuBRMONeSAr3NwFd4dPxfbLIEa3q9xycqukMIkyg8hMEXH9haGIMLVO6Ahu3sjU
	AIf22UgMKKmDwNek2jEhcuHq19IgIQpTHFDZrJPKQPUStZbv9DkAYUhnVWZ9bOteiV/sXWGAdUGDG
	0zSNFUBqUgyP5xZH/EOfaSAIpR+UTMeWeEuejQIgbAu8Uuxlul7qP6TEUuM+ONmkVyJg7YH0ECK/q
	AOeQFrTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZE-00000009AI0-3o9K;
	Wed, 02 Jul 2025 17:48:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0ib-000000092H3-38Wi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 16:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4F7CA530DC;
	Wed,  2 Jul 2025 16:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE08C4CEE7;
	Wed,  2 Jul 2025 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751475236;
	bh=SPe4Uai1bMQkO9HlAyYOM9wfRpZK1LE+tL6F2AD8u1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKlMaTth9qVjFXD1OrmZjGPDo89B+QjHzvGZv11qCVAmnmt/fVk1mV1FCiB8JKdNf
	 D6Vro1jZ4YN3ADYJXKWzZZ0cMndBt84UGCpSFWW6ygeTgBzpcY3zazVZgGcp/pOmZn
	 ogalxEGv0qRjivDYljIcQikdjDt35QapyEsoKDEDNgjC1H5OZtoSx8r+0M/n89FHhv
	 0FYBMICOQWnsCj5jPKwA8Rc/Eab0BMqBGNMlX10Iu1ef++FnlKUjF7Yzo+gSzkKtv1
	 iie6R/1OsgeHiMDbSfpx/RKVgdJAKwTyD8furAM25FZyQPwLA+Gzt81wBv3ZltyBeM
	 R/NPEBCybHM9g==
Date: Wed, 2 Jul 2025 11:53:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
	Mun Yew Tham <mun.yew.tham@altera.com>, davem@davemloft.net,
	richardcochran@gmail.com, linux-arm-kernel@lists.infradead.org,
	pabeni@redhat.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
	kuba@kernel.org, linux-kernel@vger.kernel.org,
	alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
	conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	dinguyen@kernel.org, edumazet@google.com, mcoquelin.stm32@gmail.com
Subject: Re: [PATCH v7] dt-bindings: net: Convert socfpga-dwmac bindings to
 yaml
Message-ID: <175147523465.1908626.13539013933475728908.robh@kernel.org>
References: <20250630213748.71919-1-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630213748.71919-1-matthew.gerlach@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_095357_853560_B046D2E1 
X-CRM114-Status: GOOD (  15.65  )
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


On Mon, 30 Jun 2025 14:37:48 -0700, Matthew Gerlach wrote:
> Convert the bindings for socfpga-dwmac to yaml. Since the original
> text contained descriptions for two separate nodes, two separate
> yaml files were created.
> 
> Signed-off-by: Mun Yew Tham <mun.yew.tham@altera.com>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> v7:
>  - Add compatible definition for Arria10.
>  - Update iommus to maxItems: 2.
> 
> v6:
>  - Fix reference to altr,gmii-to-sgmii-2.0.yaml in MAINTAINERS.
>  - Add Reviewed-by:
> 
> v5:
>  - Fix dt_binding_check error: comptabile.
>  - Rename altr,gmii-to-sgmii.yaml to altr,gmii-to-sgmii-2.0.yaml
> 
> v4:
>  - Change filename from socfpga,dwmac.yaml to altr,socfpga-stmmac.yaml.
>  - Updated compatible in select properties and main properties.
>  - Fixed clocks so stmmaceth clock is required.
>  - Added binding for altr,gmii-to-sgmii.
>  - Update MAINTAINERS.
> 
> v3:
>  - Add missing supported phy-modes.
> 
> v2:
>  - Add compatible to required.
>  - Add descriptions for clocks.
>  - Add clock-names.
>  - Clean up items: in altr,sysmgr-syscon.
>  - Change "additionalProperties: true" to "unevaluatedProperties: false".
>  - Add properties needed for "unevaluatedProperties: false".
>  - Fix indentation in examples.
>  - Drop gmac0: label in examples.
>  - Exclude support for Arria10 that is not validating.
> ---
>  .../bindings/net/altr,gmii-to-sgmii-2.0.yaml  |  49 ++++++
>  .../bindings/net/altr,socfpga-stmmac.yaml     | 166 ++++++++++++++++++
>  .../devicetree/bindings/net/socfpga-dwmac.txt |  57 ------
>  MAINTAINERS                                   |   7 +-
>  4 files changed, 221 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/altr,gmii-to-sgmii-2.0.yaml
>  create mode 100644 Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/socfpga-dwmac.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


