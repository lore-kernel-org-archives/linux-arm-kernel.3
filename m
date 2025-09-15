Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7F5CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 00:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVRTl5I/hGNSMCpBc0OWNr60M8Pm3nUVZWnCEe7SF6o=; b=YXYJf9C+XotZJGoQ/olJBy/dNg
	GLwxtp0j7fOFenmcDX9lD+/iWfsL/I2vdxJg98hJQK5A3eyfnlPkeFxt4eXFR7GMdsj75r89ULnPg
	cLQTjtpCJNm1lBAJMS//Zr5RfIj4ZwHAb+k1a/CO2LISSfEPeOgyMlwKjPsqD/FGTPo6B2pcIZhUr
	aisMGfo9JICRkXkjKQjsfHyeeSK5KIFsP586dEIDg2JT5rCIGvmmPpHUGMuK0izLfJyJuA59+Uk5P
	a1cD5uKRtnou4uXhbVlVQwl01HHA5rsOON+eRm3sZb6MJHo9hdvlnFnbj/6c43oVyFKDgkD2yHimK
	2PQ/3Iaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxx8N-00000002QFt-3kRI;
	Mon, 15 Sep 2025 00:31:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxx8M-00000002QFM-0cy5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 00:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69B0140735;
	Mon, 15 Sep 2025 00:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE8FC4CEF0;
	Mon, 15 Sep 2025 00:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757896313;
	bh=4o0YmVyHmVWaq2at96tQ0tiR/PkE6ZDwW+ZN9xlB0lM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5hMe1dXiprsNDyFwPihatD0CDifPrvmYxtwQ/n21XVMCqr60HeYYFjg5jkY2QHmm
	 zTKIzGanLRCSMULbnZz3EpkralNJyzarG3EoW/X/i0fiFQSxY1PrG0kyQwTw1nIcVC
	 T9lde+PdAQGGmy85CqsCArXXBGTd47clTUoj2yx/Qren9sAd/canh55yOET5zc8c5d
	 CP6ajbraB2jI7u9jF8THxMIjqjkcYuc2zypuHCVpudhGcVsWyUZFtACJZg1TBKsuqF
	 bEWEof4gOOa4BJaVAOTLF4T1aCHTf7IB06syFAWboJCyCUK/PMqHJ7LV2lS48JJI3E
	 8Sg2/lPrjHaSw==
Date: Sun, 14 Sep 2025 19:31:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, shawnguo@kernel.org,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	frank.li@nxp.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
Message-ID: <175789631104.2317240.10004704514465285001.robh@kernel.org>
References: <20250910233402.567245-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910233402.567245-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_173154_210582_D33E2150 
X-CRM114-Status: GOOD (  11.64  )
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


On Wed, 10 Sep 2025 20:34:02 -0300, Fabio Estevam wrote:
> On i.MX6Q/6DL the following subnodes exist to describe the CSI port muxing:
> 
> - ipu1_csi0_mux
> - ipu1_csi1_mux
> - ipu2_csi0_mux
> - ipu2_csi1_mux
> 
> As they were not documented, dt-schema emits warnings like:
> 
>   'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes:
>   '^pinctrl-[0-9]+$'
> 
> Add a top-level patternProperties entry for these CSI mux subnodes
> and restrict it to i.MX6Q.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Restrict it to i.MX6Q (Frank).
> 
>  .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


