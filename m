Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDE2CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YboiNlJLrHuwno2dTNAWyyWHcEmx4DdrrYbhMW2x15E=; b=hWfaV5rQBid/nc+QgbH8/FOBcv
	QRfgW6FLGQ8hBixd7yoA1kYK7ivUkXGjMczBMMftwwXfMAXRyhbFgmTOid4nhkTF6rTG4YEGksHs2
	eytLjzaNh6F/qclkJ7oqb+taPrctRc4oYXLPqxxXY+GTdeIiOa/W3cq/JgXzXJrRfA+fjtGst7hPK
	zYEecdrGGJ9wC/MDWTJDfJoWHCeSBVxg153g9RWZ3b3r6Hrn1wMCeFe3SoTdX13CAa3d0uSMOv8hI
	DJRWGv55Gp78SW9i31RMoc8TNN/jD9mubaxzl2zUDDV3Uf08DWr7lTcr5htdCqY7BGaZGPlxV1s2d
	9msAf2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLh1-000000019J5-43YE;
	Thu, 18 Sep 2025 20:57:27 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLgz-000000019Il-1Gwc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 20:57:26 +0000
Date: Thu, 18 Sep 2025 13:57:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758229041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YboiNlJLrHuwno2dTNAWyyWHcEmx4DdrrYbhMW2x15E=;
	b=hMwX8QrH4fVXAwsA6C23vCpsbnXMcPQ5RT3fH0rwp8436N2NIRDg5prPa4eJl3ts0ENGgl
	OnHiTWmb+Yba4LKkFNqLIietZ8lHLPmXh1JuiGOPdIJtj14t/ToyD4SSZmqzMts2ATW2cN
	q31pKLvfhA9Rnm/xi0Hw7bSQ3xPvRAA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 1/2] KVM: arm64: Expose FEAT_LSFE to guests
Message-ID: <aMxyKbnVjS35YuQi@linux.dev>
References: <20250918-arm64-lsfe-v4-0-0abc712101c7@kernel.org>
 <20250918-arm64-lsfe-v4-1-0abc712101c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-arm64-lsfe-v4-1-0abc712101c7@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_135725_487976_305E2A7B 
X-CRM114-Status: UNSURE (   9.17  )
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

On Thu, Sep 18, 2025 at 08:42:06PM +0100, Mark Brown wrote:
> FEAT_LSFE (Large System Float Extension), providing atomic floating point
> memory operations, is optional from v9.5. This feature adds no new
> architectural state, expose the relevant ID register field to guests so
> they can discover it.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

We also need a test in set_id_regs.c selftest for the writability of
this new feature field.

Otherwise:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

