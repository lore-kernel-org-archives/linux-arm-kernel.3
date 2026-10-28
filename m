Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F49606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m4C5x6SR;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=i+/skMd/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8jmB9RanmjeScw6lxO3L8ylBkN0Bh3ZFb96COO2bVGA=; b=m4C5x6SRhod6FI
	4viYMP0TNusjxCisk8z1uedgO+b5OAnGjAANlYTNX/AyYS6erj7MKR043eOjZPB6Ric2pz565f9lO
	gf706JBkH0H00UNnRVvhM82DIEru89YkTc9r53ZSHCc0mxFmmrKAuKuY/xgnI1Cf0qQnEwgljLbLK
	hlq9CRq4xfzGZGAVGis3Pcx0/g+oRUgU9IHciHrWlz0rN7VgPeP3ab+sqocMaWt+npHxSaBzl7O/6
	PxFGMUP2VA2gmFu5aA3hUiRAPTLRSj8iKN36FvxInVeFZ3INiyp+NdSS8bdlvuEGI9ROwqg88Hi5w
	Ejv8xQdAsQZKrUiE6abQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1kF-00000006qxn-27sA;
	Wed, 28 Oct 2026 11:23:03 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1k9-00000006qwP-3clO;
	Wed, 28 Oct 2026 11:23:02 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261028112254euoutp02b26cbd638eecd1de5239047e5366ec4e~irbBUW4tQ0198001980euoutp02b;
	Wed, 28 Oct 2026 11:22:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261028112254euoutp02b26cbd638eecd1de5239047e5366ec4e~irbBUW4tQ0198001980euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793186574;
	bh=8jmB9RanmjeScw6lxO3L8ylBkN0Bh3ZFb96COO2bVGA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=i+/skMd/joxmQpIWha/jNQK0UIdTcPIoVEd5fvdz8Izsa0FMZ/GVtJm/TVSDc4Wlf
	 PSmKOj7Xwg6LjngebJx90KPoph5FvRubzdJqkrAB01tQXiW5g0Uhg7YjWQv336Jzoz
	 0zfJhBqZpNGKdJMpWVeGSx1ReAFKZwymkmP5q8wo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261028112253eucas1p28a4257d534aa730b8a96c0bb58fdfa31~irbAWgQHl0931009310eucas1p2l;
	Wed, 28 Oct 2026 11:22:53 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261028112251eusmtip1d596afbaa8e50b7128171427ede9319d~ira_nxioV0551305513eusmtip1V;
	Wed, 28 Oct 2026 11:22:51 +0000 (GMT)
Message-ID: <ebd333b0-39b6-428f-b8fe-143faa8949bc@samsung.com>
Date: Wed, 28 Oct 2026 12:22:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/21] drm: starfive: jh7110: Enable display
 subsystem
To: OOHehir <oo.hehir@gmail.com>
Cc: Laurent.pinchart@ideasonboard.com, alex@ghiti.fr,
	andrzej.hajda@intel.com, andy.yan@rock-chips.com, aou@eecs.berkeley.edu,
	bmasney+clk@redhat.com, chaoyi.chen@rock-chips.com, conor+dt@kernel.org,
	db@domibel.de, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	gandalf@winds.org, hal.feng@starfivetech.com, heiko@sntech.de,
	hello@big-grey.co.uk, jbrunet+clk@baylibre.com, jernej.skrabec@gmail.com,
	jonas@kwiboo.se, jpeisach@ubuntu.com, kernel@esmil.dk, krzk+dt@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, luca.ceresoli@bootlin.com,
	m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com,
	mani@kernel.org, maud_spierings@murena.io, mripard@kernel.org,
	mturquette@baylibre.com, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
	palmer@dabbelt.com, pjw@kernel.org, rfoss@kernel.org, robh@kernel.org,
	sboyd@kernel.org, tzimmermann@suse.de, u.kleine-koenig@baylibre.com,
	vkoul@kernel.org, zhengxingda@iscas.ac.cn
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20261012175941.258219-1-electronicconsult1@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261028112253eucas1p28a4257d534aa730b8a96c0bb58fdfa31
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261012180005eucas1p133b9ffd7327e5e62e3748fcffbac3655
X-EPHeader: CA
X-CMS-RootMailID: 20261012180005eucas1p133b9ffd7327e5e62e3748fcffbac3655
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20261012180005eucas1p133b9ffd7327e5e62e3748fcffbac3655@eucas1p1.samsung.com>
	<20261012175941.258219-1-electronicconsult1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_042259_521602_F7F9A621 
X-CRM114-Status: GOOD (  17.33  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi,

On 10/12/26 19:59, OOHehir wrote:
> Tested on a VisionFive 2 v1.3B with patches 1-17 & 19-21 of v5 on
> Linux 7.2.8, plus the clk patch that was 14/20 in v4. Patch 18 was not
> applied: it conflicts on 7.2 & there is no Rockchip hardware here. The
> same kernel also carries the out-of-tree PowerVR BXE-4-32 enablement &
> the SiFive XPbmtUC errata patches, so the GPU could render to the
> display.
> 
> - The dc8200, the HDMI controller & PHY & the vout clock controller
>   all probe, with nothing left in deferred probe; HDMI-A-1 reports
>   connected.
> - kmscube (GLES via zink on the PowerVR Vulkan driver) runs at the
>   monitor's preferred mode: 1683 frames in 28.1 s, 59.93 fps with
>   vsync, picture confirmed on the monitor, no GPU firmware resets.
> 
> Only that one mode was tested; the modetest sweep in the cover letter
> was not repeated.
> 
> One error at boot:
> 
>   i2c i2c-7: of_i2c: modalias failure on /soc/display-subsystem@29400000/hdmi@29590000/controller/ports
>   i2c i2c-7: Failed to create I2C device for /soc/display-subsystem@29400000/hdmi@29590000/controller/ports
> 
> inno_hdmi_i2c_adapter() sets adap->dev.of_node to the controller's
> node, so the I2C core registers the controller's children as I2C
> clients, & on the JH7110 that node has a 'ports' child. The display
> still comes up. Should the adapter get no of_node, or a dedicated
> child node?
> 
> For patches 1-17 & 19-21:
> 
> Tested-by: OOHehir <oo.hehir@gmail.com>
> 

Hi,

Thanks for testing. I'll carry your Tested-by into v6.

The modalias failure reproduces for me as well. It doesn't come from
this series: inno_hdmi_i2c_adapter() has been assigning the adapter's
of_node to the controller's node ever since the driver landed, and the
RK3036 and RK3128 carry the same ports child beneath their hdmi node, so
they should print the same message.

Nothing on the DDC bus is described in DT so the adapter shouldn't
receive an of_node at all - dw-hdmi doesn't set one either. Removing
that line clears the error here with EDID and every mode still
working. I don't think the fix belongs in this series though.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

