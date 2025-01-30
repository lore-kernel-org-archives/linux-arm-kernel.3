Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96D0C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oywiWpqp9MHAJmy7yiw10FCHgBbJNJ/Gz1pBV3c1gUc=; b=zZbGrFu4xtuB4ROC00u1Anbo2t
	eib+4Lp9ZKGf1vVRj6IACzxJgLRJNZ7OWclPWNZ4PNzE6kHw6sy2iJFRVcStmKAlxHDv019yNJ34p
	qAsYwmMTGQpf163COdkqmkemGWveYzu/3PLI4mHS65wmDYuyDbzNodwg6B3wTEFvST3puzkNJFN3i
	rUdNpqlQvC3F/LWycDfz8O7Ws3GpODtg4fLdcXMRYBE/7elt5r+BzNUVq82BQzbKgVP6zmT9xAcl3
	Od99i7aSh3my48IsJXLxUSTBYK+SxJXBRFfoUf5y3bmDJ2eD1sL7STPwIIl9TLcwgGWK8nAVyCWtQ
	bq9J1naA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tde6g-00000009ngu-2aJ8;
	Thu, 30 Jan 2025 23:37:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tde3p-00000009nL4-2CDU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:35:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 082675C4C37;
	Thu, 30 Jan 2025 23:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911D7C4CED2;
	Thu, 30 Jan 2025 23:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738280100;
	bh=vhCAXi5gATiTUMD6D3daRi6pgOs0C1CHPFUGunc9oCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKxSJRTmiqLshyZAuW7i+DWArHiaKThgo09MstJssF1KXGMwY9uwBAsvlCO835a5Q
	 ORK19yjfzIdV+bR/kSpvChLZgD41hs7VIMyZOJQOgYYVlgKS/gewfe0KavAMWuuv1A
	 qzunCkmpnAHfhRReTSflacNnACpQGFrDob+FSmO1DOUZz1cAfkeSvnS+rg9I9UQltT
	 PMw2DpA4MoiPjSTniKRCEjaTx/oc5rwmVlcg0uvyytF8xygTcLMcIs8zX597+v1LJB
	 1pLQWI0k/UL5i3qwXebK5gV9vAWM2DsEfFEwRKUV4UzYgZVUjV4f9s/p18QOZGBsvP
	 pMhnvdGu5GXrA==
Date: Thu, 30 Jan 2025 17:34:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 03/16] dt-bindings: sram: Add microchip,sama7d65-sram
Message-ID: <173828009922.1871682.9459658667498984650.robh@kernel.org>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
 <e0cdc69ebb34b71135321841a0fe682ede104d79.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0cdc69ebb34b71135321841a0fe682ede104d79.1738257860.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_153501_604819_47FA93B8 
X-CRM114-Status: UNSURE (   8.51  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, lee@kernel.org, linux@armlinux.org.uk, claudiu.beznea@tuxon.dev, conor+dt@kernel.org, p.zabel@pengutronix.de, sre@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Thu, 30 Jan 2025 10:33:43 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add microchip,sama7d65-sram compatibility to DT binding documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


