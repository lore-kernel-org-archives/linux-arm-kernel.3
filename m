Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20560606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZcRcM6dT;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b5/gtSJ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQoRVtL1rIECgPFKDyXfClZIANIPEM74LIvbEMBMv+s=; b=ZcRcM6dTYiiD4+3l8hF2I8zMqJ
	GsDO+WITgIueAIsscYvQwiPmAF+4X6sEcrphfcR4FHZGJ9UyrvHNy+VIYNp99izT4hZkLEwNCmfC9
	B5z59A6gV3B0LzPmNYzwv4mTQOaRsYPT5tqkDmIujQ5QW96/awJM/UDsIgZYmca/KYRDnGa61FVWf
	f200hxfTgdTWjD3K8n0EwWDafqS3jvaAus2W1bskCRdNS9VNYrbfRCc13KzCvjzX7pdKIqpAyEf7Q
	hcivxL22jHSWIZHotsYsgmufW+XZ6+S9vML+pPo4gT3UxDmbg+nX8Vs2K1jOoEEy8r5iNI76X7Cbz
	4JrsU8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJX2q-0000000C3pF-3b2n;
	Wed, 21 Oct 2026 14:11:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJX2n-0000000C3oe-3wpI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792591911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DQoRVtL1rIECgPFKDyXfClZIANIPEM74LIvbEMBMv+s=;
	b=b5/gtSJ3x7PfqMK29ljS4m4zElRPFT+HnR3KNaKta0CaHazB4OduyCH71r8ZrNsUNDx0RE
	KoDSfEKAqTg3ITzmVy98xO7P0b3DdIAIYIqeXM8xWUXl9UrIpmjj9lhYetM5IjRSxZ/qu3
	jsWjrpYA1qKklEy1Q6uYsaxQtW0XQJ0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-Ro3VqOuUPaOYyxn_4buM0A-1; Wed, 21 Oct 2026 10:11:49 -0400
X-MC-Unique: Ro3VqOuUPaOYyxn_4buM0A-1
X-Mimecast-MFC-AGG-ID: Ro3VqOuUPaOYyxn_4buM0A_1792591909
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a510b22fso17019846d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 07:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591909; x=1793196709;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQoRVtL1rIECgPFKDyXfClZIANIPEM74LIvbEMBMv+s=;
        b=h+mUnKRpXpG6LNdKYuue2R6QFzDEIBhb2UykfYtDHG8d8+rxwdyuOc8JWOTGwu2E9o
         dg9FCYfLa+TTV8EffubbKgyVCHvwNyfyKP9E18stIifLvohGHGM+E1Dx4vkNSfgzacaD
         3ATYkvWH9Rb6fPmY/tA5llZOg5RdLTDdujLfTzeMQZvSrnDNkbwLZo3TwIkMbGiYzrxz
         510nT17WGyIr8HfpsvKxeha0TEfRLd9bblPZeOwpUAtg3hlv4k/fYEiYv4KDeBbRyOu9
         ABLPLiGoPai6ptGNWwtpyVRxFYh8s6zNWAviJkIzTnOQDOvYUsP4mTENc/zemFWeyZmA
         eUsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/L5o1sF4c7oGZAVcKP8roUk5TnG1VQ0p2GfYgNWBY40AO0JEy3mSXBCFcFt6VVVLEGPEYPPBq4W11yJEePPmV@lists.infradead.org
X-Gm-Message-State: AFq9FYJkj3MMZO/G5ajf1t96g1tsh+t5XB7RNxdhv2/M34VvVO5CAVsY
	PbnyLSPCKcuhyKD/XllhM+j1+z7LbwNQpub4kWPBlheclYyEX8c2mHsJYRkopuwOQ6K46K7lT8K
	a/x7h/aPPtLAK28wdmVZaaGpVA6B6sNpoif36Eni+JlhzP/9p2QGXjxNPMlX2Q5MS+zFr7XJtp1
	Uy
