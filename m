Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1113CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nb1ynEMRV5Oei9oKJLBfatZd50oqLhlNcCEbjrFG+7I=; b=ZehJm1MipuXBa3uYfeWEg2XS67
	Q/7qClj4IoGyjTvL2i3ciJdGXllutk2Ny6Avg5vr3cyUbsYOyqjdX2xtRi5Ffvf4dQ7YDU1xJ0XuN
	qgF2ktARPWopCNrQjfj3KAStM+4ebhCRdRmnz5CnnjLJU9gxYLrmlmfBzpGqGyvpVmNQSjtgkzJNG
	YHUD8XnMR5lQInPThwLM9XHY1aQigS5IGWhHwR9DE1m0x96TQYjF0rrdbwNqpRDlhZMMU3IVd4skX
	J+aaWzlRJ8GoHJIAGUd4pXOV/nQPKLnEPIURnSUNFrLcuWaZhuf/EdUJSj59fxL8kWP7/vXOmdiSy
	zdJc4Fcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uploR-00000004exy-07TQ;
	Sat, 23 Aug 2025 10:49:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSfs-00000002oZL-31bs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:23:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 291F5601E7;
	Fri, 22 Aug 2025 14:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A69C4CEED;
	Fri, 22 Aug 2025 14:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755872603;
	bh=p12u8vR8qiv7q0T3C6sATwxvsQ21DT4TNvgeIZFALCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7wztDtcoLnf4euD7YyiSJ6Cdw+vq/HiDC9PejmzhDILhI5g/hqEWfEcH/TSTfLCQ
	 g2UNAq+U18UTfNxZDh2bE1OW9Lms79Y+NQeyEbH3ud8oGwfFz3eBAQr6bSdhW7rV0l
	 sr0FF7pECu1A11xgznHzRZitNnzwMdlsry+l1gqRRQkG7q45UQ2RO40dQvXmpHT3Cw
	 d1fuNYFlmygAZ7kLZC1R1w0I9LT6tfq92XQCOoWYG8oJoYtzuZlLDPtC1iufG1R7Qc
	 4Mlc0O6v9m9egfm9IuuSQ73DJllJbjPQnSJ3hI5LdqM/kHAtoBNBotcXP2FlvbzqVH
	 jmToV1ArHKQvQ==
Date: Fri, 22 Aug 2025 09:23:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Salih Erim <salih.erim@amd.com>
Cc: jic23@kernel.org, devicetree@vger.kernel.org, andy@kernel.org,
	linux-kernel@vger.kernel.org, conall.ogriofa@amd.com,
	nuno.sa@analog.com, dlechner@baylibre.com, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	michal.simek@amd.com
Subject: Re: [PATCH v2] MAINTAINERS: Update xilinx-ams driver maintainers
Message-ID: <175587260151.3622268.4895714822866786813.robh@kernel.org>
References: <20250820100519.2272509-1-salih.erim@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820100519.2272509-1-salih.erim@amd.com>
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


On Wed, 20 Aug 2025 11:05:19 +0100, Salih Erim wrote:
> Anand left AMD/Xilinx some time ago. Salih and Connall are new
> maintainers of xilinx-ams driver.
> 
> Signed-off-by: Salih Erim <salih.erim@amd.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml | 3 ++-
>  MAINTAINERS                                                    | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


