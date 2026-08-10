Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A55C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddIlhF6vGPyoom57B4/DSYjoWyRRk8Fh5bwezxUOqlc=; b=UFj0czm3WN5YhqOoNK9uDVNzkb
	qt0u752br551WUQqGmJuZevhXg0bUmW2QblRiyiqdJfoVyIgdbZH1iVrBhafk4uBAX2Uhk22BLiLC
	0sUXe1/PnPTkq9ZiIjQgX6OYlN6FvwMk16RuGUEjB4h7v0v4/N8jIzHCGv6fTjFDlAyL/x64o622/
	NBS+RS0v9O3uTzo/58sXAY1bli21oizigheNTwNq1eRjycoLignaCGqC3WSIxWQDNNfAiHQ2QxIkQ
	F1VPguLKxtazJwBRthyQpean2+J0iVOdoTzbMPU1Z2iohNeig1ZsYdJaPb3Kn1/vQVQgoWtM5WSll
	zkB16ijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQkx-0000000BxwA-1BZc;
	Mon, 10 Aug 2026 14:13:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQku-0000000Bxvg-0qIx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:13:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71E781516;
	Mon, 10 Aug 2026 07:13:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E145D3F86F;
	Mon, 10 Aug 2026 07:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786371210; bh=zYnXF4fid7nru4L+UN6cx73+9ENOxlbLHCYi9e/TLbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c4OaKYOdMrP2zYlAL+9Ck9ytNUdfa4vN23e1uvO8+zr+aIIaVGbiPz8omcY23SsKm
	 69UbHQH7fCfBzAQRXN6684AqVtZFko90HF3FUO0+1yumxbokV6x6NFEDB3De+636G0
	 L1fRQ8tn65V06Wdi/ESvTdQtsPnqOd4UbC6BfEog=
Date: Mon, 10 Aug 2026 15:13:22 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 08/23] firmware: arm_scmi: Add Telemetry configuration
 operations
Message-ID: <anncgnjIKCzuBKLL@pluto>
References: <20260802145618.1952804-9-cristian.marussi@arm.com>
 <1E14B66B-A2A3-4FF7-8178-D27433A316B1@contoso.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1E14B66B-A2A3-4FF7-8178-D27433A316B1@contoso.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_071332_354683_6B21AACA 
X-CRM114-Status: GOOD (  15.75  )
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

On Mon, Aug 03, 2026 at 11:54:30PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,
> 

Hi,

> I found two configuration issues inline.
> 
> > 	if (!is_group) {
> > 		active_update_interval =
> > 			&ti->info.active_update_interval;
> > 		current_mode = &ti->info.current_mode;
> > 	} else {
> > 		struct scmi_telemetry_res_info *rinfo;
> >
> > 		rinfo = ti->res_get(ti);
> > 		active_update_interval =
> > 			&rinfo->grps[res_id].active_update_interval;
> > 		current_mode = &rinfo->grps[res_id].current_mode;
> > 	}
> > [...]
> > 	if (!ret) {
> > 		ti->info.enabled = tlm_enable;
> > 		*current_mode = next_mode;
> > 		ti->info.notif_enabled =
> > 			*current_mode == SCMI_TLM_NOTIFICATION;
> > 		if (update_interval_ms)
> > 			*active_update_interval =
> > 				le32_to_cpu(interval);
> > 	}
> 
> For a group operation, active_update_interval and current_mode point to the
> group, but enabled and notif_enabled are still written into the global
> ti->info state.
> 
> Disabling one group can therefore make the driver believe the entire
> Telemetry instance is disabled, causing reads for unrelated DEs to return
> no data. A group's collection mode can similarly overwrite the global
> notification state.
> 
> Please select group-versus-instance cached state consistently for every
> field updated here.
> 

Yes indeed...fixed in v8.

> > 			de_offs = le32_to_cpu(resp->shmti_de_offset);
> >
> > 			shmti = &ti->shmti[sid];
> > 			payld = shmti->base;
> > 			/* Check boundary first... */
> > 			if (de_offs + LINE_LENGTH_BYTES(payld) >=
> > 			    shmti->info.len)
> > 				return -EPROTO;
> 
> The addition can wrap, and the payload must end before the TDCF epilogue,
> not merely before the end of the entire SHMTI allocation.
> 
> Please use checked addition and verify the complete line against the
> payload boundary, such as len - TDCF_EPLG_SZ. The same boundary rule
> should be used for an explicitly returned block-timestamp offset.
> 

To be further reworked in v9.

Thanks,
Cristian


