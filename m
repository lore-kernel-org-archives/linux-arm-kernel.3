Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B624C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlJko1hEIFB3Xv6RCR38uaerUEqKv1vPAiOCkuwmKnw=; b=viDRPPSoow3zIkIHmru5rUJ4YB
	zcwY1O6uY2Vm+ab5OwETBavmd6ZRCp8N+O7dO62Ideo59STE8HfJfCgi7f45eMq+XtPG3jnhxW0Cn
	Yi7TBpWoK8XwCcypFyZECgVPvFPtBk1hGdAxze2SA4MKNdN6gAmR87p5DdXKpejs188RACReqI6H4
	2X3V0bpbk4kUpbwj7YebTKF+Jt8dHgmRwGb3gGHzmGc/1JSDyyKmamyPeENZ1Ur7xogOvGEKmAczv
	cFIQVtuFSJRUqz0YlNg8hg6FXxKghX9ghydYFoc4NR/eA5B8tl65nWSvYkDMxv2gZ1XukUIOL6nxU
	tM4M6haQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6bL-0000000DmxP-0PUw;
	Fri, 11 Jul 2025 05:47:15 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6Si-0000000Dlok-1UuR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 05:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=GlJko1hEIFB3Xv6RCR38uaerUEqKv1vPAiOCkuwmKnw=;
	b=Y/qrJMXGUZrgz17RUlwvQNX6XeMaE+1+eVcSakyEbmHNY0dxF4fsSb9hxhHZlm
	iP6+bd/GdNtZvvJA+OEcnJ1PcG1GfSpx9kn986y7LRdmfwe7C0UikcUpO65+eqZk
	SyZcUweGyCQUh4QxAxWakFoTDnGvGD7JmZB44N9+Y2LBo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAXNos3o3BopgpPAA--.47957S3;
	Fri, 11 Jul 2025 13:38:01 +0800 (CST)
Date: Fri, 11 Jul 2025 13:37:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.li@nxp.com>
Cc: mirela.rabulea@nxp.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ming.qian@nxp.com
Subject: Re: [PATCH RESEND 2/2] arm64: dts: imx95: add jpeg encode and decode
 nodes
Message-ID: <aHCjNtw9G7joUnka@dragon>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-2-Frank.Li@nxp.com>
 <aG8p71A4/ntuOde+@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG8p71A4/ntuOde+@lizhi-Precision-Tower-5810>
X-CM-TRANSID: M88vCgAXNos3o3BopgpPAA--.47957S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzxhLUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgSHZWhwe3SZbAAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_223820_780159_C5287C51 
X-CRM114-Status: UNSURE (   8.59  )
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

On Wed, Jul 09, 2025 at 10:48:15PM -0400, Frank Li wrote:
> On Wed, May 21, 2025 at 01:34:04PM -0400, Frank Li wrote:
> > Add jpeg encode\decode and related nodes for i.MX95.
> 
> shawn:
> 	can you help check this?

It looks good to me.  But has the binding change been applied already?

Shawn


