Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0ADCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 09:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dJAIrAjhjxcyvz9oV+xoiaVLLnVm/pZD3w+TP4HzxY=; b=jI6ZI1wU4TwPldpx9ccLzFtBCM
	3lDprcMfgtcBWEr2INYX0vyU2SKH4HAk3xQGLbRJZZVKKivuZbsKV1f02OSMQHYtXAJ0l27LNqSoC
	/fIVjlS4BJIe+ak+v1fmUxkKouUjhrLQ6FgsZjcxqImeiFuwQeCJ59J8+ueIuZOonz94I9KiWRnJd
	bo9BcJQA1xns6GLkTY8sEZCIiGW0qMTM1bFkJdGU4S4Rd3s/MT6bee0nZ8Z/g4db28dgfi1HUp0Ff
	0CTkrINjZD8yJv3AASge7YR7xxG1ASrkdy+CdOTa2nG13hCzeNWxzYD7jsZtJDHcoYkaD2yKneQd9
	OBz6FIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENWl-000000020ky-20A1;
	Wed, 07 Oct 2026 09:01:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENWk-000000020kn-1VmK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 09:01:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 619BA60238;
	Wed,  7 Oct 2026 09:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1C71F00A06;
	Wed,  7 Oct 2026 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791363689;
	bh=7dJAIrAjhjxcyvz9oV+xoiaVLLnVm/pZD3w+TP4HzxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lsjKNZK2WBQ7sax84EecjI8cnKrPGrizIUN1kNyLVFPwJQhmjKmEBb44Qelpnhkx5
	 dLYREZtdPYRsdhQ0a+qdyB3O39spA9fvgMx3KTop3jf5xaRzsHFCFY8+hZtcBsZwAZ
	 6wXgW/O4PKRgzxdrBHqH9cqT5SpIp9j2ZQXQ3KHgvem70erGGG3kCDL4EV4vdKjSUz
	 58IYdv+mnHPhjNm1cnhZ+UbwPiJz5/8fmrC9DdMdwvTDl3sq9thr202AX3K6ae9NUJ
	 HMVkwk4OumMGjUGVkynHeN7IinIJdp7UStpySCvfbdlPR7WI0eCr76bipfWZyHEELk
	 HbvqEkYWEITYQ==
Date: Wed, 7 Oct 2026 10:01:23 +0100
From: Will Deacon <will@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, joro@8bytes.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, kernel-team@android.com,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord
 SoC
Message-ID: <asYKYzDvNBLjnotz@willie-the-truck>
References: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
 <179095635040.2123203.12001281676860626455.b4-ty@kernel.org>
 <asW7Lay9i_hiuTcP@QCOM-aGQu4IUr3Y>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asW7Lay9i_hiuTcP@QCOM-aGQu4IUr3Y>
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

On Wed, Oct 07, 2026 at 11:23:25AM +0800, Shawn Guo wrote:
> On Fri, Oct 02, 2026 at 05:46:40PM +0100, Will Deacon wrote:
> > On Wed, 02 Sep 2026 09:38:58 +0800, Shawn Guo wrote:
> > > Add specific compatible string to document the GPU SMMU present on
> > > Nord SoC, and constrain it to the single HLOS vote clock.
> > > 
> > > 
> > 
> > Applied to iommu (arm/smmu/bindings), thanks!
> > 
> > [1/1] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
> >       https://git.kernel.org/iommu/c/e9da5ec4a1d6
> 
> Hi Will,
> 
> Could we get this into linux-next please?

I'm hoping Joerg can rebuild the 'next' branch soon, but it's LPC this
week so I know that everybody is busy.

Will

