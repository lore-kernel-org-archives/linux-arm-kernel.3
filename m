Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC14F34C4B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dy7+J3Nmv3CmyBjyZLXnfY++J8xerQl5T/d1Q6AZ1bc=; b=NTvyOnEt/2l1ceA7P/9VOqFt7G
	qxj0hylsTdjo5bADMUfmU1JXYKqQXBY3q7RhsqMcMHeodZBw5G4hm+b7jTIH6PL513TIlUhVlW3sd
	lbrtvMWb3PBGSjPgA8fWV2zrzQl33QYhBLT194HWOBQIUS7UhaQVnxX5N5QDlZzT6UzNnMdegKyRf
	NoWhN+u3pYCeeRttqrcVx7e4HTO0umf/APGBQNIp0Z+JD1yvgmxMA7BuO2FYifZ6q53yG2DirKaGr
	jkpXP15NvxwG49PyIV/t8mqF+Zkg7g4gnh+xeqje9HVofoTTeNsi4qzLr1aSjU2Vn4fAE1zlTw6mz
	jeMtLVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGQG-0000000Fe87-2PqU;
	Mon, 13 Apr 2026 12:29:48 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGQC-0000000Fe6d-1w16;
	Mon, 13 Apr 2026 12:29:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Dy7+J3Nmv3CmyBjyZLXnfY++J8xerQl5T/d1Q6AZ1bc=; b=QsVW+pzP/fktEna0S7j0QJmrsJ
	Sv/GgoChbT8MctDEWJs9+NCQTEW7i8Ofq5fjZY1k7vTrit6euX57QMT32YEozT7MBnsNXJQjOYPr7
	9XUFtLXPhZuBVoGXuIzfV0kYtDpl7ia5PGW7t7Fv6gaQAKZ5TuaCqVCqg5+BvfsuT4S/pETS75Q0Z
	O3tPbSqmVt514KwYuB2YO+rHO1umNrJVgOhYuLxNjI9/fwrB0oABm+56snVkVHRhVYKrcBANu7UdH
	KR8o7nnICXyaVsXXOHEQbcm4eAMizg+7eOdZX3/WFO8KPTHnDISgKXbVM4aoK+CptywUTRPAQ8f+W
	U9S/D1YQ==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=[172.24.27.208])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wCGPx-00FOp1-Pk; Mon, 13 Apr 2026 14:29:30 +0200
Message-ID: <b5ab4741-1300-4a43-b491-2b73e052eed0@igalia.com>
Date: Mon, 13 Apr 2026 09:29:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20260401111416.562279-2-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20260401111416.562279-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_052944_812553_C64E9D12 
X-CRM114-Status: GOOD (  16.91  )
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

Hi Stephen,

It would be great to land this patch in the next release together with
commit 672299736af6 ("clk: bcm: rpi: Manage clock rate in prepare/
unprepare callbacks"). When possible, could you take a look at it?

Best regards,
- Maíra

On 4/1/26 08:13, Maíra Canal wrote:
> On Raspberry Pi 3B, the VEC clock is used by the VideoCore firmware
> display driver, which remains active until the vc4 driver loads and
> sends NOTIFY_DISPLAY_DONE. If this clock is disabled during boot, a bus
> lockup happens and the firmware becomes unresponsive, causing a complete
> system lockup.
> 
> Mark the VEC clock with CLK_IGNORE_UNUSED so it survives the unused
> clock disablement and remains available until the vc4 driver takes over
> display management.
> 
> Fixes: 672299736af6 ("clk: bcm: rpi: Manage clock rate in prepare/unprepare callbacks")
> Reported-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index df2d246eb6ef..f1a99de6de4f 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -160,6 +160,13 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>   	[RPI_FIRMWARE_VEC_CLK_ID] = {
>   		.export = true,
>   		.minimize = true,
> +
> +		/*
> +		 * If this clock is disabled during boot, it causes a bus
> +		 * lockup in RPi 3B. Therefore, make sure it's left enabled
> +		 * during boot.
> +		 */
> +		.flags = CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_DISP_CLK_ID] = {
>   		.export = true,


