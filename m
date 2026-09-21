Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CBDC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biIIPAL+udhZqFXOwfaaMfkq0a6RVhD5vW+C4HMFAiQ=; b=C4Si/sGmnKMdk5fMY2xHEqpgTr
	Vw5a+m8wJFhImz87gmSA22SOmVDwXwh5boyKVOQFbb3n2xvM9Cl8F7VvyHlaXFseXAF9OoukoLZYi
	1GXXtiUBklpIPfGXHPja/7E4g+D707hWqAVbMOkeH9nD4othzXVgeVwsLkibGW950mW+DA3bf5UfN
	Vt82fchKKbTNRC/13y6bvdOJe4Af3QIRhnlF1q+B+8rqENKXcj6q3PcBlSOh2fPzzs3C6ygAHyPQi
	OS+t/OjSA7TvYxV5iGY8WSKPmPxT9WzfzJgTFgiMEKI3X3XM6UOc1pu3mYpMG7nFsVN/dVtW8EhhO
	6B1c/HIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZOQ-00000001LOT-3nha;
	Mon, 21 Sep 2026 08:28:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZOP-00000001LOG-3LTU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:28:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 48CAD43681;
	Mon, 21 Sep 2026 08:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101EE1F000FF;
	Mon, 21 Sep 2026 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789979333;
	bh=biIIPAL+udhZqFXOwfaaMfkq0a6RVhD5vW+C4HMFAiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dIS3AeOyFkaJxlhFNs+dL5RL/IpOu6aZCdV/ELU0ngWedExwC72kqNR6GjJDGQi1Y
	 vzm/oO4cDvW37S8Agtxf33GzaLU5eGIQVURLMNjOn7BtWii8WUGWcMOQ+X/QKz/n84
	 RWX00CMbYneHmZkSBQkzIdC8NXtr/YgDa+mZiz4X4wIeRPNzofmqSmjQtWgXQzlnEK
	 nqJdQdp6VA3YSf5qW/CNB4UgRLyN0Z5yxZ5esT7ZrY0v+zRxEbNitxEkUnlVEb9gQn
	 LgB2Wj2uKAiqxn7K0w9EbLs3AQpyql1pKjX1tIKVxXIVaxh6fsqfaoT3zorQLqxISJ
	 VHMa0ivbHQCAw==
Date: Mon, 21 Sep 2026 09:28:48 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260921-jumping-affable-agama-023caf@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
 <dca62a09-2af7-463e-9ba0-1be935a95502@oss.qualcomm.com>
 <aq2g9otvja7xQqJ_@monoceros>
 <20260920-hippo-of-immense-assurance-50a5fd@sudeepholla>
 <aq-xJE196Skvk2pX@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aq-xJE196Skvk2pX@monoceros>
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

On Sun, Sep 20, 2026 at 12:18:47PM +0200, Uwe Kleine-König wrote:
> On Sun, Sep 20, 2026 at 08:36:10AM +0100, Sudeep Holla wrote:

[...]

> > 
> > I am confused. I am asking to align with what's done in
> > Commit ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers")
> > and you are disagreeing with that ?
> > 
> > I am not comfortable taking this patch unless there are other similar
> > examples that are agreed upon to break the pattern followed in the above
> > mentioned commit.
> > 
> > Uwe, please suggest.
> 
> I didn't start removing stuff from mod_devicetable.h yet, as changes
> there are expensive (regarding build dependencies). So the plan is to
> stop drivers consuming mod_devicetable.h and then drop it. (Not sure
> this is sensible as new users come in faster than I can fight them, but
> I didn't give up yet.)
> 
> So while adding new device_id structures to mod_devicetable.h is
> consistent with the existing practise, it still makes the situation
> worse, as every consumer of mod_devicetable.h then also depends on the
> new header for the new structure. That's why I think it's a good idea to
> deviate here, even if you're the first one doing so, to not worsen the
> already bad situation.
> 

It would be good if you provide your reviewed-by for mod_devicetable.h
and associated parts specifically here.

Also there is another patch under discussion [1], it would be good to have
similar suggestion there as well, so that there is less divergence in the
newly added code from now on.

> If it helps you, I can propose a patch changing modpost to not use that
> catch-(nearly)-all header and use the needed linux/device-id/*.h
> instead. I put this on my list for tomorrow.
> 

That's helpful too, but for the things that are being planned to be in
v7.4, they may not see that unless you push that as a fix.

-- 
Regards,
Sudeep


[1] https://lore.kernel.org/all/20260921053807.354802-2-aneesh.kumar@kernel.org

