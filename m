Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7EFC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 19:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDO6nFUTShVTRI2iq8gUfvNHc1/68/dnTMcWjAWG1oE=; b=1+kyI9UsLv8fao58GoV+PZUrtT
	mVanLw5FLZBlhNbr13tP0BM4TVlrcROHyW83ggvrWzg11xA/xGmiDEunYKYuviw5gOwX0j6sXix60
	rT2SNW0xCrpHtiwk6YZp5DvfAIWBsyJl60yvO3B8GduJ9BHnOL/3EO1lsnojPuVIxE4eG+2a085Ad
	VIDg/f+b/LQzXpWJRcw6Vdlh/0W4/23T3bZcJ1bhRqRFwnBSvgEkp6Y9Aji1IsIRmL9nWWHYn3/Dz
	A0rLiE+pFXLs8EmwVgIymHz+1gfJE9XjqtwoXpZchxZHoXpaP8VTIDIVjXbXvGws2wjEZR41MRPmd
	vyRUCPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzyj-0000000BQhK-1h9t;
	Tue, 27 May 2025 19:28:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzwa-0000000BQUr-2Mep
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 19:26:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6AA7AA4F228;
	Tue, 27 May 2025 19:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE022C4CEE9;
	Tue, 27 May 2025 19:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748373995;
	bh=8b7Ot1h0kWRufg9jq3azIqDVbfLb610Zg17izxeq5mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lbWgiM8BThAq1FK9PnBWXw5Ea3jqTSikytUKVSl2TLgIvZiMebu1I70wy7sHvHuV7
	 Mx/asaNJz8aXte7R/VQGO8OmA0QEHjtpQFGO49Maw23fNLD9mlu4DFAzMgV4I59AAb
	 IrD8YsHZJjl7I19eX2M46MssS503LfabJ0eWIMs5JRxImghckhaDwOZqrsbOI/pMcm
	 6C/wZe6lWOWaDmLT1mXeTBqbVocwP1SCkqJc8BT8PdsIkF7GOvXfztLu+pIyaLzC4+
	 fYJpolT/yc9BItvVIXwfUO+pOxtQag+8D6zR40aLbQfp73D5JycanCY7u7jvq4bHkP
	 6yjMeVfux3lLA==
Date: Tue, 27 May 2025 14:26:33 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	gregkh@linuxfoundation.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	michal.simek@amd.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH] dt-bindings: usb: dwc3-xilinx: allow dma-coherent
Message-ID: <20250527192633.GA1084631-robh@kernel.org>
References: <1747401516-286356-1-git-send-email-radhey.shyam.pandey@amd.com>
 <20250516-exclusion-suffocate-94a1c87c1262@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516-exclusion-suffocate-94a1c87c1262@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_122636_667435_24AB14F0 
X-CRM114-Status: UNSURE (   9.30  )
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

On Fri, May 16, 2025 at 03:16:02PM +0100, Conor Dooley wrote:
> On Fri, May 16, 2025 at 06:48:36PM +0530, Radhey Shyam Pandey wrote:
> > On Versal Gen 2 SoC the LPD USB DMA controller is coherent with the CPU
> > so allow specifying the information.
> 
> Sounds like it should actually be marked required on this platform, no?

Should still work without it, just more overhead of unnecessary cache 
flushes.

Rob

