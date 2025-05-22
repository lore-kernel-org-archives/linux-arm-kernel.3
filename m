Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF0CC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 11:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D30c4LpbKJGTLV3TDgbPM1yl7EfEP9gR4/PJue8vafM=; b=IVhfFRDNAq2S7Ar2uedtL4JfZm
	542+KGvkS11xaV4nlS184NUzo5kkQLhieewI0iPSxcnFeQpma6GfsyK4TvGS3L2V7KSNBNjyQwLWZ
	XGkEOf3vsMe/IPg3wWd9HivwqLMqs/u0IpL4RPe8s/eoYKIjb3r815X1klyglXOPOkJ5XtH65qFc2
	NnOq0HvjsQS3GJaEDXURbWeYVjEHX/MvtHLaqdPRj1vnkspu7eYJpOga2PP1iciCf5ft8BGm8AnVT
	WUCHggSQUnfniSqU1Lz013LvCvoX5LXUjDIrZd9HGjG4Bo2Gv0zT44jzwinoSuplE1SCNbunps0VG
	GX/Oc9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI49T-00000000sFK-3fpX;
	Thu, 22 May 2025 11:31:55 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI47O-00000000ry7-47rg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 11:29:48 +0000
Date: Thu, 22 May 2025 07:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747913382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D30c4LpbKJGTLV3TDgbPM1yl7EfEP9gR4/PJue8vafM=;
	b=O3Qiqb2oTyWCjy+2mmqUGHpQUwP6BkMOcfELHuASHOWiSQktk1CGwhXna+jFxOqNJcc5Q6
	2MGd7pHqhmhSEa9T8Ub/KpvZ7p5AmNSPC2T3/J7I7mK4HpsQebDcYLxO6sfzrNJCl/Rwyi
	V2jPLFBTqPjBlkh3gjjmkOmjdkEEE6M=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>, 
	"linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: error: the frame size of 1552 bytes is larger than 1280 bytes
 when building bcachefs
Message-ID: <oelk3icaqi6d4qpd2lymmybnk4ah7wwydz53zihxrhula2adfr@3dsd263tjibo>
References: <PAXPR04MB845954FBBF2AD810B17536138899A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <d8e9f098-49a2-4f1e-a6a5-7a6437658d93@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8e9f098-49a2-4f1e-a6a5-7a6437658d93@app.fastmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_042947_231622_E6C5C5DF 
X-CRM114-Status: GOOD (  15.64  )
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

On Thu, May 22, 2025 at 01:23:56PM +0200, Arnd Bergmann wrote:
> On Thu, May 22, 2025, at 08:39, Peng Fan wrote:
> > Hi Kent, Arnd
> >
> > There is below build error with "make ARCH=arm randconfig; make"
> >
> > fs/bcachefs/data_update.c: In function 
> > '__bch2_data_update_index_update':
> > fs/bcachefs/data_update.c:439:1: error: the frame size of 1552 bytes is 
> > larger than 1280 bytes [-Werror=frame-larger-than=]
> 
> Right, I think that's been the case with bcachefs since the start,
> and I see it with allmodconfig as well, the problem being mostly
> CONFIG_KASAN_STACK.
> 
> There are a couple of bcachefs functions that have an unusual number
> of local struct variables in them, and KASAN_STACK adds a redzone
> around each one of them, further increasing the size.
> 
> When I add "depends on !KASAN_STACK" to bcachefs, I see all
> randconfig builds succeeding, but that may not be the best
> solution.

Post 6.16, all the bcachefs functions I know of with high stack usage
run with nearly the full stack available - they're running from a
workqueue, or they're fsck, so this should be a non issue - I recently
did some testing with max stack tracing usage enabled and our stack
usage looks ok now.

