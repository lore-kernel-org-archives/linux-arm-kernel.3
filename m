Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B344C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 23:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmVOSEsQ731UTS6S95FjRYGHWC6/pxuAi8DA4aZT314=; b=3kKcC9DY7nyPcIqIoZsMp9wrbs
	4+UXcTqAKme7HVUIc2KBrU1EN8QIGi5TAu8c0vOtRoOTE7a4qZYKUrJ8dxyI0kc4Cmw6X7clRoA93
	tkeUa8yy04wwBU+rY2W0TAMO873rID3GkqnP5N0I14GfKyYX+WjgpYNxQJHbu0DWdYxK63CvDiTvG
	DGApm8UfRsSPrCbf1fXiD1B1KCvAM7nO7La9PV7vjmIsiOp/bTiFdIyzSwbn+mBvwSJMNcmYS2pyQ
	I49cleB9Rsfx+LgbdnvXPRnYF2cAUMAmS7TOOxHCFPIWPj/U/KfByRzfyUc77SFdz6CYCuVHrnn/T
	tTYYrq/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj4WR-0000000BSgm-3zCZ;
	Mon, 04 Aug 2025 23:23:15 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj4Tu-0000000BSZt-0jTM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 23:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1754349636;
	bh=pmVOSEsQ731UTS6S95FjRYGHWC6/pxuAi8DA4aZT314=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=K6492FbGGXJ2Sm+Rukrl58+yxjSnKWD7e94Y4RPWSsJdMHXRFjgYookZgShFyU0V8
	 1zZLXPPVCdWfWh6J93XbPnnvqLhS6DH7dZofph7+6f06wxaVfmYznmzEd9c7sIS0va
	 JZxvpBgx4zxssaMnAJSmitVneDrm2nsErDcYd+CI=
Received: by gentwo.org (Postfix, from userid 1003)
	id BC5104038E; Mon,  4 Aug 2025 16:20:36 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id B82524010D;
	Mon,  4 Aug 2025 16:20:36 -0700 (PDT)
Date: Mon, 4 Aug 2025 16:20:36 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Yang Shi <yang@os.amperecomputing.com>
cc: ryan.roberts@arm.com, will@kernel.org, catalin.marinas@arm.com, 
    akpm@linux-foundation.org, Miko.Lenczewski@arm.com, dev.jain@arm.com, 
    scott@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: cpufeature: add AmpereOne to BBML2 allow
 list
In-Reply-To: <20250724221216.1998696-3-yang@os.amperecomputing.com>
Message-ID: <a76994b0-88e4-da30-4524-c8450868763a@gentwo.org>
References: <20250724221216.1998696-1-yang@os.amperecomputing.com> <20250724221216.1998696-3-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_162038_257437_ED2C4B04 
X-CRM114-Status: UNSURE (   6.50  )
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

On Thu, 24 Jul 2025, Yang Shi wrote:

> AmpereOne supports BBML2 without conflict abort, add to the allow list.

Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>


