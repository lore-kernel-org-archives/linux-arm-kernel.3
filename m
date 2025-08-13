Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421B6C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 23:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2TmOU/FysjsHnOJuDF0/FyfY9rYX5x9MA3yl9yoYVc=; b=uAYGRDXUic/rx+ovoWDObhWEV+
	dxB6HjouNv3jACBw3goWZvCTPECkpl7ckfsiarndjvOD7w7reco8fEKDhmXEMetqykJxePlLBADrL
	hwfU+Vo/mYS58G9QcQBrXUtQZtUvO6b/FmfJnO7iSk4HNepNexF8nGaCNcr4yuqYiixAhbNG+ohcw
	gZlGeAUnv4jpQwmc3SffRwi9g+LSZPI+NwNl8se1R2qTPiMYJv+UMnydbCMP9z5sH6NRB3CSlC0Tk
	WQ3uVDSVArv+IFoOjuqt6XrxCvBQ2MZGsLtGAzSHr5ZGzZDXrxbyJEvs3ZwWOa3ClfmshAes2TfRH
	cknI4XoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKbS-0000000FER6-1gdM;
	Wed, 13 Aug 2025 23:09:54 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKYt-0000000FE8H-3ZPm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 23:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1755125807;
	bh=yVULnksl4OKg12CxxFYhPKFfdwxXkGZSNGl9YwQ9v2c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c9cXknZDA7jyMse2KwiTCmhQnLux9UKA/5fhjfEmP5A5B2TlCljggrqBrGgxMyVbs
	 uvPkj/FSbvMznPSZdPr95SfEj6EpM9re3w44gRah73+XyU05DKRl+AmPV2FjXmKZoB
	 FCBoKE4TInJVdKQyFAb3GKWl0c9/xEjxlIc5Sh+8=
Received: by gentwo.org (Postfix, from userid 1003)
	id C26E3401FB; Wed, 13 Aug 2025 15:56:47 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id C15174010E;
	Wed, 13 Aug 2025 15:56:47 -0700 (PDT)
Date: Wed, 13 Aug 2025 15:56:47 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Sudeep Holla <sudeep.holla@arm.com>
cc: Jeremy Linton <jeremy.linton@arm.com>, 
    Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com, 
    will@kernel.org, patches@amperecomputing.com, 
    Shubhang@os.amperecomputing.com, krzysztof.kozlowski@linaro.org, 
    bjorn.andersson@oss.qualcomm.com, geert+renesas@glider.be, arnd@arndb.de, 
    nm@ti.com, ebiggers@kernel.org, nfraprado@collabora.com, 
    prabhakar.mahadev-lad.rj@bp.renesas.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
In-Reply-To: <d172f30d-28ad-dd46-1385-f010107bc789@gentwo.org>
Message-ID: <c45b13b9-52ae-a52b-ce39-77f7ebe09507@gentwo.org>
References: <20250808025533.6422-1-shijie@os.amperecomputing.com> <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com> <cb383a76-8848-44cd-6f32-fd30478d9ebd@gentwo.org> <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com> <20250813-gifted-nimble-wildcat-6cdf65@sudeepholla>
 <d172f30d-28ad-dd46-1385-f010107bc789@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_160715_926298_A77D8038 
X-CRM114-Status: GOOD (  13.84  )
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

On Wed, 13 Aug 2025, Christoph Lameter (Ampere) wrote:

> Can we figure out which platforms benchmarks were affected and why?
>
> It seems the notion of a "cluster" on ARM64 is derived (I guess a better
> word than "invented" hehe)  from sibling information instead of PPTT. But
> using that information should work fine right?

Sorry no that is not correct. The cluster information is correctly read
from the ACPI tables and the cluster ids are avaialble in

	/sys/devices/system/cpu/cpuXX/topology/cluster_id

if CONFIG_SCHED_CLUSTER is enabled.

If there is an issue then it is a problem with the vendor firmware
providing cluster id configurations via ACPI that cause regressions.

We could add a blacklist for those platforms to avoid regressions but we
should not allow that to hinder us to enable full support for clustering
on ARM64.




