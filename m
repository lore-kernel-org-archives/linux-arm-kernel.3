Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34805F513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 00:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLOdAxaaw8hdevuO3Kj+gdWh0W7Oe3qS67WrzYZ+e9c=; b=MjmBzWEI+YXp0HUQqthrw3tet0
	j+D7QfCIjlaHaqzE+JdFWbfsye9mEuvi0I4ToYcxRd/0VM3y5dPVaKhuaTgn8HQRxLa2/Dj3Udcse
	y8nXJcFn5XfMoE0GDEZMFEY7XpGyO0UQwZdZY3nD9iCyg1Vcd+qPwesMSGmIgC/4LoE4h3yMY65hW
	INKcJC+eIBwMrOT3JASTAQiJR2B24Z5joOW6jya5CxG1RBlN6eLasdyC/A4LAF3zG/6ODuzJZLEp2
	6bxTL4i+Bmt6SReOxWa9CPvrvXji/dZ7nnxIRX6OhzHv5F5GVguVA5QTNiKh+dhODHgrCTcj8csnR
	hOtaUxXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIcM-00000002lH7-3ADS;
	Fri, 06 Mar 2026 00:00:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIcK-00000002lGt-3Hbo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 00:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D68EA600B0;
	Fri,  6 Mar 2026 00:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623A4C116C6;
	Fri,  6 Mar 2026 00:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772755231;
	bh=CTb2hC2lLdOPKHXZKqC2oj1apJLsYH2fv+0Gg5r2wWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdBAzlrax82aIF5fwKNMWtXxe+o2/2hT1EJc7j9V02PKVMnHrHSIKNi0k/mYNld4r
	 y5PBAvpoPS5dP3BYBCE4W+LblI1tfcFmPI4QHvhx6piwNc4Y85NYwYtW21I5/6kdW5
	 30eFl/pq1NqtKbG8inBXaqvoesWZBWP89MP2oCyU+eDTsLSnW56QvPDq/DHtdI3kOx
	 9vt9RZTh5/NYgt8Eff+Ys4IIcIsbTxmABEO9HqBM3YCHu28+mH7tUPnP2NIxxobdqC
	 hoqe2ODC5TXZAdUuww7EIJcyFG9b0hbr266SoRnUCGsNuzKACVccAfiIb5K0i1uQ+v
	 oJjq138X9PMeQ==
Date: Thu, 5 Mar 2026 18:00:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] dt-bindings: arm-smmu: Add compatible for Eliza SoC
Message-ID: <177275522958.815424.2683283742395688918.robh@kernel.org>
References: <20260223-eliza-bindings-arm-smmu-v1-1-7a35a76201a5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-eliza-bindings-arm-smmu-v1-1-7a35a76201a5@oss.qualcomm.com>
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


On Mon, 23 Feb 2026 10:46:39 +0200, Abel Vesa wrote:
> Qualcomm Eliza SoC implements arm,mmu-500. Document its compatible.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


