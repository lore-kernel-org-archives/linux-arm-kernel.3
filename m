Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E77EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ud8o7Cf4N7P0KX75t4GNxQm9esZuVte3HJDcnNwymdM=; b=W0iPfYGftOnk4rZPqKy4TgJPtg
	xd5ErvVeGKn+G08T/HVj3I0yeUQpitliytBOolZ7LbgBBCR0JxvL45zohSMWV+M9WigMhey2Hbgyo
	mAovegBJImIEXjZvJcHi6auGrsaUiZaC/Q6jogVIc11gGsN5wRXeA43bXwW5hCdulNnbm3QOaP/pp
	u8iwQ460CFQzSBe22QiqYII68tOcrwxHOGidrQj1sLjhELbAQz6ovOLAeaDDTUHaatQv7SclkhOxK
	ZYdYugqXqcB0twDJ+AT1LSgPyyY/DSfagZd3/7C2yva10ewKTnnhBhEzHzFXuBgpjr+UbSvbscSUV
	B8OaLbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7VM-0000000FJMs-1wmJ;
	Sat, 04 Jan 2025 17:00:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7UC-0000000FJHv-0y4r
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D4F7A4028B;
	Sat,  4 Jan 2025 16:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830C3C4CED1;
	Sat,  4 Jan 2025 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736009929;
	bh=vl0ZkWIa06zvoaPX2y0xapu7SDRBC4ztJWKFUQYgh8Q=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=OR1jBao0T8t8+1k+Hci/YBEM3h9W1FvbSx6cdCY3Jf41xy7E2nqYT+40Dj0c0g+IE
	 0KjqQPOK50JKjfLe1fn7/PvUa0iU87+DjjlZ/IFK0qHJd+45EDd8yHvBV7axzcYZs2
	 2BV7aZFejsrxF7iW/jbRBkYR61V/lKJ/xMXzsx0KQskTWar72NcVTuvJot+/sM54e2
	 k5WrcEFKBmIL6WtPTfPPvBurs6QCxswzfoLq57hIJCkcktiQShbMGGGZMmSinByWV9
	 MdW5SFLbfUpNuj3Tse6+SZezOmlxTFCvNQ5hPIjQwYTKaEqwuVmcRFhLBWPBzNWYgj
	 liIfpoKNp5hIQ==
Message-ID: <675d0e83-6764-4d25-bb86-a1078b991fcc@kernel.org>
Date: Sat, 4 Jan 2025 18:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: omap2plus_defconfig: enable charger of TWL603X
To: Andreas Kemnade <andreas@kemnade.info>, aaro.koskinen@iki.fi,
 khilman@baylibre.com, tony@atomide.com, linux@armlinux.org.uk,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241229144459.9742-1-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241229144459.9742-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_085852_344482_B9939236 
X-CRM114-Status: UNSURE (   7.05  )
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



On 29/12/2024 16:44, Andreas Kemnade wrote:
> Enable the newly-added charger of TWL603X in the defconfig since it is
> used by the Epson Moverio BT200.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


