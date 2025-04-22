Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5B0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U59dnMWUeTOPX8RRgdP3t8+lP2W/eaBKDgmC/sG7uJM=; b=GdBDpfEfQUdof4n8l098dkOuRy
	OBQZ6FhbN5mCNRcdQL8ZleoD9jkx3svriOPzAuJQtECoDXm+SPDSwOGwx3M3nfEJJCLWfIrPA6jiW
	ZouXhEdZywllvc+Z582TKhF0kLLSz/kUJ+KV7NfvzFW0ROzFEZDjCQzOU8feKNadvJwdFHCgSkgZr
	x9N+ADZtp3VmUymUXVSoX6Q09VOA22BMZvI6THEzJ2eUNmDZ5S9sNY8rRQbczZCyVAJiWrdaWCWoU
	IB6RIX1rWsb4qXn05bVmjVc56EcnAeYtBB3xoa+VX9Ce9K3/EbFt8wGQ+/AXyy0s7eAqfy8yZLm2I
	+cc+i5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73eG-00000005gH5-1vhQ;
	Tue, 22 Apr 2025 02:46:12 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73PA-00000005cmG-04wN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=U59dnMWUeTOPX8RRgdP3t8+lP2W/eaBKDgmC/sG7uJM=;
	b=DVuA0pgKlLafF0tvPLt+2i4HE34qR4T7EAMlRtbcLL8SjJzNZF008r7JL5UVKC
	ln2rNUa62ewk1INFEDKGt5FU/j+MiyLL33zsbp21wm+0OX440rh/PfTzbzC+rq9n
	iwNQE2ATjbveYYwenUUecNsTzVKccJdSwu80fRCqHHB7I=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXQCAy_wZoixa8Aw--.12594S3;
	Tue, 22 Apr 2025 10:30:11 +0800 (CST)
Date: Tue, 22 Apr 2025 10:30:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: dts: imx31/imx6: Use flash as the NOR node name
Message-ID: <aAb/Ml38SxRJll5e@dragon>
References: <20250313175752.1532299-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313175752.1532299-1-festevam@gmail.com>
X-CM-TRANSID: Ms8vCgDXQCAy_wZoixa8Aw--.12594S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxJ3vUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERM3ZWgG8sE6-QAAsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_193036_426868_B03F14FB 
X-CRM114-Status: UNSURE (   8.21  )
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

On Thu, Mar 13, 2025 at 02:57:52PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to mtd-physmap.yaml, 'nor' is not a valid node name.
> 
> Change it to 'flash' to fix the following dt-schema warning:
> 
> nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


