Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C30FCA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pOOHCwPYM2BW6pFsz1VPyDKQK/ppxdFhtSXZN1wVsc=; b=JJuhvlFIvW/AKY+pzUW41Horcc
	4O+DKvpOINswxCo4hp1FcTHhL9PyFUrbuWhYgo58yb3y2oAhrNqdPoe5BHIj1W49JvQCe5vO8Hxst
	AYiPocwUOjJ/69Y6ZG8PnT/eOpYJHXsBhp18fBl0sB3UEQRruyjWukBx9aLSyu0WpJL2xWvRwCa/0
	nHzTc/dJpuNa9LJcLT2oUt6pV25wqJkKkyRMwF9YfZcZZ54KxF0hTu/av01XFUquAXlrzFdAzhwNd
	xqaLUURGgYmbpjLShIQW3v0IvAqStVYcqFUiIS/vwz5CUshssJ6GZtEIgSWMWqfTweR+/N3sdH/96
	AcreUWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCur-0000000A9nl-24sS;
	Mon, 12 Oct 2026 10:05:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCup-0000000A9nb-1lYZ;
	Mon, 12 Oct 2026 10:05:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BF00060213;
	Mon, 12 Oct 2026 10:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26EA1F0089B;
	Mon, 12 Oct 2026 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791799554;
	bh=9pOOHCwPYM2BW6pFsz1VPyDKQK/ppxdFhtSXZN1wVsc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cYWk47xs5RcH0WdPcyffx7nRb+ajPrkjs6zI9A3RWdvCk2xK0T9k+8Yw+fgWZyH/W
	 sGufyZ08PberHcU1pKmCqFnBnafpo2J8dK8+kiI4adlCSM7TEnr+QRHiNaBSweXrYC
	 L/wC9BMa3I75WVWCAxGZfwGz2o7z4Yucym2l4osGe+tD/iGF/5OyAK/TqPgrgUpAG2
	 O2TOEmJGbmjlrcq5J6Sr74Y8EGl7HlDxHPGMxaYz5qOYp8Uiv37/3Wyvz/SetaFk4i
	 Kuy8xX3cv/rWgQJWEIVzJZkMVorrmBNNfDHBGbOzfmBzyUSCo97WRCPPfT+QHl4MuH
	 stuaZOqA5s66w==
Subject: Re: [PATCH net] net: airoha: keep PPE offload when NPU refuses flow stats
From: netdev-bot+sashiko@kernel.org
To: sayantann11@gmail.com
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bread.hsu@airoha.com, sayantan.nandy@airoha.com, kuba@kernel.org
Date: Mon, 12 Oct 2026 10:05:53 +0000
Message-ID: <179179955348.434549.1772581551578097881@kernel.org>
In-Reply-To: <20261008094828.15458-1-sayantann11@gmail.com>
References: <20261008094828.15458-1-sayantann11@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch introduces a NULL-based MMIO dereference race through
  the new mutable ppe->flow_stats flag.
- [Medium] The patch makes an undocumented PSE hardware change that is
  unrelated to the stated fix.
- [Medium] airoha_ppe_offload_setup() (airoha_ppe.c:1456-1466) treats
  every non-zero return from npu->ops.ppe_init_stats() as a firmware…

--

net: airoha: keep PPE offload when NPU refuses flow stats

This patch makes NPU flow statistics optional for PPE offload. A new
ppe->flow_stats flag records whether flow counters are available. If
ppe_init_stats() fails, offload setup logs a warning, clears the flag and
continues instead of aborting. A zero npu_stats_addr returned by the
firmware is also treated as a refusal (-ENOSPC).

> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
> index 92611802801ea..fbc200614de3f 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c

[ ... ]

> @@ -144,6 +141,10 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
>  	sram_ppe_num_data_entries =
>  		PPE_RAM_NUM_ENTRIES_SHIFT(sram_ppe_num_data_entries);
>  
> +	if (ppe->flow_stats)
> +		airoha_fe_rmw(eth, PSE_FC_CFG, PSE_PORT6_SHARE_DIS,
> +			      FIELD_PREP(PSE_PORT6_SHARE_DIS, 0));

[Severity: Medium]
Is this write meant to be part of this patch? It clears
PSE_PORT6_SHARE_DIS in PSE_FC_CFG, which turns on shared buffer use for
PSE port 6 (CDM3). The commit message only covers the NPU refusal fallback
and the zero address check, and it doesn't mention this register.

The write runs on every system where flow stats work, not on the refusal
path the commit message describes. Port 6 is the port that
airoha_ppe_foe_flow_stats_update() sends stats-enabled flows to:

	*ib2 |= FIELD_PREP(AIROHA_FOE_IB2_PSE_PORT, 6) |
		FIELD_PREP(AIROHA_FOE_IB2_NBQ, nbq);

Also, airoha_fe_pse_ports_init() gives that port's queues zero reserved
pages. If this bit resets to 1, this hunk would be quietly fixing drops
on the existing flow stats datapath. Should that go in a separate patch,
with its own reasoning and Fixes tag?

When flow_stats is false, nothing writes the bit, so it stays at whatever
value reset or firmware left. Is that intended?

In airoha_regs.h, the new defines sit between PSE_FQ_CFG and its field
mask, and ahead of REG_FE_PSE_BUF_SET (0x0090):

 #define PSE_FQ_CFG			0x008c
+#define PSE_FC_CFG			0x0098
+#define PSE_PORT6_SHARE_DIS		BIT(22)
 #define PSE_FQ_LIMIT_MASK		GENMASK(14, 0)

