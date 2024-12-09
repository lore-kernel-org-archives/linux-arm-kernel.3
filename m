Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF9AE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEFaylC3NdZVdWvD3GSeTcFtiJlsfWJs2y3bKxsyRoc=; b=1tzx1Xh3HwcCf+DpfofoG7+FX+
	lQCGi+mgJjiYbqj3BDww+dUYn+8+W9h89ikfmXeSBOoSoRImXbKVw8vPi4+jSRNReZHSF/jijRdpN
	KhBiyL1SLbXSS8utrzbV+pgEbXQ0HPlerdktwQHW5tuVH5ATgY5Abc/JkQ/RIJtZ7U/GjNu/RIRKv
	/pV+/HY9nKeUslncRs7QuFDWN2GZKOGZkjkOKZtRyap5oI31gjTA7xzHiOqV1YxoxwIRkQG6onXuL
	DDtd2aGMfHnvcXh4Gdiotw93nx31bDR2AGCw3nHfRUKin7EGBw0QniSndOBP+paHvYwSmSbp5D2Jt
	ZZ1gUMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbBc-00000007LEA-44aV;
	Mon, 09 Dec 2024 10:40:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb3L-00000007IPw-2ynu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733740305;
	bh=uNhmgnve4luc+D5B5WQIKlrwApKmXukvG8Co3IvHWcI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i6Qk+uw166U0n2OxUOVNIeLG4tCa9HLt1XZDlIlP5VHKFPHT+Pb0pyMO8/FO7DYFn
	 miWtsy6yggg3ENn8ZPO1RYMi1rJzaxfMZ8FGvMBYawOr4IB5wvEjBquHF/n4Y7e4Dx
	 EuOc58RgutPN6G9hyVIRpLrGPB/ExwPmxnXwVPgnZmtufnG1wC1e/Tmg2NEtGfZnJM
	 CAHLd6WOMAAxb5qnoq2cZ9Q24rRCGX7IuqbMPwRlfUW2ny7MLAFD2ArFHFXEVFr2x7
	 IMAlba8F02Tv3O2jBUCiGDUmBUoXObSE58FU4eKe9DLsbJJRA4Lk0kpqeyZUd7IKhc
	 4BaNJXyFdaOFA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E75817E35FC;
	Mon,  9 Dec 2024 11:31:44 +0100 (CET)
Message-ID: <a1153976-41ce-43c8-b6c1-14b055e05e9f@collabora.com>
Date: Mon, 9 Dec 2024 11:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,02/10] drm/tests: hdmi: rename connector creation function
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20241130-hdmi-mode-valid-v5-2-742644ec3b1f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241130-hdmi-mode-valid-v5-2-742644ec3b1f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_023147_894683_A5F7E5CC 
X-CRM114-Status: UNSURE (   7.31  )
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

Il 30/11/24 02:52, Dmitry Baryshkov ha scritto:
> As pointed out by Maxime, the drm_atomic_helper_connector_hdmi_init()
> isn't a good name for a function inside KUnit tests. Rename it to
> drm_kunit_helper_connector_hdmi_init().
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


