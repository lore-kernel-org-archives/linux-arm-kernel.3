Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1649C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 23:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xeeOHiQmCewMvU5/2XDoaHNz2BGzcdbJPohQiaaKAgQ=; b=Z+VIVnUSG0xsnZoiJ+hQRq8S1h
	eLSOnbqB6KNcdQY9wyqCY9jt2RUImelOiNWQ0RVz6IGHvhdGFA19pIO2VKAfr0BFJZLLyPOspNABD
	LHWGBHLEHBIL/P1sLQx+NjFZBa39eoEeEpZ/qEhIj0GvbLQlaZuphT7u970qa5wDpLUZtg6tAFimM
	SnYZrwGmt1mbWvVF5XEZFOiFNN5JJEPv4y6z5yZXNl0zUGzRZfsIKbmHPuCscdne0CuNhOwxmTDuQ
	tbYfLuJXbuhl4x/KXwnVFJUUeff8EnS5gUtk/O4nYxNMn+2M491Zku9Np+fmgDhlCaZ60I7QQAYcP
	HY5jiQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u70p8-00000005Q8S-2DDr;
	Mon, 21 Apr 2025 23:45:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u70nG-00000005Q1L-2JxE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 23:43:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 044ACA4BDE3;
	Mon, 21 Apr 2025 23:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D67C4CEE4;
	Mon, 21 Apr 2025 23:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745278996;
	bh=xeeOHiQmCewMvU5/2XDoaHNz2BGzcdbJPohQiaaKAgQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lwerwgBNrKIM3h4p8C8Oc1iW4eOmXCmgBpjmITGovIDzIP/5hOod1SE5na8L11kU4
	 ZNSuobcDDE4PshrcRGARzTJ/ekBNhdpZCOhufVnZlDnhR9G7LgGikTFBHVKKYmssKG
	 e+Mw7mYLrkvaj7LRzYx6hNMmh7WxosKRhzg39SYFVKqiREhqvew6hGGFJ5yXs00FAO
	 zd+JLST472pk8jx2sG21RoafSCjEXThOoJzlOVX4mTUBi5m+I3Fw28Yq8zotQ0Y/JF
	 jtDsJXtOAoLxcJwTZZQGV9W47/AOHRjfxMokI98jl6Ql/i12Igbpvfp3kItEeWQVC2
	 pA55EzrncJ0Cw==
Date: Mon, 21 Apr 2025 16:43:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
Cc: Colin Ian King <colin.i.king@gmail.com>, "Pandey, Radhey Shyam"
 <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, "Simek, Michal" <michal.simek@amd.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "kernel-janitors@vger.kernel.org"
 <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] net: axienet: Fix spelling mistake "archecture"
 -> "architecture"
Message-ID: <20250421164315.5e09f02d@kernel.org>
In-Reply-To: <BL3PR12MB6571DC0AA8A521078E442E48C9B82@BL3PR12MB6571.namprd12.prod.outlook.com>
References: <20250418112447.533746-1-colin.i.king@gmail.com>
	<BL3PR12MB6571DC0AA8A521078E442E48C9B82@BL3PR12MB6571.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_164318_662675_59B07CC2 
X-CRM114-Status: UNSURE (   5.27  )
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

On Mon, 21 Apr 2025 05:34:01 +0000 Gupta, Suraj wrote:
> Please add Fixes

Fixes tags are for code bugs, FWIW, no need here

