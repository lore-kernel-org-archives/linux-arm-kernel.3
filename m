Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A5CC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6u94brVRmQ5gjTC08szwhY3RZs3X5r8tNjx4Ultd7E=; b=cwI+1EpqBUnUS5uAyUPPg0NfiQ
	6NXeHraSOAz6PqZfL1HxV9ezFkV9y2mjG7VCyNmfvdxA0DvQYiHjCrifTO+CpXRNcA7Fe+26/atlF
	zr3Xp8qgjOD5zYmDZIpGKMayNVGIvldTDFkCD1LfqpFCNjNPalL1ayafKCatuGE5BKY7e7M+BvYmR
	COMVG6NQLOQCsL1xUk+vGfTre4lLKwq7WAhs/CG6fI6H6ulfWc4AERYavehdK2Alab+QixYdC8CCo
	8aB2f35uk7UOEcrYuiygosdGjkgHnTfCPz5nvx5YV58OcAv1+FBhZg+5dU/2ld2D6WwU2vXkgrsOh
	i5oWMeQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUP2-00000008i9B-0oU7;
	Wed, 09 Jul 2025 13:00:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSF9-00000008LBJ-1XAP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:41:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29263150C;
	Wed,  9 Jul 2025 03:41:27 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9BC23F694;
	Wed,  9 Jul 2025 03:41:37 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwtracing: coresight: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Wed,  9 Jul 2025 11:41:26 +0100
Message-ID: <175205766742.267347.15415211395025557807.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703183534.2075569-1-robh@kernel.org>
References: <20250703183534.2075569-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_034139_452869_78DD9C69 
X-CRM114-Status: UNSURE (   5.69  )
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


On Thu, 03 Jul 2025 13:35:33 -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> 

Applied, thanks!

[1/1] hwtracing: coresight: Use of_reserved_mem_region_to_resource() for "memory-region"
      https://git.kernel.org/coresight/c/f0148bd7

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

