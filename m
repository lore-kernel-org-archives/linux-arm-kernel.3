Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999531112244
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKBSH1wtWBpwSruvsrmH6CpCRaR+DEEYycoYIXCD1QM=; b=rfQqEW/Y2pBQ3veeKio0IW3kFm
	dsqs9APU768Iz2DfUqxl4ez72ApZbjOAGU5LSa+MGzZQVCv/akBuOn9Wdn2XZFcB2JJgToKoG/RO+
	CINlRSXbg4OJXvrC2q6ma0v0OLk03PbbykjIGTh0ZfJ+3rODbPrtIn1WwV/CBqWw14fq0EFgLQzGQ
	aqwctU6SJe+YgPFivowVaL0rwmfwBGgfASnldWvjCMUZME8ZE+XPrloB5PVnPX6oF1xH0uuKMsyU+
	hJROG0tMu91AXZXy661Nf8/81jMFKNAMFUOUcnBkmY9/9lSOYJJe8iZaDroe1KXtauOEg0dh0lBRP
	ASzaw7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w85Bx-0000000GS2Z-2Gzz;
	Wed, 01 Apr 2026 23:41:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w85Bv-0000000GS2M-2u4W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 23:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53F85600CB;
	Wed,  1 Apr 2026 23:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9B2C4CEF7;
	Wed,  1 Apr 2026 23:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775086902;
	bh=gN4hivXJdZhMCDtFZTLE02AlhGI7gMy3Za7afn2x0ks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3YOr5rp9aVVK+XrE43E70EPT4m7Iu1o7iV3qHYHuAjfNWpblUT3QvzVnmi340aYF
	 dpbxq60t+X5FM4XLrxnUxBe2wdkSIj4xEnnVhnX1s88Kh3nqOQiEmuY7OCOGWFdOc2
	 gySaeOhN8J8JdMkYBbONeE+z+F4NlxuiGsspU2iYChCmsVtuHe9xChHL5OEYF2QmQx
	 BMFkFW98SpEWEZWDsFydShQm2Kc1tgLBcv084BIJcMoOEqaTEZrVRB9RyYbumMZ9hN
	 8Oastbs2IBaeebaCDo7XzrOTQt1iDJdCQsjU+CTUCD/KYjsTL5gE6XUjF+E31FbmDV
	 vM4I3wcomRCTw==
Date: Thu, 2 Apr 2026 01:41:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v12 0/7] i2c: xiic: use generic device property accessors
Message-ID: <ac2r9m9mSMZxgHwN@zenone.zhora.eu>
References: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
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

> Abdurrahman Hussain (7):
>       i2c: xiic: switch to devres managed APIs
>       i2c: xiic: remove duplicate error message
>       i2c: xiic: switch to generic device property accessors
>       i2c: xiic: cosmetic cleanup
>       i2c: xiic: cosmetic: use resource format specifier in debug log
>       i2c: xiic: use numbered adapter registration
>       i2c: xiic: skip input clock setup on non-OF systems

Good job Abdurrahman, thanks for following up in all the rounds
of reviews. I finally merged your patch in i2c/i2c-host.

Thanks,
Andi


