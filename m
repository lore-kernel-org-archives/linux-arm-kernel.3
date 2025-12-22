Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA0CD711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaHR9bE+tP9MJDGPZ2Nj/cqYmimEoWjAYma2LQEzjWM=; b=Ke1dE4VClONA3riJ4Ws1tgXRg1
	MsPrkssCwGXew83XRO6zJDu07rwFExIz8mzeZjIKjSvTj4Ci+u4Jdg/CgbEBqZ9xR6m+podmI5WUM
	IXTRL6ckNJTUIrIbeM99cYaI8mGPESbykZW2L0gbnTeKHKHPC2W3bGOGyoyi7HqPI/8jETQY++9ih
	D4dH2SIcNEb6SyYG7diBk89o4yz/QieV/nzQiNrqLqZv8vDufKwEpUXYS7uJYSLKP/bMrkkj+07JJ
	OxBLAm8r7DOVCV6KAkcdUuLKJ087Zn+jMhhmQxHClINbKj3Xhg9v68UHUr63ylSyI2SkQ7hxGmotC
	nQo+Ac9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXck0-0000000DaTx-3cJr;
	Mon, 22 Dec 2025 10:02:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcjz-0000000DaTf-29XT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:02:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECACE60148;
	Mon, 22 Dec 2025 10:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AF6C16AAE;
	Mon, 22 Dec 2025 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397730;
	bh=rFDFoU7W0N6i/K6WZlv3Euk+Qwss6Rke6zV6jwkns94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h3n8B0GcwOwrEEuevWY2gH95coluf18Sdd4ZAnaytzJoiNpItO+UtayaErOhsoOtB
	 MxRxcDesm01E8cLyRD9khYKbpgBSVjOd669wySRauxhAOgOXukFruBMF4AUsJRJBsr
	 MDxeJu3DVQkOzMdBPuQkuvREJTmsQcDYhmb1/izo4GivHhWMoKTnRb//lwvbTCAXnJ
	 1kPm5n/ejnB5oACkBURpF94kTK/f6CkE7l1x5SmAKj4NtUu8ceDesATMDa7mMNG9Fz
	 9EVTxRt67WkrXkeQSU5a7TDmbxlca0Qyu0k62krikesKCE4UZAc0CSadCrxwedjgyB
	 5Jr1XOz4KsQHw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216180055.2793215-2-robh@kernel.org>
References: <20251216180055.2793215-2-robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: toshiba: Use recommended node names
Message-Id: <176639772702.31420.9343688718392781751.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 11:02:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 16 Dec 2025 12:00:54 -0600, Rob Herring (Arm) wrote:
> Update Toshiba TMPV7708 node name to the recommended standard node
> names. Generally, node names and paths aren't considered ABI, so it
> is safe to change them.
> 
> 

Applied, thanks!

[1/1] arm64: dts: toshiba: Use recommended node names
      https://git.kernel.org/krzk/linux-dt/c/22fbe6e21450d629642e4bdc8d8d329219abeb46

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


