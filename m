Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C249CC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsBCpby5cP3EVqfoQ56dPnInTrDq6I0O0hcKYWuHpGo=; b=d4wTtVG9TC/Jr06V8Ukx9BOSyp
	/EP3B4nzOp6ZiF1azbHz4YguU+P2mo6YmfhdyA5KOUj6lLkhwFqAAXfS2x01vMBD8EulMGF8RA6rS
	wYMQJi0JTOO8SCm2cMZB4LykO/NrWIEsLOviTFku35xYbQuYQkmJnQ2IXZja/Zd8GNxx0oU4WA/vi
	FlOSQs6ilvMLbRhy9rFuEf3MZ+uWsDnTXeifE3x7qmZ7MBWb85qy5wt2Gf70HcJpg01XiD4BEzoLr
	wpEQpUS56Q8LyU6h1aOj8oS8bvyDd7ez56EYH7kMPjIjwtKgf3Zbq6PsexcWnx4+/EHG8N84H7bLZ
	cVFrPD3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nTD-0000000FA4j-3D1g;
	Wed, 02 Sep 2026 16:05:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nTD-0000000FA4G-0Mpf;
	Wed, 02 Sep 2026 16:05:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F4099600D0;
	Wed,  2 Sep 2026 16:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFE21F000E9;
	Wed,  2 Sep 2026 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788365149;
	bh=EsBCpby5cP3EVqfoQ56dPnInTrDq6I0O0hcKYWuHpGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g+hs68wr5C4K+6FIbXUKb/DVN58+U9LvqjVXSKkMnaS4AcsNrP8b4k3AeADGMwEaw
	 GGWHDSX5AkmZsTXZdi5MH/V9cRHfw/iZ4g+prW5EoLyqCg1mlPgN7jeYCfXcngCQX+
	 iSWYuJd51Tagb+GofcYMUChNHXjsL0EYWMdvIMyAofdIA1OT+rdLXBFKnuChmKChHs
	 dkQiKp/cNmy6NA/rYNmhJyCPVWBRSt0IBCg7ikPxoUG+yDGNvPhqUhMGifHnkzqpIS
	 hAC9UFHeXqEQWwHhHqxnfLI8GQNGZ+R0rLKJPGDlgpHv17kYFyw1T6o+sRuC7+acXJ
	 FUCwZe9adIljA==
Date: Wed, 2 Sep 2026 18:05:32 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: actions: owl-s500: Replace spaces
 indentation with tabs
Message-ID: <7jjnsbrwjqmkgo3rl6urmjeohakl2e6uy7ugdpju5auc4kdczv@c2bvxkxo2jf5>
References: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
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

On Sat, Aug 29, 2026 at 09:41:41PM +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Please take it through ARM SoC tree.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

