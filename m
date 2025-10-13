Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87244CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=magqpC/ICpnHytykh3cNdIwSRBZoSaTWDcBmzmdWY9w=; b=3fP0e4qMMGPMvzZUz0+DOLNqUt
	Jnosco5RAxdK0nLYlHTfk6himBi2SI5v3F1Wr4/R8oTdLYtexTAf+vnhTOcKNsjQkWHeRP/lorhhc
	2lj4nzq7FNL9EgIPK6ZnL+jSZmDbHU9QSHXZtdhCmC4OV7SL8/FoUEqMW9LJlkrQ2OMBbREQc1lrN
	Cs39XSxS+Cx8oLge8VHqKSV4CIeaKIIWfzwzn2MdFxg4R4O8DDTwMIZqlzyCJX1O5oY0qzWFqddRw
	mrLj/pUwJh1UTaLpsYjR0j/VbtyEKsjTqZlLy+kdXKZUHAexhUyYKcvJkbuY3Gs7bUM1cdH0xmw17
	ZY/9U3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Exa-0000000Cktg-1toL;
	Mon, 13 Oct 2025 09:35:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ExV-0000000Ckqt-3EUS;
	Mon, 13 Oct 2025 09:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760348111;
	bh=or8xQ1iruJtdfX8SleEUWuob1OR6uOc2dB1flwoE3mE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Gpre5uhbDneJfSx3JZt6GYGvpLzkerLjnbCmIq2hgFeyKqezmwBOxw/bJLD7/enfF
	 32ugXIYdpl1eKijQH1wbj3pCPNfiNgZ0zZhhtfsvkU4iHYVds2mO4xpRtm3YppQ/Fn
	 /hzRp5U+Li3LF5LwxfMZ4AhXl1SgVtVFuZOtcDQG7pXXu2O6YZZa2IM7Qd2UEFmTbs
	 KqjTnGuHWKxfPUyHXimdKf+a6LGUYxJNhHdRp6NVMBx3/k5/tNaW54Vknak7Rd4dl9
	 SixC75OkU/mCJEcK/iPNrtdmrTkwRDm8+jK5Gx5iwrGZ+Dn74zrqaRIFgz6+XIMpgD
	 Mg8w4plkgkp9w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DCE017E12C8;
	Mon, 13 Oct 2025 11:35:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <40004650c99c09ff540d8e2028a1393f4a70a6b4.1758369130.git.daniel@makrotopia.org>
References: <40004650c99c09ff540d8e2028a1393f4a70a6b4.1758369130.git.daniel@makrotopia.org>
Subject: Re: [PATCH v2 1/4] arm64: dts: mediatek: mt7622: add 'soc-uuid'
 cell to efuse
Message-Id: <176034811146.21265.15506279212407234181.b4-ty@collabora.com>
Date: Mon, 13 Oct 2025 11:35:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_023513_975406_337C59CE 
X-CRM114-Status: UNSURE (   8.07  )
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

On Sat, 20 Sep 2025 12:56:42 +0100, Daniel Golle wrote:
> The efuse of the MediaTek MT7622 contains an 8-byte unique identifier.
> Add a 'soc-uuid' cell covering those 8 bytes to the nvmem defininition
> of the efuse to allow easy access from userspace, eg. to generate a
> persistent random MAC address on boards like the BananaPi R64 which
> doesn't have any factory-assigned addresses.
> 
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[1/4] arm64: dts: mediatek: mt7622: add 'soc-uuid' cell to efuse
      commit: 79fb9654a2eeea8e973f6d329ccf68221703ec59
[2/4] arm64: dts: mediatek: mt7986a: add 'soc-uuid' cell to efuse
      commit: 18d0f98a17757c4030c0af046dfd864c8108738a
[3/4] arm64: dts: mediatek: mt7981b: add 'soc-uuid' cell to efuse
      commit: d261557f7ad37fad44e3c07e76e63a60abcf8bc3
[4/4] arm64: dts: mediatek: mt7988a: add 'soc-uuid' cell to efuse
      commit: 6bb220964d608b133a81ac2ff15177a32617ac77

Cheers,
Angelo



