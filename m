Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F51106F2F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBvgSuyzFWWQZZWE9qxcOCUaQW5++UZ3aBAesAsgErk=; b=PHMp/hCoHoFa/CVI/ehZb+pGGl
	tINY7UENN5AVtbAVo24NFq2pTwYqFVjUBKgYJevhnQ3dOXFO/E2Q/cFH9fMz8HFKCToeOPotzzdse
	oON+Mx4D/VOlwWTYdHAo3wcOhlm3OQyyYjAKOhD7+1JKwhzsywjsAygnTGYwbAIRSUc/eMJDl8UJ+
	AzLksnxrM8R9BFQ+OeuoK8ZdATdQntsqHwpD5++BeaMrEWtWXwpzIyqiCcPsdp27x2J2X3EPzQy7O
	CdPL3UqLy64G22KFsQfb9B7DXHNcEN0awfiQZkEnKXNRidQZW2n1ouuY1JeioNE5sM7uicEqBMBS1
	DDUdqQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5m5v-00000005hFU-0tZ1;
	Thu, 26 Mar 2026 14:53:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5m5u-00000005hFG-1IYT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78A5C6011F;
	Thu, 26 Mar 2026 14:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F380FC116C6;
	Thu, 26 Mar 2026 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774536837;
	bh=yHktdqW37TrXaUepZwNO6fH5900GR3PtyoKBLnov98c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i70ALy/5lGYrBo8Tzsj7piJ3wi0S/LRaCF9/tO1F6axA28niwP+AEM+zuioshbuKr
	 4tqq+gVDpsGA2LSoaHyqIAsNs3MVr3W+381X+ZsnvK2VcBuZOo5CIGZEqpDqflKE7b
	 8tyYpyZ/dXqY8SpYeqLblUm9aiWVfgfsAZ4fvjU2Obj0xrPrAP6yHXLKd8khggiRxq
	 YYn5Oq9iPZDiy7nSlIm12mQ/ufS401CXmROjJqf9ZL9W7b+4x98J8gGi7tpLjZEVji
	 +PGclWkEWJysMIbpWaqBi0vHvEsJ0WNyS4bH3jdP4Kzk2De7jiY+CoqY+Co13H+qHa
	 vtaFVoj76jdRw==
Date: Thu, 26 Mar 2026 09:53:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
Message-ID: <177453683307.2360712.17341812490963918406.robh@kernel.org>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
 <20260318-topic-am62a-ioddr-dt-v6-19-v3-2-c41473cb23c3@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-2-c41473cb23c3@baylibre.com>
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
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Wed, 18 Mar 2026 16:13:08 +0100, Markus Schneider-Pargmann (TI) wrote:
> Add names to the memory-region-names for easier identification of memory
> regions. As the meaning of the second memory region can be different
> also require the use of memory-region-names if memory-region is in use.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


