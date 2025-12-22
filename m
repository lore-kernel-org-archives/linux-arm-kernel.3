Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D285CE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DN9aio4JuV4FT+Zyz6ML+nakOodo4SfdH1rAlytK//w=; b=qP1b6kjgnqYcXPMPlt38Vz28T9
	dsA7J61o63L3jAPt1gEIgjSVRur41IOaePgZxd49TqKHFuj05GfmrqOkMDUH5Vuwpiw9kfYCGX7gn
	YBK+/wmb0wKkyEvQB4moAE9tRe4ow2Z6awkafXp0j+bIE8hvd0Zf8Mq8CUz8i8IAFYBFvW17Qexe2
	EQi1JnBldpD/PnnAR9W9Ozkb3QpstR/Alf8kqTXEzZYofzsgyI+L4RgRdV28J+4at1IreYlbSWk1/
	2ud6I7KmtS1ZUKV0IPRFbwj+x9YtxMR9qSOiSd68k04LrfOUIYwUkdSyvq/JbqFVs7ovApeL7dYob
	jQq3rMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcgs-0000000DZhT-0B7Z;
	Mon, 22 Dec 2025 09:58:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcgq-0000000DZgz-3aHQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:58:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3E1860127;
	Mon, 22 Dec 2025 09:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFECC4CEF1;
	Mon, 22 Dec 2025 09:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397535;
	bh=8xhaDtSjXOSgRrUdLRpzbBVsMJ6bbqn9dV31CeS8RPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IcQExJiLestmYEqXaLFKpPDrkmen39A6xVBakQOZ9Sv3KzUpfATq0hzwnfi3N7R76
	 xaS6/HM1ujZBKKVBr88DCgk+dxnHx+Vf+tbYv71GDgZFQWQ5UU+5WlvPP1PcWZqSfN
	 WU/Vq42SxbHikQe+Vftto3WL+fxAcIr2jDkpGCywLdnvVvrkp/XR1uIRrXsWUNDmzy
	 ZLQhNtDAYlLOI2UHDbwtq46KHkgu3DKLGtwCMTwO9Zq6GCDCqh8DzS9wlnsZltGOaI
	 ZI1fEbfnQ5zCsuf9Nbvjh7aEaHqAYkkVv6rYjjNDOFaUt7rgu3szYL0iJGk9YjxE99
	 9/jsNM2DUJu6Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org, Chanho Min <chanho.min@lge.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216175951.2791921-2-robh@kernel.org>
References: <20251216175951.2791921-2-robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: lg: Use recommended simple-bus node name
Message-Id: <176639753214.30319.18070408035908204137.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 10:58:52 +0100
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


On Tue, 16 Dec 2025 11:59:52 -0600, Rob Herring (Arm) wrote:
> Update LG LG131x 'amba' bus node name to 'amba-bus' following the
> standard names for simple-bus nodes. Generally, node names and paths
> aren't considered ABI, so it is safe to change them.
> 
> 

Applied, thanks!

[1/1] arm64: dts: lg: Use recommended simple-bus node name
      https://git.kernel.org/krzk/linux-dt/c/30ae13173704585f2a3f406e94e0dbaa5cfde69a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


