Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73085CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 06:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmWP2vge6LnbvH4d8lOidjYjO9CgllmRxPD5ReASLWE=; b=ZXk5So/Ro/LlHHpv1dutD3hZo3
	7TXonVSkqLKrhxk0TNi32sC4zi/BGidh2kQXmb507NIyfKkBATD0c980+uPc0e+GiJBRpvcqeCPMQ
	gY8ayg+ECjK44slHbyn0xc90/Xmq+BpI6M7H3xjOjYqi4VMEcD8bF/GFAqBP7/gjsOI4S9HdeYMHL
	QyWiOJjargDM3QOnJtUnnTFJ4DYbqw4lXul2FKl8SLW2JlLrtMMRUapVDkP4N6B0XYg8/+07RFri1
	WhDujtltjZckOH7FCuBbJ+U+qG11EKoaLLHEMaYaAy/YSEK/o9yYIlbmHwh8Ans1kCjE4qCoWzurP
	Fi/bS1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEL5E-00000001lsu-2Pq6;
	Wed, 07 Oct 2026 06:24:56 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEL5B-00000001lsQ-1cS7;
	Wed, 07 Oct 2026 06:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=MmWP2vge6LnbvH4d8lOidjYjO9CgllmRxPD5ReASLWE=;
	b=OEVEFzv8GIFiONK0sMa2bA+z4jE8QtTDMzEzqkg8gicZS0MFORRFug+t+b0mu2
	w0jI9lp4yjwqJD1qrhb/xmrRYsjBphfILhQSoax55XxbQ9VSYtyXC7ze6ztVI+Nm
	GceES9Ivw2ji4ZMSfGbtW2w8MM8/p86FaPXg6fDPs56ig=
From: Bob Hui <bg9oxa@163.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v8 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Date: Wed, 07 Oct 2026 14:24:43 +0800
Message-ID: <179135428374.23998.13252521177249770220@163.com>
In-Reply-To: <sashiko-outbox-162642@kernel.org>
References: <20261007-quarkpi-ca2-v8-0-b83192bed07b@163.com> <20261007-quarkpi-ca2-v8-2-b83192bed07b@163.com> <sashiko-outbox-162642@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: QCgvCgDnT32r5cVqwrrxDA--.58191S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUj1v3UUUUU
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3gywHmrF5az8XQAA37
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_232453_823624_B516094D 
X-CRM114-Status: UNSURE (   8.08  )
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

Hi,

Thank you for the review, that is a good catch on the wording.

To answer the question: the board does have two LEDs.  One is the work LED
(GPIO1_D7, heartbeat trigger) that the gpio-leds node describes; the second
one is a power indicator that is hardwired and not software controllable,
so it has no device tree node.  Nothing is missing from the description -
the sentence is accurate, it just reads as if both LEDs were
software-controlled.

I will make the wording explicit if another revision becomes necessary, but
no functional change is needed here.

Thanks,
Bob


