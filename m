Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D672D73E9B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 22:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAvJBn0EVQV5Lrq275v/ZjaGTKsbQ1c6FK2QQBX7pqY=; b=wnlAjCzpE+xDU/cMSkFVJGxZSC
	rnbE7SHtihA5h+G9RYEsg7wmUSRV+WrPrA8XZuXBMfnGzZ/qnK2NFbCTOy9mKxDG5b43GsZTiYYyp
	mrspEXap3SqYR+NuxvGFScOzEu2aWxbIRzj3U+GUCKeJClXHmyDLvKyYLnWCW+3UNSspFyo9soO1X
	uTXcD2zELK6Ai/lEUBEie2u+TElHxmJDjYtwiAHbMRyE5n7euV/sl93xLnSvJx1ByuQUhmnUGDOy0
	FmQDcCWAYW3PHMYs6ak4yFvqZb5Lk5uGscxh0QNWIAJ73u/4fAaZTExjviVIVaHjsxRMyYhT202rr
	Lp8CNNog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlacq-00000000kFx-3GkT;
	Thu, 29 Jan 2026 22:36:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlaco-00000000kF1-1ot7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 22:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GAvJBn0EVQV5Lrq275v/ZjaGTKsbQ1c6FK2QQBX7pqY=; b=B7qBbi57I/QYTmzkAb8vMTWLIT
	wfXNimv49Vg/NgMmX+EsMMlVPInC0U3VoLxrRK1xnfPUu96q29PTens7E4Zl9pPdYYG9toma6vxxC
	KEkMskNejxWqlslpvD78oaZGFcaoNFPErMMgMNBMVWu87uei8xkMqK0bE0ZvqZFXFQQY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vlace-005Pvc-DH; Thu, 29 Jan 2026 23:36:20 +0100
Date: Thu, 29 Jan 2026 23:36:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 0/6] i2c: xiic: use generic device property accessors
Message-ID: <ec8693a4-e982-4227-9558-0b1fac543e62@lunn.ch>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_143630_468839_3CD0FD0E 
X-CRM114-Status: UNSURE (   5.49  )
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

> Skip clock setup on non-OF systems where clock cannot be provided.

I think 'cannot' is wrong here. Non-OF system technically could
provide a clock, using whatever binding method they use. Not having a
clock simply appears to be a limitation of your implementation.

      Andrew

