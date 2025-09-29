Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D56CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 00:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Djnb22vXs0nO5rPbjymOk32EmHdD+HDxTwWNm9+Bfns=; b=OaI9YdJmd/NJu3TegZl1Qc0Qfa
	cNnkd4JimiZ78iJECPBkv1v6U9EdssuIVIoHR+EbK41wPi4+nmltF1x/b4Kpx4b7hYm5PMhM3Y0KN
	4CREjFCS0jH4BIQTBL9EieXJrXJap2DxSHrNxJ2SZJE8Da+8FhJnMyvk044+FORiTnjEnkqTiFzLu
	IY9aV75LQjUKyMISCcvahxgy4n8ImyMJsT/N+SvJPzXx6oZUybQahirnrL3Gmtae/7eYnCs8xBwwq
	ZlXGyYkyEBWQKaGkMYtLp20m/J0i4brLgWxPt4cDnO45VLL0bP9WaGvdN475UKYuwpu7R9n7vcIS7
	N9Yo8IwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v327j-00000000tBF-20jA;
	Mon, 29 Sep 2025 00:52:15 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v327g-00000000t8b-2Yi9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 00:52:14 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cZjM51BFTz9sm2;
	Mon, 29 Sep 2025 02:52:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759107121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Djnb22vXs0nO5rPbjymOk32EmHdD+HDxTwWNm9+Bfns=;
	b=TQlEZ+TpP5RCDXXFkZm8omA8mNSEamptg9t1ji7874wLDbDSnOwUQmzLS6d1uEqPUm547X
	C9/i75UD/4Rgk8z8Hg8zU7zzy5/UzAb2TtYPQCXi3u6XVooBmpOlEldYK6nFo+8JOcbCmZ
	IA8UX8et4qJzg4DrMAmstnMnjGfFcA91ueGLlIvVrdMe3YZKAKBKfBKPCVA0QG16u2wA47
	GJHg9Rjn1dycE8tH7fk9dVIssucguMHaCSOorXR/f8gJomjVg4uBEfl4bRaA5s5n2Wg3sT
	ADrJxbIscWHmRtSXpRa7V/YYIV0g7Eg6ifjM2GrS2riYhGA4pTb1xFqGj8ABGQ==
Message-ID: <8f4ed393-f94a-4abb-9cdd-60dd693f3ec6@mailbox.org>
Date: Mon, 29 Sep 2025 02:23:01 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, "Jiyu Yang (OSS)"
 <jiyu.yang@oss.nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Xianzhong Li <xianzhong.li@nxp.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <20250926055701.GC8204@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250926055701.GC8204@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 24eeff4a72bf94b4f8a
X-MBO-RS-META: kgs4shqh8jgam9h18x7hnwfqw7yfhu9n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_175212_801689_B4880C46 
X-CRM114-Status: GOOD (  10.59  )
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

On 9/26/25 7:57 AM, Peng Fan wrote:

Hello Peng,

> On Thu, Sep 25, 2025 at 10:38:31PM +0200, Marek Vasut wrote:
>> The instance of the GPU populated in i.MX95 is the G310, describe this
>> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>>
>>
>> +		gpu: gpu@4d900000 {
>> +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>> +			reg = <0 0x4d900000 0 0x480000>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			clock-names = "core", "coregroup";
>> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "job", "mmu", "gpu";
>> +			mali-supply = <&gpu_fixed_reg>;
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>> +			#cooling-cells = <2>;
>> +			dynamic-power-coefficient = <1013>;
> 
> Sorry for my ignorance, would you please share how to get the value?
Copy-pasted from NXP downstream kernel fork DT bindings, see:

https://github.com/nxp-imx/linux-imx.git

11495de7c24a ("MGS-7621-4 dts: gpu: update devfreq para")

