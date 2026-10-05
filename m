Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A78CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyajoXEiE5OZTyyC4HoS1mecTSELNPfDNIq8DNtLUK4=; b=Jo8WBDpl42hRaMi06Uubee/Kvt
	SkhGe0diEdLxlslbWR5uyg8BDSn9r56M4BEvb+Bqf2FOdlksrl2upZqIo0weSKF2ZN9LeIpI2G/sB
	ZXszp2lwiqAach15O7LDQ6kWDBUo512PjmYwaF9rkGj+Na7n03EoYVu9Ikb4rGC3/W02vjxoTAfjc
	/XDyMDsa3HchGQdeicIdeIGCxbqU7rBD1ZJ6eKuRJsBt+EyV9gNRY/XZiyh0WqNVG1sR4qGegOBaA
	BLMIEY11ox934hPKaRLuAAzkL64hFOoXMm+HHTDDErrlMBBZ9qetptuWx/8iNYvsmiKKZ148J+JwA
	4cGT1Png==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdlM-0000000FqGM-3rhQ;
	Mon, 05 Oct 2026 08:09:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdlM-0000000FqGE-0PVN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:09:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F8276022E;
	Mon,  5 Oct 2026 08:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97EC1F000FF;
	Mon,  5 Oct 2026 08:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791187770;
	bh=DyajoXEiE5OZTyyC4HoS1mecTSELNPfDNIq8DNtLUK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BDiOIjRQv1EGmqCsNVvPO3VFpxHPm1p+dL8msuPVOWYylIPSmUBxkBrmoJq8b3/eZ
	 Q5B9CvoKyaXadPxVRJiLiXD2fXWIk0+85yhB5IdDANPsNr/Q7bjA73Xj9rQd6tEwqQ
	 QImX85QUrDamFCxTH4qvftrRyFfGdZ7uedb3AMgP+igyN1Nj8EpmQ+P7N53ZA3XsG/
	 0ub4/sS12G/7vkyCcbRElBOaiHrqFYqS/3FAp4l82Vbz1EqrJdTeFEbkmuQEgqMFaD
	 5CfUy3wJXzKd5MAT5k6QMIqnpGm+YNtPG11nuPaopCqsL3eHGYg+F6w5ByXvn3ZI1r
	 Mjv1Juutcwq4A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xDdlI-0000000Gyvk-2GAO;
	Mon, 05 Oct 2026 08:09:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Vincent Donnefort <vdonnefort@google.com>
Cc: joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	fuad.tabba@linux.dev
Subject: Re: [PATCH] KVM: arm64: pkvm: Drop keneldoc markers for the allocator structs
Date: Mon,  5 Oct 2026 09:09:22 +0100
Message-ID: <179118775350.630534.9707834125912557281.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005072046.2246900-1-vdonnefort@google.com>
References: <20261005072046.2246900-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, vdonnefort@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, fuad.tabba@linux.dev
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

On Mon, 05 Oct 2026 08:20:46 +0100, Vincent Donnefort wrote:
> chunk_hdr and hyp_allocator are private. Their description is not
> exposed to the API documentation. Drop the kerneldoc markers.
> 
> While at it add the missing description for chunk_hdr::data.

Applied to next, thanks!

[1/1] KVM: arm64: pkvm: Drop keneldoc markers for the allocator structs
      commit: 6b1abd43b27a5ecac0672482dc8ca1e48c2c8d15

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



