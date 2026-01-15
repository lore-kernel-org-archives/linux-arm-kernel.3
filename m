Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAC0D46600
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 17:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFuKu/ItRr9BZkgGaHak7zdPLGU5UTYLg0rKiU/U/Xs=; b=C4GzozIT+jCqsZlNSrwCXVlLti
	/6ZNGgLrIRhwgQVWoHcLwveuomcxb2Odpv3hX5WPj8J+9iE03XVyCfGCp1YM1aThNLTP9MR1A6MbW
	pSpKnq8A08DnfcbzL75j2J/+C7ac3FWLvpVZTdB1Uk9mLYpmc7yUXMtRuSG3M1te61hqlRHTVbA1/
	E1LyUgdHYdG9CrejfrkAkrfP+unqzcOR0DizDWYt2pdm3CGz0tyCGUphdnLqNehUXUsXWCXCm3ZTY
	89cu3xljkUbmg2u5Zwyt+Is/R1wHfXOp6RLqSrZIt1eR9rmtrbpffMtpD9Keaqsox99wW+V7RLaA9
	kuD03fMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQwh-0000000Cphp-3zhl;
	Thu, 15 Jan 2026 17:15:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQwf-0000000CphS-2gOB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 17:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9D7D42B78;
	Thu, 15 Jan 2026 17:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FB9C116D0;
	Thu, 15 Jan 2026 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768497340;
	bh=CFLpU1u38GKle+C6cYpgJnNkEttUIxUtdzGLXnMkwoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QPT7BmI3hr3HpXbL2GjektmaUijlaMge7GpIuQ1nUd1mTH84Gp3H91+6WRdqQRZ5N
	 YEHo/OXexrrLLsKgC36K96sf+lNY0UlQHT5ANyfiGz537WZzF9JDD8Bs9mhYwbAhJn
	 ty48Np6w9ZYTvg0cGtrOY+Jgm15FapQYDYh1xnsFhasqJpzX97flRkIUpVSyXMLXhY
	 NjsEHUgbVaR7uq9r7BJewYKkVrmpw5FxBkNi4lnR2r5YifbCtRdogijiCbBw77DtH/
	 SYGOgsGpPlwzDN8nl6DbfhROfl1j6b3bW+cMcaqqlj1XQ5Av/gLzdkJX8UAasAxyvQ
	 CGn9iTFMcPRpA==
Date: Thu, 15 Jan 2026 11:15:39 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Harini T <harini.t@amd.com>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jassisinghbrar@gmail.com, shubhrajyoti.datta@amd.com, git@amd.com,
	michal.simek@amd.com, conor+dt@kernel.org
Subject: Re: [PATCH V2] dt-bindings: mailbox: xlnx,zynqmp-ipi-mailbox:
 Document msg region requirement
Message-ID: <176849733940.905812.13413704726753399789.robh@kernel.org>
References: <20260109062259.1769305-1-harini.t@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109062259.1769305-1-harini.t@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_091541_700762_BB03F795 
X-CRM114-Status: GOOD (  11.48  )
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


On Fri, 09 Jan 2026 11:52:59 +0530, Harini T wrote:
> Add description clarifying that for Versal IPI mailboxes, both host and
> remote agents must have the "msg" register region defined for successful
> message passing. Without both, only notification-based communication
> works.
> 
> Signed-off-by: Harini T <harini.t@amd.com>
> ---
> Changes in V2:
> - The description regarding the "msg" register region requirement for Versal IPI
> mailboxes was moved from the conditional schema section to the main description
> block at the top of the YAML file.
> 
> V1 link: https://lore.kernel.org/all/20251222044653.1757886-1-harini.t@amd.com/
> ---
>  .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml     | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


