Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AC9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aXrbleWA;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WttVKCZ8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qp4gNV/QeSPIL1RjfW+0FhMZ3zNgqpXftPwRkYLSa4g=; b=aXrbleWAogsazy
	znAVd69pDmmjZAGrE0wSB/Hf/In06rhI+fEPEuM4biFM1/3LZ2oUuoMYXcUMIzuYQ2Tkw+g6OKY4b
	taoLLLmC0VC+xz1V6PO+Iu7igvzOT8wVcSj1qfVAV9tfHLJv97WQ4ej/c/pMqkrIOGjT0lQVYF/GM
	YQaqBJ5fVIguZ+QIK7bUEZ2aoZfkeQWZ+RJgCgmNwTP2DSYquIqNeXm6B4yZd91pwnbtAzTArGleA
	0lf7sVAcCvWFp/fss5/bfkvYtC8BFzDDKWP0xmrQOBJEqvj96n4ZbsyMUw65xjaw4DiTE3RRT/IjG
	k6YXNjgVOQs/Hs7kPudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx96-000000093ah-1CRj;
	Thu, 05 Nov 2026 13:04:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx8n-000000093V8-2RV6;
	Thu, 05 Nov 2026 13:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793883867;
	bh=IBsoZ1Vp7gsgzVEtbu51c9eHaEQR+2eUZSh26ar6Ris=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WttVKCZ8v63kNXP9SLbHEi8Y0ZpduE4V1tcnKbCSthLJxNsH2uQDloZRquWB9sc9I
	 +pPRAb06OWgbC4MsbcTO+tOTGaZWU+u+0YBKWfxG+QtDZ98ymzX8cFXI/w5IiOQXfD
	 eAr9YLKMlZvTOHSE8N3mNu0yR8sisg+VEsz6ibB6BdIZ6ycriCirAFT+S8QjxBSJn2
	 Zht9YlCSULNsA4kb9Ovikn5EKr5vC3rUyF6uBeSnxZcSp+CGgWUvm+9/dx+9alfQr6
	 YpQ3OJlpXFqz1XaA/eREQOt+Ht3ZMr/nNmAN7gJ9X4aJdrQATmJKXueSSt4Nb8aGhN
	 F2/e0M3TtztnA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E16A617E05D6;
	Thu, 05 Nov 2026 14:04:25 +0100 (CET)
Message-ID: <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com>
Date: Thu, 5 Nov 2026 15:04:25 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color
 format on DW HDMI QP
To: Daniel Stone <daniel@fooishbar.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Stone <daniels@collabora.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_050431_846396_E5173E97 
X-CRM114-Status: GOOD (  16.91  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Daniel,

On 11/5/26 2:25 PM, Daniel Stone wrote:
> Hi Cristi,
> 
> On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>> Changes in v6:
>> - Added new vop2 patch "Disable core clocks before dropping runtime PM
>>   reference" (Sashiko)
>>
>> Changes in v5:
>> - Added new patch "drm/rockchip: dw_hdmi_qp: Do not mask error code in
>>   atomic_check()" to fix a pre-existing issue reported by Sashiko
>>
>> Changes in v3:
>> - Updated patch 3 to skip any hardware programming in the callbacks
>>   gated by drm_atomic_helper_commit_planes() after powering down VOP2 on
>>   an atomic_enable() error (Sashiko)
>> - Ensured VBLANK events are sent immediately when atomic_enable() fails,
>>   hence preventing userspace processes waiting for the page flip
>>   completion to hang indefinitely (new patch 4, Sashiko)
>>
>> Changes in v2:
>> - Addressed several issues reported by Sashiko
>>   * Reset AXI before detaching the IOMMU domain, to close a theoretical
>>     window where stale or in-flight DMA transactions could fault or
>>     access memory untranslated after the domain is detached (patch 6)
>>   * Fixed resource leak on vop2_enable() error path (new patch 2)
>>   * Balance state on atomic_enable error paths (new patch 3)
>>   * Avoided division by zero when computing max_dclk (new path 4)
>>   * Fixed VOP2_MAX_DCLK_RATE overflow on 32-bit (new patch 5)
> 
> I think everything in here should now be solidly reviewed. 

Thanks a lot for checking this out!

> But if this> series keeps on collecting unrelated patches until Sashiko decides all
> of VOP2 is bug-free, we will never get this series merged. Could we
> please keep this series focused on the useful bits at the end, and not
> keep on adding speculative new Sashiko-pleasing as artificial
> dependencies?

Yeah, sorry for that.  I'll stop here with regard to addressing further Sashiko
findings, unless there is really something wrong introduced by this series
(which doesn't seem to be the case).

Regards,
Cristian

