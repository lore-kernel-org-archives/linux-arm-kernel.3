Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E893CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3GFnHtIblNt4J73Ub9v6dpzDoaywFOdLjrcnDFlhlw=; b=zPcEZR7wbleNKxuHqXbZXr13pm
	mkR4ueryZq34R8DI+Y001lM5mvZy2Jlk51tzi4xyAgEMvdNwOaEI1L7ZlmhfehhYzH6xWwslVM381
	F6X7sv1hkrfbb3d5Q1YWzJ2kaWx49YearTsH+kE2bjggb0Nx8f02WPO78aJMGPiR8i7KikXRcAgwj
	M39WrrjE/sT3aD/cj+wn6+pyhEsdwz46QGfhBVuEuxHDDO78P3PXuJYtHjntHN1v5oK+1NAZyHuPt
	6n3+HGkEncouvDhgq8mnE8+I553kd7oSgVeR3j6yB6CrW0kuyC/I8VR+IN+B/DIuI4/5uDMVJqK9/
	AVDTayZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG0L-0000000E2Tr-2hqn;
	Thu, 04 Sep 2025 19:52:21 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuBED-0000000CJdP-3FdJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:46:23 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHj3D3blCz9tFV;
	Thu,  4 Sep 2025 16:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756997176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3GFnHtIblNt4J73Ub9v6dpzDoaywFOdLjrcnDFlhlw=;
	b=F2iBe9zdgFRK2TtiNEprqg+Jymv+RN2AS6WabCLEtHcjyuSYku9hArJ1Xc0XhqALy4lOaR
	e30O4AdWf9E+JT7UAJ2GhQGKJBNJNJX/6YIL824tgVX07kN2wTdSbCROvUHJmHeTciKwCV
	yFASCZV++Xm05PDyCxpqET79B6r8Em6FZusqntwMa9MIQbP5aH34Yc2zMp1+/SE3ZqZDsh
	ZhyYoiz/TrGr3QQlHXgd6HlYBIPc2c0VTnn4WoM59ngfUVLHDkNjik2P7Qdg/49VPia6vB
	DkxFilh8AqD7Hn0Usg1LZTa1nBCpU5h6rD8wEGltJsn+GrpcwIxQx5IGMcPnPw==
Message-ID: <8cc352ee-8279-46c5-901b-e6624156263a@mailbox.org>
Date: Thu, 4 Sep 2025 16:46:11 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20250321200625.132494-1-marex@denx.de>
 <3372501.aeNJFYEL58@steina-w>
 <52e3c5dd-6952-43b5-94f9-43f30734680e@mailbox.org>
 <7020337.lOV4Wx5bFT@steina-w>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <7020337.lOV4Wx5bFT@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: k5w75xojfhphx8ai93r4gzgxiibg3nfm
X-MBO-RS-ID: 3e8e287770314cb04a9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_074621_967666_EC878E12 
X-CRM114-Status: GOOD (  15.08  )
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

On 9/4/25 4:39 PM, Alexander Stein wrote:
> Hi,
> 
> Am Donnerstag, 4. September 2025, 15:52:38 CEST schrieb Marek Vasut:
>> On 9/4/25 8:36 AM, Alexander Stein wrote:
>>
>> Hello Alexander,
>>
>>>>> Maybe the GPU remains halted because
>>>>> setting the GLB_HALT stops command stream processing, and the GPU never
>>>>> samples the clearing of GLB_HALT and therefore remains halted forever ?
>>>>
>>>> Exactly that, and that's expected.
>>>
>>> FYI: in a new release of system manager software (starting from lf-6.12.3-1.0.0),
>>> the GPU reset is reasserted in SM software already [1] and access to GPU
>>> block control has been removed from Cortex-A [2]. Starting from B0 step this
>>> version is required AFAIK.
>>
>> I don't think the SM is involved in this, because if I do the following
>> test, the MCU also fails to boot unless I do a reset:
> 
> Is this some other reset than BLK_CTRL_GPUMIX? If so, it might be required.
> Don't know much about internal details though.
Yes

    296	/**
    297	 * panthor_gpu_soft_reset() - Issue a soft-reset
    298	 * @ptdev: Device.
    299	 *
    300	 * Return: 0 on success, a negative error code otherwise.
    301	 */
    302	int panthor_gpu_soft_reset(struct panthor_device *ptdev)
    303	{
    304		bool timedout = false;
    305		unsigned long flags;
    306	
    307		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
    308		if (!drm_WARN_ON(&ptdev->base,
    309				 ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED)) {
    310			ptdev->gpu->pending_reqs |= GPU_IRQ_RESET_COMPLETED;
    311			gpu_write(ptdev, GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
    312			gpu_write(ptdev, GPU_CMD, GPU_SOFT_RESET);
    313		}
    314		spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
    315	
    316		if (!wait_event_timeout(ptdev->gpu->reqs_acked,
    317					!(ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED),
    318					msecs_to_jiffies(100))) {
    319			spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
    320			if ((ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED) != 0 &&
    321			    !(gpu_read(ptdev, GPU_INT_RAWSTAT) & GPU_IRQ_RESET_COMPLETED))
    322				timedout = true;
    323			else
    324				ptdev->gpu->pending_reqs &= ~GPU_IRQ_RESET_COMPLETED;
    325			spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
    326		}
    327	
    328		if (timedout) {
    329			drm_err(&ptdev->base, "Soft reset timeout");
    330			return -ETIMEDOUT;
    331		}
    332	
    333		return 0;
    334	}

