Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41F0CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ek44j+taq2c0pP3ZgbbarkxWXGF/ST7eK83cOYjQXqo=; b=FQ/1nKxVVS5yeWKbiln5wEhup8
	DJe2/227cxn+0H/e/QlOIToYhn3MSSg34kMZV+Au8KYsp2R0DvDHEmruLnq90484w4TbPxbpf2sNL
	3gBggKiVWDEgTE4DaE9Oz55/vJHko5DqmCv9IgWO0ROO2c1j7hTFqFTnygzuflpZWIeE+JW1vG+o3
	FEXoh4CrwXJxUyUTD0WYhUrk0+i0brMsogonj5rp5mDzIiKeP8Zf+wqtdP+EqhepxhzKhLA5w4/mL
	D0A2uo4R8dFXqJMtTTIfIntn0vHABD0ZtxE2wmY0ROn+cRAv6JCM9V99oHkgCbiomrpfs1tM39h8D
	Lg0E/4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ9k-0000000HHtB-16yQ;
	Tue, 02 Sep 2025 12:30:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNeL-0000000GTus-0aGh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:50:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90BB6601FC;
	Tue,  2 Sep 2025 09:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7957DC4CEFC;
	Tue,  2 Sep 2025 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756806600;
	bh=8DvXbPFnI4+n7hHxbxXgOGqvAp5g/qxDSdMttlnJd5U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DItEqcQPAEKKBmNhaurvDktBCHmT4CxXYPQrpqnvvYXk2r0RBKOm83KnoAEDAwv3f
	 M+prW8UAbGCbx0WoabkpX+LsWr8thXEGRllDEA03z8xd+6qJUTowAq3bBw4HylU5+k
	 rJtnUhVHR93a0PTH5cD61Bj6EunKByj7bbyA262xogNu+FrHa/P6nYPAMO0uoNeN9O
	 wtrCD8yU/JSKvMMo+DZs4uq4VzUqMFalJj8DuwYCk4WIYPpEt+ogQE6wioQoUGasjh
	 0OXbh1cKAFPZ1a99p8faURKF94Zrsk4jDWZpjMiiMQ75nI5YCh6rqUKLgV7kh14VK7
	 fQvGPlTVVl1xw==
From: Vinod Koul <vkoul@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 michal.simek@amd.com, radhey.shyam.pandey@amd.com, 
 Abin Joseph <abin.joseph@amd.com>
Cc: git@amd.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250825130423.5739-1-abin.joseph@amd.com>
References: <20250825130423.5739-1-abin.joseph@amd.com>
Subject: Re: [PATCH RESEND] dt-bindings: dmaengine: xilinx_dma: Remove DMA
 client properties
Message-Id: <175680659600.246694.18044016578906182085.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 15:19:56 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Mon, 25 Aug 2025 18:34:23 +0530, Abin Joseph wrote:
> Remove DMA client section mentioned in the dt-bindings as it is
> not required to document client bindings in dmaengine bindings.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dmaengine: xilinx_dma: Remove DMA client properties
      commit: d5df661c9c76cb36d90527349ac6197a4baf2aba

Best regards,
-- 
~Vinod



