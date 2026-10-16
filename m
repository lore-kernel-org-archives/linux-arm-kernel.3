Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A37CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kClVQlxvdkhmydoHxozGOO4wWX8BpcBLkbYZvR7NQY=; b=PxZUkuob/S/Or97jI5+qZ6qIBo
	lsWrP20553k2kmR2CjrC6sFOPyDrnR2OUdHtQYwQMkSwdcGfsRCkJxKHOTNfRdGNoY0R7eI6uj4aJ
	23+TKJzEVK7rHF+zOsTHnxjx8ie1q+6J6EHPiTlbHkQMP/pD/fu2NFGuRbqpHLqZSZ112fMw1RqEA
	YPdc90Y8zNbI0lFy8iZt7HVEQvzSTZ9Sx9okaRaoUo2yhUH0/rVvBEbaxQSoVV27poxECKJm8H/pN
	6ZqyUOycJGbNBpA+dMInY1DJfgSubxtGSk95MvyL3CjzpbF+Y+48jfzCO2bIakG5qZehhZciR6STk
	JA/jFPUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeIZ-00000002Tzv-070B;
	Fri, 16 Oct 2026 09:32:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeIX-00000002Tze-1WTd;
	Fri, 16 Oct 2026 09:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1kClVQlxvdkhmydoHxozGOO4wWX8BpcBLkbYZvR7NQY=; b=lWA47KwIVeskF+1utT9sa0X+7I
	fKADR/cnUfLApbeRB6MpcVy2ozEcpdMJrQGkstRtfWPZna5GB/rWR31K/Oh7Nugl6lQlzgwV/0zVb
	AcqWFa+sESD0mwH3aj5ibJJD0gSUEmalIhGP9oQJ3hk1ncVYcRaPWtmyY9s3A4+9CVgtsdKu4EdnL
	2cm3jLL8uMMqqHPJTsNElSEFLQ0I+Rp6KDCwQscEMH8i5C/hrd7rfTM55s3XucfBM9HRLuZJ2/U2U
	K+sHgKW6RkmAWZlDUOxUr79oTh3y4cUPSVerCav7bnGPqCX/Fn94Esan0yOz67cPeV8AT9sLHhJYK
	Uby5z1gA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHeIU-00000001KG5-0LBx;
	Fri, 16 Oct 2026 09:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792143130;
	bh=moPz88+BKWBqA4wI7xIuez0SP9HnxmGxxTZhvQgnrkg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YIo6r9hxhFdJT3RrNKDuNtNzXUdaXGjT3OnP1EjcSV2F+72R81qKdDcWOI8EJMa5U
	 rNd/kVnzkOtJH+4YRo/n6AbnZOUFidnbDWMg+vvzdxxwB4I2G7bVmnRXvxMgB+01GH
	 f5Cwnd4quCNpNHy02cGSb1D6qXI+OWr/HI/rvwZcL40rTkoYBaC75L/ClppvoZwRz0
	 wgRklWA+/OVTuPvIFGHXpss+v0lw5hgqTYul/fiRM7KEAcsmLEV0hnGFafCq8aZO3B
	 bB0Zo8nztfOKGMed7xAGqY1CghsWoR5g9EmvQm1gIlqox+itGdBwksHoAqO2UUk8sM
	 lI2cRJR+MB/tA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 353B617E0411;
	Fri, 16 Oct 2026 11:32:10 +0200 (CEST)
Message-ID: <aa6ba0bc-38a7-4c24-965c-a7660c05eb3e@collabora.com>
Date: Fri, 16 Oct 2026 12:32:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: devm_drm_bridge_alloc() conversion and cleanup
To: Johan Jonker <jbx6244@yandex.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Huseyin BIYIK <boogiepop@gmx.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
 <179213353665.3058528.14437637653539699061.b4-ty@b4>
 <d1f0369c-ff43-4b76-9092-5c638b132f15@yandex.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <d1f0369c-ff43-4b76-9092-5c638b132f15@yandex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_103218_341760_B94ABF47 
X-CRM114-Status: UNSURE (   7.81  )
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

Hi Johan,

On 10/16/26 11:11 AM, Johan Jonker wrote:
> Hi,
> 
> If any decency or Code of Conduct left in the DRM group then also credit the original author.

Sadly I wasn't aware of the indicated submission - this was just an unfortunate
overlap.  My series stems from the following discussion:

https://lore.kernel.org/all/743283af-753a-40bb-96f3-d05b1e38e186@collabora.com/

Regards,
Cristian

