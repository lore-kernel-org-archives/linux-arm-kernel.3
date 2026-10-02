Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E868CCA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGEaSpoZvoET9V5FtqUSRMfYIQ5YULrJRJ1KA1LZnMw=; b=KZjCldvNwyU0rpoAgzxxqsrPMv
	5I4/8RikrIA2yKRFwnyussIKvdJ3gFq8gTpL2+TCk57I5GNzx9ScngbDV4EsUKg2TzVgSmgUS+iop
	aGnXkZKknnrrCCi1nywaoQUgXvqmldJP3b+0cLhY5qEgaXYQUs8FipiOSVjKn7N0LIxql+c6s88aW
	f+kVOIz1e7r2lguyGw+VMbmgVFfpX19iF9Tozw4f6iz3o39+ZbPq/zJTjjyefG0pT1cNLBdhAyGP3
	e16BJBILc5pelbCISZPceoGNTDLcJBODd/rzun///FOxQlbmb5QeTK7J3VcFEL91N/2lZktC0ZZm+
	r9vbYAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHB-0000000B4Qw-3dbc;
	Fri, 02 Oct 2026 09:09:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHA-0000000B4Q7-30H0;
	Fri, 02 Oct 2026 09:09:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ED4842E5E;
	Fri,  2 Oct 2026 09:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256A01F000FF;
	Fri,  2 Oct 2026 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932196;
	bh=YGEaSpoZvoET9V5FtqUSRMfYIQ5YULrJRJ1KA1LZnMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A7wUsDvmdnfgxr06TD6qIRYIuRgaSpLhhefkEn1inuRF1NMdYTMwoPzmqkAfyIpIm
	 RnEiH+WVhAY+npYSJzRpLp/37Ivq3yf89PL7Kgalr0bqOHClh55mKpCBCxQ/d11X+y
	 q1g395NRQ/gsFNQbxAw3cKfCtaEZS0Es2g82SNX/3HgkFy6shvW0WpuU4OTpANO42V
	 /CF/AtPtBMjBTC9Rl5HfgGX+3DO7MZ2vQYAFueUYRTI7dgPp7AZdfFKHUsagxohO1T
	 P35snTUifOcSg9G5ZjRcXr0sHFGWbyPEiZH/4EyB9ygBvy/U1JkDbJ25hlo/yN4OMf
	 J9yP10juxnrzA==
Date: Fri, 2 Oct 2026 11:09:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: BG9OXA <bg9oxa@163.com>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: rockchip: add ALIENTEK
 QuarkPi-CA2
Message-ID: <20261002-armored-robin-of-influence-9a74e1@quoll>
References: <179086264917.29834.5543033479795788817@163.com>
 <179086266302.29834.11881496781543805639@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179086266302.29834.11881496781543805639@163.com>
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

On Thu, Oct 01, 2026 at 09:51:03PM +0800, BG9OXA wrote:
> Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board computer.
> 
> Signed-off-by: BG9OXA <bg9oxa@163.com>

NAK

nothing improved, you just ignored feedback...

Best regards,
Krzysztof


