Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31405C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1hoNyVpiMb5nugh3F7JK+Dcf+wldIKzcFr1U6yCpSE=; b=nScGzXy2sXaxC4NWakbuKtW2Kz
	sXmmKOHlfgmEV5VlIUZAoBvARywXe4WSWsft5gpnziPx42N2TgHEJbpVRmau0Te8rUkOL/95e7H/t
	v0reerj/OB5bLfzNTzwVMh8NwhbE8W3atTfGgR6lmYCGl5DNGCpxZa6a8VrWFA+60cqLUnqdAiBmd
	i31FYHylNPDtJEZ9/DeypLili2bBh+iTJ6r4k749ts9RWPlDF9Of/OhsFPmrR5iHjJ+2FpQMFSbD+
	fTlP1gJ3E5J5Hu0qA9NpEmetNhxM4hpWjmUudi48SUq2FYAPUaGmDMUHOS5oSBvSUeB2kOv31L6us
	pHLu3dTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLWP-00000008FD4-4A6Y;
	Tue, 18 Aug 2026 15:14:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLWO-00000008FCo-2OGX;
	Tue, 18 Aug 2026 15:14:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C383B600AD;
	Tue, 18 Aug 2026 15:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31D71F000E9;
	Tue, 18 Aug 2026 15:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787066075;
	bh=k1hoNyVpiMb5nugh3F7JK+Dcf+wldIKzcFr1U6yCpSE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=RZmAyJnLcQnrOU2OT1Hz/+rAxWPbPSFLOiSO18BLUkuygzH8B/+BtEcv+khkrQGuP
	 sxGvicShJsy58LXKTzkGzvPx3//QcKKGQyZccR+3XreCOBSKdu/IFgOAIgej3c9r6t
	 eea35mjhd0N17sJCAEpXycAIoJkxo+vC1W8yFj2CRYs1PpnMudqNCRPBZDZS8vrCDW
	 ROdXOVxFp92kQMQMXhdP9UWTQV8aukdOICCrMTP1M6lnmwzVEHF1q8RuysjUyxi+HO
	 JMthndg3u3GOhiCZoEh72D8ZRne9dTfVQZqZKRq8EBNHkCdOAbMHjec7sp3RM7zjoA
	 3xoY25bu/356w==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Roman Vivchar <rva333@protonmail.com>
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6572
In-Reply-To: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>
References: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>
Date: Tue, 18 Aug 2026 17:14:32 +0200
Message-ID: <87zeyjh353.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi Roman,

Thank you for the patch.

On Fri, Aug 14, 2026 at 16:13, Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

> From: Roman Vivchar <rva333@protonmail.com>
>
> Add a compatible string for the mt6572 keypad, that is compatible with
> mt6779.
>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>


