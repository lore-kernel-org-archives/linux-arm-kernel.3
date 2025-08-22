Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39511CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzHHo0UkuQZ7SXhvKcyTqd+eYSh/PHuLO27ppZ03Czg=; b=1Rn6ZzXL6h+rxDGe25lvv5fG0n
	uAdmtMBySudKdC8HOftsFDFZr0pFG7scq4ri1uyMref9KeJ7KoECQdhXBYSxxgCO7ci2f7EQAFMy9
	xrHpEJ+gvtF+6ncp5fxt/ygOn2BHjUQ1nnzb/dwKns4oDiHB2YDtogx/x4r14BksE4a9pnZGK7Srt
	7D0czcks7Bfc5DMYRSc7uRFlD9y4a7xFTRdDvEEZnOXggFSxXe7u77znf2lU3zobndEJeMCOoKSR1
	P+a7wpKUMoFKi4zwKNzIxOtX25iqoVGj5HuewLmS82Jt0LrMZWzqp/7vda+rQD5HYOmaiZSLgPjvM
	oPQwv0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZaz-00000003X3F-3Rpx;
	Fri, 22 Aug 2025 21:46:49 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNhz-000000020Rr-3M8L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yzHHo0UkuQZ7SXhvKcyTqd+eYSh/PHuLO27ppZ03Czg=;
	b=oGkpWj0x1Z16Y2Zv25WWOt5SEEldKTxsCPW2ZBEjCrnYwAblJIG+JfnKOW8hn9
	Qv0RqpNunLYY5XJA9+gqioYJZACOzQiwV6ykKkRuF7RS2RaXC4XDGzlwKkAWi6N3
	XuUEwr1dRFJpXcsYcdE7+tKT75IRl7sJYaSp3CagHMNPw=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAX1W66MqhoLbgVAw--.13359S3;
	Fri, 22 Aug 2025 17:04:59 +0800 (CST)
Date: Fri, 22 Aug 2025 17:04:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: dts: ls1021a: rename rcpm as wakeup-control
 from power-control
Message-ID: <aKgyuW1M16NKEs0E@dragon>
References: <20250812061339.102616-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812061339.102616-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: M88vCgAX1W66MqhoLbgVAw--.13359S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUo89NUUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwGxZWin7iqtXwAAsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_020516_256255_5FD3049C 
X-CRM114-Status: UNSURE (   8.51  )
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

On Tue, Aug 12, 2025 at 08:13:38AM +0200, Alexander Stein wrote:
> Invoke power-domain.yaml if node name as 'power-control'.
> 
> Rcpm actually are not power domain controller. It just control wakeup
> capability. So rename it as wakeup-control. Implements the same change
> as commit e39f567e1c38c ("arm64: dts: layerscape: rename rcpm as
> wakeup-control from power-control") for arm64 layerscapes.
> While at it, also remove superfluous #power-domain-cells
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!


