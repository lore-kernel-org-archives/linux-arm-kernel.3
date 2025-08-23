Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D826CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 19:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=al4cMcBWRH9QgIUZIz9Q7Wj6h73BaDiii1apCj2i8oI=; b=IXmIMRupmUsurr1jYW4/r9SFKr
	ZBQ1hlALfYgyvZkqy2T6VrDPkrJrs1wNETf5lwhpjxN/am+A2raL2WU+H1F61n9CscQFCmLlstlai
	sm96jMb5om77qIFlOxQKbSe0imFvfP7W0yXUcLvogi7YKHIemagQXLVPQyVl/ofOau25M89G6jPsT
	zgSSj8dIE3+Xby1pgYg2RmALWnipMKWNWHLV8kFlp6cfsjZg+hP3y/eBed+oCOaBQ1nEe4eUfXkNv
	3nE5qVVhtbYLwO1M5KSghqT3yL6ibj/GS/fDj7p38saI7ySSGWazooXYTqWfYtdmCuS7vfGXkSt7u
	EsdrCabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uptbi-00000005DKy-0iyp;
	Sat, 23 Aug 2025 19:08:54 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprL5-000000054ZH-0tOH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:43:37 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A770F22BD1;
	Sat, 23 Aug 2025 18:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1755967406;
	bh=al4cMcBWRH9QgIUZIz9Q7Wj6h73BaDiii1apCj2i8oI=;
	h=Received:Received:From:To:Subject;
	b=VDwQcKNfKWVRs3Ur1vxksqe0mDrvIRYusFgqfjqnoWR4gfhuN2nVjF2k664KWqZ92
	 1iw/Vyy+i86F6UAE+Bsu7BUP4KkgDvepAuMwAyveFyXIKtSBtJCk+nylsDtp5CKPXf
	 PnIEe2Jd8w2WqFP4cJN1vkLpbGHVots+a4HgbTcbqn9TC4Ri5hpB0m5ZNRweKGmRLB
	 56qtB+TLS2SREtdusePEGjXBPk67NLt7amc2eJDLgxSq0dGe8kNCJnG+PruISc75S/
	 yHJEiLUR9DM4jE9x7N7ClfovxOJHn2OvpUmQUOlcZqLqorZmg4m9+3lBIPl9D1QwbX
	 vCxc3pE3MfWyQ==
Received: from livingston (unknown [192.168.42.11])
	by gaggiata.pivistrello.it (Postfix) with ESMTP id 608B67F996;
	Sat, 23 Aug 2025 18:43:26 +0200 (CEST)
Received: from pivi by livingston with local (Exim 4.96)
	(envelope-from <francesco@dolcini.it>)
	id 1uprKw-0002Hl-0k;
	Sat, 23 Aug 2025 18:43:26 +0200
Date: Sat, 23 Aug 2025 18:43:26 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Beleswar Prasad Padhi <b-padhi@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, nm@ti.com, vigneshr@ti.com,
	kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afd@ti.com, u-kumar1@ti.com, hnagalla@ti.com,
	jm@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
Subject: Re: [PATCH 16/33] arm64: dts: ti: k3-am62p-verdin: Add missing cfg
 for TI IPC Firmware
Message-ID: <aKnvrh2TSksb_39i@livingston.pivistrello.it>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-17-b-padhi@ti.com>
 <20250821060629.GB7503@francesco-nb>
 <ecff956d-1019-41d0-9bfc-b0bdc30e87ba@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecff956d-1019-41d0-9bfc-b0bdc30e87ba@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_094336_292527_646EF2B4 
X-CRM114-Status: GOOD (  27.72  )
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

On Fri, Aug 22, 2025 at 10:09:48PM +0530, Beleswar Prasad Padhi wrote:
> 
> On 8/21/2025 11:36 AM, Francesco Dolcini wrote:
> > On Fri, Aug 15, 2025 at 04:08:22AM +0530, Beleswar Padhi wrote:
> > > The wkup_r5fss0_core0_memory_region is used to store the text/data
> > > sections of the Device Manager (DM) firmware itself and is necessary for
> > > platform boot. Whereas the wkup_r5fss0_core0_dma_memory_region is used
> > > for allocating the Virtio buffers needed for IPC with the DM core which
> > > could be optional. The labels were incorrectly used in the
> > > k3-am62p-verdin.dtsi file. Correct the firmware memory region label.
> > > 
> > > Currently, only mailbox node is enabled with FIFO assignment. However,
> > > there are no users of the enabled mailboxes. Add the missing carveouts
> > > for WKUP and MCU R5F remote processors, and enable those by associating
> > > to the above carveout and mailboxes. This config aligns with other AM62P
> > > boards and can be refactored out later.
> > > 
> > > Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> > > ---
> > > Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > Cc: Parth Pancholi <parth.pancholi@toradex.com>
> > > Cc: Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
> > > Requesting for a review/test.
> > > 
> > >   arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 42 ++++++++++++++++++++-
> > >   1 file changed, 41 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> > > index 6a04b370d149..0687debf3bbb 100644
> > > --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> > > +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> > > @@ -162,7 +162,25 @@ secure_ddr: optee@9e800000 {
> > >   			no-map;
> > >   		};
> > > -		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
> > > +		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
> > > +			compatible = "shared-dma-pool";
> > > +			reg = <0x00 0x9b800000 0x00 0x100000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
> > Node name should be generic, `memory@9b900000` ?
> 
> 
> Humm, that memory is reserved and has the 'no-map' property. So it
> technically is only used by the node which references it (a particular
> rproc in this case), and never used by Linux for any allocations. So it
> is not generic memory per say...
> 
> So I was inclined for putting the specific node name which uses the
> carveout in the label. What do you think?

My understanding is that the node name must be generic, as required by
the DT specification. What matters is that this is memory, not what is used
for.


So it should be something like


mcu_r5fss0_core0_dma_memory: memory@9c900000 {
	compatible = "shared-dma-pool";
	reg = <0x00 0x9b800000 0x00 0x100000>;
	no-map;
};


Francesco


