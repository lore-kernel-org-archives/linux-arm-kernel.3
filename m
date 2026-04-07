Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B20FB519B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 06:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5Ka8+58kjN1SJLg58ax3m/4utMD4NCnmS1hdN1T8qM=; b=uApkmS+34yJ2anydYu8liKPWCJ
	kBlJchNefamgfK13kwbXSIPFZlohMznpf7uhOfOMcxoZx68BqQgwUQjD0nc19CaVob6Q5Jdy1h3Vt
	hnFINNeoipLuIlLhLeoZnFistWcIZeedAH1s0s29KiDtkgPWylzfgmEwwMorFxoUqND2xLi6/u7da
	jmoK0qlsturLlaIY988Ro5NbCYTq2eloAxeap37UdWtsQhhvQM+aeWSU6OxMDcr2U7EqlBZsQVGXe
	dABwx6VSVukRgYSwxyxDvXaEysplqzLnyK0W/HyX+X7EaqmGd2uxBCQ4SMFGMzeg7BXF7mYc1MvYi
	rMw5I9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9zyJ-00000005zda-20B6;
	Tue, 07 Apr 2026 06:31:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9zyH-00000005zd5-1tNO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 06:31:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38525437D6;
	Tue,  7 Apr 2026 06:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82AF0C116C6;
	Tue,  7 Apr 2026 06:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775543492;
	bh=bXTcwbNDsiXrFc3ljW48JmyQKwUopmkQMOxR6xsSBnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ogx4blcbI2hcCwHaWTU0fh2IzbKd4n1tVJSTIgDrAMtZAIttlH5Emg7jUbClX6rr9
	 GCzY86cIq8/ujUsTidEZEeVQVBLHHlMH7hNKI9OlX+bX9lV44SrPgDMzCtcgsfos6H
	 6N/pU1fNUOGIZE2jwCqk+rD2GGB8Ixuz/c7nkH0wGyishQdNKHgPgQFyxDDswvDPvo
	 2uxdburmuPMp+mXcA0bsxRMeqTZ6hJrUC2F81qbCDf6nFsuVftxybLHRCXLRtjpbTS
	 K/My6q4mzBW4Wh6U3cBeDWC6ZvMNOzB7FqS4AzU66A6UKX24Kzqj8yKueB/Ju0vbZP
	 UxIpvRQshtJkg==
Date: Tue, 7 Apr 2026 08:31:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: arm: hpe,gxp: Add HPE GSC platform
 compatible
Message-ID: <20260407-tactful-roadrunner-of-competence-feaeaf@quoll>
References: <20260406143821.1843621-1-nick.hawkins@hpe.com>
 <20260406143821.1843621-2-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406143821.1843621-2-nick.hawkins@hpe.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_233133_508726_A677CA84 
X-CRM114-Status: UNSURE (   6.40  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Apr 06, 2026 at 02:38:18PM +0000, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> From: Nick Hawkins <nick.hawkins@hpe.com>

Duplicated From parts.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


