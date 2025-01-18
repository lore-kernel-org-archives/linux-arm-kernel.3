Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F729C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 16:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xFzeCVfa8gh0Hm9SEBlv8wGSttxCx/PbKvrYQhngqI=; b=v50+TRNei9UXsZj1105iQNc4y5
	vBEl3LRSdU603MBgCYcnGUfufA5EtcSPWE7G1FHLSI/4vwzcuqXpVXC+KQR11G9U0FR7JT39zGH0B
	ZUZ8ZuMZdlHzSJMlI8RsGlIB/yG/v/NlvaIywpNMJXGJUimM6q8ctP7/PK4gCmHLExfCqBKjndRju
	43N0vNFGuPWxbi/CE3cG31z0gKiKvLCDqilLsSTCAEeVZK1WqpFxc9soaHWSCpB+L/ZLhslb6f4nO
	OJ8dv5a5otXKe50fiYC/QcihENtDBNVO1X1E01NzdKamIRUJx6PL42irk9F8MOunb/cZI9xaTFaxe
	7SD7To4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBKl-00000002g0o-0RsJ;
	Sat, 18 Jan 2025 16:06:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBJU-00000002fvY-0CTt;
	Sat, 18 Jan 2025 16:04:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E83CFA4163E;
	Sat, 18 Jan 2025 16:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF826C4CED1;
	Sat, 18 Jan 2025 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737216282;
	bh=yHPeVYJ5WM0NnkY0i/OfEl3U1ikAdfYu58ntQw3Bg1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yvk2WqNvo/nr34TscE+WKQWPsYfOZkDnz8bvt9TNVNVuhGqhXTmUqry2YR6g3Igpe
	 6Ui/hTy04pOfYq1G98GqJJMZrN/yufLtGkOjYcnvP+36O65D+UHjukelRSgdX6dCLX
	 Tx9CapF69TbB149gPFBHLl7uLBwhzJyHfuLKpjnM=
Date: Sat, 18 Jan 2025 17:04:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org, stable@vger.kernel.org
Subject: Re: [PATCH] Revert v6.2-rc1 and later "ARM: dts: bcm2835-rpi: Use
 firmware clocks for display"
Message-ID: <2025011803-tactical-strangle-f6a5@gregkh>
References: <7ba92b281cea785358551c8de99845c6345a2391.1737214993.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ba92b281cea785358551c8de99845c6345a2391.1737214993.git.hns@goldelico.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_080444_236445_449ADD3F 
X-CRM114-Status: UNSURE (   6.39  )
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

On Sat, Jan 18, 2025 at 04:43:14PM +0100, H. Nikolaus Schaller wrote:
> This reverts commit d02f02c28f5561cf5b2345f8b4c910bd98d18553.

I don't see this git id anywhere in Linus's tree, where did it come
from?  It's also not in linux-next.

thanks,

greg k-h

