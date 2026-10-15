Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA7DCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyIHE1N8EhU4LfmaBkvq2F19q6tRD3/spV1VOIDMgLE=; b=cvJPHASqeWWgXlORywHbxAHGFo
	YMboyJo5eaigvz2HauOeCXbO7/MP4er8Dcl+w+QwQi60rEVWUouZ9+H46wv8XIUEdPv5paUg/nG/W
	8okyjW31E7hfo7dLJInMFgASsntmzWfDjJqaqxegDK/cqIrPHicONiCV1GYiVU/2zPCJfLPF6NXJK
	N8XLFIBPhodB+DGQA1kqr9FUfYBkdpR47Bs/a40E8GME5PmIJh+rjVcEuVj7fXIOET4XU+gmS9RZ7
	Tibl6UmyE/ArFJPybYJ5B1uoc0201cRe2K6oFM+543yH98GACuhvyD23546bbirtAusNJrtEr5LLG
	yDmWhLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL1R-00000000BSI-2Oxz;
	Thu, 15 Oct 2026 12:57:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL1Q-00000000BQs-1YgV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 12:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OyIHE1N8EhU4LfmaBkvq2F19q6tRD3/spV1VOIDMgLE=; b=dIg6+z4L5oYSxl+HEOxmDIzbPm
	HwVskEvSAsKXOsIdax674J6xGz5+xL87z7XEv8l3GTp7CoAK62uq969cFnS4pytnp/yZrpmcDzsi9
	aSwNXmtBE+TZ++FA38gF8W8sW6NAdfJWGcuRWit54CWDV0ZZkAxf2m75L8LAPpA+UgZipiKynmlJ8
	/K+H4oH23IKIFgyqUFIIPbBBLlq+8rsUDlf2sdf4+qMAc0pSSKOxS3mx5P66aUD2AKsiLgNYiD4RM
	csvi3z8tM/ZnfQqYdMQiK+b5Oco83hwWUdvjW5D+xN8lnguqUVQNdjSPPPC7HB8TA7YiohtduJJLm
	jVXMeOoA==;
Received: from out-110.mta1.migadu.com ([95.215.58.110] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHL1M-00000000Nwz-3nJw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:57:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=OyIHE1N8EhU4LfmaBkvq2F19q6tRD3/spV1VOIDMgLE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792069039; v=1; x=1792673839;
 b=u6ZvII4K4fHTNkJedM9DiM+1QjA6nMzZUQPTQZcDsPmNKCt/CyvcO4Vp+BTDc2c6pI5A9knk
 LtpSKB+YivY06zTskjBZEsjTknobwUKVpGxm1uHwBbr9SndY+loN4Nb/Aq7DmaiLY5rQMeZTesT
 J68wAbNCe2ic1YyGljQ21TP4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fe94d5db4e3b8dd5;
	Thu, 15 Oct 2026 12:57:19 +0000
X-Mizu-Trace-ID: fe94d5db4e3b8dd5
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 5/7] KVM: arm64: Add helpers to halt a vCPU
Date: Thu, 15 Oct 2026 13:57:16 +0100
Message-Id: <20261015125716.2650737-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261015100539.1011760-6-maz@kernel.org>
References: <20261015100539.1011760-6-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_135721_331811_BC960921 
X-CRM114-Status: UNSURE (   7.30  )
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

Hi Marc,

On Thu, 15 Oct 2026 11:05:37 +0100, Oliver Upton <oupton@kernel.org> wrote:
[...]
> Signed-off-by: Oliver Upton <oupton@kernel.org>
> Link: https://patch.msgid.link/20260929212925.31775-2-oupton@kernel.org
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Should this one have a Cc: stable too? Patch 6 is tagged for stable and
calls kvm_pause_vcpu() and kvm_resume_vcpu(), so it won't build in
stable without this patch.

Cheers,
/fuad

