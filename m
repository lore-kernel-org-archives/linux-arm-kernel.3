Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60BACFD62A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzHNlNtdPWJmlEiDjg+ll4gR71pU+DAznDFbG/pCf/w=; b=ll7ketR5h3MaZ/WPW6GZw8gzsW
	sjJ1se+ibHg2FSmpMNRD7reGrLocEzKmph4LygRfypgUh8UgQNLjlbLXEvwAZt47WMzpUDUgIIeU/
	z1fCUdiDnH/7O4VZ43Emok26ZRW3avANwq//1znxgzjPO485kfaKFWDsKzyJebfC+n0SIXqdLyYNE
	zfBFO+3y330gR7PfsPJf0Y3kVS8RNbEJnQOpibwwIhjfruFuxH/Gx1i4uTK8zNixuIYAx73WkaCs+
	GKl6p9vSU4ZxufEeiuNuCmJtLhoyLk1YqgVLi4gzVORoQydVH/i/TrAv87/p3zn94dUX71/vmg8iX
	eFlaNLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTh1-0000000F16T-41pQ;
	Wed, 07 Jan 2026 13:35:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTgx-0000000F15m-3zHH;
	Wed, 07 Jan 2026 13:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 693D941A85;
	Wed,  7 Jan 2026 13:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B44C4CEF7;
	Wed,  7 Jan 2026 13:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767792915;
	bh=tuOxz+2km4OAM2kYT3YnfTTUjzyZ3rQep8bFqqLQo/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p3MuUiTF4qIyHi7ref8Gsr+U3ir/y/lus8o0rUFOH0jrq1LMRtfo4VTwskoIeBjHe
	 AZiVz9GxFH7j8jbdgoJWiRwniaguCAUdFrouwc6XHChvdsLKKB49wnnEw6fZe476Fh
	 zFpIvNUwWcobNitNWgCskLTwnv4ldoUd0Xjszvc3s7BTLzMRb3pOTGSmxWDbcdsReJ
	 oObiDCZnKAcHJn9Wb54Kl4d+2K/PHqE4j2U/cxqAWGqha4LXylEkrjXBdTHIscfOjP
	 VZMNp4QCHQ5n5fQiRCGCGeHVoHIDsqHlQU3z2VVK+6apyrA7Bpm7sVdI39ANDAzFZF
	 KvREPu8kz/KzA==
Date: Wed, 7 Jan 2026 13:35:11 +0000
From: Simon Horman <horms@kernel.org>
To: Sebastian Roland Wolf <Sebastian.Wolf@pace-systems.de>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sebastian Roland Wolf <srw@root533.premium-rootserver.net>
Subject: Re: [PATCH v2] net: mediatek: add null pointer check for hardware
 offloading
Message-ID: <20260107133511.GA345651@kernel.org>
References: <20260103005008.438081-1-Sebastian.Wolf@pace-systems.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103005008.438081-1-Sebastian.Wolf@pace-systems.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_053516_007938_D454DA4C 
X-CRM114-Status: GOOD (  13.38  )
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

On Sat, Jan 03, 2026 at 01:50:08AM +0100, Sebastian Roland Wolf wrote:
> From: Sebastian Roland Wolf <srw@root533.premium-rootserver.net>
> 
> Add a null pointer check to prevent kernel crashes when hardware
> offloading is active on MediaTek devices.
> 
> In some edge cases, the ethernet pointer or its associated netdev
> element can be NULL. Checking these pointers before access is
> mandatory to avoid segmentation faults and kernel oops.
> 
> This improves the robustness of the validation check for mtk_eth
> ingress devices introduced in commit 73cfd947dbdb ("net: mediatek:
> add support for ingress traffic offloading").
> 
> Fixes: 73cfd947dbdb ("net: mediatek: add support for ingress traffic offloading")
> net: mediatek: Add null pointer check to prevent crashes with active hardware offloading.

Hi Sebastian,

I agree that the cited hash is a good commit to reference, but
I think the Fixes line has been mangled. A correct tag for that hash is:

Fixes: 73cfd947dbdb ("net: ethernet: mtk_eth_soc: ppe: prevent ppe update for non-mtk devices")

Also, please no blank line here, between the Fixes line and your Signed-off by.

> 
> Signed-off-by: Sebastian Roland Wolf <Sebastian.Wolf@pace-systems.de>

...

