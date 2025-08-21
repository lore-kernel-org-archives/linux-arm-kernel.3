Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF6ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivSlYy+O6ZMMOOzif4ZYd6aTZX0PZeSftmL16ssiN/Q=; b=kc++ensV1rKE/vEWF3SnigWMy3
	HMtRSZhFE0BCSmhMreR/+RGf+khq6jzyME2pWgQz+FEEpAUmz03m29y+IdCxRafwtW+sryw7rHj+j
	JF0/fATEXOoiUhRLUns5xL+panws1tqTghl3VMvzL/LNK6AGLzNGOz2X9t6rOBOIJDAR7k7FHpVFi
	0iAOym1xkhfvnZq7nqkjCBgLj2SNoi2BgX58LPTnGbGbJHnxcS0MabH8MUhKQiemfFHps+2J4L6Ua
	sszrOc35N6MuHbzR/vZBxWejOHLtPXcEohoDsiZSHXlhWYoNqEzMiIJV34gDBGc5vN78Pt0eAUBBJ
	O0LLwwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7W-0000000FdWT-1QWH;
	Thu, 21 Aug 2025 03:37:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosqg-0000000FH0j-04i4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:08:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9402A45956;
	Thu, 21 Aug 2025 00:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584F0C4CEE7;
	Thu, 21 Aug 2025 00:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755734889;
	bh=QgrJKEDNsTMloOmaRWYk82/0DWzZ5DY1lY/N1y8Q7Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpwgCuhtUTrrxY4rdEIi9y/NrFnnj4JL1F0ylFg1Pn+oMB5WqRtPJNHuvbXUlTB9u
	 jPpOsn3h4QcQJSeAvT7nwEjPAL9DzQL4MLAg8mGD3oJ7EZbU0J8FcuKfu0a88E7s99
	 PrA+fDLrLwdkDj/wzs4G6G5t/EPyGIk8gaG1fL2VPfqwMEPsxLNTdi9Rkoyuc9u2nk
	 gVPpqwd4Nv3TDbypyIe567k8vNJyDslYwveIOjCASU7J3RS71TvCBajhpxoh5HPpnb
	 9on5I8wTQtTjgz4zElJQzILHTTjMiOpmBMOXYACAucl49mxraI3S4XTZqc3UUsB6KV
	 F3ApseyZt9CDw==
Date: Wed, 20 Aug 2025 19:08:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [RESEND v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to
 yaml format
Message-ID: <175573488775.1779670.2147275445391515237.robh@kernel.org>
References: <20250818183814.3603308-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818183814.3603308-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_170810_077100_6012AAEF 
X-CRM114-Status: GOOD (  11.95  )
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


On Mon, 18 Aug 2025 14:38:13 -0400, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> - add ref to matrix-keymap.yaml.
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add ref to matrix-keymap.yaml.
> - remove properties, which already defined in matrix-keymap.yaml.
> - Add Vladimir Zapolskiy review tag
> ---
>  .../devicetree/bindings/input/lpc32xx-key.txt | 34 -----------
>  .../bindings/input/nxp,lpc3220-key.yaml       | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/lpc32xx-key.txt
>  create mode 100644 Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


