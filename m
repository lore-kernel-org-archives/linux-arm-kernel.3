Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7594FC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5fDLQeTV6503ercf2Huaow/yJZlzQpj7cCspdhXDSM=; b=KEZvwLJ22o7ZtNKP05Xk5dekbr
	atF6Yp8togwILi6EbuxPEWU5RwunmO5M+q2jWPi3ZgzWx9jTRoAVRQSlhla+ITeTq7C+TFqzZr2aO
	stb48mMEX8FudhKlmaXbCW5aV/pSuY2deMeJ83s2CK+IgiekDx1tvZMEx4kMglLB5xfXs+mT23TEx
	dnWAc4YfyStlr8zIMDpvg4/bJ+U/jDh3MCPslXKVd3ip4c/CSnz+lwJtoNV/PsD5zrM9umWIamZzg
	MHrDF8iDGu6XLawbS7KEjCgOhboknAV61B+bHHzxVqlx3PRr4Egi4K0m+GlrIOm07+N4PSGzxZXR2
	Ji8gmAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTj3-0000000FIZY-034J;
	Mon, 28 Jul 2025 19:41:33 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugT6l-0000000FG3h-0y3Z;
	Mon, 28 Jul 2025 19:02:04 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 56SJ1s1s024575;
	Mon, 28 Jul 2025 21:01:54 +0200
Date: Mon, 28 Jul 2025 21:01:54 +0200
From: Willy Tarreau <w@1wt.eu>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
        Finley Xiao <finley.xiao@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 3/3] nvmem: rockchip-otp: Add support for rk3562
Message-ID: <20250728190154.GA24527@1wt.eu>
References: <20250415103203.82972-1-kever.yang@rock-chips.com>
 <20250415103203.82972-4-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415103203.82972-4-kever.yang@rock-chips.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_120159_556530_47437BEB 
X-CRM114-Status: UNSURE (   7.88  )
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

On Tue, Apr 15, 2025 at 06:32:03PM +0800, Kever Yang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> This adds the necessary data for handling otp on the rk3562.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Successfully tested with Jonas' patches on top of it on my
Radxa E20C (RK3528):

Tested-by: Willy Tarreau <w@1wt.eu>

Willy

