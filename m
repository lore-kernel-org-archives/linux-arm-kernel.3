Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E5CC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zITnVBMJCybcHbhcMTspZI1dafiEBon3xFjBHveQdzo=; b=EoktQwl+FZYianXqTvAuNJE32W
	Hq1UtVwbGdd9Cvp/Gon/OJn4LbyqHE824ZmSMJUJofTVbzpcJ8Em7BxZktNMC1B1vM+YrIWf3RC1G
	9VlBIVZwANeKZCyX8xJXDaGfBCCuQtceTjRVVchmdsxv5/75WtrmslRhn/WG8FyMVa7f6DC2nAiyD
	lH5roMcKq7CE6QZtKXXnkL9crymTyY2xMDhPikIWI/2fNM4/o/od3ZtbsjcvyjUC+EoQlhBN9DpfS
	gtlqIgcN2YXYvHMpZbbRos0icCNhUVc8zOmPqyXWL5MUrmlQDvX+iTXhj0wt7KoPWJXPUTQyRc53+
	8a6RQ5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAaa-00000004fPh-3ER5;
	Mon, 16 Jun 2025 14:13:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9Ne-00000004Rde-3cKN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 12:56:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 925455C54FB;
	Mon, 16 Jun 2025 12:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF48FC4CEEA;
	Mon, 16 Jun 2025 12:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750078565;
	bh=spYR/2xvF+MKkfbF3T4H8ZiASBq5PM0aP8gj+hYX5xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKM+PDe6B26U3+HuDJMqmAsTAWa2DzNlpTuY3RYu4R2Be2sofu+JWv5tIjNjbSJ7P
	 LadpZRYVGXa9SOoqtEdGBiVsiZKla7Dvba9rZSGlDawXQY0ygmf+nFEcLSmlK+hfyY
	 fMkBoCOlwztQgfNsPccigLGVhEcCltszLMZhhf/LmCWCdp/XM1hqKOw6Feb/G/MRf9
	 4h5v1v8AFknIXp5F38hIud1SdIg2rZIczqgxzT6gf1Fgoc9/OEHBLPmXUypCw+TzqW
	 PN2I/GYvRbCrXGr7fP+JUh9O+z1AXn7niqiZPrjIS93p4+l/cPB479aEZJlW6GQJxb
	 gxxOlfXKR7U2g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uR9Nb-0000000020W-16pB;
	Mon, 16 Jun 2025 14:56:03 +0200
Date: Mon, 16 Jun 2025 14:56:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] arm64: defconfig: fix renamed Qualcomm EUSB2 PHY symbol
Message-ID: <aFAUYwB8IqZKFMT6@hovoldconsulting.com>
References: <20250616103252.32642-1-johan+linaro@kernel.org>
 <fdcbaaed-c088-4ccb-8897-bd69080a3346@linaro.org>
 <6232e835-921d-4855-8b10-8f873a4e3c30@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6232e835-921d-4855-8b10-8f873a4e3c30@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_055606_945248_2AF78331 
X-CRM114-Status: GOOD (  16.87  )
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

On Mon, Jun 16, 2025 at 01:23:08PM +0200, Krzysztof Kozlowski wrote:
> On 16/06/2025 13:20, Krzysztof Kozlowski wrote:
> > On 16/06/2025 12:32, Johan Hovold wrote:
> >> The Qualcomm Synopsis EUSB2 PHY driver was recently renamed along with
> >> its Kconfig symbol but the defconfig was never updated (which breaks USB
> >> on a number of Qualcomm platforms).
> >>
> >> Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory")
> >> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> >> Cc: Vinod Koul <vkoul@kernel.org>
> >> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > 
> > Thanks. This was sent on the lists some time ago and since a week is
> > already in pending-fixes. Should be in coming RC as well.
> 
> Uh, now I noticed that due some other work I put it on different fixes
> branch and that fixes branch was not feeding pending-fixes. That's my
> bad, I need to fix my workflow.
> 
> It was in linux-next, though.

Ah, good. I did search the list but apparently only lkml so I missed
that one.

Johan

