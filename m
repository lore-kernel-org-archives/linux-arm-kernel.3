Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EF6CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tf3LWXKU+gR3zlJtLFtS4/H1jz1r6YhuQkB47pa4hXU=; b=YUfCqOuUYxp42s6KX+duCBvBo+
	EbKo6Zm+QfeEpn/OWx5QEv81WmB+3Hb6vqKFr+cWhlnqku1Fl6gUyDaeCkXaZdUrngmJucyeZfWFi
	pSlmcaPy2M0d67vN6hyGfutqAHgJsTWLRenMhgCydj/FL2tA3ebb0rOd9tSxePOv4Hnfx6GxrKmmO
	YzwcKe83h4Klrfa0PtlptFjWNIahny1JSQ5b6/bV0IXJKeUm/PELwCafXY4P5MqR/cxvMdj3P30hp
	QiF2nVdHPx0ICxUUhuMDCe0Qj17w6038ApIyTDgl1xq+CDawUdOKouvNr49N+n+uK5cm6bFsLa3ve
	t4fwo0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWDR-00000003RBl-2pst;
	Tue, 29 Sep 2026 11:41:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWDQ-00000003RBb-1tMS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:41:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 074C640602;
	Tue, 29 Sep 2026 11:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662161F00893;
	Tue, 29 Sep 2026 11:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790682103;
	bh=tf3LWXKU+gR3zlJtLFtS4/H1jz1r6YhuQkB47pa4hXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d940tbRwwR8NEwHkMpZn5KYXeqbS3Abmxl3YE2EE7GcP/CO0xnBr98czUyUUspKah
	 1GjvBr1z/uy620X6G+uTNih3vMmXjpmX27t03rOv3r/hDFxeG63yo3RF4+AuX0FYrT
	 btNsb7XXSzppQcLhPyGotJoT5Tl/Fa+eIMkMIJQD+C/B61ptEZl7brqeyLfZeliR75
	 +QOOYlXIwWyULludOWMGxUEEermNO9yNsqUxScScF6+s/v0euL145J2qApTW/DacOX
	 l8PykdfCAxzyVBFcwAl8huV1fTWzK4jNOka4u4Q+WN+uYWJsqUa5SLF2m5pXSPitmO
	 h5IulB3DP4dFg==
Date: Tue, 29 Sep 2026 12:41:38 +0100
From: Will Deacon <will@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord
 SoC
Message-ID: <aruj8uLUUiuKfJpp@willie-the-truck>
References: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
 <arpNicG_jUzh1ZrL@QCOM-aGQu4IUr3Y>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arpNicG_jUzh1ZrL@QCOM-aGQu4IUr3Y>
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

On Mon, Sep 28, 2026 at 07:20:41PM +0800, Shawn Guo wrote:
> On Wed, Sep 02, 2026 at 09:38:58AM +0800, Shawn Guo wrote:
> > Add specific compatible string to document the GPU SMMU present on
> > Nord SoC, and constrain it to the single HLOS vote clock.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > Changes for v2:
> > - Add the missing HLOS vote clock constraint
> > - Link to v1: https://lore.kernel.org/all/20260901140816.74200-1-shengchao.guo@oss.qualcomm.com/
> 
> Hi Will,
> 
> Would you pick up this change? Or are you okay with that we route this
> change via arm-soc tree?

I'll grab it, I'm just thousands of patches behind atm

Will

