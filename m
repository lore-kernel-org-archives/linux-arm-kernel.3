Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C434C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 23:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCG3+53Ac+NbhT3mtgTYia80x2WwrmGFmlhhWvxOySk=; b=il89G3tKufgVEAD7pm5RdS3o5K
	dqUghJS0LbEXBKQoxVGC46WDq6UsNMoByNAIcCiiD4vQwFpHcADNvYG8OiaRjuxlNcIvwE8MZipqi
	BQRPdYRn7aWDVG4Ud54wfBzy+o3B7FiiS6vVLPWlPGQsoKy1PpwCh18qHiBYwKVystlhJqYtop0iq
	86z5zwTkhOMXvsQpWFFnD+ZRVi9r7xcbbpHIBxpBxEOfifB9yG0eQgpgGDTb9MGZfapiuv+yjUJ/S
	q4HAFWYijc6Rc1undfXGlKWDOm68iFcR4QBnMflZnaF3mEyfyOaz7xFfxZyKEBBHnjo6/SQgb7yWn
	GsKCVtxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twrUT-00000004VGE-185s;
	Mon, 24 Mar 2025 23:45:57 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twrR4-00000004Utm-1w0n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 23:42:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96D02102E64C5;
	Tue, 25 Mar 2025 00:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742859744; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DCG3+53Ac+NbhT3mtgTYia80x2WwrmGFmlhhWvxOySk=;
	b=X7Id/hJwMMfgB0C9wYwS8eoklxUO3Gfdi/tiA2c4XrPzD81QJrVgmAuSnh35YOjmvepPgN
	T0Dr8g6R4rFRyJPtqTb6ptknSSJ/tHWWkMMnSc2izK7WCmXjNMEBFKaF0LS5v3O5qyjQ4v
	pPfkSx62Fb/OU+WenL5P2cxpq8ju+WOtTCrOtrCtA71aylkAR5MQ5e1ilJNOWvto+CTRdO
	Mj8bys3aLbFmmUpZZ8hBFZAucM7mnNdxXvRPjUvKINzY/dCjJBzaZu04zIfy6QeU3v5fd/
	Mv9J6pb3EMAJs9L/a17/boCilMZWftlQxjJABjlASwS6dNXtbU1LJtgGgGsYYA==
Message-ID: <e8e9f36a-6d05-425e-a0e5-89689424336d@denx.de>
Date: Tue, 25 Mar 2025 00:35:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-10-marex@denx.de> <6144881.lOV4Wx5bFT@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6144881.lOV4Wx5bFT@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_164226_645255_0CF79FEA 
X-CRM114-Status: UNSURE (   9.47  )
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

On 3/24/25 8:02 AM, Alexander Stein wrote:

Hi,

>> @@ -1890,6 +1919,35 @@ netc_emdio: mdio@0,0 {
>>   			};
>>   		};
>>   
>> +		gpu_blk_ctrl: reset-controller@4d810000 {
>> +			compatible = "nxp,imx95-gpu-blk-ctrl";
>> +			reg = <0x0 0x4d810000 0x0 0xc>;
>> +			#reset-cells = <1>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
>> +			assigned-clock-rates = <133333333>;
>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>> +		};
> 
> With the SM release lf-6.12.3-1.0.0 AP does not have any access to
> this BLK_CTRL anymore. See [1]
I just built SM 6.12 and it still requires the reset, without reset I 
cannot use the GPU ... or ... which BLK CTRL do you refer to ?

