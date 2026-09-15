Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7041C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wo4ny1YwO98WkJgsUBMk960GhhmSfpCNz1vnRwv3xeI=; b=vXnpPIm/2vQGrte93Qj45iXf/2
	tPoXlu9p04+LPo+Y5IIkzHeLIg9DZCc5W8VJUk6JpNhgqVDbxWaI9vIXW7ARXJoS7asXa2KPc8LxO
	kyur8KvlCaFyzRxSfx9cdOpPfhnjOhBLq+qPH5BxNsO3N0k8FrzmIC2JWkNcUBGeBlue0U4+zzdo4
	lIPrYmtkMdDrNzkBveXDiwrRwEW1LvxtjHXVR4FLS6l8GbL817dB2dqR6Z+MTXthTqUyhF+RtwD7u
	ismb38vmk6gP977k+1EODcQe7Rmqt6C4o9m5mCVJU/V1Ry7TEVhzMx250AkP6iNEtl7hlZgsd096z
	e2+Hz7XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TxK-00000006tke-3BJ3;
	Tue, 15 Sep 2026 14:16:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Tx8-00000006thz-2OIl;
	Tue, 15 Sep 2026 14:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789481764;
	bh=PTbxpPFOxDQ8xv3WRyCj1KIRouewlTe+7MQl0VvICic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KRUCyAocjxgVBz3HulW75LFARuyrG+119/V5KXj4ptEBwVuz+JDHiZet+PUE5I0IQ
	 qoy7VqAKh+MD6vKt02YWiG+VFikVc68ZjvuDBCMsJoa+vk+Azx+NRdAMf1ZDxvMFCk
	 1RW4txL2x7YYjWoElHWCLKxAZ5QoWcdaN7Gm80yo6u6PbSoBh+1k2YRqzerZjkZ57V
	 rcKpYgnNz/DI7qUhMi3jatG4TUpAFf1mthq+htbk8Ia+cv1QKt91/AjAkjS6MERzb8
	 42k50eoz5tHYt1tdyYmuf1ZL8TZ0SpWy5vYn6PFbarvsPRF0er/Cnwb0IW4jXWWeJf
	 BrvV6ODCSIQ6w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF8E317E089A;
	Tue, 15 Sep 2026 16:16:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Martino Dell'Ambrogio <tillo@tillo.ch>
Cc: linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kees@kernel.org, tony.luck@intel.com, 
 gpiccoli@igalia.com
In-Reply-To: <20260915135722.566918-1-tillo@tillo.ch>
References: <20260915135722.566918-1-tillo@tillo.ch>
Subject: Re: [PATCH v4] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add
 ramoops region
Message-Id: <178948176365.42253.18334352766065751313.b4-ty@b4>
Date: Tue, 15 Sep 2026 16:16:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_071608_242048_A0483657 
X-CRM114-Status: UNSURE (   8.56  )
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

On Tue, 15 Sep 2026 13:57:22 +0200, Martino Dell'Ambrogio wrote:
> Reserve 1 MiB of RAM just below the ARM Trusted Firmware secmon region
> (0x42f00000-0x43000000) for persistent kernel log storage via pstore/ramoops,
> allowing post-panic console output and oops dumps to be recovered after a
> reboot. Without it, kernel crash logs on this board are lost when the SoC
> warm-resets and the on-chip console buffer is reinitialised.
> 
> With record-size=128 KiB, console-size=256 KiB, ftrace-size=64 KiB and
> pmsg-size=64 KiB, ramoops_probe() carves the post-console remainder
> (640 KiB) into five 128 KiB kmsg records, with the requested ecc-size=16
> reserving a small Reed-Solomon parity block from each zone's own
> allocation (per persistent_ram_new()). The ECC lets pstore recover dumps
> even when the panic path truncates writes mid-record.
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region
      commit: b71dd71f0965358d33a4c5c93789e46795f0f49d

Cheers,
Angelo



