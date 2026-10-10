Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9AECA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 14:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuZQjHB51TzC9HbCK7GewQDoMKgnppnP29mw5X4Ma30=; b=uNVHGlrMXP3oi4+7G2/nqO16tm
	xWZZSM4i2MpFlOp3xhvOwTrxRPKeM5IXp3Q9WDenJS/WgyIo131yeJteXzLrVEnQ22sxcsAF1/1e8
	dljDYJgnX3D3Chg8ppaW9ri64IGtJZh3BqdHymmdDXDYAM1LIixMWPOsXYaUgkkSUQEaCsZaiFefs
	47FbKPxq/1SGjpELI3jmS1BvlTeXVD2rAh9pMpnP6OeQ9r5DBp4cvbkefRByQ2w4XHwmrq9Hp0hgx
	r4QiEHQk5sJ15VmjWTtMi638MEBZrTXAp16qUiW/mt7uYH5pdILRKWQTHaN6xPnJ7QCpplJIwXZTp
	G9xABb2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFXv0-000000089oP-3mmK;
	Sat, 10 Oct 2026 14:19:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFXuy-000000089oI-3SvO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 14:19:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1C0B60202;
	Sat, 10 Oct 2026 14:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7241F000FF;
	Sat, 10 Oct 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791641959;
	bh=SuZQjHB51TzC9HbCK7GewQDoMKgnppnP29mw5X4Ma30=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QYyVmWtndIYqGliOsFD1ApbRjW+TNgk/IekBFHDfFaNvyMP6KbId9V9C/OcsQC8jL
	 be9AHLu8Qe80kO4MhUhYu7zr6RfaFJGcjH77xAMkfSEuTjxoJ9YC3BEzzncJCN8b6P
	 4MUGfXHGhtmb0BzjmMSuOoi34naqRxjwGUGoWE3j/7zFBP0ukLl2jL6wxey5E49SWc
	 T85s6a9i8G/rs9k+4uUlytR1u+F9q4YV8vB/vxetr+ZGvWkz9tDHkZlBowdfswloUa
	 YzrCmaZbLqakYyUwSJX8QvVmQy4Q5IZeY2Sgeg40aiJ9ATXBRwXQDPfCLTcBNqzzI1
	 /XaXMAr0xSwpw==
Subject: Re: [PATCH net-next 3/3] net: sparx5: Add TAS offload support
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 Steen.Hegelund@microchip.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.marko@sartura.hr
Date: Sat, 10 Oct 2026 14:19:18 +0000
Message-ID: <179164195818.434549.1315955310783302023@kernel.org>
In-Reply-To: <20261006-sparx5-tas-v1-3-5eef1126dfd5@microchip.com>
References: <20261006-sparx5-tas-v1-3-5eef1126dfd5@microchip.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] If a TAPRIO_CMD_REPLACE fails, the schedule that was already
  pending in hardware is lost, but taprio still treats it as the current…
- [Medium] sparx5_tas_enable() computes the TAS base time with
  sparx5_new_base_time() at line 595.
- [Medium] sparx5_tas_shutdown_pending() reads LIST_STATE once (line
  288).
- [Low] The comment in sparx5_tas_init() says 'There are only 128
  (sparx5) / 60 (lan969x) TAS lists, not enough for the whole port…
- [Low] sparx5_tas_list_state_wait() (lines 249-261) and the startup loop
  in sparx5_tas_enable() (lines 661-673) poll HSCH_TAS_LIST_STATE /…

--

net: sparx5: Add TAS offload support

This commit adds Time Aware Shaper (802.1Qbv) offload for sparx5 and
lan969x, configured through tc-taprio. Each port uses two hardware TAS
lists, so a new schedule can be programmed while the other list is
operating, and GCL entries come from a pool shared by all ports. On
sparx5, the last port gets no TAS offload when all 65 ports are present.

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c b/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c
> index 3637d4b48ad67..ec80bc69371ab 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c

[ ... ]

