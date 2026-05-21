Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E62CCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wW2EIJlRcTtZ7Krb1jUuZ1MsgafTYwvcWNxQDHTGtv0=; b=ZNAC9pKwbtFBGGrORn1VqyFbCn
	JSSBpcVBLMkTh5M7WvZsRxeZ4GxqZgqdLH8yUsfyXPLm0Y+fNYIRc/6P9MXhw/2h4mAqvmZXgAzbO
	okV7FobW/6JbWbiP5T7wAnY7MiqyIx32lZK/+q2L71tbgGQEyBPDT35GtW1JlsZdv+j3jChVzzBAJ
	Zjmmv4L/9K1O/vBxYr3R5JtorhuDEgn1wKfPlPjnnb2uyRz/xEHAObs3qMm1b77I1q32FTn0bSu/z
	7IBSGGa4xWBTZgnWpiBgfgJ3jkpoxouFD+M+xOkVSabrVcAGgrz5IXsSHVczTq+DQxXm9HHv/d61V
	W4Gen1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5Lo-00000008JOO-1V1G;
	Thu, 21 May 2026 15:30:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5Ll-00000008JMX-1Oms;
	Thu, 21 May 2026 15:30:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 214AC42B91;
	Thu, 21 May 2026 15:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040871F00A3B;
	Thu, 21 May 2026 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377416;
	bh=wW2EIJlRcTtZ7Krb1jUuZ1MsgafTYwvcWNxQDHTGtv0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=W6Htv0KMZQwx9moC2dA+XQ334P5Mw4pdn+EkxJ2IOOrCyYw4VDoAHLDgEDbvuaRpg
	 m+yxu80qEpcQ85QzZV1QPWRNd9GvY5e3hDjZoUDAf+Yr/pNFas5tFShIhrat1hu+Qa
	 62DqDbhHfoK7F13R6s2XUGzTieDAsJlXqKhgBm848hPPxe21mm/YR7TV3Vi2AcDJFX
	 uMMhMNrzxPNlH/Ue+0EyrGKyPXk74hPQsO1Qkxh0lBHxVAf5IIm+6eHRIa4A/6ZUMi
	 CN50TbwnwSV9KVIHNBpZX1UKi9iuwMC5ff65mKhkC41NgOX0urCxcJ0YRrQaLE5Y62
	 yd8cVto7wrRYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197503930E02;
	Thu, 21 May 2026 15:30:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtk: remove extra copy in cmd array init
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177937742563.384060.10935423618601860001.git-patchwork-notify@kernel.org>
Date: Thu, 21 May 2026 15:30:25 +0000
References: <20260520021500.13504-1-liujiajia@kylinos.cn>
In-Reply-To: <20260520021500.13504-1-liujiajia@kylinos.cn>
To: Jiajia Liu <liujiajia@kylinos.cn>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_083017_391781_6733F9A7 
X-CRM114-Status: UNSURE (   9.30  )
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

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 20 May 2026 10:15:00 +0800 you wrote:
> In btmtk_setup_firmware_79xx, the data length indicated by wmt_params.dlen
> in the cmd buffer is MTK_SEC_MAP_NEED_SEND_SIZE + 1. Except for the first
> byte, the remaining length is MTK_SEC_MAP_NEED_SEND_SIZE. memcpy copied one
> more byte to cmd + 1 than the remaining length. Align the length passed to
> memcpy to avoid exceeding current section map.
> 
> Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtk: remove extra copy in cmd array init
    https://git.kernel.org/bluetooth/bluetooth-next/c/b3e1ce138148

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



