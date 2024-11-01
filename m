Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42D5E6F073
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCq+LctH+8M2XcB/KlFxS+W8yysc6UB4ZlFEul9P/p8=; b=r1/jcgM6Gd9/woZwKQ5OuWoHQs
	E6LIuBKUuasT+J39kNUJB/I4Weu/2Pm0s1WYgedOyH1WYfIYJ+BlM9eEykq36C4gG4STbLJNGI4w3
	0TO9Td/3sCSQaC3K8dAD3N/0OXc88eJxRnIPJCP9k0jIpYuEraYVTFlf2txuLbQ2FZYFt6uXHwWa5
	5NgHSp1vH7cuwYx1PAVj/YgPyb45bIzaQUO6YKMx2BX5WShS7ml6nekTf9XQGry/p5WTOXBRnZB3Y
	zGVuwCSszuYKEJPDPUyn0/6LnJGiwGIXYJCTOPFJdXfMA3EQrsCkNbWPCDg8djQG9tuzxs5PEhyjh
	zUHEZkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vdn-00000007s2S-1h6s;
	Fri, 01 Nov 2024 17:40:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vZX-00000007rKz-1mV9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:36:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1AEC7A43101;
	Fri,  1 Nov 2024 17:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2850C4CECD;
	Fri,  1 Nov 2024 17:36:28 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] arm64: Expose ID_AA64ISAR1_EL1.XS to sanitised feature consumers
Date: Fri,  1 Nov 2024 17:36:26 +0000
Message-Id: <173048223698.1108539.8437113781961190311.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031083519.364313-1-maz@kernel.org>
References: <20241031083519.364313-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_103631_549612_339CD14B 
X-CRM114-Status: UNSURE (   7.34  )
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

On Thu, 31 Oct 2024 08:35:19 +0000, Marc Zyngier wrote:
> Despite KVM now being able to deal with XS-tagged TLBIs, we still don't
> expose these feature bits to KVM.
> 
> Plumb in the feature in ID_AA64ISAR1_EL1.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Expose ID_AA64ISAR1_EL1.XS to sanitised feature consumers
      https://git.kernel.org/arm64/c/2287a4c1e118

-- 
Catalin


