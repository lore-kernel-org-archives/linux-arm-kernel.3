Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE077C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amF4/Pi/VqCIl3sHsMkXRBbG9j5ZsZMYCKvDdt4gns4=; b=jUnLn71nybLHeHXE4JCSOvax59
	2hMiVycjIy8nozSHpMFypBkEl9Byrv9zAT4IkjIoYQ9gukkfqOe7Ww331J5ywHX1tONxnwurXsJTe
	oIAo9nAF3kUZXThK2x1lOXc/dTqrqnX4e1g6+6rdGeZ/2pJ6oCYNAz8UgI+ReNih8Dn61h15ncTnu
	iWEAONSjGwcpm8W6qyGCoO99DuBrroX4sXSsaELS2yIzytzyidJSkxSMg4SuO2alZexZpSLQyS1oF
	WOp8l9mzkW2IAsHuRSLc/eiKMK6bjsNuOL7nxhR0fzd8dQP2reeMuMcysdkVwwdPmRwmY1a0ZYN2T
	iqwpA4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TgC-000000027AN-2DTC;
	Fri, 04 Sep 2026 13:10:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tg8-0000000277i-3Uu3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:10:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BA49153B;
	Fri,  4 Sep 2026 06:09:56 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1F2D3F7D8;
	Fri,  4 Sep 2026 06:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788527400; bh=Buk1pSC3h+5PIkfGT8hNX+9x2qy/QYsGPcAeihFCLYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ml3oAUnYoKr6Q2yLnXICRSO6D6Z0iysd96ibV7vkftWobxajbP3Ikm9mjWsQXvabx
	 O4ryFaVeOHgutQCw+YJLDgXcXBsTStJxMRq47XLj2ojqe3C25BhVa3vVGFsl0IOq0y
	 v/mcPUUwTAtphBi4YvB34FNfJc76CQGiwuSaKtIU=
Date: Fri, 4 Sep 2026 14:09:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] coresight: fix typos in comments
Message-ID: <20260904130957.GY8904@e132581.arm.com>
References: <20260904111054.22485-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904111054.22485-1-hemanth.selam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_061001_103139_CD0B3D45 
X-CRM114-Status: UNSURE (   7.45  )
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

On Fri, Sep 04, 2026 at 04:40:51PM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

