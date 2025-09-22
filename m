Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EE5CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPeUZTeUKrWZHsB5N87gJTNWT0XLGYP07Mvm2N4bXWg=; b=R/C4ec7cuqE0cFQ3LbE/dsHrx8
	ZaSMXl3fP8waTa8EtSoJWAe4v9M+hMi1kmztgq12jRQhCxeZzQqo8WOb1lH0Qk+HlJiZWLN3sM8cb
	vBeGqDA1ukxQUzKPLF7AHYErnlUtNXF/brD5QEgBzWoK3Q1XscLEXf5mjBB7KShXSqL0dCxiSXTeQ
	zmqgykAVBvomfXeVwFv5lg68vaCjXwqp2moIQ6fb9zly7XeD09su6TsynoZ93Py90xh4B53rpGbA2
	m2ob+HKz25MrzuD9jVBcv4JJ2I5NonaAxYPUSnc4wqknRjDbXIBqrB9ZC3AYg17wKRrL5KOGVAxNV
	tMgP9BTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ih5-0000000Art9-2rSd;
	Mon, 22 Sep 2025 15:43:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ih3-0000000ArsJ-48l6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 15:43:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D743601AA;
	Mon, 22 Sep 2025 15:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95D5C4CEF0;
	Mon, 22 Sep 2025 15:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555789;
	bh=Wg1EJ3SHV9/DAbJxBesxVWBP9MLRgk/GFLNrpDnYIyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LNLi4hypzskGlQOtpt4jZfwz4XHoN1tWGiT0PR/mwSJFm3L/hgIAkGjgfrox3x6R0
	 JQAuVRZxJdKfImwGSfFRuJ9SOCsh0xbcGxnvbozJlnMJlIXEh5rnNWZ7bc6ECpNbbN
	 1dTMOUU/BZmG3EYivkG/bqMfj1eyITR4RqIQFf8Q0f6dKomL8wWWOLc5xm5sJwjUl5
	 4x3Vw9S3gAALjWLJzWBckd/biRjswV3NiuoDom6C36UqSzFxSRd9UovyjJGFFvd5YT
	 o7HqdgmY2rLMFvEon8zZllSCn9938pl11IGRo+AeG0mAWsPZiGLWff5Lbmu3dsU7PB
	 txS5WIYwEjC6g==
Date: Mon, 22 Sep 2025 10:43:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos9610 compatible
Message-ID: <175855578574.38279.9654529189810333090.robh@kernel.org>
References: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
 <20250914-exynos9610-chipid-v1-1-ade99e09a23c@chimac.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914-exynos9610-chipid-v1-1-ade99e09a23c@chimac.ro>
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


On Sun, 14 Sep 2025 19:50:28 +0000, Alexandru Chimac wrote:
> Add a compatible for the "samsung,exynos9610-chipid" node, used by
> Exynos9610 platforms.
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


