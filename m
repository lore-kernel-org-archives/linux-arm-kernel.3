Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A64D690FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4P4RcwJM674M4v0+AQHt9b81wG/DDUn1Oxs5RzPC8Y=; b=lam1O4kVTz88LHgaEfM5VvNSM/
	PJXk5+CxQZ6TD+1T6O0P5209xfKH5RzOKjOLXtkHoTND4NVzRw2+Zd0rPUau3R+G7yFBtD8fVbj52
	eQuInNMsInAiyp+Rw7LT3f8HSbL0H1rdntKYGXP8aA+v3nicsQSYZOz5DOSJKPclrb8x0YyWQ+eo3
	8njYQLtZbHzv7MDCdNW3EDk20xA5GhGz6cnN4hGv7q5ibS9BUiUvRT6mF9u8DX5xwjKg1IWA4VaSb
	V+montAi/jRE3ngsqBxoIUKHL0LSlrk36hL8tX7Uqp35yfVi0N5JsFiFIU9Wm2AEhOii8LEc/YH6c
	i/9pnvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcOs-0000000FKWd-3p5Y;
	Thu, 28 Nov 2024 11:09:34 +0000
Received: from mail-gw02.astralinux.ru ([195.16.41.108])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcNu-0000000FKR5-1wbS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 11:08:35 +0000
Received: from gca-msk-a-srv-ksmg02.astralinux.ru (localhost [127.0.0.1])
	by mail-gw02.astralinux.ru (Postfix) with ESMTP id D97A11F9DE;
	Thu, 28 Nov 2024 14:08:30 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail03.astralinux.ru [10.177.185.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
	Thu, 28 Nov 2024 14:08:29 +0300 (MSK)
Received: from [10.198.18.73] (unknown [10.198.18.73])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4XzYT65Yp5z1gywG;
	Thu, 28 Nov 2024 14:08:26 +0300 (MSK)
Message-ID: <75a9916e-1826-4d27-88d3-60284862f6b5@astralinux.ru>
Date: Thu, 28 Nov 2024 14:08:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 0/1] arm64: esr: Define ESR_ELx_EC_* constants as UL
Content-Language: ru
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: lvc-project@linuxtesting.org, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Christopher Covington <cov@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241106174757.38951-1-abelova@astralinux.ru>
From: Anastasia Belova <abelova@astralinux.ru>
In-Reply-To: <20241106174757.38951-1-abelova@astralinux.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: abelova@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 42 0.3.42 bec10d90a7a48fa5da8c590feab6ebd7732fec6b, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;astralinux.ru:7.1.1;127.0.0.199:7.1.2;new-mail.astralinux.ru:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 189477 [Nov 28 2024]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2024/11/28 08:54:00 #26904895
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_030834_674885_A82BCBC0 
X-CRM114-Status: UNSURE (   8.73  )
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

Just a friendly reminder.

On 11/6/24 8:47 PM, Anastasia Belova wrote:
> Incorrect casting is possible in 6.1 stable release using ESR_ELx_EC_*
> constants.
>
> The problem has been fixed by the following upstream patch that was adapted
> to 6.1. The patch couldn't be applied clearly but the changes made are
> minor.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

