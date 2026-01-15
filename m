Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A6BD4116B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqXe7k99qKywRgnIcu3j6+2jPmUk9m7B+9YQla7q7rU=; b=BsGK5FUiTj4xdauH9VokMwVNKj
	NqhaQ1PQqdAkFPUJiPRClnj1TtYkUPjM6R4KjQ8qHQqtSMUnf8p90yLkpUttAb4/ZO4SzPhI2RR0w
	85wUOPvtvHVxYsxS9Tn8GMJUiViWfz+644urBSukM79qocnmuG6aUZheTKb9tIu9O06oeb/0MavYF
	YRhUzO/seSsSqRILqA5UDxrrb3WzdfvcxiFyqd3h+POD/eytjXsWrXTMZxlu0ABWu+poDSiYdFisw
	wFea7SRHP4ZSORXGTo1faJCncsqVNnJ+oX1filraiKrP/hTrgPpQPji6ZFx3Kt2vx1+rdv707xNkZ
	XstJ4xqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKoO-0000000CAmb-1UmX;
	Thu, 15 Jan 2026 10:42:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKoL-0000000CAlu-0Ghb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:42:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABCC6FEC;
	Thu, 15 Jan 2026 02:42:32 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EBD13F632;
	Thu, 15 Jan 2026 02:42:38 -0800 (PST)
Date: Thu, 15 Jan 2026 10:42:36 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] Mailbox changes for v6.19
Message-ID: <aWjEnIfATvipFyKS@bogus>
References: <CABb+yY0Uvkc4g0=gi79j+CCJzKkeuHGD9u_6P5ScAFkNS0F+2w@mail.gmail.com>
 <CABb+yY2or-wT46Z3jGZ_ks91tHGM2D-1OYeL0xtHfuZURatg9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABb+yY2or-wT46Z3jGZ_ks91tHGM2D-1OYeL0xtHfuZURatg9A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_024241_138617_9260D379 
X-CRM114-Status: GOOD (  15.15  )
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

Hi Jassi,

On Wed, Dec 10, 2025 at 09:28:56PM -0600, Jassi Brar wrote:
> Hi Linus,
> The following changes since commit 7d0a66e4bb9081d75c82ec4957c50034cb0ea449:
> 
>   Linux 6.18 (2025-11-30 14:42:10 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
> tags/mailbox-v6.19
> 
> for you to fetch changes up to 1ec6e0e8c0dd6599472af944b8d703d526ff1031:
> 
>   mailbox: mtk-cmdq: Add driver data to support for MT8196 (2025-12-10
> 17:17:01 -0600)
> 
> ----------------------------------------------------------------
> pcc: refactor and improve initialisation and interrupt handling
> qcom:     enable Kaanapali and Glymur platforms
> renesas:  add MFIS mailbox driver
> mediatek: add mtk-vcp-mailbox driver and bindings
>           add support for MT8196 into mtk-cmdq
> misc:     remove unneeded double quotation in Kconfig
>           drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
>           fix out-of-bounds access in mchp_ipc_get_cluster_aggr_irq
> 
> ----------------------------------------------------------------


All these changes that were missed in the v6.19 merge window were accidentally
dropped from your -next(and hence the linux-next tree), I suppose, as they
were present until about 10 days ago. This is not ideal, and the pull request
may get rejected again if they are not in -next for some time before the next
merge window.

Could you please have a look at it?.

-- 
Regards,
Sudeep

