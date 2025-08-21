Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E6ACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 06:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rErWGumZLu4gwIsfX6lXxOGxFuhRmHleVgPyO8kQS3o=; b=0+sxdjcPX9LRXxDknAJJFJ8a3J
	yrEsQIN7p1DgCU9zfqWykmUF6d90NjbA/QKfaaK9573CqJR74m+LN2eQ0pI6BVlu55AVi4GthJxCL
	tj/UNpD93KkdAD+WjCw8yJ5H5WZ1XnWH8o+CrLJjt+KN5eFKqdWdpf3ZnrlfqKV05qXEOyuaBYbS7
	G4eMt5yq5Ny7prJVLZu27zRs7KlN4Css0OYq9wQii5WxZEuoAZISypGMj0ENk+Qgbzw8BkK/TEku4
	HaUKv026cnN2l/wVGr6NM+ubR1H0aCHJYXgFTBHd7G4svoY0RQD3rACEwB+QoUeclrletK+DqYHUs
	hFA1cIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyjb-0000000Fwwf-2zuw;
	Thu, 21 Aug 2025 06:25:15 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyX4-0000000FvSS-2b70
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 06:12:19 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 573EF1F967;
	Thu, 21 Aug 2025 08:12:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1755756737;
	bh=rErWGumZLu4gwIsfX6lXxOGxFuhRmHleVgPyO8kQS3o=; h=From:To:Subject;
	b=cFE8T77pvcGGVJmwfcXad9fpSzJgRG5tXoWvAjOUqPkWZwb9aEOINBoC1svyqtVs6
	 cIbxleeF9U9c9BdadbJSl9mqYUn9vqO4XjUUckakgPO2SkIFpkzIiD7/RuOjWwLWgB
	 riZVdNIcIxXq+6FnvS0ZA2ajzIlUAJXLYuUVDtptrXeDGtSynfh4RElCX6H1T5tWvr
	 lElNS8Ty3fdOHFGT93z5GC/w1DLiYvJrIXvv4R5GGRTJxpOd5yJefAB4N7z94BV/KH
	 X/G0YMh9lTeyLuz0QqlnHdk6gRyWDxaTU6w3tmf0SY6BdawJmmQtm6Ie1AbB7ZhyS6
	 dq4focRSoKbDw==
Date: Thu, 21 Aug 2025 08:12:14 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com,
	u-kumar1@ti.com, hnagalla@ti.com, jm@ti.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Andrejs Cainikovs <andrejs.cainikovs@toradex.com>
Subject: Re: [PATCH 18/33] arm64: dts: ti: k3-am62-verdin: Add missing cfg
 for TI IPC Firmware
Message-ID: <20250821061214.GC7503@francesco-nb>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-19-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814223839.3256046-19-b-padhi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_231218_810998_C0CA416E 
X-CRM114-Status: GOOD (  11.22  )
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

On Fri, Aug 15, 2025 at 04:08:24AM +0530, Beleswar Padhi wrote:
> The wkup_r5fss0_core0_memory_region is used to store the text/data
> sections of the Device Manager (DM) firmware itself and is necessary for
> platform boot. Whereas the wkup_r5fss0_core0_dma_memory_region is used
> for allocating the Virtio buffers needed for IPC with the DM core which
> could be optional. The labels were incorrectly used in the
> k3-am62-verdin.dtsi file. Correct the firmware memory region label.
> 
> Currently, only mailbox node is enabled with FIFO assignment for a
> single M4F remote core. However, there are no users of the enabled
> mailboxes. Add the missing carveouts for WKUP R5F and MCU M4F remote
> processors, and enable those by associating to the above carveout and
> mailboxes. This config aligns with other AM62 boards and can be
> refactored out later.

Are these memory ranges fine with 512MB DDR memory?