That makes PSE_FQ_LIMIT_MASK look like a field of PSE_FC_CFG, but
airoha_fe_set_pse_oq_rsv() reads it from PSE_FQ_CFG. Could these defines
be moved so the register addresses stay in order?

> +
>  	for (i = 0; i < eth->soc->num_ppe; i++) {
>  		airoha_fe_wr(eth, REG_PPE_TB_BASE(i),
>  			     ppe->foe_dma + sram_tb_size);
> @@ -1456,10 +1457,13 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
>  	if (ppe_num_stats_entries > 0) {
>  		err = npu->ops.ppe_init_stats(npu, ppe->foe_stats_dma,
>  					      ppe_num_stats_entries);
> -		if (err)
> -			goto error_npu_put;
> +		if (err) {
> +			dev_warn(eth->dev,
> +				 "NPU firmware refused flow stats setup (%d), offload runs without flow counters\n",
> +				 err);
> +			ppe->flow_stats = false;
> +		}

[Severity: Medium]
Is every error from ppe_init_stats() really a firmware refusal? Only two
cases look like refusals: -EINVAL from a mailbox status other than
NPU_MBOX_SUCCESS, and the new -ENOSPC. But airoha_npu_ppe_stats_setup()
and airoha_npu_send_msg() can also return:

  - -ENOMEM from the GFP_ATOMIC kzalloc_obj()
  - an error code from dma_mapping_error()
  - -ETIMEDOUT from regmap_read_poll_timeout_atomic() if the mailbox
    never completes
  - -ENOMEM from devm_ioremap()

Before this patch, these errors made airoha_ppe_offload_setup() fail, and
the next tc block callback tried again. Now a short-lived allocation
failure turns off flow counters for the lifetime of the device. A stuck
NPU mailbox is also reported as "NPU firmware refused flow stats setup".

In the -ENOSPC and devm_ioremap() cases, the firmware has already
accepted PPE_FUNC_SET_WAIT_FLOW_STATS_SETUP with foe_stats_addr set to
ppe->foe_stats_dma:

	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
				  sizeof(*ppe_data));
	if (err)
		goto out;
	...
	npu->stats = devm_ioremap(npu->dev,
				  ppe_data->stats_info.npu_stats_addr,
				  size);
	if (!npu->stats)
		err = -ENOMEM;

Nothing tells the firmware to stop using stats. Meanwhile,
airoha_ppe_hw_init() switches to the no-stats layout: it drops the
PPE_STATS_NUM_ENTRIES SRAM reservation and programs SRAM_TB_NUM_ENTRY
with the full PPE_SRAM_NUM_ENTRIES. Can the driver and the firmware end
up disagreeing about whether stats are active?

Would it make sense to fall back to no stats only for the refusal codes,
and keep failing setup for the other errors?

>  	}
> -
>  	airoha_ppe_hw_init(ppe);
>  	airoha_ppe_foe_flow_stats_reset(ppe, npu);

[Severity: High]
Can this lead to an MMIO access through a NULL npu->stats in
airoha_ppe_foe_entry_get_stats()?

Before this patch, a failed ppe_init_stats() aborted setup. So whenever
eth->npu was published, npu->stats was a valid mapping. Now the rest of
airoha_ppe_offload_setup() publishes the npu while npu->stats is still
NULL:

	rcu_assign_pointer(eth->npu, npu);
	synchronize_rcu();

After that, only the plain ppe->flow_stats bool keeps readers away from
npu->stats. airoha_ppe_foe_entry_get_stats() checks that bool before it
enters the RCU section, and afterwards it only checks npu:

	ppe_num_stats_entries = airoha_ppe_get_total_num_stats_entries(ppe);
	if (ppe_num_stats_entries < 0)
		return;
	...
	rcu_read_lock();

	npu = rcu_dereference(eth->npu);
	if (npu) {
		...
		memcpy_fromio(&npu_stats, &npu->stats[index],
			      sizeof(*npu->stats));

airoha_ppe_debugfs_foe_show() (ppe/entries and ppe/bind) calls this
without holding flow_offload_mutex. Those files exist from
airoha_ppe_init() onwards:

CPU0 (debugfs read)
airoha_ppe_foe_entry_get_stats()
  sees flow_stats == true (initial value from airoha_ppe_init())
  <preempted before rcu_read_lock()>

CPU1
airoha_ppe_setup_tc_block_cb()
  airoha_ppe_offload_setup()
    ppe_init_stats() fails
    ppe->flow_stats = false
    rcu_assign_pointer(eth->npu, npu)
    synchronize_rcu()   <- returns, CPU0 is not in a read section

CPU0
  rcu_read_lock()
  npu = rcu_dereference(eth->npu)   <- non-NULL
  memcpy_fromio(&npu_stats, &npu->stats[index], ...)   <- stats is NULL

There is a similar case on the NAPI path,
airoha_ppe_foe_commit_entry()->airoha_ppe_foe_flow_stats_update(). It
reads flow_stats after rcu_dereference(eth->npu), with no dependency
ordering between the two loads. It then calls memset_io() on
npu->stats[index] through airoha_ppe_foe_flow_stat_entry_reset(). On
arm64, can the flow_stats load be reordered against the npu load?

The flow_stats store and loads are plain accesses from different
contexts, so this also looks like a data race that KCSAN would flag.

Would it be more robust to check npu->stats inside the RCU section, or to
take flow_offload_mutex on the debugfs path?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261008094828.15458-1-sayantann11%40gmail.com

