Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C330E9B245
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZXEawvWngXK7Ii00QWZotYdkchqfauIgprQyPf1qLU=; b=dXfg9eh8BUTSK7UjV8sRSId3JW
	BR4Ew/l4JPe5SAgcq/mSs//5/mVoJwTYnBG2hCMi6TJ2PUmYRpXl75Xf4ZuooU8RxGeFemDzVA5C1
	4nAIHhybP+AF5ojPpK2GpokB5X21JhBYZgSGXMvztzZkjtzwZWcAGo22ghIpECY5V4JIzY1ubPAVT
	OvTw7+RZGlqN0QUqIzH8G4dGHHEUu36ndq4qQ9g9ApljELsLC2H+gXTazjqaQ/ql6092TKKS1/sxi
	ROrsLc5bmmvHZAGwFk6NKvdax69oQabHbkSlPJx62lVBfY7x+P/RP1RNPTCW30Jws3rA854GAFSa/
	n41dd7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoy6-00000001nAp-0boy;
	Tue, 24 Feb 2026 09:44:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoy4-00000001n8k-17iB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:44:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8080440EE;
	Tue, 24 Feb 2026 09:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A84C116D0;
	Tue, 24 Feb 2026 09:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771926274;
	bh=HctdBnsORT395ESB7MJ8tadwd8gBNHYdqC/SecwtrmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CD7uR6J8TOmW2CcKz03WVUfVhQHDSyxUH+yZVjSd+HthiDXWCGBIabhquiZyLGw6m
	 6pAmZ6wg0798MkvysoEY+h/CWsP1K9hvgIemcWPCJE9KcIyHEE5jJRHa6KFvZS/NZl
	 CuUxXtDrT19e1P4ml95+3Pe+w2quTSS7VyCAD26sL5fibgHWWsC7KjEoBR1N7mKZn3
	 Mhr3Q8wtCEDDJxeX9Y8rI34o22rdBAWplxMg3APGvbW3zYK7n3DzkQR4lrMUg/0pFl
	 bn8yo4Mbxx7Ykml1GrGtwae8Ax73XXQrJ4BTSUcsKKO8w0Rn4o+GElPBuiKabKifi9
	 BhKiFVRfSrsDQ==
Date: Tue, 24 Feb 2026 09:44:29 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Chen <peter.chen@cixtech.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC PATCH] mailbox: remove superfluous internal header
Message-ID: <20260224-antique-fair-swift-89e5bc@sudeepholla>
References: <20260224085720.18055-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224085720.18055-2-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_014436_336507_EDA1A9FB 
X-CRM114-Status: UNSURE (   8.77  )
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

On Tue, Feb 24, 2026 at 09:50:21AM +0100, Wolfram Sang wrote:
> Quite some controller drivers use the defines from the internal header
> already. This prevents controller drivers outside the mailbox directory.
> Move the defines to the public controller header to allow this again as
> the defines are not strictly internal anyhow.
> 

Makes sense to me.

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

