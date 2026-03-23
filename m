Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5300BF483E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 18:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vb/gNv/TR9kIpbD9lh7nEeh9fr3O0A48hKKeOwh/lVs=; b=NCdb/EefQM5nhepCiw5c4FLcAn
	FwnOpoXPI8F89xeJ1ADdyT+zL8TivdxBZPT7ByVyVFvuPxzvn79xwLADmYUI1UlIk0WpI4E5B2ITJ
	AEb5zBwK8SGgXUcfN1T+iYO+EakLW7MOiG2/HVK2zgHF8/N9EdB1JZWZ+5yzPPMmuZlx1ip1k7Eip
	zns8WVr8pWXZSYcWhEXNUuVk4cO1nEvn/Qm9CNNJx2uOL9rtwG/k9L7fhDNKG9EZjE+KsIEAblzI9
	POgpETkadYco5n/6SbI6VRIV1Et1gOp0oLue7JLys+/m8n91KLIUgrjTB22tO0ebD/glOKD6DBC3F
	Vt2h5iqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kJL-0000000HN6A-1giQ;
	Mon, 23 Mar 2026 18:47:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kJJ-0000000HN5C-0MUd;
	Mon, 23 Mar 2026 18:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774291650;
	bh=cfCJUmQdWdHqFyoqITseCKJU7PuEd22eTZjYC9q1Z7k=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=gzuPNRrAjy4mfuprRCGQooVB76V8vsP17dkdVB6k9UJ4x7mDQXGbu167wyif3hoK8
	 2esoju+BmtIrDQFylbwrJDV2/q0oS4GcjBk6qJJH3+sDqoWLmiWWvCAUjguGN1w8Gy
	 9imlTANNyvZ8XlmvThwSEC6aJl8579Un2m+NM3tikO7EMgbArzTlqzJ+TGTBQ4Xve6
	 Bcg8JtJl0luL5gAOzAORR8WzczGC4onOIeE4nNo/uVBPGnw46LvjdphVorOYpvavmT
	 tz8i5tlz8puJYt5N/4iZnlq1M1b9t73geHl1ps0AL/AB+tqCqpkTTj1J04jIvqew41
	 UwQknFFkvXufA==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 83A3317E4108;
	Mon, 23 Mar 2026 19:47:29 +0100 (CET)
Message-ID: <a8004480-8081-4bc5-857a-e83f38a4ed94@collabora.com>
Date: Mon, 23 Mar 2026 20:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests: (Re)add kms_crtc_background_color test
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20251219-crtc-bgcolor-v3-1-31b589911588@collabora.com>
Content-Language: en-US
In-Reply-To: <20251219-crtc-bgcolor-v3-1-31b589911588@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_114733_287001_C9A6F3D7 
X-CRM114-Status: UNSURE (   9.25  )
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

Hi,

On 12/19/25 11:27 PM, Cristian Ciocaltea wrote:
> Provide test to verify the behavior of BACKGROUND_COLOR DRM CRTC
> property.
> 
> This is achieved by filling a full-screen primary plane with a given
> color and comparing the resulting CRC with the one obtained after
> turning off all planes while having the CRTC background set to the same
> color.
> 
> Also note this is a reworked version of the test that has been dropped
> over 5 years ago via commit 33f07391e5f6 ("tests: Remove
> kms_crtc_background_color test"), as the required kernel changes never
> landed because of missing support in userland.

The kernel series introducing the BACKGROUND_COLOR CRTC property has been picked
up [1] and is available since drm-misc-next-2026-03-20 [2].

Regards,
Cristian

[1] https://lore.kernel.org/all/CAPj87rMW=4=0y_WZAhaLWhnEG1e-sF+Cn4XR57+p+d5wy9BvkA@mail.gmail.com/
[2] https://gitlab.freedesktop.org/drm/misc/kernel/-/commits/drm-misc-next-2026-03-20

