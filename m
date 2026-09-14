Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7A1C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+r7yrwNWfO4qWrGcEbhhzbX1H6jV4wg/ZwNYAWuumI=; b=sOsSnpgzLzvFNTFBEPGEc6FAZc
	0UPmkorkF2Nc3Y5fJD/BQa6KFhxjH47BXUSUku/x7pBy5A2GS4Vsb77tJimDH0VTVHqo5ANorMZ51
	MhIZwi5GOcfgGHsHbUOuy2BVPtbMQI2gRzhlP1+AoY/CXKtBMWik3KocVjitATOfRqWDoTQJjpsVX
	SM3r0vdik41aSMqXT/B8/sWJlyVRE0gZ7QntrFn61ugIRAQR4HAbNwP4mEHN+YgDd8veW6fGNqXaq
	rALl2zb6UbyaNJ7I+sw3L4OeOibKsA0wXe5Xo9BDpJuVW143EU4woA+72ZHxXcaPvuTw0m0IBIDRQ
	hoIReVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Q5-00000003Sz5-1tZb;
	Mon, 14 Sep 2026 12:04:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Pn-00000003Srf-0V6M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:04:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EC6C60142;
	Mon, 14 Sep 2026 12:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FF31F00893;
	Mon, 14 Sep 2026 12:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387442;
	bh=1+r7yrwNWfO4qWrGcEbhhzbX1H6jV4wg/ZwNYAWuumI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=As1LDNmPcO+bItnYVTrRKyXFzsST2WVwN3NsdjQa+gtH0tYltoOvs/MvYiID8ZYMW
	 uGcSz+i1kPv1x36C8Y/isIgOBDyE9Hrth8etpgzTc39DCl4L+uNHxMQJ+fFols0dLT
	 u99jdYYXODnOaAWr7x75JEjatufXdb91zP1l7lIKL0ci3ZixB0jm/E/dzAuenS9yuW
	 E+dKsuLKYVWdFjUlxefmmKtR7mmq12sVUXLGOYCMooxkkvOV9MBv7UqGXYRXmCn26R
	 mYGVT4baTKo77Li+8p2NNsO7aFlqgn3tBGrUuxKLyNCqK5hAj6lFz77RNkJBOtpadP
	 /tv8LyrvBbZMQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x65Pk-00000008bCx-0CSI;
	Mon, 14 Sep 2026 12:04:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: vgic-its: Reword the comment on a collection-less ITE
Date: Mon, 14 Sep 2026 13:03:58 +0100
Message-ID: <178938739490.3215146.14243922330046405279.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260817092705.1112634-1-fuad.tabba@linux.dev>
References: <20260817092705.1112634-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, eauger@redhat.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, sascha.bischoff@arm.com, sebastianene@google.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, 17 Aug 2026 10:27:05 +0100, Fuad Tabba wrote:
> The comment above the NULL collection check in vgic_its_save_ite()
> names only MAPC with V=0, which is UNPREDICTABLE. The route that
> requires the check is clearing GITS_BASER<coll>.Valid on a disabled
> ITS, a legitimate operation that orphans every ITE at once. Name both
> routes.
> 
> No functional change intended.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: vgic-its: Reword the comment on a collection-less ITE
      commit: 356abf7cedff742621c9b7ae8ecfa7d0febb0b9e

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



