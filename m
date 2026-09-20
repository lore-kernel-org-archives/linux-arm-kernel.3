Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E2EC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 07:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BDGtN+BqSpKhCEqL/q/4vSgH4qRdVgc5NPKQyRenC0=; b=mydfdD1fcMBj9eJ00MM1UtmtCR
	4V1LA2sFNbOZqYlfWF3YsdqNAjBTiqyR+GvPG4wrtWzq/oFYOjiR4/A0w1NmYexOQsrSpLNsNeRED
	fEtKms5F/mrDgReweBy4vxLzrN/lCKhbAJT/DrXZ2XKd5i7Uqmp6yN7YRcg2588d6rk3JwQeSxzoK
	MRO1I40Bdbqm/O8m5mE+4QSBw253uMPTiw2Q4JA6KJsqQq/3x48IS4aaWFF+v54vemw8ld8xCueNV
	ujtLxBNWUYFQmw55juPXj6yCKocvlzpVlUT6oZFScZqsMvijrj9uG9p90tiVSdmf2dav2TKF4qlUz
	E9HV1zGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CCF-0000000H3XK-3Skh;
	Sun, 20 Sep 2026 07:42:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CCE-0000000H3X6-1AMG
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 20 Sep 2026 07:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3BDGtN+BqSpKhCEqL/q/4vSgH4qRdVgc5NPKQyRenC0=; b=YYEORWGNiX+SPnLrm0rdLRTr2O
	pdHRi0WCS/Ykx7mN+3SkeoHzUy5ewPmpoH35JrrM1Xzx9tH9bVGDGHau1Vh9JucEWq+I9ytMgIPfe
	KQ9Kfs657IOgVlJunsgKn4oMyhq3DW9hQ87WswRfvNXOADKytOAhKfqY7ELp5FeIIEjer8JhP76yE
	HewsbQXXIm27YAWL5m97LhBZ5e1HehxM6eNkKN1AqiLb25LnLeV0t4un9+VFmgynAcI5CAkv0Ik+8
	/iP76PyKp8uaUVlgglJIjL2MRwbbCRO68CVvB8C33/B6uQJHlmJK2J1uS1jARWPQjOVvyKH7qCTL+
	U74f/8cQ==;
Received: from out-82.mta1.migadu.com ([95.215.58.82] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8CC9-0000000BFvO-35z0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 07:42:44 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XACIHRk7pvR3ne8CI5yYmGZaL8q2kgBI23W8AaJmnmw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789890160; v=1; x=1790494960;
 b=hLqtI2jsb1Yi6iEZM0kP6YcXRZ/BParR6qhARgb/niOqQZdg4wc6QnflM31u6EHVwIXc4ayl
 kYHk6jsaJrF5Dabu9dPkmD3+TajvGV92MApTW9Eqj0yvYZjRaevpZ8PREQIlGreSTFbdbfKWMuh
 fidqhWWqbxiQSFU9sSHGV4kA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6ff25d7f64fa7a0b;
	Sun, 20 Sep 2026 07:42:39 +0000
X-Mizu-Trace-ID: 6ff25d7f64fa7a0b
X-Migadu-Flow: FLOW_OUT
Message-ID: <327d0a31-7a04-4ec2-b184-c801a95750e9@linux.dev>
Date: Sun, 20 Sep 2026 15:42:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] irqchip/gic-v3: Lifetime and range fixes in the GICv3
 and ITS drivers
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260908142632.2795308-1-fuad.tabba@linux.dev>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260908142632.2795308-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_084242_572849_F46F9043 
X-CRM114-Status: GOOD (  17.33  )
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

Hi Fuad,

On 9/8/26 10:26 PM, Fuad Tabba wrote:
> Hi folks,
> 
> Three fixes to the GICv3 and ITS drivers, from reviewing the GIC series
> floating around and chasing down Sashiko's reports.
> 
> The first releases the partition node that gic_irq_get_fwspec_info()
> takes from of_find_node_by_phandle() and never puts. Sashiko raised it
> on an of/irq patch of mine, and I said a fix was forthcoming [1].
> 
> The second widens the per-device MSI clamp, which truncates to zero when
> GITS_TYPER.ID_bits is at its maximum and then denies every MSI on that
> ITS. I couldn't find an implementation that reports that maximum, so
> this is one value at the edge rather than something anyone is hitting.
> It carries Cc: stable because the commit it fixes was itself
> backported, so drop the tag if you'd rather.
> 
> The third clears vpt_page once its_vpe_teardown() has freed it, so the
> NULL guard holds if teardown runs again on the same vPE.
> 
> Based on Linux 7.3-rc2 (df2908090cda3).
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/CA+EHjTx7eP_30vP47=UFk_wMAut-2uf+2DF-MZqn2SLE_k-8qg@mail.gmail.com/
> 
> Fuad Tabba (3):
>   irqchip/gic-v3: Release the partition node in
>     gic_irq_get_fwspec_info()
>   irqchip/gic-v3-its: Don't clamp nvecs to zero when id_bits is 32
>   irqchip/gic-v3-its: Clear vpt_page after freeing the pending table
> 
>  drivers/irqchip/irq-gic-v3-its.c | 3 ++-
>  drivers/irqchip/irq-gic-v3.c     | 7 ++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)

All look good to me.  Thanks for the fixes!

Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Zenghui

