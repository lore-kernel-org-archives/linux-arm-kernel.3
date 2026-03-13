Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEA1107BCCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AI9IHrRtf0ZTOrhrRzmATMURFhZXu6b3y7qVp28yt4s=; b=VOw4/tES9Vq5AC8imzdkhAVwv6
	N4X2PS+Dd5uqtctRKNKFTYV9ZUFK0c2yg+PcG1uVLn+Dbp2zovoQSfhSL9ntAyGGiesPe41tVh3KA
	jFxyMcfPqChReYJLK9RUptgwiLqUW1TMqh1l+cIjtOT7LLWwwoYoPxBvuGqmZiHbu+EzG6mdKm4FO
	IH9Jw3/ZB7qL7jqAnuPjjX80RzEmt0yXSJJf5xYLvkEKVajFnTm8y1kui9ln/wPZOlvxRTuqlpBSi
	XVhxP+Jw4/OZAICGxgQoId4yz6Cy/x1Qfo4kG+0yLSVi9qKy3ButgbMwfbF4mbnGhp1mkri02nYLO
	FMsN1cnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15c8-00000000gBk-05WG;
	Fri, 13 Mar 2026 16:43:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15c5-00000000gBP-2DSu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:43:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ED9A176A;
	Fri, 13 Mar 2026 09:43:42 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CBC73F7BD;
	Fri, 13 Mar 2026 09:43:46 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:43:44 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	oupton@kernel.org, miko.lenczewski@arm.com, kevin.brodsky@arm.com,
	broonie@kernel.org, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, joey.gouly@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v15 5/8] arm64: futex: support futex with FEAT_LSUI
Message-ID: <abQ-wLJj8MZfe5tS@arm.com>
References: <20260227151705.1275328-1-yeoreum.yun@arm.com>
 <20260227151705.1275328-6-yeoreum.yun@arm.com>
 <abMDOC5DYEm74And@arm.com>
 <abPXrvl9tC+nv6q9@e129823.arm.com>
 <abQiSiX_xxjSY96-@arm.com>
 <abQlhhSDkmzUugMW@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abQlhhSDkmzUugMW@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094349_604444_FD03144E 
X-CRM114-Status: UNSURE (   7.22  )
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

On Fri, Mar 13, 2026 at 02:56:06PM +0000, Yeoreum Yun wrote:
> Thanks for confirmation, I've changed them as we discussed.
> But let me sent it on v7.0-rc4 based with v17.

No need to rebase to -rc4 unless there are some features you depend on.
The arm64 for-next/core branch is based on -rc3.

> (Unfortunately, I sent v16 yesterday with missing of those review in
> this thread).

No worries.

Thanks.

-- 
Catalin

