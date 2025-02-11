Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7BEC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8FfnLgEBp7g6mkEgjaKGL+c9EZbRA0kvE0JFir4yU4=; b=fVmuSfUPr4J22Z/0NUNg34Ph38
	rn7ceGiUWbFt/rzCpc7Ie9rJYRmhbC4US/VuATeZf/F6udhgkLf7uuBZEb6ISVJyKHctosaHcUFag
	epTY8YkxxQ1pSeDumZurRv13byAA3SR5iyqAO46oTzbRe7d8j37kQ99Amh1Aa+9b5MT62GwCwApfd
	KJphYUbfeK3lhfxkkQCkGiw3+btIR8b4T/6JKQtl9l8Th4+NfBdxCWfriAgCk+kq2ZTAfD9Aem8hN
	BAkxMZAa0QRbVtOInMxIpABWv6ire/4FnYU8+tocI/xlh1f/oZG4ETfW5dmAze72RSrDoujPsIeFQ
	pZ1F3pSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtfZ-00000004cAx-2NJU;
	Tue, 11 Feb 2025 17:03:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtc7-00000004bbN-2y3z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:00:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17B7613D5;
	Tue, 11 Feb 2025 09:00:20 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 874083F5A1;
	Tue, 11 Feb 2025 08:59:56 -0800 (PST)
Date: Tue, 11 Feb 2025 16:59:53 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Message-ID: <Z6uCCeG2d395ZGDS@bogus>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_085959_787825_DE8E5D16 
X-CRM114-Status: GOOD (  10.42  )
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

On Tue, Jan 21, 2025 at 02:31:55PM +0000, Peng Fan wrote:
> 
> It is the i.MX SCMI Protocol exports two RTCs using one protocol.
> 
> Two RTC devices are created, but share one parent device.
> 
> Do you mean each RTC device should have a unique parent device?
>

Can you point where is this check for unique parent ? I am not so familiar
with RTC but I couldn't find myself with quick search.

-- 
Regards,
Sudeep

