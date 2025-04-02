Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33042C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 21:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dCoGpCwH6RrLl/7QL1y9s7XKeVIbd2DmNC4uWlkFd4=; b=nNLMhB6ZUiIrLpt7RR39jjR7SI
	RMe+Nupr24Bfo/6iiz3n19gq+TtH+QGtAqint4FyfQzVnOjmopVHAomveffLDla3nhy0uXTVKHMPt
	EDsO5Knx12UCpQ6FnaZG53r6wePSNei+7mmG8dnLiwbUwfqovwZCtnO31xIxVg/6UYgao8owJF9rR
	UFn3ibXdXgG8VK29Qx1+VR1keZ6QqC+3uH2nC+BVzMTDDWY2NSTk2S8xt/Z2l3Ige/ZKRHFRAwpFe
	iwo7RwV7QSkLiSPqiBDNiBGc7kkdK2PL8x1t6RmCddLiHo5/EnT4slYe9TQ6rSwzkSekXzh82vuuy
	5s6diOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u05Pf-00000007Dzq-481V;
	Wed, 02 Apr 2025 21:14:19 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u05Nt-00000007DiM-46xn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 21:12:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743628347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9dCoGpCwH6RrLl/7QL1y9s7XKeVIbd2DmNC4uWlkFd4=;
	b=omvOSSVuBmj7jlYvpyMuRjtPDPyhP3FKDP04H1y2CgwawijSONQ8gZsXpybmYSqNUbAfA8
	geUJfJ4tVHct1UVuFAuPvbESC/LSlz6xeC5b7il+jDlPPtCyzWuUSOJ1kubQHdLAQKy6C6
	NsFUmYbbjSKkpqqTjfSKQY5XSOgsbfw=
From: Oliver Upton <oliver.upton@linux.dev>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@arm.com,
	Chen Ni <nichen@iscas.ac.cn>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] smccc: kvm_guest: Remove unneeded semicolon
Date: Wed,  2 Apr 2025 14:11:14 -0700
Message-Id: <174362825118.2996340.1658211451849411034.b4-ty@linux.dev>
In-Reply-To: <20250326040659.1190696-1-nichen@iscas.ac.cn>
References: <20250326040659.1190696-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_141230_222347_F5E445FC 
X-CRM114-Status: UNSURE (   6.19  )
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

On Wed, 26 Mar 2025 12:06:59 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied to fixes, thanks!

[1/1] smccc: kvm_guest: Remove unneeded semicolon
      https://git.kernel.org/kvmarm/kvmarm/c/1f5bdd3b0c70

--
Best,
Oliver