> @@ -17,6 +20,753 @@ enum sparx5_tas_link_speed {

[ ... ]

> +static int sparx5_tas_list_state_wait(struct sparx5_port *port, int list,
> +				      int req, u32 done)
> +{
> +	struct sparx5 *sparx5 = port->sparx5;
> +	unsigned long end;
> +	int state;
> +
> +	/* Do not wait forever for the state change */
> +	end = jiffies + msecs_to_jiffies(TAS_TIMEOUT_MS);
> +	do {
> +		if (req >= 0)
> +			spx5_rmw(HSCH_TAS_LIST_STATE_LIST_STATE_SET(req),
> +				 HSCH_TAS_LIST_STATE_LIST_STATE,
> +				 sparx5,
> +				 HSCH_TAS_LIST_STATE);
> +
> +		state = sparx5_tas_list_state_get(sparx5);
> +		if (BIT(state) & done)
> +			return 0;
> +
> +		cond_resched();
> +	} while (!time_after(jiffies, end));

[Severity: Low]
This loop reads HSCH_TAS_LIST_STATE repeatedly with only cond_resched()
between reads, for up to TAS_TIMEOUT_MS. It runs with RTNL and
sparx5->tas_lock held.

Some of these waits are not short register settles. A TERMINATING list
runs until the end of its cycle, and cycle_time can be close to 1s.
sparx5_tas_disable() can chain several waits (pending stop, TERMINATING
request, ADMIN wait) for each of the two lists.

Would read_poll_timeout() with a sleep between reads fit better here? The
same applies to the startup polling loop in sparx5_tas_enable().

[ ... ]

> +static int sparx5_tas_shutdown_pending(struct sparx5_port *port)
> +{
> +	struct sparx5 *sparx5 = port->sparx5;
> +	int i, list, state, err;
> +
> +	for (i = 0; i < SPX5_TAS_ENTRIES_PER_PORT; i++) {
> +		list = sparx5_tas_list_index(port, i);
> +		spx5_rmw(HSCH_TAS_CFG_CTRL_LIST_NUM_SET(list),
> +			 HSCH_TAS_CFG_CTRL_LIST_NUM,
> +			 sparx5,
> +			 HSCH_TAS_CFG_CTRL);
> +
> +		state = sparx5_tas_list_state_get(sparx5);
> +		if (state != SPX5_TAS_STATE_ADVANCING &&
> +		    state != SPX5_TAS_STATE_PENDING)
> +			continue;
> +
> +		err = sparx5_tas_list_state_wait(port, list,
> +						 SPX5_TAS_STATE_ADMIN,
> +						 BIT(SPX5_TAS_STATE_ADMIN));

[Severity: Medium]
Can the hardware move this list from PENDING to OPERATING between the
state read above and the ADMIN request?

sparx5_tas_list_state_wait() writes LIST_STATE=ADMIN again on every
iteration and does not check which state the list is in now:

    if (req >= 0)
        spx5_rmw(HSCH_TAS_LIST_STATE_LIST_STATE_SET(req), ...);

If the pending list's base time arrives in that window, the list becomes
OPERATING and obsoletes the list that was operating before. The next
iteration would then write ADMIN to the only running list. That stops it
mid-cycle without going through TERMINATING. If the hardware ignores the
request instead, the wait times out with -ETIME.

On the replace path, sparx5_tas_list_find()->sparx5_tas_shutdown_pending()
is not followed by sparx5_tas_shutdown_operating(). HSCH_TAS_GATE_STATE
would then keep the gate mask of the stopped entry, possibly with queues
closed, until the new list starts.

lan966x_taprio_list_shutdown() reads the state again on each iteration. It
sends a list that has become OPERATING to TERMINATING and later restores
all-queues-open. Should sparx5 handle this case the same way?

The same unconditional rewrite applies to the TERMINATING request in
sparx5_tas_shutdown_operating(). A list that has already gone
OPERATING->TERMINATING->ADMIN could then get a TERMINATING request while
it is in ADMIN.

[ ... ]

> +int sparx5_tas_enable(struct sparx5_port *port,
> +		      struct tc_taprio_qopt_offload *qopt)
> +{

[ ... ]

> +	sparx5_new_base_time(sparx5, cycle_time, qopt->base_time, &base_time);

[Severity: Medium]
Can this base time be stale by the time it is written to hardware?

sparx5_new_base_time() returns a time only 2-3 cycles of the new schedule
ahead of the current PHC time. Two slow steps run after it:

  - sparx5_tas_list_find() can wait up to TAS_TIMEOUT_MS for a pending
    list to reach ADMIN, or for a TERMINATING list to finish its current
    cycle (up to the old cycle_time).
  - sparx5_tas_gcl_setup() programs up to n_tas_gcl entries, each with
    several indirect register accesses.

Only after these steps are HSCH_TAS_BASE_TIME_* written and ADVANCING
requested. For example, a 100us cycle that replaces a 500ms cycle while
the old list is TERMINATING has a margin of about 200-300us, but the wait
can last hundreds of milliseconds.

That breaks the rule in the comment at the top of the file, "base time is
at least current time + (2 * cycle time)". The likely result is a
STARTUP_ERROR and -EIO.

lan966x_taprio_add() computes the base time after list selection and GCL
programming. Could sparx5_new_base_time() be called just before the base
time registers are written?

> +
> +	/* Allocate before sparx5_tas_list_find() stops a pending schedule, so
> +	 * running out of GCL entries fails the replace without touching
> +	 * hardware.
> +	 */
> +	base = sparx5_tas_gcl_alloc(sparx5, qopt->num_entries);

[ ... ]

> +	/* Select an appropriate entry to use */
> +	err = sparx5_tas_list_find(port, &new_list, &obsolete);
> +	if (err) {
> +		bitmap_clear(sparx5->tas_gcl_bitmap, base, qopt->num_entries);
> +		goto out;
> +	}

[ ... ]

> +	if (HSCH_TAS_STARTUP_CFG_STARTUP_ERROR_GET(startup)) {
> +		netdev_err(port->ndev, "TAS startup error in list %d\n",
> +			   new_list);
> +		err = -EIO;
> +	} else if (state == SPX5_TAS_STATE_ADVANCING) {
> +		netdev_err(port->ndev, "Timeout starting TAS list %d\n",
> +			   new_list);
> +		err = -ETIME;
> +	}
> +
> +	/* taprio sends no DESTROY for a failed offload, so do not leave a
> +	 * list behind that may still start.
> +	 */
> +	if (err)
> +		sparx5_tas_shutdown_pending(port);

[Severity: Medium]
Is the schedule that was already pending lost when the replace fails
here?

sparx5_tas_list_find() first calls sparx5_tas_shutdown_pending(). That
forces any ADVANCING or PENDING list of the port back to ADMIN and frees
its GCL range. Several failures can happen after that point:

  - the invalid state combination check in sparx5_tas_list_find()
    (-EINVAL)
  - sparx5_tas_wait_admin() timing out on a TERMINATING list
  - a latched STARTUP_ERROR (-EIO)
  - the ADVANCING timeout (-ETIME)

Each of these cleans up only the new list, either with bitmap_clear() or
with the sparx5_tas_shutdown_pending() call above, and returns the error.
The old pending schedule is not restored.

In taprio_change(), the previous schedule B was already promoted when it
was installed. On an offload error, taprio_change() does goto free_sched
and keeps B. Take A operating and B pending, then a replace with C that
fails. Hardware keeps running A, taprio reports B, and B never starts.

The comment before sparx5_tas_gcl_alloc() covers the case where GCL
entries run out. The later failures still seem to leave hardware and
taprio out of sync. Could they be handled as well?

[ ... ]

> +int sparx5_tas_init(struct sparx5 *sparx5)
> +{
> +	const struct sparx5_consts *consts = sparx5->data->consts;
> +	int i, num_ports, list_num_max;
> +
> +	/* There are only 128 (sparx5) / 60 (lan969x) TAS lists, not enough
> +	 * for the whole port range. LIST_NUM_MAX is the highest list index
> +	 * processed, and the datasheet gives 24 as its minimum value.
> +	 */

[Severity: Low]
This isn't a bug, but is this comment accurate for lan969x?

lan969x_consts sets n_ports = 30 and n_tas_lists = 60. With
SPX5_TAS_ENTRIES_PER_PORT lists per port, every lan969x front port gets
its two lists. Only sparx5 (65 ports, 128 lists) runs short, as the commit
message says.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261006-sparx5-tas-v1-0-5eef1126dfd5%40microchip.com

