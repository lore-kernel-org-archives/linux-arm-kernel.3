Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D51C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzOSRUF+7X160qCUSiX8xJSfS6L9qF78Knb+9kxZ4EU=; b=zU9VRxXly2nHHgh4SVGwS1cnkY
	ZBu15DxmjCmLiOR0xVVxy4ocwE4wPP3BCDFfj15fNkqgMS5QfJDqvgz2chHbcSNkT6jA5meOsPLBG
	CFU2IkkkHc14SFzVHbkajFAtkgKa8Dq2TXlmYcfX131UhsREw8dZlPu2ej4M2gopEI4pnn/5wLvnl
	qVNZsdqkrGk3JmQ9z/1iQGsGG5MCTw5jb119N779shm68b8+G16u4h0qv5CgGTGLc617I6i+drDF/
	Zpa3/4wCs486XrIGBNGurb+EbauVnzX78BoAZFhDj85Pqbdfu6uHoORNf+cZRQxPuNtooEWVbuIOA
	tTzwcVpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMcQ-00000008LnZ-3a2e;
	Fri, 07 Aug 2026 15:36:22 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMcO-00000008Lmz-1HWb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1786116978;
 bh=zzOSRUF+7X160qCUSiX8xJSfS6L9qF78Knb+9kxZ4EU=;
 b=mcV3olV9UKNCwoSyzDIXel7YkoWFvRFsmAIiOoW2njslQI+g5Fybkz24ngb5m+wSdwTEazFL4
 UMc5ldEwS57P2Ni0H3mN2BCb1T62xNLAzhinHhjG76a4+Jvbkh5bJjslvrs8k6q+kyeVtujhd9n
 x4wIdogWxDKXmxzaUDPfxBoEIxWkrm52Z6swK6UyKy+ewJTJTTB7EHV342M9+OeoFQcCm7F4A/z
 RPvdCg5Pb2jQmn3kDlNNE/2v8UNBtB6u34GyeLtdOcOHHhVKxPi4O1gDqxhPxM6BXOinGPuKbs/
 bEorEmZeg4NWWXLlwuL/XGM0B5tYyjG454G0gEo9xoPg==
X-Forward-Email-ID: 6a75fb6318a12650795556ff
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.13.10
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Fri, 07 Aug 2026 11:36:01 -0400
Message-Id: <DKITMCODIHJM.PFQGZCZKZJIH@ubuntu.com>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/6] Apple NVMe fixes for macOS 15+ firmware / M4
 support
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal
 Gompa" <neal@gompa.dev>, "Keith Busch" <kbusch@kernel.org>, "Jens Axboe"
 <axboe@kernel.dk>, "Christoph Hellwig" <hch@lst.de>, "Sagi Grimberg"
 <sagi@grimberg.me>, "Arnd Bergmann" <arnd@arndb.de>
X-Mailer: aerc 0.21.0
References: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
In-Reply-To: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_083620_610490_28FCAEF2 
X-CRM114-Status: GOOD (  18.25  )
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

On Thu Aug 6, 2026 at 11:27 AM EDT, Sven Peter wrote:
> Hi,
>
> This series fixes a bunch of bugs that were working fine with M1/M2 NVMe
> controllers with older firmware but are now starting to bite us.
> With macOS 15 a new firmware is installed for the controller and both
> XNU and the controller are a bit more strict now. This firmware is
> required once we add M4 support.
>
> The first patch fixes a panic that can happen when the controller fails
> to initialize, which now happens for the first time with the new
> firmware. The other fixes then make it work again.
>
> Best,
>
> Sven
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Sven Peter (6):
>       nvme-apple: Destroy the admin queue on removal
>       nvme-apple: Don't set a DMA direction for commands without a data t=
ransfer
>       nvme-apple: Never set the opcode in the NVMMU TCB
>       nvme: Add a quirk for page aligned admin queue buffers
>       nvme-apple: Require page aligned buffers on the admin queue
>       nvme-apple: Drop the PRP null check chicken bit
>
>  drivers/nvme/host/apple.c | 32 +++++++++++++++-----------------
>  drivers/nvme/host/core.c  |  5 ++++-
>  drivers/nvme/host/nvme.h  |  7 +++++++
>  3 files changed, 26 insertions(+), 18 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260806-b4-nvme-fwabi-000386148b21
>
> Best regards,
> -- =20
> Sven Peter <sven@kernel.org>

On MacBookPro18,1 (J316s, 2021) with macOS 27 beta installed.

Tested-by: Joshua Peisach <jpeisach@ubuntu.com>

