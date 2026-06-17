Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD968CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 17:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZ7H8QpSLKtlrs3aJ59J9ZliAuUMrSHycmz8Pt9ipY0=; b=Dvgm70y/VnRG51O2S+8JFxOTQt
	k+s/2499ohtIIfYP93T7iWzhk61DNGpAuAyBXuBrcwP1vNuHq39cS9JSviioipiCl97wrC4ZByXhw
	Ro0MBdQc9n/a9Fbi/khuMBoIZppKLbs2pl+7ioGv1WtuoR+bPA+GPLQEOSid+n3vI0S4JPWRGsnq+
	mPCR1jX4y/suNGu5qWtGIo/L5VKoofLAY34JyWZCyhN1GQORwwnrmN/nuwfYVii6YSL4VXVJER/+t
	jWF3K2tTr7bgefoUkLCfK/xbI6tnKcBpVaOm1x+Jg/TT8zj79MiL+Ee4+0Y+c68abQw1qYqattzz2
	I0jVUSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZuIT-000000007v3-38YB;
	Wed, 17 Jun 2026 17:43:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZuIS-000000007uo-1pba
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 17:43:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E3B6600AA;
	Wed, 17 Jun 2026 17:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3118E1F000E9;
	Wed, 17 Jun 2026 17:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781718207;
	bh=lZ7H8QpSLKtlrs3aJ59J9ZliAuUMrSHycmz8Pt9ipY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VeSGAYYYxL2RZiet8lQGPQSHevyLmzs9/2lP3L/FLjRbj9m/NKJTKwa0pPzQmQ5DU
	 BAGmGpBI75ctCNoYAXZiIVVVaQ8rT1Qll5LwJHou2HOWA/keQTpyeNPdWbPZbJ3yp6
	 FQtk4hkdKLZ0O15Qn1wLTaC3NU/zG4Yci7hx0oe24bw9R3jFA9IYlog+TSTilMz4eG
	 UdTobY/ZYH5FkjFsZfjjp7k5kTMGqxirFQNUe/97j+wHQj9lA9xXelB5nJf4myXMnQ
	 /n/R2rlitGD4kTHiHmCe/+eWmCv7gSuRM0Ayf5oMv43ps91RvifSdeL4AFrXM6H45H
	 FNRu6g34AbjeQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wZuIP-0000000Dlun-1ahg;
	Wed, 17 Jun 2026 17:43:25 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Add Fuad Tabba as a reviewer
Date: Wed, 17 Jun 2026 18:43:20 +0100
Message-ID: <178171819812.3090852.2907545296309805581.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260617131237.2842619-1-tabba@google.com>
References: <20260617131237.2842619-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, tabba@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Wed, 17 Jun 2026 14:12:36 +0100, Fuad Tabba wrote:
> I have been working on KVM/arm64 for a couple of years, mostly on
> pKVM, and am currently upstreaming protected guest support, with more
> to come later. I already review KVM/arm64 patches more broadly, and
> am happy to continue doing so in an official capacity.
> 
> Add myself to the KVM/arm64 reviewer list.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Add Fuad Tabba as a reviewer
      commit: fcda30b134d262a1b1826555352bd7349051486e

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



