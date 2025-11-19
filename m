Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4A0CF58C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r07kmpMYU260b8TaUjt54o6pMoKxD4sOKX0bkbUbVWc=; b=OVuE82PzZQPM3xKotYcykQK8zn
	Aya0BXMlkQiLdzk4bHaNJsZp52PGI1urko2qjFQPIc824xEtK1+7MyULbG6RlDLCpp0qbGnrsaSej
	tAlWg+2pHf1iHS7hWAdCbWqQ94e+fAJS8cjHvjO7eIFLuPeSfRHw/PvURyIRT/PDJ0wA1s+jVOOjn
	o7P5JLG1B72tA9BMuMGgdOmVEcZGKsl7g0Ig6ZjfrTIkDy2yaBgaPaAId2XEmIhH8KwxrBaz8+JfG
	1luOmj09p9efR4d/RpVffwejExx4SQuN99KTZkACxImmXu3UM9UYmkeKprUPzQ0EWMorZ/XtsPRWx
	GlQ1bIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmZa-00000004Pkc-3pK3;
	Wed, 19 Nov 2025 18:06:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmZY-00000004Pj7-3onn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:06:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02B9CFEC;
	Wed, 19 Nov 2025 10:06:20 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C7D03F740;
	Wed, 19 Nov 2025 10:06:25 -0800 (PST)
Date: Wed, 19 Nov 2025 18:06:23 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: Dev Jain <dev.jain@arm.com>, will@kernel.org, ryan.roberts@arm.com,
	rppt@kernel.org, shijie@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/pageattr: Propagate return value from
 __change_memory_common
Message-ID: <aR4HH1WyCzQk8sqJ@arm.com>
References: <20251112062716.64801-1-dev.jain@arm.com>
 <20251112062716.64801-2-dev.jain@arm.com>
 <3aa3558d-cfc6-43a1-8c73-9b01ed1e2b3e@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aa3558d-cfc6-43a1-8c73-9b01ed1e2b3e@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_100629_012793_FCA7F753 
X-CRM114-Status: UNSURE (   8.24  )
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

On Wed, Nov 12, 2025 at 02:27:49PM -0800, Yang Shi wrote:
> The fix looks good to me. Reviewed-by: Yang Shi
> <yang@os.amperecomputing.com>

BTW, I think tools like b4 which I use to apply patches will ignored the
reviewed-by tag as it's not on a separate line (I haven't checked the
latest b4 version but I've seen it happening in the past).

-- 
Catalin

