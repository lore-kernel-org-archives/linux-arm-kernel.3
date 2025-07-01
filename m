Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD20C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLAQpJpx73Sd85ACs9Vy75P3EDa4RokGPwB1/GszqKk=; b=vFfDo2RQ1KMQxUgpT/RPp246Hi
	vwW8A22tj9fmIVvI7dpYk0qp9EaMCA4rRbxXQy91C2QJnexsIE35F3iYNZgOweiNyoy2esriT7lvk
	/3cgPpZHdR2rnU56VnXzge9pEkAtvDyXbr+6gjF3EVhi3/JcPC0xy+wxLO4KGGPZYFJOMNmO2DVZI
	SZ/gpFOLJotjcw7Ldz3RwDMD1BZLVqrlIUwDhvwBemHQBYRW8VYEI0oR9ulzdvf74zGs0HYTIHaQm
	BR5D9VMjXgdSsbsN8xQ+VxxfYSO4KbrjM19PKbm/21Gk/N3yVYWlAzN4X0qV+wzjzKcG3gd+/ykmj
	nxvvKY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcoX-00000005s79-3HQ0;
	Tue, 01 Jul 2025 15:22:29 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZuS-000000058sh-2Fze
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:16:26 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A303540E0200;
	Tue,  1 Jul 2025 12:16:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id M9cxXZzrn7sa; Tue,  1 Jul 2025 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751372179; bh=pLAQpJpx73Sd85ACs9Vy75P3EDa4RokGPwB1/GszqKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YY9sc2uM8qbv2hmQ/FmOQtv14X/DTyDfqY+auWSgh7QOmEod8dvTy2EJtdL0f8C7U
	 3fKwsGtZjxz3PjkqmRbwSAE9jTc2TWJiisztvJXC/E03zmZQebF5VfF1I12mkkcX24
	 xsZ+wDQm6vF8gXHG7NHzrWvJzMG9CMyc8B4cI02MBM0bLIhVtEHPMA9C53sWhTDh5y
	 AuYhtpT8T9aqhW/d6U27U3B8tE2G9bkwOzgFafst61lrWi+xkcfMGCkGZIomSkNEzj
	 wrT0ZCJKXTPcWLUIeJARggI93QV4jJUSY6+Xrrm3w472hTjVo9Do5zYFMvp7TKUNLm
	 mQnlQZDpew385PsWqK1YbIF47whoX+1pL2pbz7+p45BLyogj/dwdRSnlogMw23eOHX
	 HHFr76XXNriRqBWyotAGJhJvO0/BIQWksV1XY7mlJxFgF7q2jfbLPwepWcPUccTrfx
	 LbjuPaSGM2HyiIHPqXh9hQWeQyv1Q3HzNvIzrMFVCtI+C0rUg8mAY3CWlC+uuyqQm3
	 TUt8BXZ8f1ppIgOY9VADXyB0llGLGBOwcweJkwa1wRSGFHnC4NUl4n6kgZhCqKGk73
	 1fvge9rt1aVWanAYcrP8Epd0HBJD1M668tOxUF74Jtv7WrfzzH6ToER/plvrMDhZCw
	 7sm2M9RseRxu0U2ql50xTTfU=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6861340E01FC;
	Tue,  1 Jul 2025 12:16:09 +0000 (UTC)
Date: Tue, 1 Jul 2025 14:16:08 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH] EDAC/synopsys: Clear the ecc counters at init
Message-ID: <20250701121608.GIaGPRiLn_pmIUvvUO@fat_crate.local>
References: <20250528065650.27646-1-shubhrajyoti.datta@amd.com>
 <20250603090536.GCaD664IbJB5IoR06g@fat_crate.local>
 <SA1PR12MB894764756C6538EE985BDE24816CA@SA1PR12MB8947.namprd12.prod.outlook.com>
 <20250604093735.GAaEAT39KGW1KJDrjD@fat_crate.local>
 <SA1PR12MB89471067967E0A5F46CEE1DF8175A@SA1PR12MB8947.namprd12.prod.outlook.com>
 <20250611164018.GAaEmxctC+ESUCvBNT@fat_crate.local>
 <SA1PR12MB894766DFAD90E9DB15A3268F8174A@SA1PR12MB8947.namprd12.prod.outlook.com>
 <20250626141023.GBaF1UzwF9ITE8-LBQ@fat_crate.local>
 <SA1PR12MB894730DD2C29CB3492C734B38146A@SA1PR12MB8947.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SA1PR12MB894730DD2C29CB3492C734B38146A@SA1PR12MB8947.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_051624_731432_3004DE4F 
X-CRM114-Status: UNSURE (   7.65  )
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

On Mon, Jun 30, 2025 at 09:40:38AM +0000, Datta, Shubhrajyoti wrote:
> - Added a new `platform` enum field to `synps_platform_data` to identify the
>   target hardware platform

Better. Feel free to send a properly tested patch.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

