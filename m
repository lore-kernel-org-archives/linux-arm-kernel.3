Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A9EC982CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAL69x+aMsb3wJrvEhrX3q6+5c3rIZOTW1Qes4NnKM4=; b=KYr+VRjHD03dbck8nixnUDf+oL
	XZqvnGRErFCFWXLWHMQHsYKpMF1LTtwxa3tbZLMNO8vWJL78FgkbDnrYL8gcIbTaXiW6VIAnIPoxt
	Vq++SPdANQmnmELk3ALgiw3Lh2WYaTdaaExtNUy4vaSO0KR8ViMUVucV8S0HgIRxdfqadehSi/aWO
	gH4DMX8XTQrGOCXHRYb+BVQvWOtXXgw0OWkaQXj3AhKBDc/kOP3b6MKYgM7E3GoDswwv5JSZElg6+
	gsJtaNj70kCfPoFN97cv1V/bu2SCpSv5p/bQ0smct48QzPTqSBefyI/CDa0xQjDlwnd+Ygxr2yxSZ
	H9USxQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglfl-0000000EM2B-41Br;
	Fri, 16 Jan 2026 15:23:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglfh-0000000EM18-1yZL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 15:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SAL69x+aMsb3wJrvEhrX3q6+5c3rIZOTW1Qes4NnKM4=; b=sQkCIrL3ScL+xhdccTjGbKqBDL
	z4f2Qb/CMhImQ9NrzsrrK+6g52BTgnTHgtWxUysj3Vnk6YmEcodT7DifKUiZmcr8JsD3nzb+PE5yA
	xt+CkU+Up5VpU0pfaUKF0rL7OQ0nK9RIVCixuIoKnV5+zT2fxN2TA/qmNjM7x+NIfLwM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vglfY-0035ZG-OV; Fri, 16 Jan 2026 16:23:24 +0100
Date: Fri, 16 Jan 2026 16:23:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: xilinx: use device property accessors.
Message-ID: <12f527c6-7728-4512-a4f1-08c778627ea8@lunn.ch>
References: <20260115003328.26095-1-abdurrahman@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115003328.26095-1-abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_072333_508989_4B79E6A5 
X-CRM114-Status: UNSURE (   7.23  )
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

On Thu, Jan 15, 2026 at 12:33:28AM +0000, Abdurrahman Hussain wrote:
> This makes the driver work on non-OF platforms.
> Also, make irq optional, since the driver can already work in
> polling mode.

Are you saying ACPI cannot describe interrupts?

    Andrew

