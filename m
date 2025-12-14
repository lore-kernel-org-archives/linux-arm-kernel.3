Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A0ED5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 19:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zuvcDGFD43fYG+LbEtvETpCPOSh6yn9nRqcu+OmvAk=; b=I+8Ldy1N7QUpIJc/ioOZuPHoNW
	pabXKJjTX/5J6G9KprSvhfS5WR97GlD/jQMyKRVjRD1KtqUeQ9qBUWjMaAJEOReDA7kh52Tp4FiPE
	9BGU1Y5Y4INZIyqiCTXBIr1KJDP113IeYD5TcRdbR2TLq+oByQT9quTQVGUfuB+2IUjSpIkeNPsyB
	CBJRmPDgkZ0eftCj1KxZ6i6Vkd1PpGK9vcu0u2MGiBd65j7IiHypZ7TnsNKL4LjEHUxR1DBUSbLQl
	e5qgQChtcpM9qvJzJUlFXDuRrIJJlAiX7uMSWw/uw3z5oS2R8e89XkCXI+31ZSTg2LD7J7jnAVhBc
	G+O3UmEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUrcG-00000002gRj-3GJB;
	Sun, 14 Dec 2025 19:18:48 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUrcE-00000002gQl-41HR;
	Sun, 14 Dec 2025 19:18:47 +0000
Message-ID: <ffdc9133-49d2-4694-8706-55e924ba5f1f@infradead.org>
Date: Sun, 14 Dec 2025 11:18:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xilinx_hwicap: fifo_icap.c: fix all kernel-doc warnings
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
References: <20251214191758.2173409-1-rdunlap@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251214191758.2173409-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

ugh. Sorry about the accidental resend.