X-Gm-Gg: AYBFou0si84tt32H6JmiOWjwfsP9J0FFiFGtAkL6/B5e00hMNWjdUr8QWqh7rjiZgzJ
	5AOMK/RMBWltxCEnOQF9RFlpMKWc5lA2rO8Nuaf0MoYPymXxrvhQqWp+6g+IgO/CSKTY/HX3rLg
	svAhbAzikN2R+lwfM48CANvPTh0jyg1COxMsGluQYMlWW48hR7pfUhJP0S8IcW4yqrAg7w7d6yz
	wTRipHlSdkzxlL9AMM630rRgA34kC5W+MRYXsFMq8ezEBgdI8N8MA1UpDMrLJTHXdmZ1ppmUvYR
	q1CjfL8HT4TfAUwxrc1jiTMMJABu1FcLiIR88dshaJ3g+UnsAcGxZZ0lCv8N7/SErU4Dpv5WD5g
	xT3aj4wDA2cgUZeh7QEVzizCyUJrxJ+HJQYKSxINgZkxdpE39nV5qbrLiD/aKLxrul9M=
X-Received: by 2002:a05:622a:888b:b0:536:8ac7:3936 with SMTP id d75a77b69052e-5369b8e6a57mr31496771cf.61.1792591908898;
        Wed, 21 Oct 2026 07:11:48 -0700 (PDT)
X-Received: by 2002:a05:622a:888b:b0:536:8ac7:3936 with SMTP id d75a77b69052e-5369b8e6a57mr31496191cf.61.1792591908163;
        Wed, 21 Oct 2026 07:11:48 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10f38a6asm24903486d6.29.2026.10.21.07.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:11:47 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:11:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: Use v2 rate calculation on i.MX8MP
Message-ID: <atjIIHkoNwBVDO5b@redhat.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: db7hgpSzIe63WLf9Lz4xCvcpQQoqvEXdjUsQ1CZx9aE_1792591909
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_071154_058309_CBF25D12 
X-CRM114-Status: GOOD (  27.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Miquel (and Jerome),

On Wed, Oct 21, 2026 at 03:09:56PM +0200, Miquel Raynal wrote:
> Hello,
> 
> Thanks to Brian's series, we can finally solve the problem of rate
> calculation faced with the i.MX8MP LDB/PIX clocks. I've tested this
> series using a v7.1 mainline kernel with a lot of unrelated DRM
> patches. I then re-applied it on top of clk-next after fixing the few
> conflicts when applying Brian's series, but that means I cannot (yet)
> run a 7.2/7.3 kernel on the platform (and applying this series with b4
> will fail due to Brian's series no longer applying on top of clk-next).
> 
> The DTS patch is there for reference, I don't mind if it's not picked
> up.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for testing and posting this!

I know that Jerome would like to see some changes to my rate change
series before it can be merged. I'm going to probably poorly describe
his concerns here, so apologies in advance if I miscommunicate this
Jerome. I'd appreciate it if you could clarify.

- Currently the latest version posted (v8) to the list has the LCM
  helper (clk_hw_get_children_lcm) in drivers/clk/clk.c, and the LCM
  helper should be in clk-divider.c. I agree that it should be in the
  divider code, but we'd have to export some additional APIs to allow
  that. In the future if we went with what's in v8, and wanted to fix
  the fractional dividers, then it would need a similar type of helper
  in clk.c, which is not ideal. I initially went with this approach to
  limit the APIs that are exported from the clk core.

- I have a draft v9 series that I haven't posted yet that adds two new
  helpers: clk_hw_get_num_children() and clk_hw_get_child_by_index()
  similar to the existing functions for the parents. This allows moving
  the LCM logic into clk-divider.c where it belongs, however the
  downside to this approach is that it expands the clk exported APIs so
  that providers will be able to fully walk the clk tree. The concern is
  that providers may abuse this in the future and it may limit future
  changes / cleanups to the clk core. For example, if we wanted to clean
  up the way locking is done, this may potentially limit the available
  options.
  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-divider-scaling-v9

- He would like to see it where each clk consumer sets the min/max rate
  that's acceptable, and the clk scaling in the provider takes those
  ranges into account when rates are negotiated.

Anyways, please chime in Jerome if I got this right / wrong, and any
additional concerns.

Brian


