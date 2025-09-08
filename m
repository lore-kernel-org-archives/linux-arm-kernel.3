Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E61CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 02:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bliwDgKbSpIP0SQAFOalQgK//vCgDNXhRwj9jFqniM4=; b=atM56zcxl5vhnu9piQUDhsIQkj
	+yRq19BMYqSVMleR7CNvOwwljAWs3iD1vXLpIKZZPzQBeouCpgH9ZzSlZ2LGKYQWF2AXWTA4t7nVv
	HgefpDZ0SbYIJ7lKDRjxzIX88U46Nz3vKMNLCjHsp/vc5cH5rXfmoajYL7IkUZNjOD6Di/NTWycG3
	WZe76ej3UGBQbv9/4/dBefa8TZLhRg/E1phh0ATabITNFBAVrApSQeQ97GcBLdlac30/eX9pRc1Wt
	ZO7ZGkOVFpFQLrvP5PrAnoBJHK3kvbgpgoW/IO9evo7OJSuScgWTk/MTOaAUxrDIXu644dJuzMFRj
	JaUwzTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo6M-00000003huQ-2jlp;
	Tue, 09 Sep 2025 02:28:59 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhPz-00000001qmm-2oZS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 19:20:50 +0000
Received: from francesco-nb (xdsl-188-155-97-38.adslplus.ch [188.155.97.38])
	by mail11.truemail.it (Postfix) with ESMTPA id 656A2233EF;
	Mon,  8 Sep 2025 21:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1757359241;
	bh=bliwDgKbSpIP0SQAFOalQgK//vCgDNXhRwj9jFqniM4=; h=From:To:Subject;
	b=m1EbeoYy4+s3xyw7uU3sTOqfaPwbEnJNsJ7lj1GREHwujDCcBEec7zpb8I7wsHYIn
	 cJpeYLy6zzabWZR6eEBVql5DU83zDTaJSsQXvaND6Wt3szmdmoYc5My9SozACQwV/z
	 5OLX4+LIfigtIZLchdqChYdaJHYsXxBbS21wUl3UPXLhGvWPNXSZzj22HKuI2T0SOM
	 qm64EOA9lOtH1ny8RoMZoO1vQWW0HsYd0yjniTDbjJWOGockwQXFwiF6twK6K4wa2Z
	 Tu+QbMl959thRqJwBiNpJ5H3fhzXw4dhjxK0FviOiYx2DLga/sNHW9TpEzAYCSv5tk
	 egN8VNWQxwFxQ==
Date: Mon, 8 Sep 2025 21:20:35 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com,
	u-kumar1@ti.com, hnagalla@ti.com, jm@ti.com, d-gole@ti.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
Subject: Re: [PATCH v4 15/34] arm64: dts: ti: k3-am62p-verdin: Add missing
 cfg for TI IPC Firmware
Message-ID: <20250908192035.GA4217@francesco-nb>
References: <20250908142826.1828676-1-b-padhi@ti.com>
 <20250908142826.1828676-16-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908142826.1828676-16-b-padhi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_122049_403351_0E191F28 
X-CRM114-Status: GOOD (  12.20  )
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

On Mon, Sep 08, 2025 at 07:58:07PM +0530, Beleswar Padhi wrote:
> The wkup_r5fss0_core0_memory_region is used to store the text/data
> sections of the Device Manager (DM) firmware itself and is necessary for
> platform boot. Whereas the wkup_r5fss0_core0_dma_memory_region is used
> for allocating the Virtio buffers needed for IPC with the DM core which
> could be optional. The labels were incorrectly used in the
> k3-am62p-verdin.dtsi file. Correct the firmware memory region label.
> 
> Currently, only mailbox node is enabled with FIFO assignment. However,
> there are no users of the enabled mailboxes. Add the missing carveouts
> for WKUP and MCU R5F remote processors, and enable those by associating
> to the above carveout and mailboxes. This config aligns with other AM62P
> boards and can be refactored out later.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Verdin AM62P

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com>


