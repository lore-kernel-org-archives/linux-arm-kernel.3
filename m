Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977E1E95399
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yvl8XJa2FFVB+XIh3531tRLDGeNa7EMUHdeJD2Yqagk=; b=zXoW+rmZB3mbv4PTCvIqWhp4aO
	Wj80XYvqmQ+fC+E9uZlg2c0tABdlFeUHLJLq4+4pp4dd2reaa+PKLtPIQYZMsAIRnOlu3GE45DqZV
	QoNgGJRPvi1rroUFjB6AG+yCbZSAxFLXWoGCCejLDbvlFttyJ6NePaG5t4fvAFfJAqrc062RQAQh3
	YceMK9AqIlQ8cZjeWNzkG5NaopBTq7F6p10sFNBgtxkJNSQFHoqhdZJya7xVmK5eSIU4T60QmhBlj
	0/lbIS/psZGPkpgQcn+oxTClqdwhkFiqMyOetIj4QuOMPX5pVg+xPPzlInacQXgtmdGNyqyTz6H8U
	iDTgnb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncZH-00000008Ta5-0RY3;
	Wed, 04 Feb 2026 13:05:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncZE-00000008TZZ-2CAy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:05:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35B3A423D4;
	Wed,  4 Feb 2026 13:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81737C4CEF7;
	Wed,  4 Feb 2026 13:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770210311;
	bh=Hx6NFYTFGKEqU4p+d+bpM74eF0b9omNPgd5ukVZgyGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyRBDbKrxUS4lv7rdNYXGjs3Ab0G4ZRQtqcAI+4rRGrW9u090/iXGf+dpAf/lzbIj
	 XXqNBDe/V1RLdQ81r0J9nyReRxhlvzLwzSZEnFPxvWQNHcLssPbx2taNct+TwOnqfF
	 VpVvFgEcF2wfCk1SkrDeb27aRF1j+jClEomySFKSOVw0qZteqUFq+ZLlACIs6ZpZGc
	 LMz/TQjLY1CxWV8tV5iVq+iobc3MlhMuM6h3tUQ+0Ek5Fem/WNlXxBkuYM7f1XonyX
	 5z74z+TNUUJ6IVZgknbmkDGwThaA9XWK16Xp+slz/kMw2G/kscssyIEhL8KB82FWtw
	 +yaL/lR7yNCWw==
Date: Wed, 4 Feb 2026 14:05:06 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/gic-v5: Fix spelling mistake "ouside" ->
 "outside"
Message-ID: <aYNEAorI+Ax/nDie@lpieralisi>
References: <20260203210735.5036-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203210735.5036-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_050512_604107_D327674A 
X-CRM114-Status: GOOD (  14.83  )
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

On Tue, Feb 03, 2026 at 09:07:35PM +0000, Colin Ian King wrote:
> There is a spelling mistake in a pr_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index e24ce3d9fb62..8c4cf8430871 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -902,7 +902,7 @@ static int gicv5_its_alloc_eventid(struct gicv5_its_dev *its_dev, msi_alloc_info
>  		event_id_base = info->hwirq;
>  
>  		if (event_id_base >= its_dev->num_events) {
> -			pr_err("EventID ouside of ITT range; cannot allocate an ITT entry!\n");
> +			pr_err("EventID outside of ITT range; cannot allocate an ITT entry!\n");
>  
>  			return -EINVAL;
>  		}
> -- 
> 2.51.0
> 

