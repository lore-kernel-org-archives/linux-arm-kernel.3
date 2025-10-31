Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9662FCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOkYvQG+Sh53NGhL21Jhy7ZV7gavvZxgT/rXIEVZ16s=; b=i/57Foh4Va3tXo91PVRUiJ916m
	KJCOmlhbSyauA+g+x0o+Y0WUTabkwbAvu0ZYMQAF1OqMwz5YVuYElgrzSMXjOFLOk56aoPRICREQp
	QsOGdxTjSq6+RF7jiL6FHKe6/9bqVwZFLTCO/7jyuv5xPDdr+8bJQapytFUprnnvleDNkA60W93Ae
	uKqIMJiMTPVyII8gEpfDxkqvJ6YipmuqMqfrqQhXBkUMLXa5KXB0YlG3v2o8PJwqSWONCHuA+hiW6
	s5ungDDP8sdr/Jowqol6y7ORg64ts2kAYCY4m5XG9kkMJjrQl/nWGsXB678nhWLKh+E4ltM3GaSm7
	N+1LZGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErz7-00000006PPN-1eiP;
	Fri, 31 Oct 2025 16:28:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErz6-00000006POf-08sK;
	Fri, 31 Oct 2025 16:28:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3F0960241;
	Fri, 31 Oct 2025 16:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42381C4CEE7;
	Fri, 31 Oct 2025 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761928094;
	bh=J84IQUL9bblDhG1K4MYDhAu/ebJSucswpnmmazP+pEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ii4vi4doCkLRPW1OiEegRLUvHoi9sSYnwbZx7UTKizmW4OWXgaXzOxHz70r9hpLvm
	 fmyU7HJh+wUsDj4YPZHrynwCyFwqUutuINETDIPoz9V62zoBzQusuL/KP/5JcanLSL
	 8LUSvnqGMiMWrmIIIy9xMOXdRDjULeBe6+zqsf38BYkhLYYJ6sdMoZ/dzWvaJ2MvIL
	 WcfEXE8fN/sD216LUHAytWSIFyHyvwyNg8ioVpKwaNCELZl3VO9CWH61HRycvoU0Fq
	 ocNnQBNxWoopcyYyPHIgg/zpxVhZg9f2ul65zTebNy8CdzzUQ9wJxhwFvB+sWRv+Nc
	 /ODyNG6ol2Kxw==
Date: Fri, 31 Oct 2025 11:28:13 -0500
From: Rob Herring <robh@kernel.org>
To: peter.wang@mediatek.com
Cc: linux-scsi@vger.kernel.org, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jejb@linux.ibm.com, martin.petersen@oracle.com, lgirdwood@gmail.com,
	broonie@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
	michael@walle.cc, conor.dooley@microchip.com, chu.stanley@gmail.com,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
	naomi.chu@mediatek.com, ed.tsai@mediatek.com
Subject: Re: [PATCH v1] dt-bindings: ufs: mediatek,ufs: Update maintainer
 information in mediatek,ufs.yaml
Message-ID: <20251031162813.GA912533-robh@kernel.org>
References: <20251031122008.1517549-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031122008.1517549-1-peter.wang@mediatek.com>
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

On Fri, Oct 31, 2025 at 08:19:12PM +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> Replace Stanley Chu with me and Chaotian in the maintainers field,
> since his email address is no longer active.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

The ufs-phy binding also needs updating. You can do a single patch and 
I'll take it.

Rob

