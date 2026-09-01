Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B48C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9817+vy3gEnpJQ4kgLut8eMpM0Nvzbnj2sTQP/ukjEc=; b=RIvszaO3Tov8OTwTSeB9NlOvD+
	Wjw9ZBzXnqD/0IIqq2w+BDJe7yJaXFUXYbztzgPnLEvEnnWIOwkUbddyYH5/RoBA1JJ+PWJQVb17S
	JVyuJYA1Z4xUhddU+vozc5OiIw1OTH/FhzJDUpXC9JBTd40FErjVftCFr7MO8vMYBb5ZM+sxVMM9P
	xDjYYnY6A0UgzfcxqL4ppN8POFd6q/qkSVEX9QNkgXmaLMmYf8m5gdQvhvd1cHZpX2KEwuTMIoi42
	eYFeQAj7K47gbVqB/95qQ+Os0Dto+tAEmPji7nddvZLPHlKy8vE5Ukj6KcY1fNL506KZzfBE1F5Fr
	ozAKM0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JLY-0000000BBbg-3hyw;
	Tue, 01 Sep 2026 07:55:56 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JLV-0000000BBbC-19D4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:55:55 +0000
Received: from ratatoskr.pengutronix.de (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4F6AD200FE5;
	Tue, 01 Sep 2026 09:55:49 +0200 (CEST)
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Frank Li <Frank.Li@nxp.com>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Shawn Guo
 <shawnguo@kernel.org>,  =?utf-8?Q?S=C3=B8ren?= Andersen <san@skov.dk>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,  Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] arm64: dts: imx8mp-skov: add new 7" variant
In-Reply-To: <20260831182243.GA955466-robh@kernel.org>
References: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
	<20260831182243.GA955466-robh@kernel.org>
User-Agent: mu4e 1.14.3; emacs 31.1
Date: Tue, 01 Sep 2026 09:55:47 +0200
Message-ID: <87o6ehjth8.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_005553_462386_AF9A5729 
X-CRM114-Status: GOOD (  15.78  )
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

On 2026-08-31 at 13:22 -05, Rob Herring <robh@kernel.org> wrote:

> On Mon, Aug 31, 2026 at 10:17:37AM +0200, Steffen Trumtrar wrote:
> > Add a new board variant for the Skov i.MX8MP based family of boards.
> > 
> > This variant uses a different 7" panel than the existing ones.
> 
> The sashiko issue needs to be addressed.

I'm not 100% sure what would be the correct solution for this case.

Would it be valid when the *.dtso just drop the "skov,imx8mp-skov-revc-touch"?
The generic compatible is not really needed, but the base DTS wouldn't have a compatible otherwise.

Or do I have to change the binding, so that 3 entries are valid for the skov,imx8mp-skov-recv-* and keep the hierarchy (although unused)?

Thanks,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

